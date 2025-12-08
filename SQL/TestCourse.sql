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


-- Test 3: Delete the course
DELETE FROM course WHERE course_id = @test_id;

SELECT 'Test 3 Complete: DELETE operation' AS 'Test Result';
SELECT 'Audit record for delete:' AS 'Check';
SELECT * FROM course_audit WHERE action = 'DELETE' AND course_id = @test_id;

-- Test 4: Show complete audit trail
SELECT 'Test 4: Complete Audit Trail' AS 'Test Result';
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

