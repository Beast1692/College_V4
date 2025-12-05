-- Stored procedure for enrollment audit logging
-- This procedure is called by enrollment triggers to log changes

DROP PROCEDURE IF EXISTS `sp_log_enrollment_audit`;

DELIMITER ;;

CREATE PROCEDURE `sp_log_enrollment_audit`(
    IN p_enrollment_id INT,
    IN p_action VARCHAR(50),
    IN p_old_status VARCHAR(255),
    IN p_new_status VARCHAR(255),
    IN p_old_grade_id INT,
    IN p_new_grade_id INT,
    IN p_changed_by VARCHAR(50)
)
BEGIN
    INSERT INTO `enrollment_audit` (
        enrollment_id, action, 
        old_enrollment_status, new_enrollment_status,
        old_lookup_grade_id, new_lookup_grade_id, 
        changed_by, changed_at
    ) VALUES (
        p_enrollment_id, p_action,
        p_old_status, p_new_status,
        p_old_grade_id, p_new_grade_id,
        p_changed_by, NOW()
    );
END;;

DELIMITER ;
