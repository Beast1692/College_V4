-- Trigger: user_before_insert
-- Auto-generates system_userid and campus_email for new user records

DROP TRIGGER IF EXISTS `user_before_insert`;

DELIMITER ;;

CREATE TRIGGER `user_before_insert` BEFORE INSERT ON `user`
FOR EACH ROW
BEGIN
    DECLARE v_base VARCHAR(50);
    DECLARE v_suffix INT DEFAULT 0;
    DECLARE v_userid VARCHAR(50);
    DECLARE v_exists INT DEFAULT 1;

    -- Generate base userid: first 2 letters of fname + up to 5 letters of lname
    SET v_base = LOWER(CONCAT(
        LEFT(NEW.user_fname, 2),
        LEFT(NEW.user_lname, LEAST(5, CHAR_LENGTH(NEW.user_lname)))
    ));

    -- Check if base userid already exists, add suffix if needed
    SET v_userid = v_base;
    WHILE v_exists > 0 DO
        SELECT COUNT(*) INTO v_exists FROM user WHERE system_userid = v_userid;
        IF v_exists > 0 THEN
            SET v_suffix = v_suffix + 1;
            SET v_userid = CONCAT(v_base, v_suffix);
        END IF;
    END WHILE;

    -- Set system_userid and campus_email
    SET NEW.system_userid = v_userid;
    SET NEW.campus_email = CONCAT(v_userid, '@wsc.edu');
END ;;

DELIMITER ;