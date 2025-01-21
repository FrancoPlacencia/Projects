CREATE DEFINER=`root`@`localhost` FUNCTION `tvmtz_dev`.`fn_get_links`(IN in_category VARCHAR(10)
) RETURNS text CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	
	DECLARE LINKS TEXT DEFAULT '';
	DECLARE WEEKS TEXT DEFAULT '';

	SELECT 
	IFNULL(CONCAT(
		'[[',url,'|<span class="button_link tournament_link">',description,'</span>]]\n',
		'<div class="buttons_in_line">',
		IF(
			in_category != 'FEMENIL',
			CONCAT('<div>[[',url,'_Femenil|<span class="button_link fem_link">FEMENIL</span>]]</div>'),
			''
		),
		IF(
			in_category != 'VARONIL',
			CONCAT('<div>[[',url,'_Varonil|<span class="button_link var_link">VARONIL</span>]]</div>'),
			''
		),
		IF(
			in_category != 'MIXTO',
			CONCAT('<div>[[',url,'_Mixto|<span class="button_link mix_link">MIXTO</span>]]</div>'),
			''
		),
		'</div>'
	),'') INTO LINKS
	FROM tournaments
	WHERE is_active = TRUE;

	SELECT 
	CONCAT('<div class="buttons_in_line">\n',
	GROUP_CONCAT (
		'<div>[[Torneo_Otoño_Invierno_2024_Jornada ',week_number,
		'|<span class="button_link game_link">Jornada ',week_number,
		'</span>]]</div>'
		ORDER BY week_number
		SEPARATOR '\n'
	) ,
	'\n</div>'
	) INTO WEEKS
	FROM (
		SELECT DISTINCT week_number AS week_number
		FROM games
		WHERE tournament_id = 2
	) AS weeks;

	RETURN CONCAT(LINKS,WEEKS);
END;