CREATE DEFINER=`root`@`localhost` FUNCTION `tvmtz_dev`.`fn_get_set_info`(p_first_pts 	INTEGER,
	p_second_pts	INTEGER,
	p_team_number	INTEGER,
	p_set_number	INTEGER,
	p_by_default	BOOLEAN
) RETURNS text CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	RETURN
	IF(
		p_first_pts = 0 AND p_second_pts = 0,
		'',
		CONCAT(
			'|TEAM_',p_team_number, '_SET_', p_set_number, '_POINTS=', p_first_pts,
			'|TEAM_',p_team_number, '_SET_', p_set_number, '_COLOR=', fn_is_winner(p_first_pts, p_second_pts, p_by_default)
		)
	);
END;