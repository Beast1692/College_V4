-- Event: truncate_enrollment_audit_monthly
-- Automatically deletes enrollment_audit records older than 1 month
-- Runs on the first day of each month

DROP EVENT IF EXISTS `truncate_enrollment_audit_monthly`;

DELIMITER ;;

CREATE EVENT `truncate_enrollment_audit_monthly`
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP
DO
  DELETE FROM `enrollment_audit` WHERE `changed_at` < DATE_SUB(NOW(), INTERVAL 1 MONTH);;

DELIMITER ;
