CREATE DEFINER=`root`@`localhost` FUNCTION `tvmtz_dev`.`fn_is_winner_result`(p_first_pts 	INTEGER,
	p_second_pts	INTEGER) RETURNS varchar(15) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	RETURN IF(
		p_first_pts = 0 && p_second_pts = 0, 
		'losser-result',
		IF(
			p_first_pts = p_first_pts,
			'draw_result',
			IF(
				p_first_pts > p_second_pts, 
				'winner-result',
				'losser-result'
			)
		)
	);
END;