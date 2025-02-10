CALL usp_get_week_template(17, @template)

-- =============================================================================
-- MIXTO 
-- =============================================================================
CALL usp_get_category_template('MIXTO',@template);
-- TEAMS
CALL usp_get_team_template('MIXTO','FENIX', @template);
CALL usp_get_team_template('MIXTO','GALACTICOS', @template);
CALL usp_get_team_template('MIXTO','L@S PEQUES', @template);
-- CALL usp_get_team_template('MIXTO','LA SELECCIÓN', @template);
CALL usp_get_team_template('MIXTO','LOS DEL BASQUET', @template);
CALL usp_get_team_template('MIXTO','LOS OLVIDADOS', @template);
CALL usp_get_team_template('MIXTO','MIXED SQUIRRELS', @template);
CALL usp_get_team_template('MIXTO','MIXTICOS', @template);
CALL usp_get_team_template('MIXTO','PECHOCHOS', @template);
CALL usp_get_team_template('MIXTO','RENCOROSOS', @template);
CALL usp_get_team_template('MIXTO','ROJAS MIX', @template);
CALL usp_get_team_template('MIXTO','VENGADORES', @template);
CALL usp_get_team_template('MIXTO','VIKINGOS', @template);
CALL usp_get_team_template('MIXTO','WINNERS', @template);
-- =============================================================================
-- VARONIL 
-- =============================================================================
CALL usp_get_category_template('VARONIL',@template);
-- TEAMS
CALL usp_get_team_template('VARONIL','EL CHIQUE', @template);
CALL usp_get_team_template('VARONIL','CIERVOS', @template);
CALL usp_get_team_template('VARONIL','CUERVOS', @template);
CALL usp_get_team_template('VARONIL','DESPEINADOS', @template);
CALL usp_get_team_template('VARONIL','LOS UNICOS', @template);
CALL usp_get_team_template('VARONIL','NEGOS', @template);
CALL usp_get_team_template('VARONIL','REENCUENTRO', @template);
CALL usp_get_team_template('VARONIL','TOROS', @template);
-- =============================================================================
-- FEMENIL 
-- =============================================================================
CALL usp_get_category_template('FEMENIL',@template);
-- TEAMS
CALL usp_get_team_template('FEMENIL','GALACTICAS', @template);
CALL usp_get_team_template('FEMENIL','LAS PEQUES', @template);
CALL usp_get_team_template('FEMENIL','MONARCAS', @template);
CALL usp_get_team_template('FEMENIL','NOVAS', @template);
CALL usp_get_team_template('FEMENIL','PANTERAS', @template);
-- CALL usp_get_team_template('FEMENIL','COYOTITAS', @template);
CALL usp_get_team_template('FEMENIL','TIX', @template);
CALL usp_get_team_template('FEMENIL','VENUS', @template);

-- UPDATE LINK
UPDATE teams
SET image = concat('[[Torneo_Otoño_Invierno_2024_',UPPER(SUBSTRING(category,1,1)),LOWER(SUBSTRING(category,2)),'_', name,'|',name,']]') 
WHERE tournament_id = 2
-- =============================================================================

UPDATE games
SET team_1_set_1_pts = 25,team_1_set_2_pts = 25,team_1_set_3_pts = 25,
team_2_set_1_pts = 1,team_2_set_2_pts = 1,team_2_set_3_pts = 1
WHERE stage = 'QUARTER';
UPDATE games
SET team_1_set_1_pts = 25,team_1_set_2_pts = 25,team_1_set_3_pts = 25,team_1_set_4_pts = 25,
team_2_set_1_pts = 1,team_2_set_2_pts = 1,team_2_set_3_pts = 1,team_1_set_4_pts = 25
WHERE stage = 'SEMI';
UPDATE games
SET team_1_set_1_pts = 25,team_1_set_2_pts = 25,team_1_set_3_pts = 25,team_1_set_4_pts = 25,team_1_set_5_pts = 25,
team_2_set_1_pts = 1,team_2_set_2_pts = 1,team_2_set_3_pts = 1,team_1_set_5_pts = 25
WHERE stage = 'FINAL';
UPDATE games
SET team_1_set_1_pts = 25,team_1_set_2_pts = 25,
team_2_set_1_pts = 1,team_2_set_2_pts = 1
WHERE stage = 'THIRD';

SELECT * FROM teams WHERE tournament_id = 2 AND category = 'MIXTO'

CALL usp_update_team()