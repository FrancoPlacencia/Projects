-- SQL [Map Film]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Talent/Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES	
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeactors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Guest Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.EpisodeguestActor] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Director'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodedirectors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Writer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodewriters] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Producer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeproducers] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN (
SELECT 
[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id,
[AVAILS_ProgramMetadata_Ratings.Rating] as rating,
[AVAILS_ProgramMetadata_Ratings.Descriptor] as descriptor,
[AVAILS_ProgramMetadata_Ratings.Reason] as reason,
[AVAILS_ProgramMetadata_Ratings.Content] as content,
[AVAILS_ProgramMetadata_Ratings.UserCode] as usercode
FROM [AVAILS_ProgramMetadata]

	INNER JOIN [AVAILS_Transmission]
	ON [AVAILS_Transmission].object_id = [AVAILS_ProgramMetadata].object_id
	AND [AVAILS_Transmission.HierarchyParentID] = [AVAILS_ProgramMetadata.AMCNID]
	
	INNER JOIN [AVAILS_Transmission_PublicationSystem]
	ON [AVAILS_Transmission_PublicationSystem].parent_ref_id = [AVAILS_Transmission].parent_ref_id
	AND [AVAILS_Transmission_PublicationSystem].object_id = [AVAILS_Transmission].object_id 
	
	INNER JOIN [AVAILS_ProgramMetadata_Ratings]
	ON [AVAILS_ProgramMetadata_Ratings].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
	AND [AVAILS_ProgramMetadata_Ratings].object_id = [AVAILS_ProgramMetadata].object_id

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')	
	AND [AVAILS_ProgramMetadata_Ratings.Type]=[AVAILS_Transmission_PublicationSystem.Rating_Type]
	AND [AVAILS_ProgramMetadata_Ratings.UserCode]=[AVAILS_Transmission_PublicationSystem.Rating_UserCode]

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUP_RATINGS
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUP_RATINGS.parent_ref_id
SET [AVAILS_ProgramMetadata.EpisodeTVRating] = GROUP_RATINGS.rating,
[AVAILS_ProgramMetadata.RatingDescriptorTV] = GROUP_RATINGS.descriptor,
[AVAILS_ProgramMetadata.RatingReason] = GROUP_RATINGS.reason,
[AVAILS_ProgramMetadata.RatingUserCode] = GROUP_RATINGS.usercode

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Cutdown'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'CHVRS Rating'

SET [AVAILS_ProgramMetadata.CHVRSRating] = [AVAILS_ProgramMetadata_Ratings.Rating]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'RCQ Rating'

SET [AVAILS_ProgramMetadata.RCQRating] = [AVAILS_ProgramMetadata_Ratings.Rating]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] LIKE 'Amazon-Primary%'
SET [AVAILS_ProgramMetadata.StudioGenreAmazonOnly] = 
CASE 
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Crime' THEN 'AMC Plus Drama'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Supernatural' THEN 'AMC Plus Supernatural'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Crime' THEN 'AMC Plus Crime'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Documentary' THEN 'AMC Plus Documentaries'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Independent' THEN 'AMC Plus Independent'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Horror' THEN 'AMC Plus Horror'
    ELSE ''
END,
[AVAILS_ProgramMetadata.AmazonGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Amazon-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Amazon-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Amazon-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.AppleGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Movie')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.ApplePrimaryGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-Primary-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Movie')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT 
	GROUP_CONCAT(distinct [AVAILS_Transmission_AttributePeriods_AttributePeriod.Downloadable] SEPARATOR ',') AS grouped_Downloadable, 
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id AS period_parent_ref_id 
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id 
) AS period 
ON period.period_parent_ref_id = [AVAILS_Transmission].parent_ref_id 
SET [AVAILS_Transmission.TempDownload] = period.grouped_Downloadable 

NEW_SQL

INSERT INTO [AVAILS_Episode] (	
	[AVAILS_Episode].object_id,
	[AVAILS_Episode].object_type,
	[AVAILS_Episode.AMCNID],
	[AVAILS_Episode.HierarchyParentID],
	[AVAILS_Episode.TitleType],
	[AVAILS_Episode.ShowType],
	[AVAILS_Episode.EpisodeNumber],
	[AVAILS_Episode.ReleaseYear],
	[AVAILS_Episode.mediumEpisodeDescription],
	[AVAILS_Episode.MRMID],
	[AVAILS_Episode.EpisodeTitle],
	[AVAILS_Episode.AlternativeTitles],
	[AVAILS_Episode.EpisodeCC],
	[AVAILS_Episode.longEpisodeDescription],
	[AVAILS_Episode.shortEpisodeDescription],
	[AVAILS_Episode.Keywords],
	[AVAILS_Episode.OwnerNetwork],
	[AVAILS_Episode.EpisodeProductionNumber],
	[AVAILS_Episode.TMSID],
	[AVAILS_Episode.ActualTRT],
	[AVAILS_Episode.Episodeactors],
	[AVAILS_Episode.EpisodeguestActor],
	[AVAILS_Episode.Episodedirectors],
	[AVAILS_Episode.Episodewriters],
	[AVAILS_Episode.Episodeproducers],
	[AVAILS_Episode.EpisodeTVRating],
	[AVAILS_Episode.CanadaRating],
	[AVAILS_Episode.StudioGenreAmazonOnly],
    [AVAILS_Episode.AmazonGenre],
	[AVAILS_Episode.AppleGenre],
    [AVAILS_Episode.PremierDate],
	[AVAILS_Episode.PressSheetStatus],
	[AVAILS_Episode.Original],
	[AVAILS_Episode.DistributorProductionCompany],
	[AVAILS_Episode.EpisodeVersionTypeDescription],
	[AVAILS_Episode.CHVRSRating],
	[AVAILS_Episode.RCQRating],
	[AVAILS_Episode.CountryOfOrigin],
	[AVAILS_Episode.OriginalLanguage],
	[AVAILS_Episode.AURating],
	[AVAILS_Episode.NZRating],
	[AVAILS_Episode.RatingDescriptorCA],
	[AVAILS_Episode.RatingDescriptor] ,
	[AVAILS_Episode.RatingDescriptorNZ],
	[AVAILS_Episode.RatingDescriptorUS] ,
	[AVAILS_Episode.RatingDescriptorTV],
	[AVAILS_Episode.FolderName],
	[AVAILS_Episode.IndiaRating],
	[AVAILS_Episode.IndiaRatingDescriptor],
	[AVAILS_Episode.ChangedOn],
	[AVAILS_Episode.Notes],
	[AVAILS_Episode.PressTarget],
	[AVAILS_Episode.RatingReason],
	[AVAILS_Episode.RatingUserCode]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AiringOrder],
	[AVAILS_ProgramMetadata.ReleaseYear],
	MEDIUM[AVAILS_ProgramMetadata_Descriptions.Description] as Medium_Description,
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata_EpisodeTitle.Title],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata.ClosedCaptionsYN],
	LONG[AVAILS_ProgramMetadata_Descriptions.Description] as Long_Description,
	SHORT[AVAILS_ProgramMetadata_Descriptions.Description] as Short_Description,
	[AVAILS_ProgramMetadata.Keywords],
	[AVAILS_ProgramMetadata.OwnerNetwork],
	[AVAILS_ProgramMetadata.EpisodeNumber],
	[AVAILS_ProgramMetadata.TMSID],
	[AVAILS_ProgramMetadata.ActualTRT],
	[AVAILS_ProgramMetadata.Episodeactors],
	[AVAILS_ProgramMetadata.EpisodeguestActor],
	[AVAILS_ProgramMetadata.Episodedirectors],
	[AVAILS_ProgramMetadata.Episodewriters],
	[AVAILS_ProgramMetadata.Episodeproducers],
	[AVAILS_ProgramMetadata.EpisodeTVRating],
	[AVAILS_ProgramMetadata.CanadaRating],
	[AVAILS_ProgramMetadata.StudioGenreAmazonOnly],
    [AVAILS_ProgramMetadata.AmazonGenre],
    CONCAT_WS(',',[AVAILS_ProgramMetadata.ApplePrimaryGenre],[AVAILS_ProgramMetadata.AppleGenre]),
	[AVAILS_ProgramMetadata.PremierDate],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.Original],
	[AVAILS_ProgramMetadata.DistributorProductionCompany],
	[AVAILS_ProgramMetadata.EpisodeVersionTypeDescription],
	[AVAILS_ProgramMetadata.CHVRSRating],
	[AVAILS_ProgramMetadata.RCQRating],
	[AVAILS_ProgramMetadata.CountryOfOrigin],
	[AVAILS_ProgramMetadata.OriginalLanguage],
	[AVAILS_ProgramMetadata.AURating],
	[AVAILS_ProgramMetadata.NZRating],
	[AVAILS_ProgramMetadata.RatingDescriptorCA],
	 [AVAILS_ProgramMetadata.RatingDescriptor] ,
	[AVAILS_ProgramMetadata.RatingDescriptorNZ],
	[AVAILS_ProgramMetadata.RatingDescriptorUS] ,
	[AVAILS_ProgramMetadata.RatingDescriptorTV],
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE ( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^',''),'/',''),',',''),&quot;'&quot;,''),
	char(92),'')),
	[AVAILS_ProgramMetadata.IndiaRating],
	[AVAILS_ProgramMetadata.IndiaRatingDescriptor],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget],
	[AVAILS_ProgramMetadata.RatingReason],
	[AVAILS_ProgramMetadata.RatingUserCode]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_EpisodeTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_EpisodeTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_EpisodeTitle].object_id = {PROCESS::ID}

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS SHORT[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  SHORT[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND SHORT[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND SHORT[AVAILS_ProgramMetadata_Descriptions.Type] = 'Short'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS MEDIUM[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  MEDIUM[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS LONG[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  LONG[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND LONG[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND LONG[AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')">UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Talent/Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES	
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeactors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Guest Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.EpisodeguestActor] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Director'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodedirectors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Writer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodewriters] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Producer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeproducers] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN (
SELECT 
[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id,
[AVAILS_ProgramMetadata_Ratings.Rating] as rating,
[AVAILS_ProgramMetadata_Ratings.Descriptor] as descriptor,
[AVAILS_ProgramMetadata_Ratings.Reason] as reason,
[AVAILS_ProgramMetadata_Ratings.Content] as content,
[AVAILS_ProgramMetadata_Ratings.UserCode] as usercode
FROM [AVAILS_ProgramMetadata]

	INNER JOIN [AVAILS_Transmission]
	ON [AVAILS_Transmission].object_id = [AVAILS_ProgramMetadata].object_id
	AND [AVAILS_Transmission.HierarchyParentID] = [AVAILS_ProgramMetadata.AMCNID]
	
	INNER JOIN [AVAILS_Transmission_PublicationSystem]
	ON [AVAILS_Transmission_PublicationSystem].parent_ref_id = [AVAILS_Transmission].parent_ref_id
	AND [AVAILS_Transmission_PublicationSystem].object_id = [AVAILS_Transmission].object_id 
	
	INNER JOIN [AVAILS_ProgramMetadata_Ratings]
	ON [AVAILS_ProgramMetadata_Ratings].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
	AND [AVAILS_ProgramMetadata_Ratings].object_id = [AVAILS_ProgramMetadata].object_id

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')	
	AND [AVAILS_ProgramMetadata_Ratings.Type]=[AVAILS_Transmission_PublicationSystem.Rating_Type]
	AND [AVAILS_ProgramMetadata_Ratings.UserCode]=[AVAILS_Transmission_PublicationSystem.Rating_UserCode]

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUP_RATINGS
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUP_RATINGS.parent_ref_id
SET [AVAILS_ProgramMetadata.EpisodeTVRating] = GROUP_RATINGS.rating,
[AVAILS_ProgramMetadata.RatingDescriptorTV] = GROUP_RATINGS.descriptor,
[AVAILS_ProgramMetadata.RatingReason] = GROUP_RATINGS.reason,
[AVAILS_ProgramMetadata.RatingUserCode] = GROUP_RATINGS.usercode

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Cutdown'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'CHVRS Rating'

SET [AVAILS_ProgramMetadata.CHVRSRating] = [AVAILS_ProgramMetadata_Ratings.Rating]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'RCQ Rating'

SET [AVAILS_ProgramMetadata.RCQRating] = [AVAILS_ProgramMetadata_Ratings.Rating]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] LIKE 'Amazon-Primary%'
SET [AVAILS_ProgramMetadata.StudioGenreAmazonOnly] = 
CASE 
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Crime' THEN 'AMC Plus Drama'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Supernatural' THEN 'AMC Plus Supernatural'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Crime' THEN 'AMC Plus Crime'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Documentary' THEN 'AMC Plus Documentaries'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Independent' THEN 'AMC Plus Independent'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Horror' THEN 'AMC Plus Horror'
    ELSE ''
END,
[AVAILS_ProgramMetadata.AmazonGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Amazon-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Amazon-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Amazon-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.AppleGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Movie')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.ApplePrimaryGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-Primary-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Movie')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT 
	GROUP_CONCAT(distinct [AVAILS_Transmission_AttributePeriods_AttributePeriod.Downloadable] SEPARATOR ',') AS grouped_Downloadable, 
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id AS period_parent_ref_id 
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id 
) AS period 
ON period.period_parent_ref_id = [AVAILS_Transmission].parent_ref_id 
SET [AVAILS_Transmission.TempDownload] = period.grouped_Downloadable 

NEW_SQL

INSERT INTO [AVAILS_Episode] (	
	[AVAILS_Episode].object_id,
	[AVAILS_Episode].object_type,
	[AVAILS_Episode.AMCNID],
	[AVAILS_Episode.HierarchyParentID],
	[AVAILS_Episode.TitleType],
	[AVAILS_Episode.ShowType],
	[AVAILS_Episode.EpisodeNumber],
	[AVAILS_Episode.ReleaseYear],
	[AVAILS_Episode.mediumEpisodeDescription],
	[AVAILS_Episode.MRMID],
	[AVAILS_Episode.EpisodeTitle],
	[AVAILS_Episode.AlternativeTitles],
	[AVAILS_Episode.EpisodeCC],
	[AVAILS_Episode.longEpisodeDescription],
	[AVAILS_Episode.shortEpisodeDescription],
	[AVAILS_Episode.Keywords],
	[AVAILS_Episode.OwnerNetwork],
	[AVAILS_Episode.EpisodeProductionNumber],
	[AVAILS_Episode.TMSID],
	[AVAILS_Episode.ActualTRT],
	[AVAILS_Episode.Episodeactors],
	[AVAILS_Episode.EpisodeguestActor],
	[AVAILS_Episode.Episodedirectors],
	[AVAILS_Episode.Episodewriters],
	[AVAILS_Episode.Episodeproducers],
	[AVAILS_Episode.EpisodeTVRating],
	[AVAILS_Episode.CanadaRating],
	[AVAILS_Episode.StudioGenreAmazonOnly],
    [AVAILS_Episode.AmazonGenre],
	[AVAILS_Episode.AppleGenre],
    [AVAILS_Episode.PremierDate],
	[AVAILS_Episode.PressSheetStatus],
	[AVAILS_Episode.Original],
	[AVAILS_Episode.DistributorProductionCompany],
	[AVAILS_Episode.EpisodeVersionTypeDescription],
	[AVAILS_Episode.CHVRSRating],
	[AVAILS_Episode.RCQRating],
	[AVAILS_Episode.CountryOfOrigin],
	[AVAILS_Episode.OriginalLanguage],
	[AVAILS_Episode.AURating],
	[AVAILS_Episode.NZRating],
	[AVAILS_Episode.RatingDescriptorCA],
	[AVAILS_Episode.RatingDescriptor] ,
	[AVAILS_Episode.RatingDescriptorNZ],
	[AVAILS_Episode.RatingDescriptorUS] ,
	[AVAILS_Episode.RatingDescriptorTV],
	[AVAILS_Episode.FolderName],
	[AVAILS_Episode.IndiaRating],
	[AVAILS_Episode.IndiaRatingDescriptor],
	[AVAILS_Episode.ChangedOn],
	[AVAILS_Episode.Notes],
	[AVAILS_Episode.PressTarget],
	[AVAILS_Episode.RatingReason],
	[AVAILS_Episode.RatingUserCode]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AiringOrder],
	[AVAILS_ProgramMetadata.ReleaseYear],
	MEDIUM[AVAILS_ProgramMetadata_Descriptions.Description] as Medium_Description,
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata_EpisodeTitle.Title],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata.ClosedCaptionsYN],
	LONG[AVAILS_ProgramMetadata_Descriptions.Description] as Long_Description,
	SHORT[AVAILS_ProgramMetadata_Descriptions.Description] as Short_Description,
	[AVAILS_ProgramMetadata.Keywords],
	[AVAILS_ProgramMetadata.OwnerNetwork],
	[AVAILS_ProgramMetadata.EpisodeNumber],
	[AVAILS_ProgramMetadata.TMSID],
	[AVAILS_ProgramMetadata.ActualTRT],
	[AVAILS_ProgramMetadata.Episodeactors],
	[AVAILS_ProgramMetadata.EpisodeguestActor],
	[AVAILS_ProgramMetadata.Episodedirectors],
	[AVAILS_ProgramMetadata.Episodewriters],
	[AVAILS_ProgramMetadata.Episodeproducers],
	[AVAILS_ProgramMetadata.EpisodeTVRating],
	[AVAILS_ProgramMetadata.CanadaRating],
	[AVAILS_ProgramMetadata.StudioGenreAmazonOnly],
    [AVAILS_ProgramMetadata.AmazonGenre],
    CONCAT_WS(',',[AVAILS_ProgramMetadata.ApplePrimaryGenre],[AVAILS_ProgramMetadata.AppleGenre]),
	[AVAILS_ProgramMetadata.PremierDate],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.Original],
	[AVAILS_ProgramMetadata.DistributorProductionCompany],
	[AVAILS_ProgramMetadata.EpisodeVersionTypeDescription],
	[AVAILS_ProgramMetadata.CHVRSRating],
	[AVAILS_ProgramMetadata.RCQRating],
	[AVAILS_ProgramMetadata.CountryOfOrigin],
	[AVAILS_ProgramMetadata.OriginalLanguage],
	[AVAILS_ProgramMetadata.AURating],
	[AVAILS_ProgramMetadata.NZRating],
	[AVAILS_ProgramMetadata.RatingDescriptorCA],
	 [AVAILS_ProgramMetadata.RatingDescriptor] ,
	[AVAILS_ProgramMetadata.RatingDescriptorNZ],
	[AVAILS_ProgramMetadata.RatingDescriptorUS] ,
	[AVAILS_ProgramMetadata.RatingDescriptorTV],
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE ( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^',''),'/',''),',',''),&quot;'&quot;,''),
	char(92),'')),
	[AVAILS_ProgramMetadata.IndiaRating],
	[AVAILS_ProgramMetadata.IndiaRatingDescriptor],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget],
	[AVAILS_ProgramMetadata.RatingReason],
	[AVAILS_ProgramMetadata.RatingUserCode]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_EpisodeTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_EpisodeTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_EpisodeTitle].object_id = {PROCESS::ID}

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS SHORT[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  SHORT[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND SHORT[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND SHORT[AVAILS_ProgramMetadata_Descriptions.Type] = 'Short'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS MEDIUM[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  MEDIUM[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS LONG[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  LONG[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND LONG[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND LONG[AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Program'
AND [AVAILS_ProgramMetadata.ShowType] in ('Movie','Special','Pilot','Short Film')</sql></Params>
-- SQL [DisplayName]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
 LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Episode.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET [AVAILS_Episode.displayName] = 
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] = 'Amazon EST' THEN 'amc'
ELSE 'AMC Networks'
END,
 [AVAILS_Episode.Platform] = [EST_EXport_Reference_Platform.Platform_Name] ,
 
[AVAILS_Episode.corePlatform]=[EST_EXport_Reference_Platform.corePlatform],
[AVAILS_Episode.EpisodeTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Series.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET 
[AVAILS_Series.SeriesTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Series].object_id = {PROCESS::ID} ">UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
 LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Episode.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET [AVAILS_Episode.displayName] = 
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] = 'Amazon EST' THEN 'amc'
ELSE 'AMC Networks'
END,
 [AVAILS_Episode.Platform] = [EST_EXport_Reference_Platform.Platform_Name] ,
 
[AVAILS_Episode.corePlatform]=[EST_EXport_Reference_Platform.corePlatform],
[AVAILS_Episode.EpisodeTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Series.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET 
[AVAILS_Series.SeriesTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Series].object_id = {PROCESS::ID} </sql></Params>
-- SQL [Map Data]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="insert into [AVAILS_ProgramMetadataCheckpoint] (object_id, [AVAILS_ProgramMetadataCheckpoint.totalCount])
SELECT {PROCESS::ID}, COUNT(1) FROM [AVAILS_ProgramMetadata] WHERE object_id = {PROCESS::ID}

NEW_SQL
UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Talent/Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES	
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeactors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Guest Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.EpisodeguestActor] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Director'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodedirectors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Writer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodewriters] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Producer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeproducers] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'TV Rating'

SET [AVAILS_ProgramMetadata.EpisodeTVRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorTV] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'Canada TV Rating'

SET [AVAILS_ProgramMetadata.CanadaRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorCA] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')



NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'AU Rating'

SET [AVAILS_ProgramMetadata.AURating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptor] = [AVAILS_ProgramMetadata_Ratings.Descriptor]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NZ Rating'

SET [AVAILS_ProgramMetadata.NZRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorNZ] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')




NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NLD TV Rating'

SET
[AVAILS_ProgramMetadata.RatingDescriptorUS] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'IN Rating'

SET [AVAILS_ProgramMetadata.IndiaRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.IndiaRatingDescriptor] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')



NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Folder_SD'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Cutdown'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Special','Pilot')




NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] LIKE 'Amazon-Primary%'
SET [AVAILS_ProgramMetadata.StudioGenreAmazonOnly] = 
CASE 
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Crime' THEN 'AMC Plus Drama'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Supernatural' THEN 'AMC Plus Supernatural'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Crime' THEN 'AMC Plus Crime'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Documentary' THEN 'AMC Plus Documentaries'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Independent' THEN 'AMC Plus Independent'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Horror' THEN 'AMC Plus Horror'
    ELSE ''
END,
[AVAILS_ProgramMetadata.AmazonGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Amazon-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Amazon-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Amazon-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )    
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.AppleGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.ApplePrimaryGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-Primary-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT 
	GROUP_CONCAT(distinct [AVAILS_Transmission_AttributePeriods_AttributePeriod.Downloadable] SEPARATOR ',') AS grouped_Downloadable, 
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id AS period_parent_ref_id 
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id 
) AS period 
ON period.period_parent_ref_id = [AVAILS_Transmission].parent_ref_id 
SET [AVAILS_Transmission.TempDownload] = period.grouped_Downloadable 
WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT
    [AVAILS_Transmission.AMCNID] AS AMCNID,
    CONCAT_WS(CHAR(10 using utf8),IFNULL(Series_Notes.Notes,''),
                   IFNULL(Season_Notes.Notes,''),
                   IFNULL(Episode_Notes.Notes,'')) AS Notes
    FROM
    [AVAILS_Transmission]
    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('ParentSeries')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Series_Notes
        ON Series_Notes.obj=[AVAILS_Transmission].object_id

    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,	
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('Series')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Season_Notes
        ON Season_Notes.obj=[AVAILS_Transmission].object_id 
        
    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('Episode')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Episode_Notes
        ON Episode_Notes.obj=[AVAILS_Transmission].object_id
        AND Episode_Notes.AMCNID = [AVAILS_Transmission.HierarchyParentID]
    WHERE
    [AVAILS_Transmission].object_id={PROCESS::ID}

    GROUP BY [AVAILS_Transmission.AMCNID] 
) AS summaryNotesTbl 
ON summaryNotesTbl.AMCNID = [AVAILS_Transmission.AMCNID] 
SET [AVAILS_Transmission.SummaryNotes] = summaryNotesTbl.Notes
WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}


NEW_SQL

INSERT INTO [AVAILS_Series] (	
	[AVAILS_Series].object_id,
	[AVAILS_Series].object_type,
	[AVAILS_Series.AMCNID],
	[AVAILS_Series.TitleType],
	[AVAILS_Series.ShowType],			
	[AVAILS_Series.AlternativeTitles],
	[AVAILS_Series.Titles],
	[AVAILS_Series.mediumSeriesDescription],
	[AVAILS_Series.MRMID],
	[AVAILS_Series.PressSheetStatus],
	[AVAILS_Series.TMSID],
	[AVAILS_Series.FolderName],
	[AVAILS_Series.ChangedOn],
	[AVAILS_Series.ReleaseYear],
	[AVAILS_Series.Notes],
	[AVAILS_Series.PressTarget]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata_Titles.Title],
	[AVAILS_ProgramMetadata_Descriptions.Description],
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.TMSID],	
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE ( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^',''),'/',''),',',''),&quot;'&quot;,''),
	char(92),'')),
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.ReleaseYear],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Titles]
ON [AVAILS_ProgramMetadata_Titles].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Titles].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Descriptions].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] = 'ParentSeries'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

INSERT INTO [AVAILS_Season] (	
	[AVAILS_Season].object_id,
	[AVAILS_Season].object_type,
	[AVAILS_Season.AMCNID],
	[AVAILS_Season.HierarchyParentID],
	[AVAILS_Season.TitleType],
	[AVAILS_Season.ShowType],
	[AVAILS_Season.SeasonNumber],
	[AVAILS_Season.TotalNoOfEpisodes],
	[AVAILS_Season.MRMID],
	[AVAILS_Season.ReleaseYear],
	[AVAILS_Season.CountryOfOrigin],
	[AVAILS_Season.OriginalLanguage],
	[AVAILS_Season.LongSeasonDescription],
	[AVAILS_Season.PressSheetStatus],
	[AVAILS_Season.ChangedOn],
	[AVAILS_Season.Notes],
	[AVAILS_Season.PressTarget],
	[AVAILS_Season.Copyright]
)
SELECT 
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.SeasonNumber],
	[AVAILS_ProgramMetadata.TotalNoOfEpisodes],
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata.ReleaseYear],
	[AVAILS_ProgramMetadata.CountryOfOrigin],
	[AVAILS_ProgramMetadata.OriginalLanguage],
	[AVAILS_ProgramMetadata_Descriptions.Description],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget],
	[AVAILS_ProgramMetadata.Copyright]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Descriptions].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series' 
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

INSERT INTO [AVAILS_Episode] (	
	[AVAILS_Episode].object_id,
	[AVAILS_Episode].object_type,
	[AVAILS_Episode.AMCNID],
	[AVAILS_Episode.HierarchyParentID],
	[AVAILS_Episode.TitleType],
	[AVAILS_Episode.ShowType],
	[AVAILS_Episode.EpisodeNumber],
	[AVAILS_Episode.ReleaseYear],
	[AVAILS_Episode.mediumEpisodeDescription],
	[AVAILS_Episode.MRMID],
	[AVAILS_Episode.EpisodeTitle],
	[AVAILS_Episode.AlternativeTitles],
	[AVAILS_Episode.EpisodeCC],
	[AVAILS_Episode.longEpisodeDescription],
	[AVAILS_Episode.shortEpisodeDescription],
	[AVAILS_Episode.Keywords],
	[AVAILS_Episode.OwnerNetwork],
	[AVAILS_Episode.EpisodeProductionNumber],
	[AVAILS_Episode.TMSID],
	[AVAILS_Episode.ActualTRT],
	[AVAILS_Episode.Episodeactors],
	[AVAILS_Episode.EpisodeguestActor],
	[AVAILS_Episode.Episodedirectors],
	[AVAILS_Episode.Episodewriters],
	[AVAILS_Episode.Episodeproducers],
	[AVAILS_Episode.EpisodeTVRating],
	[AVAILS_Episode.CanadaRating],
	[AVAILS_Episode.StudioGenreAmazonOnly],
    [AVAILS_Episode.AmazonGenre],
	[AVAILS_Episode.AppleGenre],
    [AVAILS_Episode.PremierDate],
	[AVAILS_Episode.PressSheetStatus],
	[AVAILS_Episode.Original],
	[AVAILS_Episode.AURating],
	[AVAILS_Episode.NZRating],
	[AVAILS_Episode.RatingDescriptorCA],
	 [AVAILS_Episode.RatingDescriptor] ,
	[AVAILS_Episode.RatingDescriptorNZ],
	[AVAILS_Episode.RatingDescriptorUS] ,
	 [AVAILS_Episode.RatingDescriptorTV]  ,
	[AVAILS_Episode.FolderName],
    [AVAILS_Episode.ExtraCode],
	[AVAILS_Episode.ChangedOn],
	[AVAILS_Episode.IndiaRating],
	[AVAILS_Episode.IndiaRatingDescriptor],
	[AVAILS_Episode.Notes],
	[AVAILS_Episode.PressTarget]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AiringOrder],
	[AVAILS_ProgramMetadata.ReleaseYear],
	MEDIUM[AVAILS_ProgramMetadata_Descriptions.Description] as Medium_Description,
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata_EpisodeTitle.Title],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata.ClosedCaptionsYN],
	LONG[AVAILS_ProgramMetadata_Descriptions.Description] as Long_Description,
	SHORT[AVAILS_ProgramMetadata_Descriptions.Description] as Short_Description,
	[AVAILS_ProgramMetadata.Keywords],
	[AVAILS_ProgramMetadata.OwnerNetwork],
	[AVAILS_ProgramMetadata.EpisodeNumber],
	[AVAILS_ProgramMetadata.TMSID],
	[AVAILS_ProgramMetadata.ActualTRT],
	[AVAILS_ProgramMetadata.Episodeactors],
	[AVAILS_ProgramMetadata.EpisodeguestActor],
	[AVAILS_ProgramMetadata.Episodedirectors],
	[AVAILS_ProgramMetadata.Episodewriters],
	[AVAILS_ProgramMetadata.Episodeproducers],
	[AVAILS_ProgramMetadata.EpisodeTVRating],
	[AVAILS_ProgramMetadata.CanadaRating],
	[AVAILS_ProgramMetadata.StudioGenreAmazonOnly],
    [AVAILS_ProgramMetadata.AmazonGenre],
    CONCAT_WS(',',[AVAILS_ProgramMetadata.ApplePrimaryGenre],[AVAILS_ProgramMetadata.AppleGenre]),
	[AVAILS_ProgramMetadata.PremierDate],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.Original],
	[AVAILS_ProgramMetadata.AURating],
	[AVAILS_ProgramMetadata.NZRating],
	[AVAILS_ProgramMetadata.RatingDescriptorCA],
	 [AVAILS_ProgramMetadata.RatingDescriptor] ,
	[AVAILS_ProgramMetadata.RatingDescriptorNZ],
	[AVAILS_ProgramMetadata.RatingDescriptorUS] ,
	[AVAILS_ProgramMetadata.RatingDescriptorTV]  ,
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE ( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^',''),'/',''),',',''),&quot;'&quot;,''),
	char(92),'')),
    [AVAILS_ProgramMetadata.ExtraCode],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.IndiaRating] ,
	[AVAILS_ProgramMetadata.IndiaRatingDescriptor],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_EpisodeTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_EpisodeTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_EpisodeTitle].object_id = {PROCESS::ID}

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS SHORT[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  SHORT[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND SHORT[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND SHORT[AVAILS_ProgramMetadata_Descriptions.Type] = 'Short'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS MEDIUM[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  MEDIUM[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS LONG[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  LONG[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND LONG[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND LONG[AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] in ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Movie')

NEW_SQL

UPDATE [AVAILS_Transmission_AttributePeriods_AttributePeriod]
JOIN
	(SELECT
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].id idVal,
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id objID,
	IFNULL(MIN(tbl1.sDate),LEFT([AVAILS_Transmission.StartDateTimeTo],10)) endDate
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
	LEFT JOIN 
		(SELECT [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id parent,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id obj,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod].id rowID,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate] sDate
		FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
		WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Authenticated] = 'true')tbl1
	ON tbl1.obj = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
	AND tbl1.sDate &gt; [AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate]
	AND tbl1.parent = [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	JOIN [AVAILS_Transmission]
	ON [AVAILS_Transmission].object_id = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
	AND [AVAILS_Transmission].parent_ref_id = [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}
	AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true'
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].id)tbl2
ON tbl2.idVal = [AVAILS_Transmission_AttributePeriods_AttributePeriod].id
AND tbl2.objID = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
SET [AVAILS_Transmission_AttributePeriods_AttributePeriod.EndDate] = tbl2.endDate
WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_Transmission]
LEFT JOIN [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
ON [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}	 
AND [AVAILS_Transmission_AttributePeriods_AttributePeriod].id in ( 
	SELECT [AVAILS_Transmission_AttributePeriods_AttributePeriod].id
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
	INNER JOIN (
		SELECT 
			[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id as parent_ref_id,
		MIN(ABS(DATEDIFF([AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],CURDATE()))) as diffDates
		FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
		
		INNER JOIN [AVAILS_Transmission]
		ON [AVAILS_Transmission].object_id= {PROCESS::ID}  
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id  = [AVAILS_Transmission].parent_ref_id 
		
		WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true'
		GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	) AS RES_GROUPED
	ON [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id = RES_GROUPED.parent_ref_id
	AND ABS(DATEDIFF([AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],CURDATE())) = RES_GROUPED.diffDates
	
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true' 
)
SET 
[AVAILS_Transmission.flightStartDate] = [AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],
[AVAILS_Transmission.flightEndDate] = [AVAILS_Transmission_AttributePeriods_AttributePeriod.EndDate] 
where 
[AVAILS_Transmission].object_id= {PROCESS::ID} AND
[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id  = [AVAILS_Transmission].parent_ref_id

NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'TV Rating') 

SET [AVAILS_Season.TVRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')



NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'Canada TV Rating') 

SET [AVAILS_Season.CanadaRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')





NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'AU Rating') 

SET [AVAILS_Season.AURating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')






NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NZ Rating') 

SET [AVAILS_Season.NZRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')



NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'IN Rating') 

SET [AVAILS_Season.IndiaRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL
UPDATE 
[AVAILS_Episode]
LEFT JOIN 
[AVAILS_Season] ON 
(
 [AVAILS_Season].object_id = {PROCESS::ID} AND 
[AVAILS_Season.AMCNID] = [AVAILS_Episode.HierarchyParentID] 
)
SET
[AVAILS_Episode.SeasonNumber] =[AVAILS_Season.SeasonNumber]  

 WHERE [AVAILS_Episode].object_id = {PROCESS::ID}
 
 ">insert into [AVAILS_ProgramMetadataCheckpoint] (object_id, [AVAILS_ProgramMetadataCheckpoint.totalCount])
SELECT {PROCESS::ID}, COUNT(1) FROM [AVAILS_ProgramMetadata] WHERE object_id = {PROCESS::ID}

NEW_SQL
UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Talent/Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES	
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeactors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Guest Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.EpisodeguestActor] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Director'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodedirectors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Writer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodewriters] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Producer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeproducers] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'TV Rating'

SET [AVAILS_ProgramMetadata.EpisodeTVRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorTV] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'Canada TV Rating'

SET [AVAILS_ProgramMetadata.CanadaRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorCA] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')



NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'AU Rating'

SET [AVAILS_ProgramMetadata.AURating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptor] = [AVAILS_ProgramMetadata_Ratings.Descriptor]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NZ Rating'

SET [AVAILS_ProgramMetadata.NZRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorNZ] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')




NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NLD TV Rating'

SET
[AVAILS_ProgramMetadata.RatingDescriptorUS] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'IN Rating'

SET [AVAILS_ProgramMetadata.IndiaRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.IndiaRatingDescriptor] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')



NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Folder_SD'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Cutdown'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Special','Pilot')




NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] LIKE 'Amazon-Primary%'
SET [AVAILS_ProgramMetadata.StudioGenreAmazonOnly] = 
CASE 
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Crime' THEN 'AMC Plus Drama'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Supernatural' THEN 'AMC Plus Supernatural'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Crime' THEN 'AMC Plus Crime'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Documentary' THEN 'AMC Plus Documentaries'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Independent' THEN 'AMC Plus Independent'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Horror' THEN 'AMC Plus Horror'
    ELSE ''
END,
[AVAILS_ProgramMetadata.AmazonGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Amazon-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Amazon-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Amazon-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )    
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.AppleGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')


NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.ApplePrimaryGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-Primary-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial')

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT 
	GROUP_CONCAT(distinct [AVAILS_Transmission_AttributePeriods_AttributePeriod.Downloadable] SEPARATOR ',') AS grouped_Downloadable, 
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id AS period_parent_ref_id 
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id 
) AS period 
ON period.period_parent_ref_id = [AVAILS_Transmission].parent_ref_id 
SET [AVAILS_Transmission.TempDownload] = period.grouped_Downloadable 
WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT
    [AVAILS_Transmission.AMCNID] AS AMCNID,
    CONCAT_WS(CHAR(10 using utf8),IFNULL(Series_Notes.Notes,''),
                   IFNULL(Season_Notes.Notes,''),
                   IFNULL(Episode_Notes.Notes,'')) AS Notes
    FROM
    [AVAILS_Transmission]
    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('ParentSeries')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Series_Notes
        ON Series_Notes.obj=[AVAILS_Transmission].object_id

    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,	
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('Series')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Season_Notes
        ON Season_Notes.obj=[AVAILS_Transmission].object_id 
        
    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('Episode')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Episode_Notes
        ON Episode_Notes.obj=[AVAILS_Transmission].object_id
        AND Episode_Notes.AMCNID = [AVAILS_Transmission.HierarchyParentID]
    WHERE
    [AVAILS_Transmission].object_id={PROCESS::ID}

    GROUP BY [AVAILS_Transmission.AMCNID] 
) AS summaryNotesTbl 
ON summaryNotesTbl.AMCNID = [AVAILS_Transmission.AMCNID] 
SET [AVAILS_Transmission.SummaryNotes] = summaryNotesTbl.Notes
WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}


NEW_SQL

INSERT INTO [AVAILS_Series] (	
	[AVAILS_Series].object_id,
	[AVAILS_Series].object_type,
	[AVAILS_Series.AMCNID],
	[AVAILS_Series.TitleType],
	[AVAILS_Series.ShowType],			
	[AVAILS_Series.AlternativeTitles],
	[AVAILS_Series.Titles],
	[AVAILS_Series.mediumSeriesDescription],
	[AVAILS_Series.MRMID],
	[AVAILS_Series.PressSheetStatus],
	[AVAILS_Series.TMSID],
	[AVAILS_Series.FolderName],
	[AVAILS_Series.ChangedOn],
	[AVAILS_Series.ReleaseYear],
	[AVAILS_Series.Notes],
	[AVAILS_Series.PressTarget]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata_Titles.Title],
	[AVAILS_ProgramMetadata_Descriptions.Description],
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.TMSID],	
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE ( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^',''),'/',''),',',''),&quot;'&quot;,''),
	char(92),'')),
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.ReleaseYear],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Titles]
ON [AVAILS_ProgramMetadata_Titles].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Titles].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Descriptions].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] = 'ParentSeries'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

INSERT INTO [AVAILS_Season] (	
	[AVAILS_Season].object_id,
	[AVAILS_Season].object_type,
	[AVAILS_Season.AMCNID],
	[AVAILS_Season.HierarchyParentID],
	[AVAILS_Season.TitleType],
	[AVAILS_Season.ShowType],
	[AVAILS_Season.SeasonNumber],
	[AVAILS_Season.TotalNoOfEpisodes],
	[AVAILS_Season.MRMID],
	[AVAILS_Season.ReleaseYear],
	[AVAILS_Season.CountryOfOrigin],
	[AVAILS_Season.OriginalLanguage],
	[AVAILS_Season.LongSeasonDescription],
	[AVAILS_Season.PressSheetStatus],
	[AVAILS_Season.ChangedOn],
	[AVAILS_Season.Notes],
	[AVAILS_Season.PressTarget],
	[AVAILS_Season.Copyright]
)
SELECT 
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.SeasonNumber],
	[AVAILS_ProgramMetadata.TotalNoOfEpisodes],
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata.ReleaseYear],
	[AVAILS_ProgramMetadata.CountryOfOrigin],
	[AVAILS_ProgramMetadata.OriginalLanguage],
	[AVAILS_ProgramMetadata_Descriptions.Description],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget],
	[AVAILS_ProgramMetadata.Copyright]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Descriptions].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series' 
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

INSERT INTO [AVAILS_Episode] (	
	[AVAILS_Episode].object_id,
	[AVAILS_Episode].object_type,
	[AVAILS_Episode.AMCNID],
	[AVAILS_Episode.HierarchyParentID],
	[AVAILS_Episode.TitleType],
	[AVAILS_Episode.ShowType],
	[AVAILS_Episode.EpisodeNumber],
	[AVAILS_Episode.ReleaseYear],
	[AVAILS_Episode.mediumEpisodeDescription],
	[AVAILS_Episode.MRMID],
	[AVAILS_Episode.EpisodeTitle],
	[AVAILS_Episode.AlternativeTitles],
	[AVAILS_Episode.EpisodeCC],
	[AVAILS_Episode.longEpisodeDescription],
	[AVAILS_Episode.shortEpisodeDescription],
	[AVAILS_Episode.Keywords],
	[AVAILS_Episode.OwnerNetwork],
	[AVAILS_Episode.EpisodeProductionNumber],
	[AVAILS_Episode.TMSID],
	[AVAILS_Episode.ActualTRT],
	[AVAILS_Episode.Episodeactors],
	[AVAILS_Episode.EpisodeguestActor],
	[AVAILS_Episode.Episodedirectors],
	[AVAILS_Episode.Episodewriters],
	[AVAILS_Episode.Episodeproducers],
	[AVAILS_Episode.EpisodeTVRating],
	[AVAILS_Episode.CanadaRating],
	[AVAILS_Episode.StudioGenreAmazonOnly],
    [AVAILS_Episode.AmazonGenre],
	[AVAILS_Episode.AppleGenre],
    [AVAILS_Episode.PremierDate],
	[AVAILS_Episode.PressSheetStatus],
	[AVAILS_Episode.Original],
	[AVAILS_Episode.AURating],
	[AVAILS_Episode.NZRating],
	[AVAILS_Episode.RatingDescriptorCA],
	 [AVAILS_Episode.RatingDescriptor] ,
	[AVAILS_Episode.RatingDescriptorNZ],
	[AVAILS_Episode.RatingDescriptorUS] ,
	 [AVAILS_Episode.RatingDescriptorTV]  ,
	[AVAILS_Episode.FolderName],
    [AVAILS_Episode.ExtraCode],
	[AVAILS_Episode.ChangedOn],
	[AVAILS_Episode.IndiaRating],
	[AVAILS_Episode.IndiaRatingDescriptor],
	[AVAILS_Episode.Notes],
	[AVAILS_Episode.PressTarget]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AiringOrder],
	[AVAILS_ProgramMetadata.ReleaseYear],
	MEDIUM[AVAILS_ProgramMetadata_Descriptions.Description] as Medium_Description,
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata_EpisodeTitle.Title],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata.ClosedCaptionsYN],
	LONG[AVAILS_ProgramMetadata_Descriptions.Description] as Long_Description,
	SHORT[AVAILS_ProgramMetadata_Descriptions.Description] as Short_Description,
	[AVAILS_ProgramMetadata.Keywords],
	[AVAILS_ProgramMetadata.OwnerNetwork],
	[AVAILS_ProgramMetadata.EpisodeNumber],
	[AVAILS_ProgramMetadata.TMSID],
	[AVAILS_ProgramMetadata.ActualTRT],
	[AVAILS_ProgramMetadata.Episodeactors],
	[AVAILS_ProgramMetadata.EpisodeguestActor],
	[AVAILS_ProgramMetadata.Episodedirectors],
	[AVAILS_ProgramMetadata.Episodewriters],
	[AVAILS_ProgramMetadata.Episodeproducers],
	[AVAILS_ProgramMetadata.EpisodeTVRating],
	[AVAILS_ProgramMetadata.CanadaRating],
	[AVAILS_ProgramMetadata.StudioGenreAmazonOnly],
    [AVAILS_ProgramMetadata.AmazonGenre],
    CONCAT_WS(',',[AVAILS_ProgramMetadata.ApplePrimaryGenre],[AVAILS_ProgramMetadata.AppleGenre]),
	[AVAILS_ProgramMetadata.PremierDate],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.Original],
	[AVAILS_ProgramMetadata.AURating],
	[AVAILS_ProgramMetadata.NZRating],
	[AVAILS_ProgramMetadata.RatingDescriptorCA],
	 [AVAILS_ProgramMetadata.RatingDescriptor] ,
	[AVAILS_ProgramMetadata.RatingDescriptorNZ],
	[AVAILS_ProgramMetadata.RatingDescriptorUS] ,
	[AVAILS_ProgramMetadata.RatingDescriptorTV]  ,
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE ( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^',''),'/',''),',',''),&quot;'&quot;,''),
	char(92),'')),
    [AVAILS_ProgramMetadata.ExtraCode],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.IndiaRating] ,
	[AVAILS_ProgramMetadata.IndiaRatingDescriptor],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_EpisodeTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_EpisodeTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_EpisodeTitle].object_id = {PROCESS::ID}

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS SHORT[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  SHORT[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND SHORT[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND SHORT[AVAILS_ProgramMetadata_Descriptions.Type] = 'Short'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS MEDIUM[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  MEDIUM[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS LONG[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  LONG[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND LONG[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND LONG[AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] in ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Movie')

NEW_SQL

UPDATE [AVAILS_Transmission_AttributePeriods_AttributePeriod]
JOIN
	(SELECT
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].id idVal,
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id objID,
	IFNULL(MIN(tbl1.sDate),LEFT([AVAILS_Transmission.StartDateTimeTo],10)) endDate
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
	LEFT JOIN 
		(SELECT [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id parent,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id obj,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod].id rowID,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate] sDate
		FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
		WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Authenticated] = 'true')tbl1
	ON tbl1.obj = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
	AND tbl1.sDate &gt; [AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate]
	AND tbl1.parent = [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	JOIN [AVAILS_Transmission]
	ON [AVAILS_Transmission].object_id = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
	AND [AVAILS_Transmission].parent_ref_id = [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}
	AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true'
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].id)tbl2
ON tbl2.idVal = [AVAILS_Transmission_AttributePeriods_AttributePeriod].id
AND tbl2.objID = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
SET [AVAILS_Transmission_AttributePeriods_AttributePeriod.EndDate] = tbl2.endDate
WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_Transmission]
LEFT JOIN [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
ON [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}	 
AND [AVAILS_Transmission_AttributePeriods_AttributePeriod].id in ( 
	SELECT [AVAILS_Transmission_AttributePeriods_AttributePeriod].id
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
	INNER JOIN (
		SELECT 
			[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id as parent_ref_id,
		MIN(ABS(DATEDIFF([AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],CURDATE()))) as diffDates
		FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
		
		INNER JOIN [AVAILS_Transmission]
		ON [AVAILS_Transmission].object_id= {PROCESS::ID}  
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id  = [AVAILS_Transmission].parent_ref_id 
		
		WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true'
		GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	) AS RES_GROUPED
	ON [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id = RES_GROUPED.parent_ref_id
	AND ABS(DATEDIFF([AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],CURDATE())) = RES_GROUPED.diffDates
	
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true' 
)
SET 
[AVAILS_Transmission.flightStartDate] = [AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],
[AVAILS_Transmission.flightEndDate] = [AVAILS_Transmission_AttributePeriods_AttributePeriod.EndDate] 
where 
[AVAILS_Transmission].object_id= {PROCESS::ID} AND
[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id  = [AVAILS_Transmission].parent_ref_id

NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'TV Rating') 

SET [AVAILS_Season.TVRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')



NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'Canada TV Rating') 

SET [AVAILS_Season.CanadaRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')





NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'AU Rating') 

SET [AVAILS_Season.AURating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')






NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NZ Rating') 

SET [AVAILS_Season.NZRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')



NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'IN Rating') 

SET [AVAILS_Season.IndiaRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL
UPDATE 
[AVAILS_Episode]
LEFT JOIN 
[AVAILS_Season] ON 
(
 [AVAILS_Season].object_id = {PROCESS::ID} AND 
[AVAILS_Season.AMCNID] = [AVAILS_Episode.HierarchyParentID] 
)
SET
[AVAILS_Episode.SeasonNumber] =[AVAILS_Season.SeasonNumber]  

 WHERE [AVAILS_Episode].object_id = {PROCESS::ID}
 
 </sql></Params>
-- SQL [DisplayName]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
 LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Episode.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET [AVAILS_Episode.displayName] = 
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] = 'Amazon EST' THEN 'amc'
ELSE 'AMC Networks'
END,
 [AVAILS_Episode.Platform] = [EST_EXport_Reference_Platform.Platform_Name] ,
[AVAILS_Episode.EpisodeTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Series.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET 
[AVAILS_Series.SeriesTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Series].object_id = {PROCESS::ID} ">UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
 LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Episode.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET [AVAILS_Episode.displayName] = 
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] = 'Amazon EST' THEN 'amc'
ELSE 'AMC Networks'
END,
 [AVAILS_Episode.Platform] = [EST_EXport_Reference_Platform.Platform_Name] ,
[AVAILS_Episode.EpisodeTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Series.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET 
[AVAILS_Series.SeriesTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Series].object_id = {PROCESS::ID} </sql></Params>
-- SQL [Map Hierachy ID]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND SUBSTRING_INDEX([AVAILS_Episode.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Episode.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Episode.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END,
[AVAILS_Episode.ServiceProvider] =
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] in ('Amazon EST','Comcast EST','Verizon EST','VUDU','Microsoft Xbox' ) THEN 'Fotokem'
WHEN [EST_EXport_Reference_Platform.Platform_Name] in ('FandangoNOW EST','Google Play' ) THEN 'Premiere'
else
''
END 
 WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND SUBSTRING_INDEX([AVAILS_Series.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Series.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Series.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Series].object_id = {PROCESS::ID} 
 
 
 
NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND SUBSTRING_INDEX([AVAILS_Season.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Season.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Season.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  
 
 ">UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND SUBSTRING_INDEX([AVAILS_Episode.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Episode.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Episode.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END,
[AVAILS_Episode.ServiceProvider] =
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] in ('Amazon EST','Comcast EST','Verizon EST','VUDU','Microsoft Xbox' ) THEN 'Fotokem'
WHEN [EST_EXport_Reference_Platform.Platform_Name] in ('FandangoNOW EST','Google Play' ) THEN 'Premiere'
else
''
END 
 WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND SUBSTRING_INDEX([AVAILS_Series.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Series.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Series.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Series].object_id = {PROCESS::ID} 
 
 
 
NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND SUBSTRING_INDEX([AVAILS_Season.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Season.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Season.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  
 
 </sql></Params>
-- SQL [Map Hierarchy ID]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(
([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) 
AND SUBSTRING_INDEX([AVAILS_Episode.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Episode.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) 
THEN IF([EST_EXport_data_tmp.exportType]='iTunes Export',[AVAILS_Episode.AMCNID],[AVAILS_Episode.MRMID])
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) AND SUBSTRING_INDEX([AVAILS_Series.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Series.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) 
THEN IF([EST_EXport_data_tmp.exportType]='iTunes Export',[AVAILS_Series.AMCNID],[AVAILS_Series.MRMID])
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Series].object_id = {PROCESS::ID} 
 
 
 
NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) AND SUBSTRING_INDEX([AVAILS_Season.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Season.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) 
THEN IF([EST_EXport_data_tmp.exportType]='iTunes Export',[AVAILS_Season.AMCNID],[AVAILS_Season.MRMID]) 
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  
 
 ">UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(
([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) 
AND SUBSTRING_INDEX([AVAILS_Episode.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Episode.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) 
THEN IF([EST_EXport_data_tmp.exportType]='iTunes Export',[AVAILS_Episode.AMCNID],[AVAILS_Episode.MRMID])
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) AND SUBSTRING_INDEX([AVAILS_Series.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Series.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) 
THEN IF([EST_EXport_data_tmp.exportType]='iTunes Export',[AVAILS_Series.AMCNID],[AVAILS_Series.MRMID])
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Series].object_id = {PROCESS::ID} 
 
 
 
NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) AND SUBSTRING_INDEX([AVAILS_Season.AMCNID],'-',1) = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Season.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) 
THEN IF([EST_EXport_data_tmp.exportType]='iTunes Export',[AVAILS_Season.AMCNID],[AVAILS_Season.MRMID]) 
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  
 
 </sql></Params>
-- SQL [Map Hierachy ID]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(
([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) 
AND [AVAILS_Episode.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Episode.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Episode.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) AND [AVAILS_Series.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Series.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Series.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Series].object_id = {PROCESS::ID} 
 
 
 
NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) AND [AVAILS_Season.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Season.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Season.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  
 
 ">UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(
([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) 
AND [AVAILS_Episode.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Episode.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Episode.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) AND [AVAILS_Series.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Series.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Series.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Series].object_id = {PROCESS::ID} 
 
 
 
NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
(([ADAM_NL_ID_Table.nonLinearPlatform]  like REPLACE([EST_EXport_Reference_Platform.Platform_Name],'+','%')   ) AND [AVAILS_Season.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Season.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Season.MRMID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  
 
 </sql></Params>
-- SQL [CleanDataInit]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value=""></sql></Params>
-- SQL [CleanData]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="DELETE  FROM [EST_EXport_list_temp] WHERE [EST_EXport_list_temp].object_id={PROCESS::ID} 

NEW_SQL

DELETE  FROM [EST_EXport_Common_evals] WHERE [EST_EXport_Common_evals].object_id={PROCESS::ID} 

NEW_SQL

DELETE  FROM [EST_EXport_data_tmp] WHERE [EST_EXport_data_tmp].object_id={PROCESS::ID} 
">DELETE  FROM [EST_EXport_list_temp] WHERE [EST_EXport_list_temp].object_id={PROCESS::ID} 

NEW_SQL

DELETE  FROM [EST_EXport_Common_evals] WHERE [EST_EXport_Common_evals].object_id={PROCESS::ID} 

NEW_SQL

DELETE  FROM [EST_EXport_data_tmp] WHERE [EST_EXport_data_tmp].object_id={PROCESS::ID} 
</sql></Params>
-- SQL [Skip NameSpace]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = REPLACE(REPLACE(REPLACE([AVAILS_Response.result],'&lt;amc:','&lt;'),'&lt;/amc:','&lt;/'),'amc:','')
WHERE [AVAILS_Response].object_id = {PROCESS::ID}">UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = REPLACE(REPLACE(REPLACE([AVAILS_Response.result],'&lt;amc:','&lt;'),'&lt;/amc:','&lt;/'),'amc:','')
WHERE [AVAILS_Response].object_id = {PROCESS::ID}</sql></Params>
-- SQL [clean MP Tables]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="DELETE  FROM [AVAILS_Series] WHERE [AVAILS_Series].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Season] WHERE [AVAILS_Season].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Episode] WHERE [AVAILS_Episode].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Episode_Titles] WHERE [AVAILS_Episode_Titles].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadataMRM] WHERE [AVAILS_ProgramMetadataMRM].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata] WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Cast_CastMember] WHERE [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames] WHERE [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Crew_CrewMember] WHERE [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames] WHERE [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Descriptions] WHERE [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_EpisodeTitle] WHERE [AVAILS_ProgramMetadata_EpisodeTitle].object_id = {PROCESS::ID}

NEW_SQL

DELETE FROM [AVAILS_Transmission_PublicationSystem] WHERE [AVAILS_Transmission_PublicationSystem].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Ratings] WHERE [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Titles] WHERE [AVAILS_ProgramMetadata_Titles].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup] WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Transmission] WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Series_Titles] WHERE [AVAILS_Series_Titles].object_id = {PROCESS::ID}">DELETE  FROM [AVAILS_Series] WHERE [AVAILS_Series].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Season] WHERE [AVAILS_Season].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Episode] WHERE [AVAILS_Episode].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Episode_Titles] WHERE [AVAILS_Episode_Titles].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadataMRM] WHERE [AVAILS_ProgramMetadataMRM].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata] WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Cast_CastMember] WHERE [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames] WHERE [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Crew_CrewMember] WHERE [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames] WHERE [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Descriptions] WHERE [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_EpisodeTitle] WHERE [AVAILS_ProgramMetadata_EpisodeTitle].object_id = {PROCESS::ID}

NEW_SQL

DELETE FROM [AVAILS_Transmission_PublicationSystem] WHERE [AVAILS_Transmission_PublicationSystem].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Ratings] WHERE [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_Titles] WHERE [AVAILS_ProgramMetadata_Titles].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup] WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Transmission] WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}

NEW_SQL

DELETE  FROM [AVAILS_Series_Titles] WHERE [AVAILS_Series_Titles].object_id = {PROCESS::ID}</sql></Params>
-- SQL [DisplayName]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
 LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Episode.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET [AVAILS_Episode.displayName] = 
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] = 'Amazon EST' THEN 'amc'
ELSE 'AMC Networks'
END,
 [AVAILS_Episode.Platform] = [EST_EXport_Reference_Platform.Platform_Name] ,
[AVAILS_Episode.EpisodeTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Series.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET 
[AVAILS_Series.SeriesTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Series].object_id = {PROCESS::ID} ">UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
 LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Episode.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET [AVAILS_Episode.displayName] = 
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] = 'Amazon EST' THEN 'amc'
ELSE 'AMC Networks'
END,
 [AVAILS_Episode.Platform] = [EST_EXport_Reference_Platform.Platform_Name] ,
[AVAILS_Episode.EpisodeTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Series.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET 
[AVAILS_Series.SeriesTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Series].object_id = {PROCESS::ID} </sql></Params>
-- SQL [Map Hierarchy ID]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Episode.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Episode.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Episode.AMCNID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END,
[AVAILS_Episode.ServiceProvider] =
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] in ('Amazon EST','Comcast EST','Verizon EST','VUDU','Microsoft Xbox' ) THEN 'Fotokem'
WHEN [EST_EXport_Reference_Platform.Platform_Name] in ('FandangoNOW EST','Google Play' ) THEN 'Premiere'
else
''
END 
 WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Series.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Series.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Series.AMCNID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Series].object_id = {PROCESS::ID} 
 
 
 
NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Season.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Season.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Season.AMCNID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  
 
 ">UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Episode.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Episode.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Episode.AMCNID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END,
[AVAILS_Episode.ServiceProvider] =
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] in ('Amazon EST','Comcast EST','Verizon EST','VUDU','Microsoft Xbox' ) THEN 'Fotokem'
WHEN [EST_EXport_Reference_Platform.Platform_Name] in ('FandangoNOW EST','Google Play' ) THEN 'Premiere'
else
''
END 
 WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Series.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Series.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Series.AMCNID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Series].object_id = {PROCESS::ID} 
 
 
 
NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
LEFT JOIN [ADAM_NL_ID_Table] ON  
([EST_EXport_Reference_Platform.Platform_Name]  = sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Season.AMCNID] = [ADAM_NL_ID_Table.amcnId])
SET [AVAILS_Season.exportAMCNID] = 
CASE
WHEN ( ( [ADAM_NL_ID_Table.legacyNonLinearId] = '' ) or ([ADAM_NL_ID_Table.legacyNonLinearId] IS NULL )) THEN [AVAILS_Season.AMCNID]
ELSE [ADAM_NL_ID_Table.legacyNonLinearId]
END
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  
 
 </sql></Params>
-- SQL [Skip NameSpace]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = REPLACE(REPLACE(REPLACE([AVAILS_Response.result],'&lt;amc:','&lt;'),'&lt;/amc:','&lt;/'),'amc:','')
WHERE [AVAILS_Response].object_id = {PROCESS::ID}">UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = REPLACE(REPLACE(REPLACE([AVAILS_Response.result],'&lt;amc:','&lt;'),'&lt;/amc:','&lt;/'),'amc:','')
WHERE [AVAILS_Response].object_id = {PROCESS::ID}</sql></Params>
-- SQL [DisplayName]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
 LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Episode.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET [AVAILS_Episode.displayName] = 
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] = 'Amazon EST' THEN 'amc'
ELSE 'AMC Networks'
END,
 [AVAILS_Episode.Platform] = [EST_EXport_Reference_Platform.Platform_Name] ,
 
[AVAILS_Episode.corePlatform]=[EST_EXport_Reference_Platform.corePlatform],
[AVAILS_Episode.EpisodeTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Series.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET 
[AVAILS_Series.SeriesTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Series].object_id = {PROCESS::ID} ">UPDATE [AVAILS_Episode]
LEFT JOIN [EST_EXport_data_tmp] ON [EST_EXport_data_tmp].object_id = {PROCESS::ID} 
LEFT JOIN [EST_EXport_Reference_Platform] ON [EST_EXport_data_tmp.Platform] =[EST_EXport_Reference_Platform.Platform_ID]
 LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Episode.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET [AVAILS_Episode.displayName] = 
CASE
WHEN [EST_EXport_Reference_Platform.Platform_Name] = 'Amazon EST' THEN 'amc'
ELSE 'AMC Networks'
END,
 [AVAILS_Episode.Platform] = [EST_EXport_Reference_Platform.Platform_Name] ,
 
[AVAILS_Episode.corePlatform]=[EST_EXport_Reference_Platform.corePlatform],
[AVAILS_Episode.EpisodeTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Episode].object_id = {PROCESS::ID} 

NEW_SQL

UPDATE [AVAILS_Series]
LEFT JOIN  [AVAILS_ProgramMetadataMRM] ON 
( [AVAILS_ProgramMetadataMRM.HierarchyParentID] = [AVAILS_Series.AMCNID] and [AVAILS_ProgramMetadataMRM].object_id={PROCESS::ID} ) 
SET 
[AVAILS_Series.SeriesTitleDisplayUnlimited]=[AVAILS_ProgramMetadataMRM.AlternativeTitles] 
WHERE [AVAILS_Series].object_id = {PROCESS::ID} </sql></Params>
-- SQL [Map Episode and Series]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="insert into [AVAILS_ProgramMetadataCheckpoint] (object_id, [AVAILS_ProgramMetadataCheckpoint.totalCount])
SELECT {PROCESS::ID}, COUNT(1) FROM [AVAILS_ProgramMetadata] WHERE object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Talent/Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES	
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeactors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Guest Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.EpisodeguestActor] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Director'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodedirectors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Writer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodewriters] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Producer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeproducers] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'TV Rating'

SET [AVAILS_ProgramMetadata.EpisodeTVRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorTV] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'Canada TV Rating'

SET [AVAILS_ProgramMetadata.CanadaRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorCA] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'AU Rating'

SET [AVAILS_ProgramMetadata.AURating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptor] = [AVAILS_ProgramMetadata_Ratings.Descriptor]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NZ Rating'

SET [AVAILS_ProgramMetadata.NZRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorNZ] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NLD TV Rating'

SET
[AVAILS_ProgramMetadata.RatingDescriptorUS] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = [AVAILS_ProgramMetadata].object_id

LEFT JOIN [AVAILS_Transmission_PublicationSystem]
ON [AVAILS_Transmission_PublicationSystem].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_Transmission_PublicationSystem].object_id = [AVAILS_ProgramMetadata].object_id

SET [AVAILS_ProgramMetadata.IndiaRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.IndiaRatingDescriptor] = [AVAILS_ProgramMetadata_Ratings.Descriptor],
[AVAILS_ProgramMetadata.UserCode] = [AVAILS_Transmission_PublicationSystem.Rating_UserCode]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata_Ratings.Type]=[AVAILS_Transmission_PublicationSystem.Rating_Type]
AND [AVAILS_ProgramMetadata_Ratings.UserCode]=[AVAILS_Transmission_PublicationSystem.Rating_UserCode]
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Folder_SD'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program','ParentSeries')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Cutdown'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] LIKE 'Amazon-Primary%'
SET [AVAILS_ProgramMetadata.StudioGenreAmazonOnly] = 
CASE 
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Crime' THEN 'AMC Plus Drama'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Supernatural' THEN 'AMC Plus Supernatural'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Crime' THEN 'AMC Plus Crime'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Documentary' THEN 'AMC Plus Documentaries'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Independent' THEN 'AMC Plus Independent'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Horror' THEN 'AMC Plus Horror'
    ELSE ''
END,
[AVAILS_ProgramMetadata.AmazonGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Amazon-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Amazon-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Amazon-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )    
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.AppleGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.ApplePrimaryGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-Primary-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT 
	GROUP_CONCAT(distinct [AVAILS_Transmission_AttributePeriods_AttributePeriod.Downloadable] SEPARATOR ',') AS grouped_Downloadable, 
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id AS period_parent_ref_id 
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id 
) AS period 
ON period.period_parent_ref_id = [AVAILS_Transmission].parent_ref_id 
SET [AVAILS_Transmission.TempDownload] = period.grouped_Downloadable 
WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT
    [AVAILS_Transmission.AMCNID] AS AMCNID,
    CONCAT_WS(CHAR(10 using utf8),IFNULL(Series_Notes.Notes,''),
                   IFNULL(Season_Notes.Notes,''),
                   IFNULL(Episode_Notes.Notes,'')) AS Notes
    FROM
    [AVAILS_Transmission]
    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('ParentSeries')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Series_Notes
        ON Series_Notes.obj=[AVAILS_Transmission].object_id

    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,	
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('Series')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Season_Notes
        ON Season_Notes.obj=[AVAILS_Transmission].object_id 
        
    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('Episode')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Episode_Notes
        ON Episode_Notes.obj=[AVAILS_Transmission].object_id
        AND Episode_Notes.AMCNID = [AVAILS_Transmission.HierarchyParentID]
    WHERE
    [AVAILS_Transmission].object_id={PROCESS::ID}

    GROUP BY [AVAILS_Transmission.AMCNID] 
) AS summaryNotesTbl 
ON summaryNotesTbl.AMCNID = [AVAILS_Transmission.AMCNID] 
SET [AVAILS_Transmission.SummaryNotes] = summaryNotesTbl.Notes
WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}

NEW_SQL

INSERT INTO [AVAILS_Series] (	
	[AVAILS_Series].object_id,
	[AVAILS_Series].object_type,
	[AVAILS_Series.AMCNID],
	[AVAILS_Series.TitleType],
	[AVAILS_Series.ShowType],			
	[AVAILS_Series.AlternativeTitles],
	[AVAILS_Series.Titles],
	[AVAILS_Series.mediumSeriesDescription],
	[AVAILS_Series.MRMID],
	[AVAILS_Series.PressSheetStatus],
	[AVAILS_Series.TMSID],
	[AVAILS_Series.FolderName],
	[AVAILS_Series.ChangedOn],
	[AVAILS_Series.ReleaseYear],
	[AVAILS_Series.Notes],
	[AVAILS_Series.PressTarget]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata_Titles.Title],
	[AVAILS_ProgramMetadata_Descriptions.Description],
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.TMSID],	
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE ( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^',''),'/',''),',',''),&quot;'&quot;,''),
	char(92),'')),
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.ReleaseYear] ,
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Titles]
ON [AVAILS_ProgramMetadata_Titles].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Titles].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Descriptions].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
																  
AND [AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
														   
AND [AVAILS_ProgramMetadata.TitleType] = 'ParentSeries'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

INSERT INTO [AVAILS_Season] (	
	[AVAILS_Season].object_id,
	[AVAILS_Season].object_type,
	[AVAILS_Season.AMCNID],
	[AVAILS_Season.HierarchyParentID],
	[AVAILS_Season.TitleType],
	[AVAILS_Season.ShowType],
	[AVAILS_Season.SeasonNumber],
	[AVAILS_Season.TotalNoOfEpisodes],
	[AVAILS_Season.MRMID],
	[AVAILS_Season.ReleaseYear],
	[AVAILS_Season.CountryOfOrigin],
	[AVAILS_Season.OriginalLanguage],
	[AVAILS_Season.LongSeasonDescription],
	[AVAILS_Season.PressSheetStatus],
	[AVAILS_Season.ChangedOn],
	[AVAILS_Season.Notes],
	[AVAILS_Season.PressTarget],
	[AVAILS_Season.Copyright]
)
SELECT 
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.SeasonNumber],
	[AVAILS_ProgramMetadata.TotalNoOfEpisodes],
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata.ReleaseYear],
	[AVAILS_ProgramMetadata.CountryOfOrigin],
	[AVAILS_ProgramMetadata.OriginalLanguage],
	[AVAILS_ProgramMetadata_Descriptions.Description],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget],
	[AVAILS_ProgramMetadata.Copyright]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Descriptions].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series' 
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

INSERT INTO [AVAILS_Episode] (	
	[AVAILS_Episode].object_id,
	[AVAILS_Episode].object_type,
	[AVAILS_Episode.AMCNID],
	[AVAILS_Episode.HierarchyParentID],
	[AVAILS_Episode.TitleType],
	[AVAILS_Episode.ShowType],
	[AVAILS_Episode.EpisodeNumber],
	[AVAILS_Episode.ReleaseYear],
	[AVAILS_Episode.mediumEpisodeDescription],
	[AVAILS_Episode.MRMID],
	[AVAILS_Episode.EpisodeTitle],
	[AVAILS_Episode.AlternativeTitles],
	[AVAILS_Episode.EpisodeCC],
	[AVAILS_Episode.longEpisodeDescription],
	[AVAILS_Episode.shortEpisodeDescription],
	[AVAILS_Episode.Keywords],
	[AVAILS_Episode.OwnerNetwork],
	[AVAILS_Episode.EpisodeProductionNumber],
	[AVAILS_Episode.TMSID],
	[AVAILS_Episode.ActualTRT],
	[AVAILS_Episode.Episodeactors],
	[AVAILS_Episode.EpisodeguestActor],
	[AVAILS_Episode.Episodedirectors],
	[AVAILS_Episode.Episodewriters],
	[AVAILS_Episode.Episodeproducers],
	[AVAILS_Episode.EpisodeTVRating],
	[AVAILS_Episode.CanadaRating],
	[AVAILS_Episode.StudioGenreAmazonOnly],
    [AVAILS_Episode.AmazonGenre],
	[AVAILS_Episode.AppleGenre],
    [AVAILS_Episode.PremierDate],
	[AVAILS_Episode.PressSheetStatus],
	[AVAILS_Episode.Original],
	[AVAILS_Episode.AURating],
	[AVAILS_Episode.NZRating],
	[AVAILS_Episode.RatingDescriptorCA],
	[AVAILS_Episode.RatingDescriptor] ,
	[AVAILS_Episode.RatingDescriptorNZ],
	[AVAILS_Episode.RatingDescriptorUS],
	[AVAILS_Episode.RatingDescriptorTV],
	[AVAILS_Episode.FolderName],
    [AVAILS_Episode.ExtraCode],
	[AVAILS_Episode.ChangedOn],
	[AVAILS_Episode.IndiaRating],
	[AVAILS_Episode.IndiaRatingDescriptor],
	[AVAILS_Episode.Notes],
	[AVAILS_Episode.PressTarget]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AiringOrder],
	[AVAILS_ProgramMetadata.ReleaseYear],
	MEDIUM[AVAILS_ProgramMetadata_Descriptions.Description] as Medium_Description,
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata_EpisodeTitle.Title],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata.ClosedCaptionsYN],
	LONG[AVAILS_ProgramMetadata_Descriptions.Description] as Long_Description,
	SHORT[AVAILS_ProgramMetadata_Descriptions.Description] as Short_Description,
	[AVAILS_ProgramMetadata.Keywords],
	[AVAILS_ProgramMetadata.OwnerNetwork],
	[AVAILS_ProgramMetadata.EpisodeNumber],
	[AVAILS_ProgramMetadata.TMSID],
	[AVAILS_ProgramMetadata.ActualTRT],
	[AVAILS_ProgramMetadata.Episodeactors],
	[AVAILS_ProgramMetadata.EpisodeguestActor],
	[AVAILS_ProgramMetadata.Episodedirectors],
	[AVAILS_ProgramMetadata.Episodewriters],
	[AVAILS_ProgramMetadata.Episodeproducers],
	[AVAILS_ProgramMetadata.EpisodeTVRating],
	[AVAILS_ProgramMetadata.CanadaRating],
	[AVAILS_ProgramMetadata.StudioGenreAmazonOnly],
    [AVAILS_ProgramMetadata.AmazonGenre],
    CONCAT_WS(',',[AVAILS_ProgramMetadata.ApplePrimaryGenre],[AVAILS_ProgramMetadata.AppleGenre]),
	[AVAILS_ProgramMetadata.PremierDate],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.Original],
	[AVAILS_ProgramMetadata.AURating],
	[AVAILS_ProgramMetadata.NZRating],
	[AVAILS_ProgramMetadata.RatingDescriptorCA],
	[AVAILS_ProgramMetadata.RatingDescriptor],
	[AVAILS_ProgramMetadata.RatingDescriptorNZ],
	[AVAILS_ProgramMetadata.RatingDescriptorUS] ,
	[AVAILS_ProgramMetadata.RatingDescriptorTV]  ,
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^','')),
    [AVAILS_ProgramMetadata.ExtraCode],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.IndiaRating] ,
	[AVAILS_ProgramMetadata.IndiaRatingDescriptor],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_EpisodeTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_EpisodeTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_EpisodeTitle].object_id = {PROCESS::ID}

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS SHORT[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  SHORT[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND SHORT[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND SHORT[AVAILS_ProgramMetadata_Descriptions.Type] = 'Short'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS MEDIUM[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  MEDIUM[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS LONG[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  LONG[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND LONG[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND LONG[AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Transmission_AttributePeriods_AttributePeriod]
JOIN
	(SELECT
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].id idVal,
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id objID,
	IFNULL(MIN(tbl1.sDate),LEFT([AVAILS_Transmission.StartDateTimeTo],10)) endDate
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
	LEFT JOIN 
		(SELECT [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id parent,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id obj,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod].id rowID,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate] sDate
		FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
		WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Authenticated] = 'true')tbl1
	ON tbl1.obj = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
	AND tbl1.sDate &gt; [AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate]
	AND tbl1.parent = [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	JOIN [AVAILS_Transmission]
	ON [AVAILS_Transmission].object_id = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
	AND [AVAILS_Transmission].parent_ref_id = [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}
	AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true'
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].id)tbl2
ON tbl2.idVal = [AVAILS_Transmission_AttributePeriods_AttributePeriod].id
AND tbl2.objID = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
SET [AVAILS_Transmission_AttributePeriods_AttributePeriod.EndDate] = tbl2.endDate
WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_Transmission]
LEFT JOIN [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
ON [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}	 
AND [AVAILS_Transmission_AttributePeriods_AttributePeriod].id in ( 
	SELECT [AVAILS_Transmission_AttributePeriods_AttributePeriod].id
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
	INNER JOIN (
		SELECT 
			[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id as parent_ref_id,
		MIN(ABS(DATEDIFF([AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],CURDATE()))) as diffDates
		FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
		
		INNER JOIN [AVAILS_Transmission]
		ON [AVAILS_Transmission].object_id= {PROCESS::ID}  
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id  = [AVAILS_Transmission].parent_ref_id 
		
		WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true'
		GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	) AS RES_GROUPED
	ON [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id = RES_GROUPED.parent_ref_id
	AND ABS(DATEDIFF([AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],CURDATE())) = RES_GROUPED.diffDates
	
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true' 
)
SET 
[AVAILS_Transmission.flightStartDate] = [AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],
[AVAILS_Transmission.flightEndDate] = [AVAILS_Transmission_AttributePeriods_AttributePeriod.EndDate] 
where 
[AVAILS_Transmission].object_id= {PROCESS::ID} AND
[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id  = [AVAILS_Transmission].parent_ref_id

NEW_SQL

UPDATE [AVAILS_Season]	
LEFT JOIN 	
[AVAILS_ProgramMetadata] ON	
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 	
AND [AVAILS_Season].object_id = {PROCESS::ID} )	

LEFT JOIN 	
[AVAILS_Transmission_PublicationSystem] ON	
([AVAILS_Transmission_PublicationSystem].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id 
AND [AVAILS_Transmission_PublicationSystem].object_id = {PROCESS::ID} )	

LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 	
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id	
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 	
AND [AVAILS_Transmission_PublicationSystem.Rating_Type] = [AVAILS_ProgramMetadata_Ratings.Type]
AND [AVAILS_Transmission_PublicationSystem.Rating_UserCode] = [AVAILS_ProgramMetadata_Ratings.UserCode]) 	

SET [AVAILS_Season.TVRating] = [AVAILS_ProgramMetadata_Ratings.Rating]	
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 		
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'	
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'Canada TV Rating') 

SET [AVAILS_Season.CanadaRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'AU Rating') 

SET [AVAILS_Season.AURating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NZ Rating') 

SET [AVAILS_Season.NZRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Season]

INNER JOIN [AVAILS_ProgramMetadata] AS SEASON[AVAILS_ProgramMetadata]
ON SEASON[AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND SEASON[AVAILS_ProgramMetadata.TitleType] = 'Series'
AND SEASON[AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')
AND SEASON[AVAILS_ProgramMetadata].object_id = [AVAILS_Season].object_id

INNER JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata_Ratings].parent_ref_id = SEASON[AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = SEASON[AVAILS_ProgramMetadata].object_id

INNER JOIN [AVAILS_ProgramMetadata] AS EPISODE[AVAILS_ProgramMetadata]
ON  EPISODE[AVAILS_ProgramMetadata].object_id = SEASON[AVAILS_ProgramMetadata].object_id
AND EPISODE[AVAILS_ProgramMetadata.HierarchyParentID] = SEASON[AVAILS_ProgramMetadata.AMCNID]

INNER JOIN [AVAILS_Transmission]
ON [AVAILS_Transmission].object_id = EPISODE[AVAILS_ProgramMetadata].object_id
AND [AVAILS_Transmission.HierarchyParentID] = EPISODE[AVAILS_ProgramMetadata.AMCNID]

LEFT JOIN [AVAILS_Transmission_PublicationSystem]
ON [AVAILS_Transmission_PublicationSystem].parent_ref_id = [AVAILS_Transmission].parent_ref_id
AND [AVAILS_Transmission_PublicationSystem].object_id = [AVAILS_Transmission].object_id 

SET [AVAILS_Season.TVRating] = [AVAILS_ProgramMetadata_Ratings.Rating]

WHERE [AVAILS_Season].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type]=[AVAILS_Transmission_PublicationSystem.Rating_Type]
AND [AVAILS_ProgramMetadata_Ratings.UserCode]=[AVAILS_Transmission_PublicationSystem.Rating_UserCode]

NEW_SQL

UPDATE [AVAILS_Episode]
LEFT JOIN [AVAILS_Season] 
ON (
[AVAILS_Season].object_id = {PROCESS::ID} AND 
[AVAILS_Season.AMCNID] = [AVAILS_Episode.HierarchyParentID] 
)
SET [AVAILS_Episode.SeasonNumber] =[AVAILS_Season.SeasonNumber]  
WHERE [AVAILS_Episode].object_id = {PROCESS::ID}">insert into [AVAILS_ProgramMetadataCheckpoint] (object_id, [AVAILS_ProgramMetadataCheckpoint.totalCount])
SELECT {PROCESS::ID}, COUNT(1) FROM [AVAILS_ProgramMetadata] WHERE object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Talent/Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES	
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeactors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Cast_CastMember.Type] = 'Guest Actor'

	LEFT JOIN [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Cast_CastMember].child_ref_id = [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Cast_CastMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.EpisodeguestActor] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Director'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodedirectors] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Writer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodewriters] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN (
	SELECT 
		[AVAILS_ProgramMetadata].parent_ref_id as parent_ref_id, 
		GROUP_CONCAT([AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames.DisplayName] SEPARATOR ', ') AS DisplayNames
	FROM [AVAILS_ProgramMetadata]

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember]
	ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata_Crew_CrewMember.Type] = 'Producer'

	LEFT JOIN [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames]
	ON [AVAILS_ProgramMetadata_Crew_CrewMember].child_ref_id = [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].parent_ref_id
	AND [AVAILS_ProgramMetadata_Crew_CrewMember_DisplayNames].object_id = {PROCESS::ID}

	WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
	AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

	GROUP BY [AVAILS_ProgramMetadata].parent_ref_id
) AS GROUPED_NAMES
ON [AVAILS_ProgramMetadata].parent_ref_id = GROUPED_NAMES.parent_ref_id

SET [AVAILS_ProgramMetadata.Episodeproducers] = GROUPED_NAMES.DisplayNames

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'TV Rating'

SET [AVAILS_ProgramMetadata.EpisodeTVRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorTV] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'Canada TV Rating'

SET [AVAILS_ProgramMetadata.CanadaRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorCA] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'AU Rating'

SET [AVAILS_ProgramMetadata.AURating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptor] = [AVAILS_ProgramMetadata_Ratings.Descriptor]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NZ Rating'

SET [AVAILS_ProgramMetadata.NZRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.RatingDescriptorNZ] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NLD TV Rating'

SET
[AVAILS_ProgramMetadata.RatingDescriptorUS] = [AVAILS_ProgramMetadata_Ratings.Descriptor]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = [AVAILS_ProgramMetadata].object_id

LEFT JOIN [AVAILS_Transmission_PublicationSystem]
ON [AVAILS_Transmission_PublicationSystem].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_Transmission_PublicationSystem].object_id = [AVAILS_ProgramMetadata].object_id

SET [AVAILS_ProgramMetadata.IndiaRating] = [AVAILS_ProgramMetadata_Ratings.Rating],
[AVAILS_ProgramMetadata.IndiaRatingDescriptor] = [AVAILS_ProgramMetadata_Ratings.Descriptor],
[AVAILS_ProgramMetadata.UserCode] = [AVAILS_Transmission_PublicationSystem.Rating_UserCode]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata_Ratings.Type]=[AVAILS_Transmission_PublicationSystem.Rating_Type]
AND [AVAILS_ProgramMetadata_Ratings.UserCode]=[AVAILS_Transmission_PublicationSystem.Rating_UserCode]
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Folder_SD'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program','ParentSeries')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_VODTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_VODTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_VODTitle].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_VODTitle.VODTitleType] = 'Cutdown'

SET [AVAILS_ProgramMetadata.FolderName] = [AVAILS_ProgramMetadata_VODTitle.content]

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] IN ('Episode','Program')
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] LIKE 'Amazon-Primary%'
SET [AVAILS_ProgramMetadata.StudioGenreAmazonOnly] = 
CASE 
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Crime' THEN 'AMC Plus Drama'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Drama - Supernatural' THEN 'AMC Plus Supernatural'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Crime' THEN 'AMC Plus Crime'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Nonfiction - Documentary' THEN 'AMC Plus Documentaries'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Independent' THEN 'AMC Plus Independent'
    WHEN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] = 'Amazon-Primary-Horror' THEN 'AMC Plus Horror'
    ELSE ''
END,
[AVAILS_ProgramMetadata.AmazonGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Amazon-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Amazon-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Amazon-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )    
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.AppleGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-%'
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] not like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_ProgramMetadata]
LEFT JOIN [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
AND [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}
SET
[AVAILS_ProgramMetadata.ApplePrimaryGenre] = (
    SELECT 
    GROUP_CONCAT(REPLACE([AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre],'Apple-Primary-','') 
        ORDER BY [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] SEPARATOR ', ')
    from [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup]
    WHERE [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].object_id = {PROCESS::ID}    
    and [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup.Genre] like 'Apple-Primary-%'
    AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
	AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')
    AND [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}
    AND [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_PlatformGenres_GenreGroup].parent_ref_id
    )
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT 
	GROUP_CONCAT(distinct [AVAILS_Transmission_AttributePeriods_AttributePeriod.Downloadable] SEPARATOR ',') AS grouped_Downloadable, 
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id AS period_parent_ref_id 
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id 
) AS period 
ON period.period_parent_ref_id = [AVAILS_Transmission].parent_ref_id 
SET [AVAILS_Transmission.TempDownload] = period.grouped_Downloadable 
WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_Transmission] 
LEFT JOIN ( 
	SELECT
    [AVAILS_Transmission.AMCNID] AS AMCNID,
    CONCAT_WS(CHAR(10 using utf8),IFNULL(Series_Notes.Notes,''),
                   IFNULL(Season_Notes.Notes,''),
                   IFNULL(Episode_Notes.Notes,'')) AS Notes
    FROM
    [AVAILS_Transmission]
    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('ParentSeries')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Series_Notes
        ON Series_Notes.obj=[AVAILS_Transmission].object_id

    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,	
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('Series')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Season_Notes
        ON Season_Notes.obj=[AVAILS_Transmission].object_id 
        
    LEFT JOIN (SELECT [AVAILS_ProgramMetadata.Notes] Notes,
                    [AVAILS_ProgramMetadata].object_id obj,
                    [AVAILS_ProgramMetadata.AMCNID] AMCNID,
                    [AVAILS_ProgramMetadata.HierarchyParentID] HierarchyParentID,
                    [AVAILS_ProgramMetadata].parent_ref_id parent_ref_id
               FROM [AVAILS_ProgramMetadata] 
               WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
                AND [AVAILS_ProgramMetadata.Notes] &gt; '' 
                AND	[AVAILS_ProgramMetadata.TitleType] in ('Episode')
                AND	[AVAILS_ProgramMetadata.ShowType] in ('Series') 
               ) Episode_Notes
        ON Episode_Notes.obj=[AVAILS_Transmission].object_id
        AND Episode_Notes.AMCNID = [AVAILS_Transmission.HierarchyParentID]
    WHERE
    [AVAILS_Transmission].object_id={PROCESS::ID}

    GROUP BY [AVAILS_Transmission.AMCNID] 
) AS summaryNotesTbl 
ON summaryNotesTbl.AMCNID = [AVAILS_Transmission.AMCNID] 
SET [AVAILS_Transmission.SummaryNotes] = summaryNotesTbl.Notes
WHERE [AVAILS_Transmission].object_id = {PROCESS::ID}

NEW_SQL

INSERT INTO [AVAILS_Series] (	
	[AVAILS_Series].object_id,
	[AVAILS_Series].object_type,
	[AVAILS_Series.AMCNID],
	[AVAILS_Series.TitleType],
	[AVAILS_Series.ShowType],			
	[AVAILS_Series.AlternativeTitles],
	[AVAILS_Series.Titles],
	[AVAILS_Series.mediumSeriesDescription],
	[AVAILS_Series.MRMID],
	[AVAILS_Series.PressSheetStatus],
	[AVAILS_Series.TMSID],
	[AVAILS_Series.FolderName],
	[AVAILS_Series.ChangedOn],
	[AVAILS_Series.ReleaseYear],
	[AVAILS_Series.Notes],
	[AVAILS_Series.PressTarget]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata_Titles.Title],
	[AVAILS_ProgramMetadata_Descriptions.Description],
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.TMSID],	
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE ( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^',''),'/',''),',',''),&quot;'&quot;,''),
	char(92),'')),
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.ReleaseYear] ,
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Titles]
ON [AVAILS_ProgramMetadata_Titles].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Titles].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Descriptions].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
																  
AND [AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}
														   
AND [AVAILS_ProgramMetadata.TitleType] = 'ParentSeries'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

INSERT INTO [AVAILS_Season] (	
	[AVAILS_Season].object_id,
	[AVAILS_Season].object_type,
	[AVAILS_Season.AMCNID],
	[AVAILS_Season.HierarchyParentID],
	[AVAILS_Season.TitleType],
	[AVAILS_Season.ShowType],
	[AVAILS_Season.SeasonNumber],
	[AVAILS_Season.TotalNoOfEpisodes],
	[AVAILS_Season.MRMID],
	[AVAILS_Season.ReleaseYear],
	[AVAILS_Season.CountryOfOrigin],
	[AVAILS_Season.OriginalLanguage],
	[AVAILS_Season.LongSeasonDescription],
	[AVAILS_Season.PressSheetStatus],
	[AVAILS_Season.ChangedOn],
	[AVAILS_Season.Notes],
	[AVAILS_Season.PressTarget],
	[AVAILS_Season.Copyright]
)
SELECT 
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.SeasonNumber],
	[AVAILS_ProgramMetadata.TotalNoOfEpisodes],
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata.ReleaseYear],
	[AVAILS_ProgramMetadata.CountryOfOrigin],
	[AVAILS_ProgramMetadata.OriginalLanguage],
	[AVAILS_ProgramMetadata_Descriptions.Description],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget],
	[AVAILS_ProgramMetadata.Copyright]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND [AVAILS_ProgramMetadata_Descriptions].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series' 
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

INSERT INTO [AVAILS_Episode] (	
	[AVAILS_Episode].object_id,
	[AVAILS_Episode].object_type,
	[AVAILS_Episode.AMCNID],
	[AVAILS_Episode.HierarchyParentID],
	[AVAILS_Episode.TitleType],
	[AVAILS_Episode.ShowType],
	[AVAILS_Episode.EpisodeNumber],
	[AVAILS_Episode.ReleaseYear],
	[AVAILS_Episode.mediumEpisodeDescription],
	[AVAILS_Episode.MRMID],
	[AVAILS_Episode.EpisodeTitle],
	[AVAILS_Episode.AlternativeTitles],
	[AVAILS_Episode.EpisodeCC],
	[AVAILS_Episode.longEpisodeDescription],
	[AVAILS_Episode.shortEpisodeDescription],
	[AVAILS_Episode.Keywords],
	[AVAILS_Episode.OwnerNetwork],
	[AVAILS_Episode.EpisodeProductionNumber],
	[AVAILS_Episode.TMSID],
	[AVAILS_Episode.ActualTRT],
	[AVAILS_Episode.Episodeactors],
	[AVAILS_Episode.EpisodeguestActor],
	[AVAILS_Episode.Episodedirectors],
	[AVAILS_Episode.Episodewriters],
	[AVAILS_Episode.Episodeproducers],
	[AVAILS_Episode.EpisodeTVRating],
	[AVAILS_Episode.CanadaRating],
	[AVAILS_Episode.StudioGenreAmazonOnly],
    [AVAILS_Episode.AmazonGenre],
	[AVAILS_Episode.AppleGenre],
    [AVAILS_Episode.PremierDate],
	[AVAILS_Episode.PressSheetStatus],
	[AVAILS_Episode.Original],
	[AVAILS_Episode.AURating],
	[AVAILS_Episode.NZRating],
	[AVAILS_Episode.RatingDescriptorCA],
	[AVAILS_Episode.RatingDescriptor] ,
	[AVAILS_Episode.RatingDescriptorNZ],
	[AVAILS_Episode.RatingDescriptorUS],
	[AVAILS_Episode.RatingDescriptorTV],
	[AVAILS_Episode.FolderName],
    [AVAILS_Episode.ExtraCode],
	[AVAILS_Episode.ChangedOn],
	[AVAILS_Episode.IndiaRating],
	[AVAILS_Episode.IndiaRatingDescriptor],
	[AVAILS_Episode.Notes],
	[AVAILS_Episode.PressTarget]
)
SELECT
	{PROCESS::ID},
	11,
	[AVAILS_ProgramMetadata.AMCNID],
	[AVAILS_ProgramMetadata.HierarchyParentID],
	[AVAILS_ProgramMetadata.TitleType],
	[AVAILS_ProgramMetadata.ShowType],
	[AVAILS_ProgramMetadata.AiringOrder],
	[AVAILS_ProgramMetadata.ReleaseYear],
	MEDIUM[AVAILS_ProgramMetadata_Descriptions.Description] as Medium_Description,
	[AVAILS_ProgramMetadata.MRMID],
	[AVAILS_ProgramMetadata_EpisodeTitle.Title],
	[AVAILS_ProgramMetadata.AlternativeTitles],
	[AVAILS_ProgramMetadata.ClosedCaptionsYN],
	LONG[AVAILS_ProgramMetadata_Descriptions.Description] as Long_Description,
	SHORT[AVAILS_ProgramMetadata_Descriptions.Description] as Short_Description,
	[AVAILS_ProgramMetadata.Keywords],
	[AVAILS_ProgramMetadata.OwnerNetwork],
	[AVAILS_ProgramMetadata.EpisodeNumber],
	[AVAILS_ProgramMetadata.TMSID],
	[AVAILS_ProgramMetadata.ActualTRT],
	[AVAILS_ProgramMetadata.Episodeactors],
	[AVAILS_ProgramMetadata.EpisodeguestActor],
	[AVAILS_ProgramMetadata.Episodedirectors],
	[AVAILS_ProgramMetadata.Episodewriters],
	[AVAILS_ProgramMetadata.Episodeproducers],
	[AVAILS_ProgramMetadata.EpisodeTVRating],
	[AVAILS_ProgramMetadata.CanadaRating],
	[AVAILS_ProgramMetadata.StudioGenreAmazonOnly],
    [AVAILS_ProgramMetadata.AmazonGenre],
    CONCAT_WS(',',[AVAILS_ProgramMetadata.ApplePrimaryGenre],[AVAILS_ProgramMetadata.AppleGenre]),
	[AVAILS_ProgramMetadata.PremierDate],
	[AVAILS_ProgramMetadata.PressSheetStatus],
	[AVAILS_ProgramMetadata.Original],
	[AVAILS_ProgramMetadata.AURating],
	[AVAILS_ProgramMetadata.NZRating],
	[AVAILS_ProgramMetadata.RatingDescriptorCA],
	[AVAILS_ProgramMetadata.RatingDescriptor],
	[AVAILS_ProgramMetadata.RatingDescriptorNZ],
	[AVAILS_ProgramMetadata.RatingDescriptorUS] ,
	[AVAILS_ProgramMetadata.RatingDescriptorTV]  ,
(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([AVAILS_ProgramMetadata.FolderName], ' ','_'),',',''),'.',''),'-',''),':','') ,'(',''),')','') 
,'&amp;',''),'//','' ),'!',''),'@',''),'#',''),'$',''),'*',''),'-',''),'+',''),'=',''),'?',''),'&lt;',''),'&gt;',''),'%',''),'^','')),
    [AVAILS_ProgramMetadata.ExtraCode],
	[AVAILS_ProgramMetadata.ChangedOn],
	[AVAILS_ProgramMetadata.IndiaRating] ,
	[AVAILS_ProgramMetadata.IndiaRatingDescriptor],
	[AVAILS_ProgramMetadata.Notes],
	[AVAILS_ProgramMetadata.PressTarget]
FROM [AVAILS_ProgramMetadata]

LEFT JOIN [AVAILS_ProgramMetadata_EpisodeTitle]
ON [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_EpisodeTitle].parent_ref_id
AND [AVAILS_ProgramMetadata_EpisodeTitle].object_id = {PROCESS::ID}

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS SHORT[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  SHORT[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND SHORT[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND SHORT[AVAILS_ProgramMetadata_Descriptions.Type] = 'Short'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS MEDIUM[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  MEDIUM[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND MEDIUM[AVAILS_ProgramMetadata_Descriptions.Type] = 'Medium'

LEFT JOIN [AVAILS_ProgramMetadata_Descriptions] AS LONG[AVAILS_ProgramMetadata_Descriptions]
ON [AVAILS_ProgramMetadata].parent_ref_id =  LONG[AVAILS_ProgramMetadata_Descriptions].parent_ref_id
AND LONG[AVAILS_ProgramMetadata_Descriptions].object_id = {PROCESS::ID}
AND LONG[AVAILS_ProgramMetadata_Descriptions.Type] = 'Long'

WHERE [AVAILS_ProgramMetadata].object_id={PROCESS::ID}	
AND [AVAILS_ProgramMetadata.TitleType] = 'Episode'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Transmission_AttributePeriods_AttributePeriod]
JOIN
	(SELECT
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].id idVal,
	[AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id objID,
	IFNULL(MIN(tbl1.sDate),LEFT([AVAILS_Transmission.StartDateTimeTo],10)) endDate
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
	LEFT JOIN 
		(SELECT [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id parent,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id obj,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod].id rowID,
		[AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate] sDate
		FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
		WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Authenticated] = 'true')tbl1
	ON tbl1.obj = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
	AND tbl1.sDate &gt; [AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate]
	AND tbl1.parent = [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	JOIN [AVAILS_Transmission]
	ON [AVAILS_Transmission].object_id = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
	AND [AVAILS_Transmission].parent_ref_id = [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}
	AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true'
	GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].id)tbl2
ON tbl2.idVal = [AVAILS_Transmission_AttributePeriods_AttributePeriod].id
AND tbl2.objID = [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id
SET [AVAILS_Transmission_AttributePeriods_AttributePeriod.EndDate] = tbl2.endDate
WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}

NEW_SQL

UPDATE [AVAILS_Transmission]
LEFT JOIN [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
ON [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID}	 
AND [AVAILS_Transmission_AttributePeriods_AttributePeriod].id in ( 
	SELECT [AVAILS_Transmission_AttributePeriods_AttributePeriod].id
	FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod]
	INNER JOIN (
		SELECT 
			[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id as parent_ref_id,
		MIN(ABS(DATEDIFF([AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],CURDATE()))) as diffDates
		FROM [AVAILS_Transmission_AttributePeriods_AttributePeriod] 
		
		INNER JOIN [AVAILS_Transmission]
		ON [AVAILS_Transmission].object_id= {PROCESS::ID}  
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id  = [AVAILS_Transmission].parent_ref_id 
		
		WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
		AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true'
		GROUP BY [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id
	) AS RES_GROUPED
	ON [AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id = RES_GROUPED.parent_ref_id
	AND ABS(DATEDIFF([AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],CURDATE())) = RES_GROUPED.diffDates
	
	WHERE [AVAILS_Transmission_AttributePeriods_AttributePeriod].object_id = {PROCESS::ID} 
	AND [AVAILS_Transmission_AttributePeriods_AttributePeriod.Unauthenticated] = 'true' 
)
SET 
[AVAILS_Transmission.flightStartDate] = [AVAILS_Transmission_AttributePeriods_AttributePeriod.StartDate],
[AVAILS_Transmission.flightEndDate] = [AVAILS_Transmission_AttributePeriods_AttributePeriod.EndDate] 
where 
[AVAILS_Transmission].object_id= {PROCESS::ID} AND
[AVAILS_Transmission_AttributePeriods_AttributePeriod].parent_ref_id  = [AVAILS_Transmission].parent_ref_id

NEW_SQL

UPDATE [AVAILS_Season]	
LEFT JOIN 	
[AVAILS_ProgramMetadata] ON	
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 	
AND [AVAILS_Season].object_id = {PROCESS::ID} )	

LEFT JOIN 	
[AVAILS_Transmission_PublicationSystem] ON	
([AVAILS_Transmission_PublicationSystem].parent_ref_id = [AVAILS_ProgramMetadata].parent_ref_id 
AND [AVAILS_Transmission_PublicationSystem].object_id = {PROCESS::ID} )	

LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 	
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id	
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 	
AND [AVAILS_Transmission_PublicationSystem.Rating_Type] = [AVAILS_ProgramMetadata_Ratings.Type]
AND [AVAILS_Transmission_PublicationSystem.Rating_UserCode] = [AVAILS_ProgramMetadata_Ratings.UserCode]) 	

SET [AVAILS_Season.TVRating] = [AVAILS_ProgramMetadata_Ratings.Rating]	
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 		
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'	
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'Canada TV Rating') 

SET [AVAILS_Season.CanadaRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'AU Rating') 

SET [AVAILS_Season.AURating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Season]
LEFT JOIN 
[AVAILS_ProgramMetadata] ON
([AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND [AVAILS_Season].object_id = {PROCESS::ID} )
LEFT JOIN [AVAILS_ProgramMetadata_Ratings] 
ON ( [AVAILS_ProgramMetadata].parent_ref_id = [AVAILS_ProgramMetadata_Ratings].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type] = 'NZ Rating') 

SET [AVAILS_Season.NZRating] = [AVAILS_ProgramMetadata_Ratings.Rating]
WHERE [AVAILS_ProgramMetadata].object_id = {PROCESS::ID} 	
AND [AVAILS_ProgramMetadata.TitleType] = 'Series'
AND [AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')

NEW_SQL

UPDATE [AVAILS_Season]

INNER JOIN [AVAILS_ProgramMetadata] AS SEASON[AVAILS_ProgramMetadata]
ON SEASON[AVAILS_ProgramMetadata.AMCNID] = [AVAILS_Season.AMCNID] 
AND SEASON[AVAILS_ProgramMetadata.TitleType] = 'Series'
AND SEASON[AVAILS_ProgramMetadata.ShowType] IN ('Series','Interstitial','Special','Pilot','Digital Series')
AND SEASON[AVAILS_ProgramMetadata].object_id = [AVAILS_Season].object_id

INNER JOIN [AVAILS_ProgramMetadata_Ratings]
ON [AVAILS_ProgramMetadata_Ratings].parent_ref_id = SEASON[AVAILS_ProgramMetadata].parent_ref_id
AND [AVAILS_ProgramMetadata_Ratings].object_id = SEASON[AVAILS_ProgramMetadata].object_id

INNER JOIN [AVAILS_ProgramMetadata] AS EPISODE[AVAILS_ProgramMetadata]
ON  EPISODE[AVAILS_ProgramMetadata].object_id = SEASON[AVAILS_ProgramMetadata].object_id
AND EPISODE[AVAILS_ProgramMetadata.HierarchyParentID] = SEASON[AVAILS_ProgramMetadata.AMCNID]

INNER JOIN [AVAILS_Transmission]
ON [AVAILS_Transmission].object_id = EPISODE[AVAILS_ProgramMetadata].object_id
AND [AVAILS_Transmission.HierarchyParentID] = EPISODE[AVAILS_ProgramMetadata.AMCNID]

LEFT JOIN [AVAILS_Transmission_PublicationSystem]
ON [AVAILS_Transmission_PublicationSystem].parent_ref_id = [AVAILS_Transmission].parent_ref_id
AND [AVAILS_Transmission_PublicationSystem].object_id = [AVAILS_Transmission].object_id 

SET [AVAILS_Season.TVRating] = [AVAILS_ProgramMetadata_Ratings.Rating]

WHERE [AVAILS_Season].object_id = {PROCESS::ID} 
AND [AVAILS_ProgramMetadata_Ratings.Type]=[AVAILS_Transmission_PublicationSystem.Rating_Type]
AND [AVAILS_ProgramMetadata_Ratings.UserCode]=[AVAILS_Transmission_PublicationSystem.Rating_UserCode]

NEW_SQL

UPDATE [AVAILS_Episode]
LEFT JOIN [AVAILS_Season] 
ON (
[AVAILS_Season].object_id = {PROCESS::ID} AND 
[AVAILS_Season.AMCNID] = [AVAILS_Episode.HierarchyParentID] 
)
SET [AVAILS_Episode.SeasonNumber] =[AVAILS_Season.SeasonNumber]  
WHERE [AVAILS_Episode].object_id = {PROCESS::ID}</sql></Params>
-- SQL [Test Import]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = '&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;AMCN-ProgramADAM xmlns:amc=&quot;http://schemahost.amcnetworks.com:8080/amcnesb/schemas/adam&quot;&gt;
	&lt;Transmission&gt;
		&lt;AMCNID&gt;564806304812&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA200776&lt;/HierarchyParentID&gt;
		&lt;Channel&gt;AMC+ On Demand&lt;/Channel&gt;
		&lt;StartDateTimeFrom/&gt;
		&lt;StartDateTimeTo&gt;2020-07-02&lt;/StartDateTimeTo&gt;
		&lt;TransmissionPrototype&gt;AMC+ (US) - Relative To Flight Dates&lt;/TransmissionPrototype&gt;
		&lt;AttributePeriods&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-26&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;true&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-27&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;false&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
		&lt;/AttributePeriods&gt;
		&lt;ChangedOn&gt;2020-10-26&lt;/ChangedOn&gt;
	&lt;/Transmission&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA200776&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLS16034&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Episode&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
		&lt;EpisodeTitle&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead: 02-013: Date of Death&lt;/Title&gt;
		&lt;/EpisodeTitle&gt;
		&lt;ReleaseYear&gt;2016&lt;/ReleaseYear&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead: 02-013: Date of Death&lt;/AlternativeTitles&gt;
		&lt;OriginalLanguage&gt;English&lt;/OriginalLanguage&gt;
		&lt;AssetSource/&gt;
		&lt;MRMID/&gt;
		&lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead: 02-013: Date of Death&lt;/AlternativeTitles&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Short&quot;&gt;Hello Short Description&lt;/Description&gt;
		&lt;/Descriptions&gt;
		&lt;Ratings/&gt;
		&lt;Crew/&gt;
		&lt;Cast/&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLS16034&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA199504&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Series&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;SeasonNumber&gt;2&lt;/SeasonNumber&gt;
		&lt;TotalNoOfEpisodes&gt;16&lt;/TotalNoOfEpisodes&gt;
		&lt;OriginalLanguage/&gt;
		&lt;MRMID/&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions/&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA199504&lt;/AMCNID&gt;
		&lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;Titles&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead&lt;/Title&gt;
		&lt;/Titles&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead&lt;/AlternativeTitles&gt;
		&lt;MRMID&gt;TestSrs12345&lt;/MRMID&gt;
		&lt;AlternativeTitles&gt;Fear Series Walking Dead&lt;/AlternativeTitles&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;Example2&lt;/Description&gt;
		&lt;/Descriptions&gt;
	&lt;/ProgramMetadata&gt;
	&lt;Transmission&gt;
		&lt;AMCNID&gt;638576101812&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA219880&lt;/HierarchyParentID&gt;
		&lt;Channel&gt;AMC+ On Demand&lt;/Channel&gt;
		&lt;StartDateTimeFrom/&gt;
		&lt;StartDateTimeTo&gt;2021-08-16&lt;/StartDateTimeTo&gt;
		&lt;TransmissionPrototype&gt;AMC+ (US) - Relative To Flight Dates&lt;/TransmissionPrototype&gt;
		&lt;AttributePeriods&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-26&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;false&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-27&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;false&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-28&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;false&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
		&lt;/AttributePeriods&gt;
		&lt;ChangedOn&gt;2021-07-01&lt;/ChangedOn&gt;
	&lt;/Transmission&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA219880&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLS21909&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Episode&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
		&lt;EpisodeTitle&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead: 06-001&lt;/Title&gt;
		&lt;/EpisodeTitle&gt;
		&lt;ReleaseYear&gt;2020&lt;/ReleaseYear&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead: 06-001&lt;/AlternativeTitles&gt;
		&lt;OriginalLanguage/&gt;
		&lt;AssetSource/&gt;
		&lt;MRMID&gt;AMCNEP0000010621&lt;/MRMID&gt;
		&lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
		&lt;AlternativeTitles&gt;Earths Great Seasons 101&lt;/AlternativeTitles&gt;
		&lt;AiringOrder&gt;1&lt;/AiringOrder&gt;
		&lt;Keywords&gt;keys for cars&lt;/Keywords&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Long&quot;&gt;BBC America: This special, narrated by Andrew Scott, celebrates spring on planet Earth. For everything from adventurous grizzly bear cubs to flowers in the desert, spring is about rushing to make the most of the opportunities this busy season brings.&lt;/Description&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;BBC America: This special, narrated by Andrew Scott, celebrates spring on planet Earth. For everything from adventurous grizzly bear cubs to flowers in the desert, spring is about rushing to make the most of the opportunities this busy season brings.&lt;/Description&gt;
			&lt;Description Type=&quot;Short&quot;&gt;BBC America: This special, narrated by Andrew Scott, celebrates spring on planet Earth. For everything from adventurous grizzly bear cubs to flowers in the desert, spring is about rushing to make the most of the opportunities this busy season brings.&lt;/Description&gt;
		&lt;/Descriptions&gt;
		&lt;Ratings/&gt;
		&lt;Crew&gt;
			&lt;CrewMember Type=&quot;Producer&quot;&gt;
				&lt;FirstName/&gt;
				&lt;LastName/&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName/&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;1&lt;/Order&gt;
			&lt;/CrewMember&gt;
		&lt;/Crew&gt;
		&lt;Cast/&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLS21909&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA199504&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Series&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;SeasonNumber&gt;6&lt;/SeasonNumber&gt;
		&lt;TotalNoOfEpisodes&gt;16&lt;/TotalNoOfEpisodes&gt;
		&lt;OriginalLanguage/&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA199504&lt;/AMCNID&gt;
		&lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;Titles&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead&lt;/Title&gt;
		&lt;/Titles&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead&lt;/AlternativeTitles&gt;
		&lt;MRMID&gt;TestSrs12345&lt;/MRMID&gt;
		&lt;AlternativeTitles&gt;Fear Series Walking Dead&lt;/AlternativeTitles&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;Example2&lt;/Description&gt;
		&lt;/Descriptions&gt;
	&lt;/ProgramMetadata&gt;
	&lt;Transmission&gt;
		&lt;AMCNID&gt;556012190812&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA217218&lt;/HierarchyParentID&gt;
		&lt;Channel&gt;Comcast EST&lt;/Channel&gt;
		&lt;StartDateTimeFrom&gt;2030-05-10&lt;/StartDateTimeFrom&gt;
		&lt;StartDateTimeTo&gt;2030-05-12&lt;/StartDateTimeTo&gt;
		&lt;TransmissionPrototype&gt;EST - Next Day&lt;/TransmissionPrototype&gt;
	&lt;/Transmission&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA217218&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLS21308&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Episode&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
		&lt;EpisodeTitle&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead: 05-006: The Little Prince&lt;/Title&gt;
		&lt;/EpisodeTitle&gt;
		&lt;ReleaseYear&gt;2019&lt;/ReleaseYear&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead: 05-006: The Little Prince&lt;/AlternativeTitles&gt;
		&lt;OriginalLanguage&gt;Test Original Language&lt;/OriginalLanguage&gt;
		&lt;AssetSource&gt;Original&lt;/AssetSource&gt;
		&lt;PlatformGenres&gt;
			&lt;GenreGroup&gt;
				&lt;Genre&gt;Amazon-Action&lt;/Genre&gt;
				&lt;Genre&gt;Amazon-Action - Comic&lt;/Genre&gt;
				&lt;Genre&gt;Amazon-Action - Crime&lt;/Genre&gt;
				&lt;Genre&gt;Amazon-Action - Disaster&lt;/Genre&gt;
				&lt;Genre&gt;Amazon-Primary-Drama - Crime&lt;/Genre&gt;
				&lt;Genre&gt;Apple-Drama&lt;/Genre&gt;
				&lt;Genre&gt;Apple-Horror&lt;/Genre&gt;
				&lt;Genre&gt;Apple-Independent&lt;/Genre&gt;
				&lt;Genre&gt;Apple-Primary-Thriller&lt;/Genre&gt;
			&lt;/GenreGroup&gt;
		&lt;/PlatformGenres&gt;
		&lt;MRMID&gt;AMCNEP12345&lt;/MRMID&gt;
		&lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
		&lt;AiringOrder&gt;1&lt;/AiringOrder&gt;
		&lt;EpisodeNumber&gt;01&lt;/EpisodeNumber&gt;
		&lt;Keywords&gt;hello test key words today&lt;/Keywords&gt;
		&lt;TMSID&gt;123&lt;/TMSID&gt;
		&lt;ActualTRT&gt;00:45:00.000&lt;/ActualTRT&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Long&quot;&gt;Long Episode Descriptions&lt;/Description&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;Medium Episode Descriptions&lt;/Description&gt;
			&lt;Description Type=&quot;Short&quot;&gt;Short Episode Descriptions&lt;/Description&gt;
		&lt;/Descriptions&gt;
		&lt;Ratings&gt;
			&lt;Rating Type=&quot;TV Rating&quot;&gt;TV-14&lt;/Rating&gt;
			&lt;Rating Type=&quot;Canada TV Rating&quot;&gt;TV-21&lt;/Rating&gt;
		&lt;/Ratings&gt;
		&lt;Crew&gt;
			&lt;CrewMember Type=&quot;Director&quot;&gt;
				&lt;FirstName&gt;Director&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Director Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;1&lt;/Order&gt;
			&lt;/CrewMember&gt;
			&lt;CrewMember Type=&quot;Writer&quot;&gt;
				&lt;FirstName&gt;Writer&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Writer Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;2&lt;/Order&gt;
			&lt;/CrewMember&gt;
			&lt;CrewMember Type=&quot;Producer&quot;&gt;
				&lt;FirstName&gt;Producer&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Producer Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;3&lt;/Order&gt;
			&lt;/CrewMember&gt;
		&lt;/Crew&gt;
		&lt;Cast&gt;
			&lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
				&lt;FirstName&gt;Talent Actor&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;CharacterName&gt;Talent Actor CharacterName&lt;/CharacterName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Talent Actor Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;1&lt;/Order&gt;
			&lt;/CastMember&gt;
			&lt;CastMember Type=&quot;Guest Actor&quot;&gt;
				&lt;FirstName&gt;Guest Actor&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;CharacterName&gt;Guest Actor CharacterName&lt;/CharacterName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Guest Actor Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;2&lt;/Order&gt;
			&lt;/CastMember&gt;
		&lt;/Cast&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLS21308&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA199504&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Series&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;SeasonNumber&gt;5&lt;/SeasonNumber&gt;
		&lt;TotalNoOfEpisodes&gt;16&lt;/TotalNoOfEpisodes&gt;
		&lt;OriginalLanguage&gt;Test Season OriginalLanguage&lt;/OriginalLanguage&gt;
		&lt;MRMID&gt;TestS12345&lt;/MRMID&gt;
		&lt;ReleaseYear&gt;2021&lt;/ReleaseYear&gt;
		&lt;CountryOfOrigin&gt;United States&lt;/CountryOfOrigin&gt;
		&lt;ActualTRT&gt;Test&lt;/ActualTRT&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Long&quot;&gt;Long Season Description&lt;/Description&gt;
		&lt;/Descriptions&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA199504&lt;/AMCNID&gt;
		&lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;Titles&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead&lt;/Title&gt;
		&lt;/Titles&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead&lt;/AlternativeTitles&gt;
		&lt;MRMID&gt;TestSrs12345&lt;/MRMID&gt;
		&lt;ActualTRT&gt;00:50:00.000&lt;/ActualTRT&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;Medium Series Descriptions&lt;/Description&gt;
		&lt;/Descriptions&gt;
	&lt;/ProgramMetadata&gt;
&lt;/AMCN-ProgramADAM&gt;'
WHERE [AVAILS_Response].object_id = {PROCESS::ID}">UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = '&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;AMCN-ProgramADAM xmlns:amc=&quot;http://schemahost.amcnetworks.com:8080/amcnesb/schemas/adam&quot;&gt;
	&lt;Transmission&gt;
		&lt;AMCNID&gt;564806304812&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA200776&lt;/HierarchyParentID&gt;
		&lt;Channel&gt;AMC+ On Demand&lt;/Channel&gt;
		&lt;StartDateTimeFrom/&gt;
		&lt;StartDateTimeTo&gt;2020-07-02&lt;/StartDateTimeTo&gt;
		&lt;TransmissionPrototype&gt;AMC+ (US) - Relative To Flight Dates&lt;/TransmissionPrototype&gt;
		&lt;AttributePeriods&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-26&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;true&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-27&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;false&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
		&lt;/AttributePeriods&gt;
		&lt;ChangedOn&gt;2020-10-26&lt;/ChangedOn&gt;
	&lt;/Transmission&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA200776&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLS16034&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Episode&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
		&lt;EpisodeTitle&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead: 02-013: Date of Death&lt;/Title&gt;
		&lt;/EpisodeTitle&gt;
		&lt;ReleaseYear&gt;2016&lt;/ReleaseYear&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead: 02-013: Date of Death&lt;/AlternativeTitles&gt;
		&lt;OriginalLanguage&gt;English&lt;/OriginalLanguage&gt;
		&lt;AssetSource/&gt;
		&lt;MRMID/&gt;
		&lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead: 02-013: Date of Death&lt;/AlternativeTitles&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Short&quot;&gt;Hello Short Description&lt;/Description&gt;
		&lt;/Descriptions&gt;
		&lt;Ratings/&gt;
		&lt;Crew/&gt;
		&lt;Cast/&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLS16034&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA199504&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Series&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;SeasonNumber&gt;2&lt;/SeasonNumber&gt;
		&lt;TotalNoOfEpisodes&gt;16&lt;/TotalNoOfEpisodes&gt;
		&lt;OriginalLanguage/&gt;
		&lt;MRMID/&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions/&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA199504&lt;/AMCNID&gt;
		&lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;Titles&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead&lt;/Title&gt;
		&lt;/Titles&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead&lt;/AlternativeTitles&gt;
		&lt;MRMID&gt;TestSrs12345&lt;/MRMID&gt;
		&lt;AlternativeTitles&gt;Fear Series Walking Dead&lt;/AlternativeTitles&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;Example2&lt;/Description&gt;
		&lt;/Descriptions&gt;
	&lt;/ProgramMetadata&gt;
	&lt;Transmission&gt;
		&lt;AMCNID&gt;638576101812&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA219880&lt;/HierarchyParentID&gt;
		&lt;Channel&gt;AMC+ On Demand&lt;/Channel&gt;
		&lt;StartDateTimeFrom/&gt;
		&lt;StartDateTimeTo&gt;2021-08-16&lt;/StartDateTimeTo&gt;
		&lt;TransmissionPrototype&gt;AMC+ (US) - Relative To Flight Dates&lt;/TransmissionPrototype&gt;
		&lt;AttributePeriods&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-26&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;false&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-27&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;false&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
			&lt;AttributePeriod&gt;
				&lt;StartDate&gt;2021-05-28&lt;/StartDate&gt;
				&lt;EndDate&gt;2021-08-16&lt;/EndDate&gt;
				&lt;Authenticated/&gt;
				&lt;Unauthenticated/&gt;
				&lt;Downloadable&gt;false&lt;/Downloadable&gt;
				&lt;FastForwardDisabled/&gt;
			&lt;/AttributePeriod&gt;
		&lt;/AttributePeriods&gt;
		&lt;ChangedOn&gt;2021-07-01&lt;/ChangedOn&gt;
	&lt;/Transmission&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA219880&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLS21909&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Episode&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
		&lt;EpisodeTitle&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead: 06-001&lt;/Title&gt;
		&lt;/EpisodeTitle&gt;
		&lt;ReleaseYear&gt;2020&lt;/ReleaseYear&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead: 06-001&lt;/AlternativeTitles&gt;
		&lt;OriginalLanguage/&gt;
		&lt;AssetSource/&gt;
		&lt;MRMID&gt;AMCNEP0000010621&lt;/MRMID&gt;
		&lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
		&lt;AlternativeTitles&gt;Earths Great Seasons 101&lt;/AlternativeTitles&gt;
		&lt;AiringOrder&gt;1&lt;/AiringOrder&gt;
		&lt;Keywords&gt;keys for cars&lt;/Keywords&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Long&quot;&gt;BBC America: This special, narrated by Andrew Scott, celebrates spring on planet Earth. For everything from adventurous grizzly bear cubs to flowers in the desert, spring is about rushing to make the most of the opportunities this busy season brings.&lt;/Description&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;BBC America: This special, narrated by Andrew Scott, celebrates spring on planet Earth. For everything from adventurous grizzly bear cubs to flowers in the desert, spring is about rushing to make the most of the opportunities this busy season brings.&lt;/Description&gt;
			&lt;Description Type=&quot;Short&quot;&gt;BBC America: This special, narrated by Andrew Scott, celebrates spring on planet Earth. For everything from adventurous grizzly bear cubs to flowers in the desert, spring is about rushing to make the most of the opportunities this busy season brings.&lt;/Description&gt;
		&lt;/Descriptions&gt;
		&lt;Ratings/&gt;
		&lt;Crew&gt;
			&lt;CrewMember Type=&quot;Producer&quot;&gt;
				&lt;FirstName/&gt;
				&lt;LastName/&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName/&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;1&lt;/Order&gt;
			&lt;/CrewMember&gt;
		&lt;/Crew&gt;
		&lt;Cast/&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLS21909&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA199504&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Series&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;SeasonNumber&gt;6&lt;/SeasonNumber&gt;
		&lt;TotalNoOfEpisodes&gt;16&lt;/TotalNoOfEpisodes&gt;
		&lt;OriginalLanguage/&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA199504&lt;/AMCNID&gt;
		&lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;Titles&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead&lt;/Title&gt;
		&lt;/Titles&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead&lt;/AlternativeTitles&gt;
		&lt;MRMID&gt;TestSrs12345&lt;/MRMID&gt;
		&lt;AlternativeTitles&gt;Fear Series Walking Dead&lt;/AlternativeTitles&gt;
		&lt;ActualTRT/&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;Example2&lt;/Description&gt;
		&lt;/Descriptions&gt;
	&lt;/ProgramMetadata&gt;
	&lt;Transmission&gt;
		&lt;AMCNID&gt;556012190812&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA217218&lt;/HierarchyParentID&gt;
		&lt;Channel&gt;Comcast EST&lt;/Channel&gt;
		&lt;StartDateTimeFrom&gt;2030-05-10&lt;/StartDateTimeFrom&gt;
		&lt;StartDateTimeTo&gt;2030-05-12&lt;/StartDateTimeTo&gt;
		&lt;TransmissionPrototype&gt;EST - Next Day&lt;/TransmissionPrototype&gt;
	&lt;/Transmission&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA217218&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLS21308&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Episode&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
		&lt;EpisodeTitle&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead: 05-006: The Little Prince&lt;/Title&gt;
		&lt;/EpisodeTitle&gt;
		&lt;ReleaseYear&gt;2019&lt;/ReleaseYear&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead: 05-006: The Little Prince&lt;/AlternativeTitles&gt;
		&lt;OriginalLanguage&gt;Test Original Language&lt;/OriginalLanguage&gt;
		&lt;AssetSource&gt;Original&lt;/AssetSource&gt;
		&lt;PlatformGenres&gt;
			&lt;GenreGroup&gt;
				&lt;Genre&gt;Amazon-Action&lt;/Genre&gt;
				&lt;Genre&gt;Amazon-Action - Comic&lt;/Genre&gt;
				&lt;Genre&gt;Amazon-Action - Crime&lt;/Genre&gt;
				&lt;Genre&gt;Amazon-Action - Disaster&lt;/Genre&gt;
				&lt;Genre&gt;Amazon-Primary-Drama - Crime&lt;/Genre&gt;
				&lt;Genre&gt;Apple-Drama&lt;/Genre&gt;
				&lt;Genre&gt;Apple-Horror&lt;/Genre&gt;
				&lt;Genre&gt;Apple-Independent&lt;/Genre&gt;
				&lt;Genre&gt;Apple-Primary-Thriller&lt;/Genre&gt;
			&lt;/GenreGroup&gt;
		&lt;/PlatformGenres&gt;
		&lt;MRMID&gt;AMCNEP12345&lt;/MRMID&gt;
		&lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
		&lt;AiringOrder&gt;1&lt;/AiringOrder&gt;
		&lt;EpisodeNumber&gt;01&lt;/EpisodeNumber&gt;
		&lt;Keywords&gt;hello test key words today&lt;/Keywords&gt;
		&lt;TMSID&gt;123&lt;/TMSID&gt;
		&lt;ActualTRT&gt;00:45:00.000&lt;/ActualTRT&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Long&quot;&gt;Long Episode Descriptions&lt;/Description&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;Medium Episode Descriptions&lt;/Description&gt;
			&lt;Description Type=&quot;Short&quot;&gt;Short Episode Descriptions&lt;/Description&gt;
		&lt;/Descriptions&gt;
		&lt;Ratings&gt;
			&lt;Rating Type=&quot;TV Rating&quot;&gt;TV-14&lt;/Rating&gt;
			&lt;Rating Type=&quot;Canada TV Rating&quot;&gt;TV-21&lt;/Rating&gt;
		&lt;/Ratings&gt;
		&lt;Crew&gt;
			&lt;CrewMember Type=&quot;Director&quot;&gt;
				&lt;FirstName&gt;Director&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Director Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;1&lt;/Order&gt;
			&lt;/CrewMember&gt;
			&lt;CrewMember Type=&quot;Writer&quot;&gt;
				&lt;FirstName&gt;Writer&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Writer Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;2&lt;/Order&gt;
			&lt;/CrewMember&gt;
			&lt;CrewMember Type=&quot;Producer&quot;&gt;
				&lt;FirstName&gt;Producer&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Producer Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;3&lt;/Order&gt;
			&lt;/CrewMember&gt;
		&lt;/Crew&gt;
		&lt;Cast&gt;
			&lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
				&lt;FirstName&gt;Talent Actor&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;CharacterName&gt;Talent Actor CharacterName&lt;/CharacterName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Talent Actor Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;1&lt;/Order&gt;
			&lt;/CastMember&gt;
			&lt;CastMember Type=&quot;Guest Actor&quot;&gt;
				&lt;FirstName&gt;Guest Actor&lt;/FirstName&gt;
				&lt;LastName&gt;Test&lt;/LastName&gt;
				&lt;CharacterName&gt;Guest Actor CharacterName&lt;/CharacterName&gt;
				&lt;DisplayNames&gt;
					&lt;DisplayName&gt;Guest Actor Test&lt;/DisplayName&gt;
				&lt;/DisplayNames&gt;
				&lt;Order&gt;2&lt;/Order&gt;
			&lt;/CastMember&gt;
		&lt;/Cast&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLS21308&lt;/AMCNID&gt;
		&lt;HierarchyParentID&gt;RLA199504&lt;/HierarchyParentID&gt;
		&lt;TitleType&gt;Series&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;SeasonNumber&gt;5&lt;/SeasonNumber&gt;
		&lt;TotalNoOfEpisodes&gt;16&lt;/TotalNoOfEpisodes&gt;
		&lt;OriginalLanguage&gt;Test Season OriginalLanguage&lt;/OriginalLanguage&gt;
		&lt;MRMID&gt;TestS12345&lt;/MRMID&gt;
		&lt;ReleaseYear&gt;2021&lt;/ReleaseYear&gt;
		&lt;CountryOfOrigin&gt;United States&lt;/CountryOfOrigin&gt;
		&lt;ActualTRT&gt;Test&lt;/ActualTRT&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Long&quot;&gt;Long Season Description&lt;/Description&gt;
		&lt;/Descriptions&gt;
	&lt;/ProgramMetadata&gt;
	&lt;ProgramMetadata&gt;
		&lt;AMCNID&gt;RLA199504&lt;/AMCNID&gt;
		&lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
		&lt;ShowType&gt;Series&lt;/ShowType&gt;
		&lt;Titles&gt;
			&lt;Title Language=&quot;en&quot;&gt;Fear the Walking Dead&lt;/Title&gt;
		&lt;/Titles&gt;
		&lt;AlternativeTitles&gt;Fear the Walking Dead&lt;/AlternativeTitles&gt;
		&lt;MRMID&gt;TestSrs12345&lt;/MRMID&gt;
		&lt;ActualTRT&gt;00:50:00.000&lt;/ActualTRT&gt;
		&lt;Descriptions&gt;
			&lt;Description Type=&quot;Medium&quot;&gt;Medium Series Descriptions&lt;/Description&gt;
		&lt;/Descriptions&gt;
	&lt;/ProgramMetadata&gt;
&lt;/AMCN-ProgramADAM&gt;'
WHERE [AVAILS_Response].object_id = {PROCESS::ID}</sql></Params>
