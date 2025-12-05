CREATE TABLE IF NOT EXISTS `course_audit` (
  `course_audit_id` INT NOT NULL AUTO_INCREMENT,
  `course_id` INT NOT NULL,
  `action` VARCHAR(50) DEFAULT NULL,
  `old_course_name` VARCHAR(255) DEFAULT NULL,
  `new_course_name` VARCHAR(255) DEFAULT NULL,
  `old_course_credits` INT DEFAULT NULL,
  `new_course_credits` INT DEFAULT NULL,
  `old_audit_user_id` VARCHAR(50) DEFAULT NULL,
  `new_audit_user_id` VARCHAR(50) DEFAULT NULL,
  `changed_by` VARCHAR(50) NOT NULL,
  `changed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_audit_id`),
  KEY `fk_course_audit_course_idx` (`course_id`),
  KEY `idx_course_audit_changed_at` (`changed_at`),
  KEY `idx_course_audit_action` (`action`),
  CONSTRAINT `fk_course_audit_course` 
    FOREIGN KEY (`course_id`) 
    REFERENCES `course` (`course_id`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;