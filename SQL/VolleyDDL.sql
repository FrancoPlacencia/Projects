DROP TABLE IF EXISTS games_played;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS tournaments;

CREATE TABLE tournaments (
	tournament_id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	year INTEGER NOT NULL,
	description VARCHAR(255) NOT NULL,
	url VARCHAR(255) NOT NULL,
	rounds INTEGER NOT NULL DEFAULT 0,
	CONSTRAINT PK_tournaments PRIMARY KEY (tournament_id),
	CONSTRAINT UC_tournaments UNIQUE(name, year)
);
	
CREATE TABLE teams (
	team_id INTEGER NOT NULL AUTO_INCREMENT,
	tournament_id INTEGER NOT NULL,
	number INTEGER NOT NULL DEFAULT 0,
	initials VARCHAR(8) NOT NULL DEFAULT '',
	name VARCHAR(20) NOT NULL,
	category ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	image VARCHAR(255),
	
	games_won INTEGER NOT NULL DEFAULT 0,
	games_lost INTEGER NOT NULL DEFAULT 0,
		
	sets_won INTEGER NOT NULL DEFAULT 0,
	SETS_LOST INTEGER NOT NULL DEFAULT 0,
	
	points_won INTEGER NOT NULL DEFAULT 0,
	points_lost INTEGER NOT NULL DEFAULT 0,
	
	is_active BOOLEAN NOT NULL DEFAULT FALSE,
	CONSTRAINT PK_teams PRIMARY KEY (team_id),
	CONSTRAINT FK_teams_tournament FOREIGN KEY (tournament_id) 
		REFERENCES tournaments (tournament_id),
	CONSTRAINT UC_teams_name_tournament UNIQUE (name, category, tournament_id)
);

CREATE TABLE players (
	player_id 	INTEGER NOT NULL AUTO_INCREMENT,
	team_id		INTEGER NOT NULL,
	name 		VARCHAR(50) NOT NULL,
	last_name	VARCHAR(50) NOT NULL,
	number		INTEGER NOT NULL,
	
	CONSTRAINT PK_players PRIMARY KEY (player_id),
	CONSTRAINT FK_team FOREIGN KEY (team_id) REFERENCES teams(team_id),
	CONSTRAINT UC_player UNIQUE (team_id, number)
	
);

CREATE TABLE games (
	game_id 		INTEGER NOT NULL AUTO_INCREMENT,
	tournament_id 	INTEGER NOT NULL,
	category 		ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	
	week_number 	INTEGER NOT NULL,

	game_date  DATETIME NOT NULL,
	game_place VARCHAR(10) NOT NULL,
	
	team_1 			INTEGER NOT NULL,
	team_1_sets 	INTEGER NOT NULL DEFAULT 0,
	team_1_points 	INTEGER NOT NULL DEFAULT 0,
	team_1_score 	INTEGER NOT NULL DEFAULT 0,
	
	team_1_set_1_pts INTEGER NOT NULL DEFAULT 0,
	team_1_set_2_pts INTEGER NOT NULL DEFAULT 0,
	team_1_set_3_pts INTEGER NOT NULL DEFAULT 0,
	team_1_set_4_pts INTEGER NOT NULL DEFAULT 0,
	team_1_set_5_pts INTEGER NOT NULL DEFAULT 0,
	
	
	team_2 			INTEGER NOT NULL,
	team_2_sets 	INTEGER NOT NULL DEFAULT 0,
	team_2_points 	INTEGER NOT NULL DEFAULT 0,
	team_2_score 	INTEGER NOT NULL DEFAULT 0,	
	
	team_2_set_1_pts INTEGER NOT NULL DEFAULT 0,
	team_2_set_2_pts INTEGER NOT NULL DEFAULT 0,
	team_2_set_3_pts INTEGER NOT NULL DEFAULT 0,
	team_2_set_4_pts INTEGER NOT NULL DEFAULT 0,
	team_2_set_5_pts INTEGER NOT NULL DEFAULT 0,
	
	by_default BOOLEAN NOT NULL DEFAULT FALSE,
	
	CONSTRAINT PK_games PRIMARY KEY (game_id),
	
	CONSTRAINT FK_games_tournament FOREIGN KEY (tournament_id) 
		REFERENCES tournaments(tournament_id),
	CONSTRAINT FK_games_team_1 FOREIGN KEY (team_1) REFERENCES teams(team_id),
	CONSTRAINT FK_games_team_2 FOREIGN KEY (team_2) REFERENCES teams(team_id),
	CONSTRAINT UC_games_match UNIQUE (tournament_id, category, week_number, game_date, team_1, team_2)
);

CREATE TABLE games_played (
	games_played_id INTEGER NOT NULL AUTO_INCREMENT,
	player_id		INTEGER NOT NULL,
	game_id			INTEGER NOT NULL,
	CONSTRAINT PK_games_played PRIMARY KEY (games_played_id),
	CONSTRAINT FK_games_played_player FOREIGN KEY (player_id) REFERENCES players(player_id),
	CONSTRAINT FK_games_played_game FOREIGN KEY (player_id) REFERENCES games(game_id)
);


/*
CREATE TABLE playoffs (
	playoff_id INTEGER NOT NULL AUTO_INCREMENT,
	tournament_id INTEGER NOT NULL,
	category ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	position INTEGER NOT NULL DEFAULT 0,
	team_1_name VARCHAR(100) NOT NULL,
	team_1_score INTEGER NOT NULL DEFAULT 0,
	team_1_sets INTEGER NOT NULL DEFAULT 0,
	team_1_points INTEGER NOT NULL DEFAULT 0,
	team_2_name VARCHAR(100) NOT NULL,
	team_2_score INTEGER NOT NULL DEFAULT 0,
	team_2_sets INTEGER NOT NULL DEFAULT 0,
	team_2_points INTEGER NOT NULL DEFAULT 0,
	bracket VARCHAR(10) NOT NULL DEFAULT '',
	CONSTRAINT PK_playoff_id PRIMARY KEY (playoff_id),
	
	CONSTRAINT FK_playoffs_tournament FOREIGN KEY (tournament_id) 
		REFERENCES tournaments(tournament_id)
);

CREATE TABLE standings (
	standing_id INTEGER NOT NULL AUTO_INCREMENT,
	tournament_id INTEGER NOT NULL,
	category ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	team_pos INTEGER NOT NULL DEFAULT 0,
	team_name VARCHAR(100) NOT NULL,
	team_JJ INTEGER NOT NULL DEFAULT 0,
	team_JG INTEGER NOT NULL DEFAULT 0,
	team_JP INTEGER NOT NULL DEFAULT 0,
	team_DJ INTEGER NOT NULL DEFAULT 0,
	team_SG INTEGER NOT NULL DEFAULT 0,
	team_SP INTEGER NOT NULL DEFAULT 0,
	team_DS INTEGER NOT NULL DEFAULT 0,
	team_PG INTEGER NOT NULL DEFAULT 0,
	team_PP INTEGER NOT NULL DEFAULT 0,
	team_DP INTEGER NOT NULL DEFAULT 0,
	
	CONSTRAINT PK_standing_id PRIMARY KEY (standing_id),
	
	CONSTRAINT FK_standings_tournament_id FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id)
);


CREATE TABLE standings_results (
	standings_results_id INTEGER NOT NULL AUTO_INCREMENT,
	tournament_id INTEGER NOT NULL,
	category ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	team_number INTEGER NOT NULL DEFAULT 0,
	name VARCHAR(100) NOT NULL DEFAULT '',
		vs_team_1_wins INTEGER,
	vs_team_1_losses INTEGER,
	vs_team_2_wins INTEGER,
	vs_team_2_losses INTEGER,
	vs_team_3_wins INTEGER,
	vs_team_3_losses INTEGER,
	vs_team_4_wins INTEGER,
	vs_team_4_losses INTEGER,
	vs_team_5_wins INTEGER,
	vs_team_5_losses INTEGER,
	vs_team_6_wins INTEGER,
	vs_team_6_losses INTEGER,
	vs_team_7_wins INTEGER,
	vs_team_7_losses INTEGER,
	vs_team_8_wins INTEGER,
	vs_team_8_losses INTEGER,
	vs_team_9_wins INTEGER,
	vs_team_9_losses INTEGER,
	vs_team_10_wins INTEGER,
	vs_team_10_losses INTEGER,
	vs_team_11_wins INTEGER,
	vs_team_11_losses INTEGER,
	vs_team_12_wins INTEGER,
	vs_team_12_losses INTEGER,
	vs_team_13_wins INTEGER,
	vs_team_13_losses INTEGER,
	vs_team_14_wins INTEGER,
	vs_team_14_losses INTEGER,
	vs_team_15_wins INTEGER,
	vs_team_15_losses INTEGER,
	vs_team_16_wins INTEGER,
	vs_team_16_losses INTEGER,
	vs_team_17_wins INTEGER,
	vs_team_17_losses INTEGER,
	vs_team_18_wins INTEGER,
	vs_team_18_losses INTEGER,
	vs_team_19_wins INTEGER,
	vs_team_19_losses INTEGER,
	vs_team_20_wins INTEGER,
	vs_team_20_losses INTEGER,
	template TEXT NOT NULL DEFAULT ''	,
	CONSTRAINT PK_standings_results_id PRIMARY KEY (standings_results_id),
	
	CONSTRAINT FK_standings_results_tournament_id FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id)
);
*/