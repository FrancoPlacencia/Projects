CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmtz_dev`.`usp_generate_playoff_config`(
	IN in_tournament 	INTEGER,
	IN in_category 		VARCHAR(10)
)
BEGIN
	DECLARE CONFIG_LOCKED INTEGER DEFAULT 0;

	SELECT COUNT(*) INTO CONFIG_LOCKED
	FROM playoff_config 
	WHERE tournament_id = in_tournament 
	AND category = in_category;

	IF CONFIG_LOCKED = 0 THEN
		INSERT INTO playoff_config (tournament_id, category, stage)
		SELECT in_tournament, in_category, 'FINAL'
		UNION ALL
		SELECT in_tournament, in_category, 'SEMI'
		UNION ALL
		SELECT in_tournament, in_category, 'QUARTER' 
		FROM DUAL WHERE in_playoff_type != 4;
	END IF;	
END;