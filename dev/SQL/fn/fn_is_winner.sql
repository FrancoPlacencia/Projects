CREATE DEFINER=`root`@`localhost` FUNCTION `tvmtz_dev`.`fn_is_winner`(p_first_pts 	INTEGER,
	p_second_pts	INTEGER,
	p_default		BOOLEAN
) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	RETURN IF(p_first_pts > p_second_pts, 'winner-bc', IF(p_default, 'default','losser-bc'));
END;