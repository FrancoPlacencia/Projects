CREATE DEFINER=`root`@`localhost` FUNCTION `tvmtz_dev`.`fn_get_team_id`(p_category VARCHAR(10),
	p_name VARCHAR(20)
) RETURNS int(11)
BEGIN
	DECLARE out_teamId INTEGER DEFAULT 0;
	DECLARE activeTournament INTEGER DEFAULT 0;

	SET activeTournament := (
		SELECT tournament_id
		FROM tournaments
		WHERE is_active = true
	);


	SELECT team_id INTO out_teamId
	FROM teams
	WHERE tournament_id = activeTournament
	AND category = p_category
	AND name = p_name;

	RETURN out_teamId;
	
END;