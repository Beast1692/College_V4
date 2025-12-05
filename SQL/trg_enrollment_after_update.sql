-- Trigger: enrollment_after_update
-- Logs changes to enrollment status or grade to the enrollment_audit table

DROP TRIGGER IF EXISTS `enrollment_after_update`;

DELIMITER ;;

CREATE TRIGGER `enrollment_after_update` AFTER UPDATE ON `enrollment`
FOR EACH ROW
BEGIN
    IF (OLD.enrollment_status != NEW.enrollment_status OR 
        COALESCE(OLD.lookup_grade_id, 0) != COALESCE(NEW.lookup_grade_id, 0)) THEN
        CALL sp_log_enrollment_audit(
            NEW.enrollment_id, 'UPDATE',
            OLD.enrollment_status, NEW.enrollment_status,
            OLD.lookup_grade_id, NEW.lookup_grade_id,
            NEW.audit_user_id
        );
    END IF;
END;;

DELIMITER ;
