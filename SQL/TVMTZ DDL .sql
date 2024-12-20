SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS games_played;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS tournaments;

CREATE TABLE tournaments (
	tournament_id	INTEGER NOT NULL AUTO_INCREMENT,
	name 			VARCHAR(50) NOT NULL,
	year 			INTEGER NOT NULL,
	description 	VARCHAR(255) NOT NULL,
	rounds 			INTEGER NOT NULL DEFAULT 0,
	url 			VARCHAR(255) NOT NULL,
	is_active		BOOLEAN NOT NULL DEFAULT FALSE,
	CONSTRAINT PK_tournaments PRIMARY KEY (tournament_id),
	CONSTRAINT UC_tournaments UNIQUE(name, year)
);
	
CREATE TABLE teams (
	team_id 		INTEGER NOT NULL AUTO_INCREMENT,
	tournament_id 	INTEGER NOT NULL,
	team_number		INTEGER NOT NULL DEFAULT 0,
	name 			VARCHAR(20) NOT NULL,
	initials 		VARCHAR(8) NOT NULL DEFAULT '',
	category 		ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	image 			VARCHAR(255),
	is_active 		BOOLEAN NOT NULL DEFAULT TRUE,
	
	games_won 		INTEGER NOT NULL DEFAULT 0,
	games_lost 		INTEGER NOT NULL DEFAULT 0,
		
	sets_won 		INTEGER NOT NULL DEFAULT 0,
	sets_lost 		INTEGER NOT NULL DEFAULT 0,
	
	points_won 		INTEGER NOT NULL DEFAULT 0,
	points_lost 	INTEGER NOT NULL DEFAULT 0,
	
	CONSTRAINT PK_teams PRIMARY KEY (team_id),
	CONSTRAINT FK_teams_tournament FOREIGN KEY (tournament_id) REFERENCES tournaments (tournament_id),
	CONSTRAINT UC_teams_name_tournament UNIQUE (name, category, tournament_id)
);

CREATE TABLE players (
	player_id 	INTEGER NOT NULL AUTO_INCREMENT,
	team_id		INTEGER NOT NULL,
	name 		varchar(100) NOT NULL,
	last_name	varchar(100) DEFAULT '',
	number		INTEGER NOT NULL,
	
	CONSTRAINT PK_players PRIMARY KEY (player_id),
	CONSTRAINT FK_player_team FOREIGN KEY (team_id) REFERENCES teams(team_id),
	CONSTRAINT UC_player_team UNIQUE (number, team_id)
);

CREATE TABLE games (
	game_id 		INTEGER NOT NULL AUTO_INCREMENT,
	tournament_id 	INTEGER NOT NULL,
	category 		ENUM('MIXTO','FEMENIL','VARONIL') NOT NULL,
	week_number 	INTEGER NOT NULL,

	game_date  		DATETIME NOT NULL,
	game_place 		VARCHAR(10) NOT NULL,
	
	
	team_1 			INTEGER NOT NULL,
	team_1_score 	INTEGER DEFAULT 0,
	team_1_sets 	INTEGER DEFAULT 0,
	team_1_points 	INTEGER DEFAULT 0,
	
	team_1_set_1_pts INTEGER DEFAULT 0,
	team_1_set_2_pts INTEGER DEFAULT 0,
	team_1_set_3_pts INTEGER DEFAULT 0,
	team_1_set_4_pts INTEGER DEFAULT 0,
	team_1_set_5_pts INTEGER DEFAULT 0,

	
	team_2 			INTEGER NOT NULL,
	team_2_score 	INTEGER DEFAULT 0,	
	team_2_sets 	INTEGER DEFAULT 0,
	team_2_points 	INTEGER DEFAULT 0,
	
	team_2_set_1_pts INTEGER DEFAULT 0,
	team_2_set_2_pts INTEGER DEFAULT 0,
	team_2_set_3_pts INTEGER DEFAULT 0,
	team_2_set_4_pts INTEGER DEFAULT 0,
	team_2_set_5_pts INTEGER DEFAULT 0,
	
	by_default BOOLEAN DEFAULT FALSE, 
	CONSTRAINT PK_games PRIMARY KEY (game_id),
	
	CONSTRAINT FK_games_tournament FOREIGN KEY (tournament_id) REFERENCES tournaments (tournament_id),
	CONSTRAINT FK_games_team_1 FOREIGN KEY (team_1) REFERENCES teams(team_id),
	CONSTRAINT FK_games_team_2 FOREIGN KEY (team_2) REFERENCES teams(team_id),
	CONSTRAINT UC_games_match UNIQUE (tournament_id,category,week_number,game_date,team_1,team_2)
);


CREATE TABLE games_played (
	games_played_id INTEGER NOT NULL AUTO_INCREMENT,
	player_id 		INTEGER NOT NULL,
	game_id			INTEGER NOT NULL,
	CONSTRAINT PK_games_played PRIMARY KEY (games_played_id),
	CONSTRAINT FK_games_played_player FOREIGN KEY (player_id) REFERENCES players(player_id)  ON DELETE CASCADE,
	CONSTRAINT FK_games_played_game FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE,
	CONSTRAINT UC_games_player UNIQUE (player_id,game_id)
);