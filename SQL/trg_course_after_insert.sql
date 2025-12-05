DELIMITER $$
CREATE TRIGGER trg_course_after_insert
AFTER INSERT ON course
FOR EACH ROW
BEGIN
    INSERT INTO course_audit (
        course_id, 
        action,
        new_course_name, 
        new_course_credits,
        new_audit_user_id,
        changed_by
    ) VALUES (
        NEW.course_id, 
        'INSERT',
        NEW.course_name, 
        NEW.course_credits,
        NEW.audit_user_id,
        SUBSTRING_INDEX(CURRENT_USER(), '@', 1)
    );
END$$
DELIMITER ;