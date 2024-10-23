-- NAMING CONVENTIONS	fn_ usp_
CREATE FUNCTION tvmtz_stg.fn_getTeamId(
	p_tournamentId INTEGER,
	p_category VARCHAR(10),
	p_name VARCHAR(20)
)
RETURNS INT
BEGIN
	DECLARE out_teamId INTEGER DEFAULT 0;
	
	SELECT team_id INTO out_teamId
	FROM teams
	WHERE tournament_id = p_tournamentId
	AND category = p_category
	AND name = p_name;

	RETURN out_teamId;
END