SELECT * FROM tvmtz_stg.tournaments

INSERT INTO tvmtz_dev.tournaments (name, year, description, url, rounds)
SELECT name, t_year, description, url, 2
FROM tvmtz_stg.tournaments;

INSERT INTO tvmtz_dev.teams ( tournament_uuid, name, initials, category)
SELECT 
IF(tournament_id = 1, '3b061b80-a2d9-11ef-b2bb-1c1b0de4c2e4','3b061e81-a2d9-11ef-b2bb-1c1b0de4c2e4'), 
name, initials, category
FROM tvmtz_stg.teams;

INSERT INTO tvmtz_dev.games (
	game_id, tournament_id, category, week_number, game_date, game_place, 
	team_1, team_1_score, team_1_points, team_1_set_1_pts, team_1_set_2_pts, team_1_set_3_pts, team_1_set_4_pts, team_1_set_5_pts,
	team_2, team_2_score, team_2_points, team_2_set_1_pts, team_2_set_2_pts, team_2_set_3_pts, team_2_set_4_pts, team_2_set_5_pts
)
SELECT 
	game_id, tournament_id, category, week_number, game_date, game_place, 
	team_1, team_1_score, team_1_points, team_1_set_1_pts, team_1_set_2_pts, team_1_set_3_pts, team_1_set_4_pts, team_1_set_5_pts,
	team_2, team_2_score, team_2_points, team_2_set_1_pts, team_2_set_2_pts, team_2_set_3_pts, team_2_set_4_pts, team_2_set_5_pts
FROM tvmtz_stg.games;


-- MIGRATE FROM STG TO DEV
INSERT INTO tvmtz_dev.games (
	tournament_uuid, category, week_number, 
	game_date, game_place,
	team_1,
	team_1_score, team_1_sets, team_1_points,
	team_1_set_1_pts, team_1_set_2_pts, team_1_set_3_pts, team_1_set_4_pts, team_1_set_5_pts,
	team_2,
	team_2_score, team_2_sets, team_2_points,
	team_2_set_1_pts, team_2_set_2_pts, team_2_set_3_pts, team_2_set_4_pts, team_2_set_5_pts,
	by_default
)
SELECT 
	IF(tvmtz_stg.games.tournament_id = 1, '3b061b80-a2d9-11ef-b2bb-1c1b0de4c2e4','3b061e81-a2d9-11ef-b2bb-1c1b0de4c2e4') AS tournament_uuid, 
	tvmtz_stg.games.category, week_number, 
	game_date, game_place, 
	t1_dev.team_uuid AS team_1,
	team_1_score, team_1_sets, team_1_points,
	team_1_set_1_pts, team_1_set_2_pts, team_1_set_3_pts, team_1_set_4_pts, team_1_set_5_pts,
	t2_dev.team_uuid AS team_2,
	team_2_score, team_2_sets, team_2_points,
	team_2_set_1_pts, team_2_set_2_pts, team_2_set_3_pts, team_2_set_4_pts, team_2_set_5_pts,
	by_default
FROM tvmtz_stg.games

INNER JOIN tvmtz_stg.teams t1
ON t1.team_id = tvmtz_stg.games.team_1

INNER JOIN tvmtz_dev.teams t1_dev
ON t1.tournament_id = 2
AND t1.category = t1_dev.category
AND t1.name = t1_dev.name

INNER JOIN tvmtz_stg.teams t2
ON t2.team_id = tvmtz_stg.games.team_2

INNER JOIN tvmtz_dev.teams t2_dev
ON t2.tournament_id = 2
AND t2.category = t2_dev.category
AND t2.name = t2_dev.name

WHERE tvmtz_stg.games.tournament_id = 2