CREATE TABLE [dbo].[Proprietari]
(
	[CodF] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nome] VARCHAR(30) NULL, 
    [Residenza] VARCHAR(30) NULL
)
CREATE TABLE [dbo].[Assicurazioni]
(
	[CodAss] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nome] VARCHAR(30) NULL, 
    [Sede] VARCHAR(50) NULL
)
CREATE TABLE [dbo].[Auto]
(
	[Targa] VARCHAR(7) NOT NULL PRIMARY KEY, 
    [Marca] VARCHAR(30) NULL, 
    [Modello] VARCHAR(30) NULL, 
    [Cilindrata] INT NULL, 
    [Potenza] INT NULL, 
    [CodF] INT  NULL, 
    [CodAss] INT NULL, 
    CONSTRAINT [FK_Auto_ToTable] FOREIGN KEY ([CodF]) REFERENCES [Proprietari]([CodF]), 
    CONSTRAINT [FK_Auto_ToTable_1] FOREIGN KEY ([CodAss]) REFERENCES [Assicurazioni]([CodAss])
)
CREATE TABLE [dbo].[Sinistro]
(
	[CodS] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Localita] VARCHAR(30) NULL, 
    [Data] DATE NULL
)
CREATE TABLE [dbo].[AutoCoinvolte]
(
	[CodS] INT NOT NULL , 
    [Targa] VARCHAR(7) NOT NULL, 
    [ImportoDelDanno] INT NULL, 
    PRIMARY KEY ([CodS], [Targa]), 
    CONSTRAINT [FK_Table_ToTable] FOREIGN KEY ([CodS]) REFERENCES [Sinistro]([CodS]), 
    CONSTRAINT [FK_Table_ToTable_1] FOREIGN KEY ([Targa]) REFERENCES [Auto]([Targa])
)