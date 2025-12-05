-- Trigger: enrollment_after_insert
-- Logs new enrollment records to the enrollment_audit table

DROP TRIGGER IF EXISTS `enrollment_after_insert`;

DELIMITER ;;

CREATE TRIGGER `enrollment_after_insert` AFTER INSERT ON `enrollment`
FOR EACH ROW
BEGIN
    CALL sp_log_enrollment_audit(
        NEW.enrollment_id, 'INSERT', 
        NULL, NEW.enrollment_status,
        NULL, NEW.lookup_grade_id,
        NEW.audit_user_id
    );
END;;

DELIMITER ;
