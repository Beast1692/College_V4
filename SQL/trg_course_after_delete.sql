DELIMITER $$
CREATE TRIGGER trg_course_after_delete
AFTER DELETE ON course
FOR EACH ROW
BEGIN
    INSERT INTO course_audit (
        course_id, 
        action,
        old_course_name, 
        old_course_credits,
        old_audit_user_id,
        changed_by
    ) VALUES (
        OLD.course_id, 
        'DELETE',
        OLD.course_name, 
        OLD.course_credits,
        OLD.audit_user_id,
        SUBSTRING_INDEX(CURRENT_USER(), '@', 1)
    );
END$$
DELIMITER ;