CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_get_category_template`(
	IN in_category VARCHAR(10),
	OUT out_template TEXT
)
BEGIN
	DECLARE activeTournament INTEGER DEFAULT 0;
	DECLARE categoryStanding VARCHAR(100) DEFAULT '';
	DECLARE GAMES_TEMPLATE TEXT DEFAULT '';
	DECLARE GAMES_DETAILS_TEMPLATE TEXT DEFAULT '';

	SET activeTournament := (
		SELECT tournament_id
		FROM tournaments
		WHERE is_active = true
	);

	SET categoryStanding := (
		SELECT CASE in_category 
		WHEN 'FEMENIL' THEN 'fem-bc fem-color'
		WHEN 'VARONIL' THEN 'var-bc var-color'
		WHEN 'MIXTO'   THEN 'mix-bc mix-color'
		ELSE '' END 
	);

	CALL usp_update_team();

	SELECT 
	GROUP_CONCAT(
		'{{Standings_Line',
		'|TEAM_POS=',TEAM_POS,
		'|TEAM_NAME=',TEAM_NAME,
		'|TEAM_STYLE=',TEAM_STYLE,
		'|TEAM_JJ=',TEAM_JJ,
		'|TEAM_JG=',TEAM_JG,
		'|TEAM_JP=',TEAM_JP,
		'|TEAM_DJ=',IF(TEAM_DJ > 0,CONCAT('+',TEAM_DJ),TEAM_DJ),
		'|TEAM_SG=',TEAM_SG,
		'|TEAM_SP=',TEAM_SP,
		'|TEAM_DS=',IF(TEAM_DS > 0,CONCAT('+',TEAM_DS),TEAM_DS),
		'|TEAM_PG=',TEAM_PG,
		'|TEAM_PP=',TEAM_PP,
		'|TEAM_DP=',IF(TEAM_DP > 0,CONCAT('+',TEAM_DP),TEAM_DP),
		'|TEAM_IMG=','',
		'}}'
		ORDER BY TEAM_POS ASC
		SEPARATOR '\n'
	) INTO out_template
	FROM (
		SELECT 
		ROW_NUMBER() OVER (
		ORDER BY 
			IS_ACTIVE DESC,
			TEAM_JG DESC,
			TEAM_DJ DESC,
			TEAM_SG DESC,
			TEAM_DS DESC,
			TEAM_PG DESC,
			TEAM_DP DESC
		) AS TEAM_POS,
		teams.*
		FROM (
			SELECT 
				name AS TEAM_NAME, 
				games_won + games_lost AS TEAM_JJ,
				games_won AS TEAM_JG,
				games_lost AS TEAM_JP,
				games_won - games_lost AS TEAM_DJ,
				sets_won AS TEAM_SG,
				sets_lost AS TEAM_SP,
				sets_won - sets_lost AS TEAM_DS,
				points_won AS TEAM_PG,
				points_lost AS TEAM_PP,
				points_won - points_lost AS TEAM_DP,
				CONCAT('team-',fn_get_category_class(in_category),'-',team_number, IF(is_active, '',' withdraw')) AS TEAM_STYLE,
				is_active AS IS_ACTIVE
			FROM teams
			WHERE tournament_id = activeTournament
			AND category = in_category
		) AS teams
	) AS template;
	
	CALL usp_get_games_template(in_category, GAMES_TEMPLATE);

	SELECT 
	GROUP_CONCAT(
		'{{Standings_Detail_Line',
		'|GAME_DATE=',DATE_FORMAT(game_date, '%d/%b/%y'),
		'|TEAM_1=',t1.name,
		'|TEAM_1_NUM=',t1.team_number,
		'|TEAM_1_SETS=',games.team_1_sets,
		'|TEAM_1_POINTS=',games.team_1_points,
		'|TEAM_1_STYLE=',
		'|TEAM_2=',t2.name,
		'|TEAM_2_NUM=',t2.team_number,
		'|TEAM_2_SETS=',games.team_2_sets,
		'|TEAM_2_POINTS=',games.team_2_points,
		'|TEAM_2_STYLE=',
		'}}'
		ORDER BY game_date DESC
		SEPARATOR '\n'
	) INTO GAMES_DETAILS_TEMPLATE
	FROM games
	
	INNER JOIN teams t1 ON t1.team_id = games.team_1 
	INNER JOIN teams t2 ON t2.team_id = games.team_2
	
	WHERE games.tournament_id = activeTournament
	AND games.category = in_category;

	SELECT CONCAT(
		fn_get_links(in_category), '\n', 
		'== Tabla de Posiciones ==\n',
		'{{Standings|CATEGORY=',categoryStanding,'}}\n',
		out_template, '\n\n',
		'== Resultado de Partidos ==\n',
		GAMES_TEMPLATE, '\n',
		'== Tabla de Partidos ==\n',
		'<small>',
		'\'\'\'P1\'\'\' = Puntos del Equipo 1,',
		'\'\'\'S1\'\'\' = Sets del Equipo 1,',
		'\'\'\'P2\'\'\' = Puntos del Equipo 2,',
		'\'\'\'S2\'\'\' = Sets del Equipo 2',
		'</small>',
		'{{Standings_Detail}}',
		GAMES_DETAILS_TEMPLATE
	);

END;