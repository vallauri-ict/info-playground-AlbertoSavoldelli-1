CREATE TABLE [dbo].[Aeroporto]
(
	[Città] NCHAR(20) NOT NULL PRIMARY KEY, 
    [Nazione] NCHAR(20) NULL, 
    [NumPiste] INT NULL
)

CREATE TABLE [dbo].[Volo]
(
	[IdVolo] INT NOT NULL PRIMARY KEY IDENTITY, 
    [GiornoSett] NCHAR(10) NULL, 
    [CittaPart] NCHAR(20) NULL, 
    [OraPart] TIME NULL, 
    [CittaArr] NCHAR(20) NULL, 
    [OraArr] TIME NULL, 
    [TipoAereo] NCHAR(20) NULL
)

CREATE TABLE [dbo].[Aereo]
(
	[TipoAereo] NCHAR(20) NOT NULL PRIMARY KEY, 
    [NumPasseggeri] INT NULL, 
    [QtaMerci] INT NULL
)