SELECT  DISTINCT [D].[NAME] AS [ƒ»ÀÀ≈–] 
FROM [DBO].[MANUFACTURER] AS [M1],[DBO].[AUTOS] AS [A1],[DBO].[FORSELL] AS [F1],[DBO].[DILLER] as [D]
WHERE [D].[ID_DILLER]=[F1].[ID_DILLER] and [F1].[ID_MODEL]=[A1].[ID_MODEL] AND [A1].[ID_MANUF]=[M1].[ID_MANUF] and not exists
(select * from [manufacturer] where not exists
(SELECT  DISTINCT [D2].[NAME] AS [ƒ»ÀÀ≈–] 
FROM [DBO].[MANUFACTURER] AS [M2],[DBO].[AUTOS] AS [A2],[DBO].[FORSELL] AS [F2],[DBO].[DILLER] as [D2]
WHERE [D2].[ID_DILLER]=[F2].[ID_DILLER] and [F2].[ID_MODEL]=[A2].[ID_MODEL] AND [A2].[ID_MANUF]=[M2].[ID_MANUF]
And [d2].[id_diller]=[d].[id_diller] and [m2].[id_manuf]=[manufacturer].[id_manuf]))
GO

SELECT  DISTINCT [D].[NAME] AS [DILL] 
FROM [DBO].[MANUFACTURER] AS [M1],[DBO].[AUTOS] AS [A1],[DBO].[FORSELL] AS [F1],[DBO].[DILLER] as [D], [DBO].[COUNTRY] as [C]
WHERE [F1].[ID_MODEL]=[A1].[ID_MODEL] AND [D].[ID_DILLER]=[F1].[ID_DILLER] and [F1].[ID_DILLER] NOT IN
(SELECT  DISTINCT [F1].[ID_DILLER]
FROM [DBO].[MANUFACTURER] AS [M1], [DBO].[AUTOS] AS [A1], [DBO].[FORSELL] AS [F1]
WHERE [M1].[NAME]='Merzedes' AND [A1].[ID_MANUF]=[M1].[ID_MANUF] AND [F1].[ID_MODEL]=[A1].[ID_MODEL])
GO
