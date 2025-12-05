-- ============================================
-- TEST THE COMPLETE AUDIT SYSTEM
-- ============================================

-- Test 1: Insert a new course
INSERT INTO course (
    course_name, 
    course_credits,
    audit_user_id
) VALUES (
    'Test Course - Database Management',
    3,
    SUBSTRING_INDEX(CURRENT_USER(), '@', 1)
);

SELECT 'Test 1 Complete: INSERT operation' AS 'Test Result';
SELECT 'Audit record created:' AS 'Check';
SELECT * FROM course_audit WHERE action = 'INSERT' ORDER BY changed_at DESC LIMIT 1;

-- Test 2: Update the course
SET @test_id = LAST_INSERT_ID();

UPDATE course 
SET 
    course_name = 'Updated - Database Management',
    course_credits = 4,
    audit_user_id = SUBSTRING_INDEX(CURRENT_USER(), '@', 1)
WHERE course_id = @test_id;

SELECT 'Test 2 Complete: UPDATE operation' AS 'Test Result';
SELECT 'Audit record for update:' AS 'Check';
SELECT * FROM course_audit WHERE action = 'UPDATE' AND course_id = @test_id;

-- Test 3: Update with NO changes (should NOT create audit record)
SELECT 'Test 3: UPDATE with same values' AS 'Test Result';
SET @before_count = (SELECT COUNT(*) FROM course_audit WHERE course_id = @test_id);

UPDATE course 
SET course_name = course_name 
WHERE course_id = @test_id;

SET @after_count = (SELECT COUNT(*) FROM course_audit WHERE course_id = @test_id);

SELECT 
    'No-change update test:' AS 'Test',
    @before_count AS 'Records before',
    @after_count AS 'Records after',
    CASE 
        WHEN @before_count = @after_count THEN 'PASS - No audit record created'
        ELSE 'FAIL - Unexpected audit record'
    END AS 'Result';

-- Test 4: Delete the course
DELETE FROM course WHERE course_id = @test_id;

SELECT 'Test 4 Complete: DELETE operation' AS 'Test Result';
SELECT 'Audit record for delete:' AS 'Check';
SELECT * FROM course_audit WHERE action = 'DELETE' AND course_id = @test_id;

-- Test 5: Show complete audit trail
SELECT 'Test 5: Complete Audit Trail' AS 'Test Result';
SELECT 
    course_id,
    action,
    CASE 
        WHEN action = 'INSERT' THEN CONCAT('Created: ', new_course_name)
        WHEN action = 'UPDATE' THEN CONCAT(COALESCE(old_course_name, 'NULL'), ' → ', COALESCE(new_course_name, 'NULL'))
        WHEN action = 'DELETE' THEN CONCAT('Deleted: ', old_course_name)
    END AS 'Description',
    CONCAT(COALESCE(old_course_credits, 'N/A'), ' → ', COALESCE(new_course_credits, 'N/A')) AS 'Credits',
    changed_by,
    DATE_FORMAT(changed_at, '%Y-%m-%d %H:%i:%s') AS 'Timestamp'
FROM course_audit 
WHERE course_id = @test_id 
ORDER BY changed_at;

-- Test 6: Test the event (simulate)
SELECT 'Test 6: Event Simulation' AS 'Test Result';

-- Insert an old audit record
INSERT INTO course_audit (
    course_id, 
    action,
    old_course_name,
    new_course_name,
    changed_by,
    changed_at
) VALUES (
    1, 
    'TEST_OLD',
    'Old Course',
    'New Course',
    'test_user',
    DATE_SUB(NOW(), INTERVAL 2 MONTH)
);

SELECT 'Old record created with ID:' AS 'Info', LAST_INSERT_ID() AS 'Record_ID';

-- Manually run event logic
DELETE FROM course_audit 
WHERE changed_at < DATE_SUB(NOW(), INTERVAL 1 MONTH)
AND action = 'TEST_OLD';

SELECT 'Manual purge completed. Old TEST_OLD records remaining:' AS 'Check',
       COUNT(*) AS 'Count'
FROM course_audit 
WHERE action = 'TEST_OLD';