CREATE DEFINER=`root`@`localhost` FUNCTION `tvmtz_dev`.`fn_get_category_class`(IN in_category VARCHAR(10)	
) RETURNS text CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	RETURN 
		CASE in_category
		WHEN 'FEMENIL' THEN 'fem'
		WHEN 'VARONIL' THEN 'var'
		WHEN 'MIXTO' THEN 'mix'
		ELSE 'error' END;
END;