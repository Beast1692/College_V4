-- Create UPDATE trigger 
DELIMITER $$
CREATE TRIGGER trg_course_after_update
AFTER UPDATE ON course
FOR EACH ROW
BEGIN
    -- Simple check for changes 
    IF (OLD.course_name != NEW.course_name OR 
        OLD.course_credits != NEW.course_credits OR
        OLD.audit_user_id != NEW.audit_user_id) THEN
        
        INSERT INTO course_audit (
            course_id, 
            action,
            old_course_name, 
            new_course_name,
            old_course_credits, 
            new_course_credits,
            old_audit_user_id,
            new_audit_user_id,
            changed_by
        ) VALUES (
            NEW.course_id, 
            'UPDATE',
            OLD.course_name, 
            NEW.course_name,
            OLD.course_credits, 
            NEW.course_credits,
            OLD.audit_user_id,
            NEW.audit_user_id,
            SUBSTRING_INDEX(CURRENT_USER(), '@', 1)
        );
    END IF;
END$$
DELIMITER ;