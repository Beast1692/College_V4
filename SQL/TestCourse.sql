-- Check current courses
SELECT * FROM course ORDER BY course_id;

-- Check existing audit records
SELECT * FROM course_audit ORDER BY changed_at DESC;


-- 1. Insert a new course
INSERT INTO course (course_name, course_credits, audit_user_id) 
VALUES ('Test Course - Programming 101', 3, 1);

-- 2. Get the inserted ID
SET @test_course_id = LAST_INSERT_ID();




-- 1. Update the course
UPDATE course 
SET course_name = 'Updated - Programming 101',
    course_credits = 4
WHERE course_id = @test_course_id;


-- 1. Delete the course (with foreign key handling)
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM course WHERE course_id = @test_course_id;
SET FOREIGN_KEY_CHECKS = 1;
