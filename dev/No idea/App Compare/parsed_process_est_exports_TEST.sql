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
WHERE [AVAILS_Series].object_id = {PROCESS::ID}">UPDATE [AVAILS_Episode]
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
WHERE [AVAILS_Series].object_id = {PROCESS::ID}</sql></Params>
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
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  ">UPDATE [AVAILS_Episode]
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
 WHERE [AVAILS_Season].object_id = {PROCESS::ID}  </sql></Params>
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
-- SQL [Skip NameSpace]
<?xml version="1.0" encoding="ISO-8859-1"?><Params><sql value="UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = REPLACE(REPLACE(REPLACE([AVAILS_Response.result],'&lt;amc:','&lt;'),'&lt;/amc:','&lt;/'),'amc:','')
WHERE [AVAILS_Response].object_id = {PROCESS::ID} ">UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = REPLACE(REPLACE(REPLACE([AVAILS_Response.result],'&lt;amc:','&lt;'),'&lt;/amc:','&lt;/'),'amc:','')
WHERE [AVAILS_Response].object_id = {PROCESS::ID} </sql></Params>
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
([EST_EXport_Reference_Platform.Platform_Name]  =sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Series.AMCNID] = [ADAM_NL_ID_Table.amcnId])
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
([EST_EXport_Reference_Platform.Platform_Name]  =sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Season.AMCNID] = [ADAM_NL_ID_Table.amcnId])
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
([EST_EXport_Reference_Platform.Platform_Name]  =sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Series.AMCNID] = [ADAM_NL_ID_Table.amcnId])
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
([EST_EXport_Reference_Platform.Platform_Name]  =sbxUnClean([ADAM_NL_ID_Table.nonLinearPlatform]) AND [AVAILS_Season.AMCNID] = [ADAM_NL_ID_Table.amcnId])
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
SET [AVAILS_Response.result] = '&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;AMCN-ProgramADAM xmlns:amc=&quot;http://schemahost.amcnetworks.com:8080/amcnesb/schemas/adam&quot;&gt;
   &lt;Transmission&gt;
      &lt;AMCNID&gt;1390767867812&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLA232705-PressSheet1&lt;/HierarchyParentID&gt;
      &lt;TransmissionStatus/&gt;
      &lt;Channel&gt;AMC+ On Demand (US)&lt;/Channel&gt;
      &lt;TransmissionTerritory&gt;US&lt;/TransmissionTerritory&gt;
      &lt;StartDateTimeFrom&gt;2021-12-15T00:00:00&lt;/StartDateTimeFrom&gt;
      &lt;StartDateTimeTo&gt;2021-12-30T23:59:00&lt;/StartDateTimeTo&gt;
      &lt;TransmissionPrototype&gt;AMC+ (US) - Day Time - Series Pre  Post&lt;/TransmissionPrototype&gt;
      &lt;AttributePeriods&gt;
         &lt;AttributePeriod&gt;
            &lt;StartDate&gt;2021-12-15&lt;/StartDate&gt;
            &lt;EndDate&gt;2021-12-30&lt;/EndDate&gt;
            &lt;Authenticated/&gt;
            &lt;Unauthenticated/&gt;
            &lt;Downloadable&gt;false&lt;/Downloadable&gt;
            &lt;FastForwardDisabled/&gt;
         &lt;/AttributePeriod&gt;
      &lt;/AttributePeriods&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;FlightStartDateTime&gt;2021-12-15&lt;/FlightStartDateTime&gt;
      &lt;FlightEndDateTime&gt;2021-12-30&lt;/FlightEndDateTime&gt;
      &lt;TransmissionPressTarget&gt;Press Sheet 1&lt;/TransmissionPressTarget&gt;
   &lt;/Transmission&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLA232705-PressSheet1&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLS24575-PressSheet1&lt;/HierarchyParentID&gt;
      &lt;TitleType&gt;Episode&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;&gt;Kids in the Hall, The: 05-002&lt;/Title&gt;
      &lt;/Titles&gt;
      &lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
      &lt;ReleaseYear&gt;1994&lt;/ReleaseYear&gt;
      &lt;OriginalLanguage&gt;en&lt;/OriginalLanguage&gt;
      &lt;AssetSource&gt;Acquired&lt;/AssetSource&gt;
      &lt;PlatformGenres&gt;
         &lt;GenreGroup/&gt;
      &lt;/PlatformGenres&gt;
      &lt;EpisodeVersionTypeDescription&gt;Theatrical&lt;/EpisodeVersionTypeDescription&gt;
      &lt;TotalNoOfEpisodes/&gt;
      &lt;PressAMCNID&gt;1390769279828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;Press Sheet 1&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
      &lt;AlternativeTitles&gt;The Kids in the Hall 502&lt;/AlternativeTitles&gt;
      &lt;AiringOrder&gt;2&lt;/AiringOrder&gt;
      &lt;Keywords&gt;Sketch Comedy, Dave Foley, Cabbage Head, The Chicken Lady, Mark McKinney, Canadian, Buddy Cole&lt;/Keywords&gt;
      &lt;EpisodeNumber&gt;502&lt;/EpisodeNumber&gt;
      &lt;CountryOfOrigin&gt;US&lt;/CountryOfOrigin&gt;
      &lt;PremierDate&gt;1994-10-12&lt;/PremierDate&gt;
      &lt;ActualTRT/&gt;
      &lt;EpisodeTitle&gt;
         &lt;Title Language=&quot;en&quot;&gt;Press Sheet 1 Episode 2&lt;/Title&gt;
      &lt;/EpisodeTitle&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Long&quot;&gt;A man films a documentary about getting fired from his job and a disgusting old man asks his neighbor to roll his wife over. Sketches include: Police Department 1, Disgusting Old Man, The Chosen One Thinker, Chance Meeting, Police Department 2&lt;/Description&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;A man films a documentary about getting fired from his job.&lt;/Description&gt;
         &lt;Description Type=&quot;Short&quot;&gt;A man films a documentary about getting fired from his job.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;VODTitles&gt;
         &lt;VODTitle VODTitleType=&quot;Cutdown&quot;&gt;Kids in Hall 502&lt;/VODTitle&gt;
      &lt;/VODTitles&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany&gt;Broadway Video International&lt;/DistributorProductionCompany&gt;
      &lt;Notes/&gt;
      &lt;Ratings&gt;
         &lt;Rating Type=&quot;NLD TV Rating&quot; Descriptor=&quot;Language,Sex&quot;&gt;TV-MA&lt;/Rating&gt;
         &lt;Rating Type=&quot;TV Rating&quot; Descriptor=&quot;&quot;&gt;TV-MA&lt;/Rating&gt;
      &lt;/Ratings&gt;
      &lt;Crew&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;1&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Kevin&lt;/FirstName&gt;
            &lt;LastName&gt;McDonald&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Kevin McDonald&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;2&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;McKinney&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark McKinney&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;3&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Scott&lt;/FirstName&gt;
            &lt;LastName&gt;Thompson&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Scott Thompson&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;4&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Jeffrey&lt;/FirstName&gt;
            &lt;LastName&gt;Berman&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Jeffrey Berman&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;5&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;John&lt;/FirstName&gt;
            &lt;LastName&gt;Blanchard&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;John Blanchard&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;6&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Lorne&lt;/FirstName&gt;
            &lt;LastName&gt;Michaels&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Lorne Michaels&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;7&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Betty&lt;/FirstName&gt;
            &lt;LastName&gt;Orr&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Betty Orr&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;8&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;John&lt;/FirstName&gt;
            &lt;LastName&gt;Blanchard&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;John Blanchard&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;9&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;10&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;Sawers&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark Sawers&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;11&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Dave&lt;/FirstName&gt;
            &lt;LastName&gt;Foley&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Dave Foley&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;12&lt;/Order&gt;
         &lt;/CrewMember&gt;
      &lt;/Crew&gt;
      &lt;Cast&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Dave&lt;/FirstName&gt;
            &lt;LastName&gt;Foley&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Dave Foley&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;1&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;2&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Kevin&lt;/FirstName&gt;
            &lt;LastName&gt;McDonald&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Kevin McDonald&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;3&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;McKinney&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark McKinney&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;4&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Scott&lt;/FirstName&gt;
            &lt;LastName&gt;Thompson&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Scott Thompson&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;5&lt;/Order&gt;
         &lt;/CastMember&gt;
      &lt;/Cast&gt;
   &lt;/ProgramMetadata&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLS24575-PressSheet1&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLA232615-PressSheet1&lt;/HierarchyParentID&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;/&gt;
      &lt;/Titles&gt;
      &lt;TitleType&gt;Series&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;SeasonNumber&gt;05&lt;/SeasonNumber&gt;
      &lt;OriginalLanguage&gt;en&lt;/OriginalLanguage&gt;
      &lt;TotalNoOfEpisodes&gt;22&lt;/TotalNoOfEpisodes&gt;
      &lt;PressAMCNID&gt;1378668750828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;Press Sheet 1&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;AlternativeTitles&gt;Kids in the Hall, The: Season 5&lt;/AlternativeTitles&gt;
      &lt;ReleaseYear&gt;1994&lt;/ReleaseYear&gt;
      &lt;CountryOfOrigin&gt;US&lt;/CountryOfOrigin&gt;
      &lt;PremierDate/&gt;
      &lt;ActualTRT/&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Long&quot;&gt;Press Sheet 1 - The hilarious Canadian sketch comedy troupe consisting of comedians Dave Foley, Bruce McCulloch, Kevin McDonald, Mark McKinney, and Scott Thompson who, more often than not, put bizarre, unique, and insane twists in their skits.&lt;/Description&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;Press Sheet 1 - The bizarre and unique skits of the hilarious Canadian sketch comedy troupe.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-02&lt;/ChangedOn&gt;
      &lt;VODTitles/&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany/&gt;
      &lt;Notes&gt;KITH S5 Press Sheet 1&lt;/Notes&gt;
      &lt;Ratings&gt;
         &lt;Rating Type=&quot;IN Rating&quot; Descriptor=&quot;&quot;&gt;U/A 13+&lt;/Rating&gt;
         &lt;Rating Type=&quot;MPAA&quot; Descriptor=&quot;&quot;/&gt;
         &lt;Rating Type=&quot;NLD TV Rating&quot; Descriptor=&quot;&quot;/&gt;
         &lt;Rating Type=&quot;TV Rating&quot; Descriptor=&quot;&quot;/&gt;
      &lt;/Ratings&gt;
   &lt;/ProgramMetadata&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLA232615-PressSheet1&lt;/AMCNID&gt;
      &lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;&gt;Kids in the Hall, The&lt;/Title&gt;
      &lt;/Titles&gt;
      &lt;TotalNoOfEpisodes/&gt;
      &lt;PressAMCNID&gt;1378668751828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;Press Sheet 1&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;AlternativeTitles&gt;Press Sheet 1 - The Kids in the Hall&lt;/AlternativeTitles&gt;
      &lt;ReleaseYear&gt;1988&lt;/ReleaseYear&gt;
      &lt;PremierDate/&gt;
      &lt;ActualTRT/&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;The hilarious Canadian sketch comedy troupe consisting of comedians Dave Foley, Bruce McCulloch, Kevin McDonald, Mark McKinney, and Scott Thompson who, more often than not, put bizarre, unique, and insane twists in their skits.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;VODTitles&gt;
         &lt;VODTitle VODTitleType=&quot;Folder_SD&quot;&gt;Kids in the Hall&lt;/VODTitle&gt;
      &lt;/VODTitles&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany/&gt;
      &lt;Notes&gt;12/2/21 - KITH PS1&lt;/Notes&gt;
   &lt;/ProgramMetadata&gt;
   &lt;Transmission&gt;
      &lt;AMCNID&gt;1390769124812&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLA232705&lt;/HierarchyParentID&gt;
      &lt;TransmissionStatus/&gt;
      &lt;Channel&gt;AMC+ On Demand (US)&lt;/Channel&gt;
      &lt;TransmissionTerritory&gt;US&lt;/TransmissionTerritory&gt;
      &lt;StartDateTimeFrom&gt;2021-12-15T00:00:00&lt;/StartDateTimeFrom&gt;
      &lt;StartDateTimeTo&gt;2021-12-30T23:59:00&lt;/StartDateTimeTo&gt;
      &lt;TransmissionPrototype&gt;AMC+ (US) - Day Time - Series Pre  Post&lt;/TransmissionPrototype&gt;
      &lt;AttributePeriods&gt;
         &lt;AttributePeriod&gt;
            &lt;StartDate&gt;2021-12-15&lt;/StartDate&gt;
            &lt;EndDate&gt;2021-12-30&lt;/EndDate&gt;
            &lt;Authenticated/&gt;
            &lt;Unauthenticated/&gt;
            &lt;Downloadable&gt;false&lt;/Downloadable&gt;
            &lt;FastForwardDisabled/&gt;
         &lt;/AttributePeriod&gt;
      &lt;/AttributePeriods&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;FlightStartDateTime&gt;2021-12-15&lt;/FlightStartDateTime&gt;
      &lt;FlightEndDateTime&gt;2021-12-30&lt;/FlightEndDateTime&gt;
      &lt;TransmissionPressTarget/&gt;
   &lt;/Transmission&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLA232705&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLS24575&lt;/HierarchyParentID&gt;
      &lt;TitleType&gt;Episode&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;&gt;Kids in the Hall, The: 05-002&lt;/Title&gt;
      &lt;/Titles&gt;
      &lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
      &lt;ReleaseYear&gt;1994&lt;/ReleaseYear&gt;
      &lt;OriginalLanguage&gt;en&lt;/OriginalLanguage&gt;
      &lt;AssetSource&gt;Acquired&lt;/AssetSource&gt;
      &lt;PlatformGenres&gt;
         &lt;GenreGroup/&gt;
      &lt;/PlatformGenres&gt;
      &lt;EpisodeVersionTypeDescription&gt;Theatrical&lt;/EpisodeVersionTypeDescription&gt;
      &lt;TotalNoOfEpisodes/&gt;
      &lt;PressAMCNID&gt;1390769278828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;AMC+&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
      &lt;AlternativeTitles&gt;The Kids in the Hall 502&lt;/AlternativeTitles&gt;
      &lt;AiringOrder&gt;2&lt;/AiringOrder&gt;
      &lt;Keywords&gt;Sketch Comedy, Dave Foley, Cabbage Head, The Chicken Lady, Mark McKinney, Canadian, Buddy Cole&lt;/Keywords&gt;
      &lt;EpisodeNumber&gt;502&lt;/EpisodeNumber&gt;
      &lt;CountryOfOrigin&gt;US&lt;/CountryOfOrigin&gt;
      &lt;PremierDate&gt;1994-10-12&lt;/PremierDate&gt;
      &lt;ActualTRT/&gt;
      &lt;EpisodeTitle&gt;
         &lt;Title Language=&quot;en&quot;&gt;AMC+ Episode 2&lt;/Title&gt;
      &lt;/EpisodeTitle&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Long&quot;&gt;A man films a documentary about getting fired from his job and a disgusting old man asks his neighbor to roll his wife over. Sketches include: Police Department 1, Disgusting Old Man, The Chosen One Thinker, Chance Meeting, Police Department 2&lt;/Description&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;A man films a documentary about getting fired from his job.&lt;/Description&gt;
         &lt;Description Type=&quot;Short&quot;&gt;A man films a documentary about getting fired from his job.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;VODTitles&gt;
         &lt;VODTitle VODTitleType=&quot;Cutdown&quot;&gt;Kids in Hall 502&lt;/VODTitle&gt;
      &lt;/VODTitles&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany&gt;Broadway Video International&lt;/DistributorProductionCompany&gt;
      &lt;Notes/&gt;
      &lt;Ratings&gt;
         &lt;Rating Type=&quot;NLD TV Rating&quot; Descriptor=&quot;Language,Sex&quot;&gt;TV-MA&lt;/Rating&gt;
         &lt;Rating Type=&quot;TV Rating&quot; Descriptor=&quot;&quot;&gt;TV-MA&lt;/Rating&gt;
      &lt;/Ratings&gt;
      &lt;Crew&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;1&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Kevin&lt;/FirstName&gt;
            &lt;LastName&gt;McDonald&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Kevin McDonald&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;2&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;McKinney&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark McKinney&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;3&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Scott&lt;/FirstName&gt;
            &lt;LastName&gt;Thompson&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Scott Thompson&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;4&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Jeffrey&lt;/FirstName&gt;
            &lt;LastName&gt;Berman&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Jeffrey Berman&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;5&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;John&lt;/FirstName&gt;
            &lt;LastName&gt;Blanchard&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;John Blanchard&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;6&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Lorne&lt;/FirstName&gt;
            &lt;LastName&gt;Michaels&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Lorne Michaels&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;7&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Betty&lt;/FirstName&gt;
            &lt;LastName&gt;Orr&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Betty Orr&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;8&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;John&lt;/FirstName&gt;
            &lt;LastName&gt;Blanchard&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;John Blanchard&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;9&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;10&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;Sawers&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark Sawers&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;11&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Dave&lt;/FirstName&gt;
            &lt;LastName&gt;Foley&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Dave Foley&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;12&lt;/Order&gt;
         &lt;/CrewMember&gt;
      &lt;/Crew&gt;
      &lt;Cast&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Dave&lt;/FirstName&gt;
            &lt;LastName&gt;Foley&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Dave Foley&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;1&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;2&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Kevin&lt;/FirstName&gt;
            &lt;LastName&gt;McDonald&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Kevin McDonald&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;3&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;McKinney&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark McKinney&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;4&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Scott&lt;/FirstName&gt;
            &lt;LastName&gt;Thompson&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Scott Thompson&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;5&lt;/Order&gt;
         &lt;/CastMember&gt;
      &lt;/Cast&gt;
   &lt;/ProgramMetadata&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLS24575&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLA232615&lt;/HierarchyParentID&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;/&gt;
      &lt;/Titles&gt;
      &lt;TitleType&gt;Series&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;SeasonNumber&gt;05&lt;/SeasonNumber&gt;
      &lt;OriginalLanguage&gt;en&lt;/OriginalLanguage&gt;
      &lt;TotalNoOfEpisodes&gt;22&lt;/TotalNoOfEpisodes&gt;
      &lt;PressAMCNID&gt;1378661212828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;AMC+&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;AlternativeTitles&gt;Kids in the Hall, The: Season 5&lt;/AlternativeTitles&gt;
      &lt;ReleaseYear&gt;1994&lt;/ReleaseYear&gt;
      &lt;CountryOfOrigin&gt;US&lt;/CountryOfOrigin&gt;
      &lt;PremierDate/&gt;
      &lt;ActualTRT/&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Long&quot;&gt;AMC+ - The hilarious Canadian sketch comedy troupe consisting of comedians Dave Foley, Bruce McCulloch, Kevin McDonald, Mark McKinney, and Scott Thompson who, more often than not, put bizarre, unique, and insane twists in their skits.&lt;/Description&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;AMC+ - The bizarre and unique skits of the hilarious Canadian sketch comedy troupe.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-02&lt;/ChangedOn&gt;
      &lt;VODTitles/&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany/&gt;
      &lt;Notes&gt;KITH S5 AMC+&lt;/Notes&gt;
      &lt;Ratings&gt;
         &lt;Rating Type=&quot;IN Rating&quot; Descriptor=&quot;&quot;&gt;U/A 13+&lt;/Rating&gt;
         &lt;Rating Type=&quot;MPAA&quot; Descriptor=&quot;&quot;/&gt;
         &lt;Rating Type=&quot;NLD TV Rating&quot; Descriptor=&quot;&quot;/&gt;
         &lt;Rating Type=&quot;TV Rating&quot; Descriptor=&quot;&quot;/&gt;
      &lt;/Ratings&gt;
   &lt;/ProgramMetadata&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLA232615&lt;/AMCNID&gt;
      &lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;&gt;Kids in the Hall, The&lt;/Title&gt;
      &lt;/Titles&gt;
      &lt;TotalNoOfEpisodes/&gt;
      &lt;PressAMCNID&gt;1378661217828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;AMC+&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;AlternativeTitles&gt;AMC+ - The Kids in the Hall&lt;/AlternativeTitles&gt;
      &lt;ReleaseYear&gt;1988&lt;/ReleaseYear&gt;
      &lt;PremierDate/&gt;
      &lt;ActualTRT/&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;The hilarious Canadian sketch comedy troupe consisting of comedians Dave Foley, Bruce McCulloch, Kevin McDonald, Mark McKinney, and Scott Thompson who, more often than not, put bizarre, unique, and insane twists in their skits.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;VODTitles&gt;
         &lt;VODTitle VODTitleType=&quot;Folder_SD&quot;&gt;Kids in the Hall&lt;/VODTitle&gt;
      &lt;/VODTitles&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany/&gt;
      &lt;Notes&gt;KITH AMC+&lt;/Notes&gt;
   &lt;/ProgramMetadata&gt;
&lt;/AMCN-ProgramADAM&gt;'
WHERE [AVAILS_Response].object_id = {PROCESS::ID}">UPDATE [AVAILS_Response]
SET [AVAILS_Response.result] = '&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;AMCN-ProgramADAM xmlns:amc=&quot;http://schemahost.amcnetworks.com:8080/amcnesb/schemas/adam&quot;&gt;
   &lt;Transmission&gt;
      &lt;AMCNID&gt;1390767867812&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLA232705-PressSheet1&lt;/HierarchyParentID&gt;
      &lt;TransmissionStatus/&gt;
      &lt;Channel&gt;AMC+ On Demand (US)&lt;/Channel&gt;
      &lt;TransmissionTerritory&gt;US&lt;/TransmissionTerritory&gt;
      &lt;StartDateTimeFrom&gt;2021-12-15T00:00:00&lt;/StartDateTimeFrom&gt;
      &lt;StartDateTimeTo&gt;2021-12-30T23:59:00&lt;/StartDateTimeTo&gt;
      &lt;TransmissionPrototype&gt;AMC+ (US) - Day Time - Series Pre  Post&lt;/TransmissionPrototype&gt;
      &lt;AttributePeriods&gt;
         &lt;AttributePeriod&gt;
            &lt;StartDate&gt;2021-12-15&lt;/StartDate&gt;
            &lt;EndDate&gt;2021-12-30&lt;/EndDate&gt;
            &lt;Authenticated/&gt;
            &lt;Unauthenticated/&gt;
            &lt;Downloadable&gt;false&lt;/Downloadable&gt;
            &lt;FastForwardDisabled/&gt;
         &lt;/AttributePeriod&gt;
      &lt;/AttributePeriods&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;FlightStartDateTime&gt;2021-12-15&lt;/FlightStartDateTime&gt;
      &lt;FlightEndDateTime&gt;2021-12-30&lt;/FlightEndDateTime&gt;
      &lt;TransmissionPressTarget&gt;Press Sheet 1&lt;/TransmissionPressTarget&gt;
   &lt;/Transmission&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLA232705-PressSheet1&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLS24575-PressSheet1&lt;/HierarchyParentID&gt;
      &lt;TitleType&gt;Episode&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;&gt;Kids in the Hall, The: 05-002&lt;/Title&gt;
      &lt;/Titles&gt;
      &lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
      &lt;ReleaseYear&gt;1994&lt;/ReleaseYear&gt;
      &lt;OriginalLanguage&gt;en&lt;/OriginalLanguage&gt;
      &lt;AssetSource&gt;Acquired&lt;/AssetSource&gt;
      &lt;PlatformGenres&gt;
         &lt;GenreGroup/&gt;
      &lt;/PlatformGenres&gt;
      &lt;EpisodeVersionTypeDescription&gt;Theatrical&lt;/EpisodeVersionTypeDescription&gt;
      &lt;TotalNoOfEpisodes/&gt;
      &lt;PressAMCNID&gt;1390769279828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;Press Sheet 1&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
      &lt;AlternativeTitles&gt;The Kids in the Hall 502&lt;/AlternativeTitles&gt;
      &lt;AiringOrder&gt;2&lt;/AiringOrder&gt;
      &lt;Keywords&gt;Sketch Comedy, Dave Foley, Cabbage Head, The Chicken Lady, Mark McKinney, Canadian, Buddy Cole&lt;/Keywords&gt;
      &lt;EpisodeNumber&gt;502&lt;/EpisodeNumber&gt;
      &lt;CountryOfOrigin&gt;US&lt;/CountryOfOrigin&gt;
      &lt;PremierDate&gt;1994-10-12&lt;/PremierDate&gt;
      &lt;ActualTRT/&gt;
      &lt;EpisodeTitle&gt;
         &lt;Title Language=&quot;en&quot;&gt;Press Sheet 1 Episode 2&lt;/Title&gt;
      &lt;/EpisodeTitle&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Long&quot;&gt;A man films a documentary about getting fired from his job and a disgusting old man asks his neighbor to roll his wife over. Sketches include: Police Department 1, Disgusting Old Man, The Chosen One Thinker, Chance Meeting, Police Department 2&lt;/Description&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;A man films a documentary about getting fired from his job.&lt;/Description&gt;
         &lt;Description Type=&quot;Short&quot;&gt;A man films a documentary about getting fired from his job.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;VODTitles&gt;
         &lt;VODTitle VODTitleType=&quot;Cutdown&quot;&gt;Kids in Hall 502&lt;/VODTitle&gt;
      &lt;/VODTitles&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany&gt;Broadway Video International&lt;/DistributorProductionCompany&gt;
      &lt;Notes/&gt;
      &lt;Ratings&gt;
         &lt;Rating Type=&quot;NLD TV Rating&quot; Descriptor=&quot;Language,Sex&quot;&gt;TV-MA&lt;/Rating&gt;
         &lt;Rating Type=&quot;TV Rating&quot; Descriptor=&quot;&quot;&gt;TV-MA&lt;/Rating&gt;
      &lt;/Ratings&gt;
      &lt;Crew&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;1&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Kevin&lt;/FirstName&gt;
            &lt;LastName&gt;McDonald&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Kevin McDonald&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;2&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;McKinney&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark McKinney&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;3&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Scott&lt;/FirstName&gt;
            &lt;LastName&gt;Thompson&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Scott Thompson&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;4&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Jeffrey&lt;/FirstName&gt;
            &lt;LastName&gt;Berman&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Jeffrey Berman&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;5&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;John&lt;/FirstName&gt;
            &lt;LastName&gt;Blanchard&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;John Blanchard&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;6&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Lorne&lt;/FirstName&gt;
            &lt;LastName&gt;Michaels&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Lorne Michaels&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;7&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Betty&lt;/FirstName&gt;
            &lt;LastName&gt;Orr&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Betty Orr&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;8&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;John&lt;/FirstName&gt;
            &lt;LastName&gt;Blanchard&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;John Blanchard&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;9&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;10&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;Sawers&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark Sawers&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;11&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Dave&lt;/FirstName&gt;
            &lt;LastName&gt;Foley&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Dave Foley&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;12&lt;/Order&gt;
         &lt;/CrewMember&gt;
      &lt;/Crew&gt;
      &lt;Cast&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Dave&lt;/FirstName&gt;
            &lt;LastName&gt;Foley&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Dave Foley&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;1&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;2&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Kevin&lt;/FirstName&gt;
            &lt;LastName&gt;McDonald&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Kevin McDonald&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;3&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;McKinney&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark McKinney&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;4&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Scott&lt;/FirstName&gt;
            &lt;LastName&gt;Thompson&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Scott Thompson&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;5&lt;/Order&gt;
         &lt;/CastMember&gt;
      &lt;/Cast&gt;
   &lt;/ProgramMetadata&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLS24575-PressSheet1&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLA232615-PressSheet1&lt;/HierarchyParentID&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;/&gt;
      &lt;/Titles&gt;
      &lt;TitleType&gt;Series&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;SeasonNumber&gt;05&lt;/SeasonNumber&gt;
      &lt;OriginalLanguage&gt;en&lt;/OriginalLanguage&gt;
      &lt;TotalNoOfEpisodes&gt;22&lt;/TotalNoOfEpisodes&gt;
      &lt;PressAMCNID&gt;1378668750828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;Press Sheet 1&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;AlternativeTitles&gt;Kids in the Hall, The: Season 5&lt;/AlternativeTitles&gt;
      &lt;ReleaseYear&gt;1994&lt;/ReleaseYear&gt;
      &lt;CountryOfOrigin&gt;US&lt;/CountryOfOrigin&gt;
      &lt;PremierDate/&gt;
      &lt;ActualTRT/&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Long&quot;&gt;Press Sheet 1 - The hilarious Canadian sketch comedy troupe consisting of comedians Dave Foley, Bruce McCulloch, Kevin McDonald, Mark McKinney, and Scott Thompson who, more often than not, put bizarre, unique, and insane twists in their skits.&lt;/Description&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;Press Sheet 1 - The bizarre and unique skits of the hilarious Canadian sketch comedy troupe.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-02&lt;/ChangedOn&gt;
      &lt;VODTitles/&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany/&gt;
      &lt;Notes&gt;KITH S5 Press Sheet 1&lt;/Notes&gt;
      &lt;Ratings&gt;
         &lt;Rating Type=&quot;IN Rating&quot; Descriptor=&quot;&quot;&gt;U/A 13+&lt;/Rating&gt;
         &lt;Rating Type=&quot;MPAA&quot; Descriptor=&quot;&quot;/&gt;
         &lt;Rating Type=&quot;NLD TV Rating&quot; Descriptor=&quot;&quot;/&gt;
         &lt;Rating Type=&quot;TV Rating&quot; Descriptor=&quot;&quot;/&gt;
      &lt;/Ratings&gt;
   &lt;/ProgramMetadata&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLA232615-PressSheet1&lt;/AMCNID&gt;
      &lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;&gt;Kids in the Hall, The&lt;/Title&gt;
      &lt;/Titles&gt;
      &lt;TotalNoOfEpisodes/&gt;
      &lt;PressAMCNID&gt;1378668751828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;Press Sheet 1&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;AlternativeTitles&gt;Press Sheet 1 - The Kids in the Hall&lt;/AlternativeTitles&gt;
      &lt;ReleaseYear&gt;1988&lt;/ReleaseYear&gt;
      &lt;PremierDate/&gt;
      &lt;ActualTRT/&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;The hilarious Canadian sketch comedy troupe consisting of comedians Dave Foley, Bruce McCulloch, Kevin McDonald, Mark McKinney, and Scott Thompson who, more often than not, put bizarre, unique, and insane twists in their skits.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;VODTitles&gt;
         &lt;VODTitle VODTitleType=&quot;Folder_SD&quot;&gt;Kids in the Hall&lt;/VODTitle&gt;
      &lt;/VODTitles&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany/&gt;
      &lt;Notes&gt;12/2/21 - KITH PS1&lt;/Notes&gt;
   &lt;/ProgramMetadata&gt;
   &lt;Transmission&gt;
      &lt;AMCNID&gt;1390769124812&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLA232705&lt;/HierarchyParentID&gt;
      &lt;TransmissionStatus/&gt;
      &lt;Channel&gt;AMC+ On Demand (US)&lt;/Channel&gt;
      &lt;TransmissionTerritory&gt;US&lt;/TransmissionTerritory&gt;
      &lt;StartDateTimeFrom&gt;2021-12-15T00:00:00&lt;/StartDateTimeFrom&gt;
      &lt;StartDateTimeTo&gt;2021-12-30T23:59:00&lt;/StartDateTimeTo&gt;
      &lt;TransmissionPrototype&gt;AMC+ (US) - Day Time - Series Pre  Post&lt;/TransmissionPrototype&gt;
      &lt;AttributePeriods&gt;
         &lt;AttributePeriod&gt;
            &lt;StartDate&gt;2021-12-15&lt;/StartDate&gt;
            &lt;EndDate&gt;2021-12-30&lt;/EndDate&gt;
            &lt;Authenticated/&gt;
            &lt;Unauthenticated/&gt;
            &lt;Downloadable&gt;false&lt;/Downloadable&gt;
            &lt;FastForwardDisabled/&gt;
         &lt;/AttributePeriod&gt;
      &lt;/AttributePeriods&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;FlightStartDateTime&gt;2021-12-15&lt;/FlightStartDateTime&gt;
      &lt;FlightEndDateTime&gt;2021-12-30&lt;/FlightEndDateTime&gt;
      &lt;TransmissionPressTarget/&gt;
   &lt;/Transmission&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLA232705&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLS24575&lt;/HierarchyParentID&gt;
      &lt;TitleType&gt;Episode&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;&gt;Kids in the Hall, The: 05-002&lt;/Title&gt;
      &lt;/Titles&gt;
      &lt;OwnerNetwork&gt;AMC&lt;/OwnerNetwork&gt;
      &lt;ReleaseYear&gt;1994&lt;/ReleaseYear&gt;
      &lt;OriginalLanguage&gt;en&lt;/OriginalLanguage&gt;
      &lt;AssetSource&gt;Acquired&lt;/AssetSource&gt;
      &lt;PlatformGenres&gt;
         &lt;GenreGroup/&gt;
      &lt;/PlatformGenres&gt;
      &lt;EpisodeVersionTypeDescription&gt;Theatrical&lt;/EpisodeVersionTypeDescription&gt;
      &lt;TotalNoOfEpisodes/&gt;
      &lt;PressAMCNID&gt;1390769278828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;AMC+&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;ClosedCaptionsYN&gt;true&lt;/ClosedCaptionsYN&gt;
      &lt;AlternativeTitles&gt;The Kids in the Hall 502&lt;/AlternativeTitles&gt;
      &lt;AiringOrder&gt;2&lt;/AiringOrder&gt;
      &lt;Keywords&gt;Sketch Comedy, Dave Foley, Cabbage Head, The Chicken Lady, Mark McKinney, Canadian, Buddy Cole&lt;/Keywords&gt;
      &lt;EpisodeNumber&gt;502&lt;/EpisodeNumber&gt;
      &lt;CountryOfOrigin&gt;US&lt;/CountryOfOrigin&gt;
      &lt;PremierDate&gt;1994-10-12&lt;/PremierDate&gt;
      &lt;ActualTRT/&gt;
      &lt;EpisodeTitle&gt;
         &lt;Title Language=&quot;en&quot;&gt;AMC+ Episode 2&lt;/Title&gt;
      &lt;/EpisodeTitle&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Long&quot;&gt;A man films a documentary about getting fired from his job and a disgusting old man asks his neighbor to roll his wife over. Sketches include: Police Department 1, Disgusting Old Man, The Chosen One Thinker, Chance Meeting, Police Department 2&lt;/Description&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;A man films a documentary about getting fired from his job.&lt;/Description&gt;
         &lt;Description Type=&quot;Short&quot;&gt;A man films a documentary about getting fired from his job.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;VODTitles&gt;
         &lt;VODTitle VODTitleType=&quot;Cutdown&quot;&gt;Kids in Hall 502&lt;/VODTitle&gt;
      &lt;/VODTitles&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany&gt;Broadway Video International&lt;/DistributorProductionCompany&gt;
      &lt;Notes/&gt;
      &lt;Ratings&gt;
         &lt;Rating Type=&quot;NLD TV Rating&quot; Descriptor=&quot;Language,Sex&quot;&gt;TV-MA&lt;/Rating&gt;
         &lt;Rating Type=&quot;TV Rating&quot; Descriptor=&quot;&quot;&gt;TV-MA&lt;/Rating&gt;
      &lt;/Ratings&gt;
      &lt;Crew&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;1&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Kevin&lt;/FirstName&gt;
            &lt;LastName&gt;McDonald&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Kevin McDonald&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;2&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;McKinney&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark McKinney&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;3&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Scott&lt;/FirstName&gt;
            &lt;LastName&gt;Thompson&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Scott Thompson&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;4&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Jeffrey&lt;/FirstName&gt;
            &lt;LastName&gt;Berman&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Jeffrey Berman&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;5&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;John&lt;/FirstName&gt;
            &lt;LastName&gt;Blanchard&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;John Blanchard&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;6&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Lorne&lt;/FirstName&gt;
            &lt;LastName&gt;Michaels&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Lorne Michaels&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;7&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Producer&quot;&gt;
            &lt;FirstName&gt;Betty&lt;/FirstName&gt;
            &lt;LastName&gt;Orr&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Betty Orr&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;8&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;John&lt;/FirstName&gt;
            &lt;LastName&gt;Blanchard&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;John Blanchard&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;9&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;10&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Director&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;Sawers&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark Sawers&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;11&lt;/Order&gt;
         &lt;/CrewMember&gt;
         &lt;CrewMember Type=&quot;Writer&quot;&gt;
            &lt;FirstName&gt;Dave&lt;/FirstName&gt;
            &lt;LastName&gt;Foley&lt;/LastName&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Dave Foley&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;12&lt;/Order&gt;
         &lt;/CrewMember&gt;
      &lt;/Crew&gt;
      &lt;Cast&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Dave&lt;/FirstName&gt;
            &lt;LastName&gt;Foley&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Dave Foley&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;1&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Bruce&lt;/FirstName&gt;
            &lt;LastName&gt;McCulloch&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Bruce McCulloch&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;2&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Kevin&lt;/FirstName&gt;
            &lt;LastName&gt;McDonald&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Kevin McDonald&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;3&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Mark&lt;/FirstName&gt;
            &lt;LastName&gt;McKinney&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Mark McKinney&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;4&lt;/Order&gt;
         &lt;/CastMember&gt;
         &lt;CastMember Type=&quot;Talent/Actor&quot;&gt;
            &lt;FirstName&gt;Scott&lt;/FirstName&gt;
            &lt;LastName&gt;Thompson&lt;/LastName&gt;
            &lt;CharacterName/&gt;
            &lt;DisplayNames&gt;
               &lt;DisplayName&gt;Scott Thompson&lt;/DisplayName&gt;
            &lt;/DisplayNames&gt;
            &lt;Order&gt;5&lt;/Order&gt;
         &lt;/CastMember&gt;
      &lt;/Cast&gt;
   &lt;/ProgramMetadata&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLS24575&lt;/AMCNID&gt;
      &lt;HierarchyParentID&gt;RLA232615&lt;/HierarchyParentID&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;/&gt;
      &lt;/Titles&gt;
      &lt;TitleType&gt;Series&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;SeasonNumber&gt;05&lt;/SeasonNumber&gt;
      &lt;OriginalLanguage&gt;en&lt;/OriginalLanguage&gt;
      &lt;TotalNoOfEpisodes&gt;22&lt;/TotalNoOfEpisodes&gt;
      &lt;PressAMCNID&gt;1378661212828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;AMC+&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;AlternativeTitles&gt;Kids in the Hall, The: Season 5&lt;/AlternativeTitles&gt;
      &lt;ReleaseYear&gt;1994&lt;/ReleaseYear&gt;
      &lt;CountryOfOrigin&gt;US&lt;/CountryOfOrigin&gt;
      &lt;PremierDate/&gt;
      &lt;ActualTRT/&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Long&quot;&gt;AMC+ - The hilarious Canadian sketch comedy troupe consisting of comedians Dave Foley, Bruce McCulloch, Kevin McDonald, Mark McKinney, and Scott Thompson who, more often than not, put bizarre, unique, and insane twists in their skits.&lt;/Description&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;AMC+ - The bizarre and unique skits of the hilarious Canadian sketch comedy troupe.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-02&lt;/ChangedOn&gt;
      &lt;VODTitles/&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany/&gt;
      &lt;Notes&gt;KITH S5 AMC+&lt;/Notes&gt;
      &lt;Ratings&gt;
         &lt;Rating Type=&quot;IN Rating&quot; Descriptor=&quot;&quot;&gt;U/A 13+&lt;/Rating&gt;
         &lt;Rating Type=&quot;MPAA&quot; Descriptor=&quot;&quot;/&gt;
         &lt;Rating Type=&quot;NLD TV Rating&quot; Descriptor=&quot;&quot;/&gt;
         &lt;Rating Type=&quot;TV Rating&quot; Descriptor=&quot;&quot;/&gt;
      &lt;/Ratings&gt;
   &lt;/ProgramMetadata&gt;
   &lt;ProgramMetadata&gt;
      &lt;AMCNID&gt;RLA232615&lt;/AMCNID&gt;
      &lt;TitleType&gt;ParentSeries&lt;/TitleType&gt;
      &lt;ShowType&gt;Series&lt;/ShowType&gt;
      &lt;Titles&gt;
         &lt;Title Language=&quot;en&quot;&gt;Kids in the Hall, The&lt;/Title&gt;
      &lt;/Titles&gt;
      &lt;TotalNoOfEpisodes/&gt;
      &lt;PressAMCNID&gt;1378661217828&lt;/PressAMCNID&gt;
      &lt;PressTarget&gt;AMC+&lt;/PressTarget&gt;
      &lt;MRMID/&gt;
      &lt;PressSheetStatus/&gt;
      &lt;AlternativeTitles&gt;AMC+ - The Kids in the Hall&lt;/AlternativeTitles&gt;
      &lt;ReleaseYear&gt;1988&lt;/ReleaseYear&gt;
      &lt;PremierDate/&gt;
      &lt;ActualTRT/&gt;
      &lt;Descriptions&gt;
         &lt;Description Type=&quot;Medium&quot;&gt;The hilarious Canadian sketch comedy troupe consisting of comedians Dave Foley, Bruce McCulloch, Kevin McDonald, Mark McKinney, and Scott Thompson who, more often than not, put bizarre, unique, and insane twists in their skits.&lt;/Description&gt;
      &lt;/Descriptions&gt;
      &lt;ChangedOn&gt;2021-12-15&lt;/ChangedOn&gt;
      &lt;VODTitles&gt;
         &lt;VODTitle VODTitleType=&quot;Folder_SD&quot;&gt;Kids in the Hall&lt;/VODTitle&gt;
      &lt;/VODTitles&gt;
      &lt;ExtraCode/&gt;
      &lt;DistributorProductionCompany/&gt;
      &lt;Notes&gt;KITH AMC+&lt;/Notes&gt;
   &lt;/ProgramMetadata&gt;
&lt;/AMCN-ProgramADAM&gt;'
WHERE [AVAILS_Response].object_id = {PROCESS::ID}</sql></Params>
