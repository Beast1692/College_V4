CREATE DEFINER=`af25tylel1`@`localhost` FUNCTION `fn_get_building_capacity`(in_building_id INT)
RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE v_total_capacity INT;

    SELECT SUM(r.room_capacity)
    INTO v_total_capacity
    FROM room r
    WHERE r.building_id = in_building_id;

    RETURN IFNULL(v_total_capacity, 0);
END
