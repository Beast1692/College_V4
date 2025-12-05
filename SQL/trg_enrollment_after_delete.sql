-- Trigger: enrollment_after_delete
-- Logs deleted enrollment records to the enrollment_audit table

DROP TRIGGER IF EXISTS `enrollment_after_delete`;

DELIMITER ;;

CREATE TRIGGER `enrollment_after_delete` AFTER DELETE ON `enrollment`
FOR EACH ROW
BEGIN
    CALL sp_log_enrollment_audit(
        OLD.enrollment_id, 'DELETE',
        OLD.enrollment_status, NULL,
        OLD.lookup_grade_id, NULL,
        SUBSTRING_INDEX(CURRENT_USER(), '@', 1)
    );
END;;

DELIMITER ;
