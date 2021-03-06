USE [master]
GO
/****** Object:  Database [Labb2KamilNiescieronek]    Script Date: 2021-04-26 18:59:25 ******/
CREATE DATABASE [Labb2KamilNiescieronek]
 CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'Labb2KamilNiescieronek', FILENAME = N'C:\Users\kami_\Labb2KamilNiescieronek.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'Labb2KamilNiescieronek_log', FILENAME = N'C:\Users\kami_\Labb2KamilNiescieronek_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Labb2KamilNiescieronek].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET ARITHABORT OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET  MULTI_USER 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET QUERY_STORE = OFF
GO
USE [Labb2KamilNiescieronek]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Labb2KamilNiescieronek]
GO
/****** Object:  Table [dbo].[Författare_Böcker]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Författare_Böcker](
	[FörfattareId] [int] NOT NULL,
	[ISBN] [bigint] NOT NULL,
 CONSTRAINT [PK_Författare_Böcker] PRIMARY KEY CLUSTERED 
(
	[FörfattareId] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LagerSaldo]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LagerSaldo](
	[ButikId] [int] NOT NULL,
	[ISBN] [bigint] NOT NULL,
	[Antal] [int] NULL,
 CONSTRAINT [PK_LagerSaldo] PRIMARY KEY CLUSTERED 
(
	[ButikId] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Författare]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Författare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Förnamn] [nvarchar](50) NOT NULL,
	[Efternamn] [nvarchar](50) NOT NULL,
	[Födelsedatum] [datetime2](7) NOT NULL,
	[Är_Avliden] [bit] NULL,
 CONSTRAINT [PK_Författare] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Böcker]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Böcker](
	[ISBN13] [bigint] NOT NULL,
	[Titel] [nvarchar](50) NOT NULL,
	[Språk] [nvarchar](50) NOT NULL,
	[Pris_SEK] [float] NOT NULL,
	[Utgivningsdatum] [datetime2](7) NOT NULL,
	[Antal_sidor] [int] NULL,
	[Dimensioner] [nvarchar](50) NULL,
	[Vikt_gram] [float] NULL,
	[SAB] [nvarchar](50) NULL,
	[FörlagId] [int] NOT NULL,
 CONSTRAINT [PK_Böcker] PRIMARY KEY CLUSTERED 
(
	[ISBN13] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_TitlarPerFörfattare]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_TitlarPerFörfattare] AS
SELECT	CONCAT(f.Förnamn, ' ', f.Efternamn) AS Namn,
		CASE
			WHEN f.Är_Avliden = 1 THEN 'Död'
		ELSE
			CAST(
			FLOOR(DATEDIFF(DAY, f.Födelsedatum, GETDATE()) / 365.25)
			AS varchar(50)) + ' år'
		END AS Ålder,
		CAST(a.Titlar AS varchar) + ' st' AS Titlar,
		c.Lagervärde
FROM Författare f
	JOIN
		(SELECT FörfattareId, COUNT(*) AS Titlar
		FROM Författare_Böcker
		GROUP BY FörfattareId) a
			ON f.Id = A.FörfattareId
	JOIN
		(SELECT	b.FörfattareId, 
		CAST(SUM(b.[Lagerväde per bok]) AS varchar(50)) + ' kr' AS Lagervärde
		FROM
			(SELECT fb.FörfattareId, SUM(Antal * b.Pris_SEK) AS [Lagerväde per bok]
			FROM LagerSaldo ls
				JOIN Böcker b
					ON ls.ISBN = b.ISBN13
				JOIN Författare_Böcker fb
					ON fb.ISBN = b.ISBN13
			GROUP BY b.ISBN13, fb.FörfattareId) b
		GROUP BY b.FörfattareId) c
			ON c.FörfattareId = f.Id
GO
/****** Object:  Table [dbo].[Böcker_Orderrader]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Böcker_Orderrader](
	[ISBN] [bigint] NOT NULL,
	[OrderradId] [int] NOT NULL,
 CONSTRAINT [PK_Böcker_Orderrader] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC,
	[OrderradId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordrar]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordrar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Orderdatum] [datetime2](7) NOT NULL,
	[Leveransdatum] [datetime2](7) NULL,
	[Levaransadress] [nvarchar](50) NULL,
	[Levaransgatunummer] [nvarchar](50) NULL,
	[Levaranspostnummer] [nvarchar](50) NULL,
	[KundId] [int] NOT NULL,
	[Frakt] [bit] NOT NULL,
 CONSTRAINT [PK_Ordrar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderrader]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderrader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enhetspris] [float] NOT NULL,
	[Mängd] [tinyint] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_Orderspecifikationer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunder]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Förnamn] [nvarchar](50) NULL,
	[Efternamn] [nvarchar](50) NULL,
	[KontaktId] [int] NULL,
	[Personnummer] [char](13) NULL,
 CONSTRAINT [PK_Kunder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_KundErbjudanden]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_KundErbjudanden] AS
/*Har kunden köpt en bok så kan man snabbt se om författaren har 
skrivit några andra böcker som kan vara till intresse för kunden. 
Denna information kan vara användbar inom merförsäljning*/
SELECT	Kund, Personnummer, Beställningsdatum, Beställde, 
		LTRIM([Mer Böcker]) AS [Mer titlar från samma författare]
FROM	
	(SELECT	CONCAT(k.Förnamn, ' ', k.Efternamn) AS Kund, k.Personnummer,
	FORMAT(o.Orderdatum, 'yyyy-MM-dd') AS Beställningsdatum,
	b.Titel + ' av ' + f.Förnamn + ' ' + f.Efternamn AS Beställde,
	f.Förnamn + ' ' + f.Efternamn AS Namn
	FROM Kunder k
		JOIN Ordrar o
			ON k.Id = o.KundId
		JOIN Orderrader ord
			ON ord.OrderId = o.Id
		JOIN Böcker_Orderrader bord
			ON bord.OrderradId = ord.Id
		JOIN Böcker b
			ON b.ISBN13 = bord.ISBN
		JOIN Författare_Böcker fb
			ON fb.ISBN = b.ISBN13
		JOIN Författare f
			ON f.Id = fb.FörfattareId) a
		LEFT JOIN 
			(SELECT	Namn, 
			STUFF((SELECT DISTINCT ', ' + Titel
			FROM
				(SELECT CONCAT(f.Förnamn, ' ', f.Efternamn) AS Namn, b.Titel
				FROM Författare f
					JOIN Författare_Böcker fb
						ON f.Id = fb.FörfattareId
					JOIN Böcker b
						ON b.ISBN13 = fb.ISBN) p
				WHERE p.Namn = t.Namn
				FOR XML PATH ('')), 1, 1, '') AS [Mer Böcker]
				FROM 
					(SELECT CONCAT(f.Förnamn, ' ', f.Efternamn) AS Namn, b.Titel
					FROM Författare f
						JOIN Författare_Böcker fb
							ON f.Id = fb.FörfattareId
						JOIN Böcker b
							ON b.ISBN13 = fb.ISBN) t
				GROUP BY Namn) b
					ON a.Namn = b.Namn
GO
/****** Object:  Table [dbo].[Butiker]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Butiker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Butiksnamn] [nvarchar](50) NOT NULL,
	[KontaktId] [int] NOT NULL,
 CONSTRAINT [PK_Butiker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Förlag]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Förlag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bokförlag] [nvarchar](50) NOT NULL,
	[KontaktId] [int] NOT NULL,
 CONSTRAINT [PK_Förlag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kontaktuppgifter]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontaktuppgifter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gatuadress] [nvarchar](50) NULL,
	[Gatunummer] [nvarchar](50) NULL,
	[Postnummer] [int] NULL,
	[Är_Leveransadress] [bit] NULL,
	[Telefon] [nvarchar](50) NULL,
	[Epost] [nvarchar](50) NULL,
	[Webbplats] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kontaktuppgifter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9781789096491, N'Later', N'Engelska', 99, CAST(N'2021-03-02T00:00:00.0000000' AS DateTime2), 272, N'196 x 130 x 22 mm', 200, NULL, 1)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789100180270, N'Institutet', N'Svenska', 210, CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 672, N'232 x 160 x 45 mm', 959, NULL, 2)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789100182472, N'Shuggie Bain', N'Svenska', 189, CAST(N'2021-03-01T00:00:00.0000000' AS DateTime2), 460, N'221 x 145 x 36 mm', 602, NULL, 2)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789113072005, N'Morgonstjärnan', N'Svenska', 219, CAST(N'2021-01-20T00:00:00.0000000' AS DateTime2), 663, N'218 x 145 x 45 mm', 874, NULL, 5)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789113072029, N'Om vintern', N'Svenska', 219, CAST(N'2016-10-18T00:00:00.0000000' AS DateTime2), 275, N'210 x 135 x 25 mm', 550, NULL, 5)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789129657517, N'Ronja Rövardotter', N'Svenska', 168, CAST(N'2004-07-01T00:00:00.0000000' AS DateTime2), 248, N'215 x 215 x 16 mm', 520, NULL, 3)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789129688313, N'Bröderna Lejonhjärta', N'Svenska', 123, CAST(N'2013-09-26T00:00:00.0000000' AS DateTime2), 248, N'215 x 160 x 25 mm', 588, NULL, 3)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789129723632, N'Pippi Långstrump', N'Svenska', 161, CAST(N'2020-04-24T00:00:00.0000000' AS DateTime2), 135, N'214 x 160 x 17 mm', 437, NULL, 3)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789174290936, N'Doktor Glas', N'Svenska', 59, CAST(N'2010-01-04T00:00:00.0000000' AS DateTime2), 155, N'178 x 110 x 10 mm', 100, NULL, 4)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789177017646, N'Indicier', N'Svenska', 206, CAST(N'2018-06-18T00:00:00.0000000' AS DateTime2), 319, N'220 x 150 x 30 mm', 477, NULL, 6)
INSERT [dbo].[Böcker] ([ISBN13], [Titel], [Språk], [Pris_SEK], [Utgivningsdatum], [Antal_sidor], [Dimensioner], [Vikt_gram], [SAB], [FörlagId]) VALUES (9789177814412, N'Post mortem', N'Svenska', 55, CAST(N'2018-07-23T00:00:00.0000000' AS DateTime2), 318, N'178 x 110 x 20 mm', 183, NULL, 6)
GO
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9781789096491, 2)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9781789096491, 4)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789100180270, 7)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789100182472, 3)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789113072005, 10)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789129657517, 8)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789129688313, 1)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789129723632, 9)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789177017646, 5)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789177814412, 6)
INSERT [dbo].[Böcker_Orderrader] ([ISBN], [OrderradId]) VALUES (9789177814412, 11)
GO
SET IDENTITY_INSERT [dbo].[Butiker] ON 

INSERT [dbo].[Butiker] ([Id], [Butiksnamn], [KontaktId]) VALUES (1, N'Science Fiction-bokhandeln', 1)
INSERT [dbo].[Butiker] ([Id], [Butiksnamn], [KontaktId]) VALUES (2, N'Akademibokhandeln', 2)
INSERT [dbo].[Butiker] ([Id], [Butiksnamn], [KontaktId]) VALUES (3, N'Din Bok', 3)
INSERT [dbo].[Butiker] ([Id], [Butiksnamn], [KontaktId]) VALUES (4, N'Hedengrens bokhandel AB', 4)
INSERT [dbo].[Butiker] ([Id], [Butiksnamn], [KontaktId]) VALUES (5, N'Söderbokhandeln Hansson & Bruce', 5)
SET IDENTITY_INSERT [dbo].[Butiker] OFF
GO
SET IDENTITY_INSERT [dbo].[Författare] ON 

INSERT [dbo].[Författare] ([Id], [Förnamn], [Efternamn], [Födelsedatum], [Är_Avliden]) VALUES (1, N'Stephen', N'King', CAST(N'1947-09-21T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Författare] ([Id], [Förnamn], [Efternamn], [Födelsedatum], [Är_Avliden]) VALUES (2, N'Astrid', N'Lindgren', CAST(N'1907-11-14T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Författare] ([Id], [Förnamn], [Efternamn], [Födelsedatum], [Är_Avliden]) VALUES (3, N'Hjalmar', N'Söderberg', CAST(N'1869-07-02T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Författare] ([Id], [Förnamn], [Efternamn], [Födelsedatum], [Är_Avliden]) VALUES (4, N'Douglas', N'Stuart', CAST(N'1976-05-31T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Författare] ([Id], [Förnamn], [Efternamn], [Födelsedatum], [Är_Avliden]) VALUES (5, N'Karl Ove', N'Knausgård', CAST(N'1968-12-06T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Författare] ([Id], [Förnamn], [Efternamn], [Födelsedatum], [Är_Avliden]) VALUES (6, N'Patricia', N'Cornwell', CAST(N'1956-06-09T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Författare] OFF
GO
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (1, 9781789096491)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (1, 9789100180270)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (2, 9789129657517)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (2, 9789129688313)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (2, 9789129723632)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (3, 9789174290936)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (4, 9789100182472)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (5, 9789113072005)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (5, 9789113072029)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (6, 9789177017646)
INSERT [dbo].[Författare_Böcker] ([FörfattareId], [ISBN]) VALUES (6, 9789177814412)
GO
SET IDENTITY_INSERT [dbo].[Förlag] ON 

INSERT [dbo].[Förlag] ([Id], [Bokförlag], [KontaktId]) VALUES (1, N'Hard Case Crime', 6)
INSERT [dbo].[Förlag] ([Id], [Bokförlag], [KontaktId]) VALUES (2, N'Albert Bonniers Förlag', 7)
INSERT [dbo].[Förlag] ([Id], [Bokförlag], [KontaktId]) VALUES (3, N'Rabén & Sjögren', 8)
INSERT [dbo].[Förlag] ([Id], [Bokförlag], [KontaktId]) VALUES (4, N'Bonnier Pocket', 9)
INSERT [dbo].[Förlag] ([Id], [Bokförlag], [KontaktId]) VALUES (5, N'Norstedts', 10)
INSERT [dbo].[Förlag] ([Id], [Bokförlag], [KontaktId]) VALUES (6, N'Modernista', 11)
SET IDENTITY_INSERT [dbo].[Förlag] OFF
GO
SET IDENTITY_INSERT [dbo].[Kontaktuppgifter] ON 

INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (1, N'Kungsgatan', N'19', 41119, NULL, N'031-13 06 70', N'goteborg@sfbok.se', N'https://www.sfbok.se/kontakt/goteborg')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (2, N'Norra Hamngatan', N'26', 41106, NULL, N'010-744 19 00', N'goteborg.nordstan@akademibokhandeln.se', N'https://www.akademibokhandeln.se')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (3, N'Västra Hamngatan', N'21', 41117, NULL, N'031-13 63 50', N'info@din-bok.se', N'https://din-bok.se/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (4, N'Grev Turegatan', N'13', 11446, NULL, N'08-611 51 28', N'galleri@hedengrens.se', N'http://hedengrens.se/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (5, N'Götgatan', N'37', 11621, NULL, N'08-640 54 32', N'info@soderbokhandeln.se', N'https://www.soderbokhandeln.se/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (6, NULL, NULL, NULL, NULL, NULL, N'info@hardcasecrime.com', N'http://www.hardcasecrime.com/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (7, N'Sveavägen', N'56', 11134, NULL, N'08-696 86 20', N'info@albertbonniers.se', N'https://www.albertbonniersforlag.se/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (8, N'Tryckerigatan', N'4', 10312, NULL, N'08-769 88 00', N'order@norstedts.se', N'http://www.rabensjogren.se/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (9, N'Torsgatan', N'21', 11321, NULL, N'08-736 40 00', N'bv@bonnier.se', N'https://www.bonnier.com/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (10, N'Tryckerigatan', N'4', 10312, NULL, N'08-769 89 00', N'order@norstedts.se', N'http://www.norstedts.se/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (11, N'Kvarngatan', N'10', 11847, NULL, N'08-702 04 11', N'info@modernista.se', N'https://www.modernista.se/')
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (12, N'Repslagargatan', N'14', 11846, 1, N'08-942 80 41', N'alexander.dahl@telia.se', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (13, N'Odelbergsvägen', N'25', 12047, 1, N'08-373 79 44', N'beata.moller@hotmail.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (14, N'Bolmensvägen', N'47', 12050, 1, N'08-248 51 10', N'anne.akerman@hotmail.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (15, N'Rimbertsvägen', N'4', 12650, 1, N'0701-121 26 03', N'malin.ek@telia.se', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (16, N'Borensvägen', N'27', 12052, 1, N'0702-850 16 36', N'randi.eriksson@gmail.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (17, N'Förskeppsgatan', N'2', 12061, 1, N'070-63 35 79', N'anton.ragnvaldsson@gmail.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (18, N'Banérgatan', N'60', 11553, 1, N'08-153 62 05', N'sigrid.pettersson@gmail.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (19, N'Solrosgatan', N'3', 41651, 1, N'031-35 19 74', N'anders.hansson@hotmail.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (20, N'Sonettgatan', N'29', 42255, 1, N'073-874 08 81', N'kaj.ingesson@gmail.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (21, N'Norra pingstliljegatan', N'5', 42668, 1, N'073-1423995', N'elisabeth.vang@hotmail.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (22, N'Blåeldsgatan', N'7', 42668, 1, N'070-775 36 62', N'rakel.albertsson@yahoo.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (23, N'Halvtumsgatan', N'4', 42174, 1, N'0701-60 84 31', N'felix.berglund@telia.se', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (24, N'Galvaniseringsgatan', N'2', 41707, 1, N'070-28 23 74', N'felicia.bertilsson@yahoo.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (25, N'Harmonigatan', N'1', 42668, 1, N'073-338 31 88', N'petter.moller@yahoo.com', NULL)
INSERT [dbo].[Kontaktuppgifter] ([Id], [Gatuadress], [Gatunummer], [Postnummer], [Är_Leveransadress], [Telefon], [Epost], [Webbplats]) VALUES (26, N'Doppingegatan', N'27', 42243, 1, N'0702-583 66 48', N'kare.lundberg@yahoo.com', NULL)
SET IDENTITY_INSERT [dbo].[Kontaktuppgifter] OFF
GO
SET IDENTITY_INSERT [dbo].[Kunder] ON 

INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (1, N'Alexander', N'Dahl', 12, N'19741109-2058')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (2, N'Beata', N'Möller', 13, N'19750210-6008')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (3, N'Anne', N'Åkerman', 14, N'19751123-9724')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (4, N'Malin', N'Ek', 15, N'19770422-8188')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (5, N'Randi', N'Eriksson', 16, N'19800512-6752')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (6, N'Anton', N'Ragnvaldsson', 17, N'19801022-4516')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (7, N'Sigrid', N'Pettersson', 18, N'19811008-5301')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (8, N'Anders', N'Hansson', 19, N'19820624-3075')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (9, N'Elisabeth', N'Ingesson', 20, N'19841204-3830')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (10, N'Rakel', N'Vång', 21, N'19851126-2068')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (11, N'Felix', N'Albertsson', 22, N'19861110-5749')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (12, N'Felicia', N'Berglund', 23, N'19880706-3713')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (13, N'Petter', N'Bertilsson', 24, N'19890701-1480')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (14, N'Kåre', N'Möller', 25, N'19910806-1370')
INSERT [dbo].[Kunder] ([Id], [Förnamn], [Efternamn], [KontaktId], [Personnummer]) VALUES (15, N'Kaj', N'Lundberg', 26, N'19921005-4598')
SET IDENTITY_INSERT [dbo].[Kunder] OFF
GO
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9781789096491, 74)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789100180270, 14)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789100182472, 0)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789113072005, 24)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789113072029, 12)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789129657517, 24)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789129688313, 28)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789129723632, 3)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789174290936, 63)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789177017646, 26)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (1, 9789177814412, 39)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9781789096491, 63)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789100180270, 1)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789100182472, 6)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789113072005, 2)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789113072029, 43)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789129657517, 43)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789129688313, 0)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789129723632, 4)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789174290936, 56)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789177017646, 2)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (2, 9789177814412, 32)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9781789096491, 45)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789100180270, 2)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789100182472, 10)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789113072005, 34)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789113072029, 67)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789129657517, 5)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789129688313, 6)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789129723632, 7)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789174290936, 18)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789177017646, 45)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (3, 9789177814412, 12)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9781789096491, 13)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789100180270, 5)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789100182472, 21)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789113072005, 5)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789113072029, 2)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789129657517, 8)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789129688313, 67)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789129723632, 23)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789174290936, 45)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789177017646, 18)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (4, 9789177814412, 8)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9781789096491, 98)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789100180270, 2)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789100182472, 47)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789113072005, 21)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789113072029, 76)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789129657517, 5)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789129688313, 6)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789129723632, 47)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789174290936, 74)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789177017646, 18)
INSERT [dbo].[LagerSaldo] ([ButikId], [ISBN], [Antal]) VALUES (5, 9789177814412, 7)
GO
SET IDENTITY_INSERT [dbo].[Orderrader] ON 

INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (1, 123, 2, 1)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (2, 89, 1, 2)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (3, 189, 1, 3)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (4, 89, 1, 3)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (5, 206, 1, 4)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (6, 55, 2, 5)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (7, 210, 1, 6)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (8, 168, 1, 7)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (9, 161, 1, 8)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (10, 179, 1, 9)
INSERT [dbo].[Orderrader] ([Id], [Enhetspris], [Mängd], [OrderId]) VALUES (11, 219, 1, 10)
SET IDENTITY_INSERT [dbo].[Orderrader] OFF
GO
SET IDENTITY_INSERT [dbo].[Ordrar] ON 

INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (1, CAST(N'2017-05-04T00:00:00.0000000' AS DateTime2), CAST(N'2017-05-07T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 2, 1)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (2, CAST(N'2017-12-18T00:00:00.0000000' AS DateTime2), CAST(N'2017-12-21T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 5, 1)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (3, CAST(N'2018-07-02T00:00:00.0000000' AS DateTime2), CAST(N'2018-07-04T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (4, CAST(N'2019-01-22T00:00:00.0000000' AS DateTime2), CAST(N'2019-01-24T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 6, 1)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (5, CAST(N'2019-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2019-02-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (6, CAST(N'2019-06-11T00:00:00.0000000' AS DateTime2), CAST(N'2019-06-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 8, 1)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (7, CAST(N'2020-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-09T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (8, CAST(N'2020-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-14T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (9, CAST(N'2020-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-18T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 10, 1)
INSERT [dbo].[Ordrar] ([Id], [Orderdatum], [Leveransdatum], [Levaransadress], [Levaransgatunummer], [Levaranspostnummer], [KundId], [Frakt]) VALUES (10, CAST(N'2020-12-16T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-19T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 13, 0)
SET IDENTITY_INSERT [dbo].[Ordrar] OFF
GO
ALTER TABLE [dbo].[Böcker]  WITH CHECK ADD  CONSTRAINT [FK_Böcker_Förlag] FOREIGN KEY([FörlagId])
REFERENCES [dbo].[Förlag] ([Id])
GO
ALTER TABLE [dbo].[Böcker] CHECK CONSTRAINT [FK_Böcker_Förlag]
GO
ALTER TABLE [dbo].[Böcker_Orderrader]  WITH CHECK ADD  CONSTRAINT [FK_Böcker_Orderrader_Böcker] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Böcker] ([ISBN13])
GO
ALTER TABLE [dbo].[Böcker_Orderrader] CHECK CONSTRAINT [FK_Böcker_Orderrader_Böcker]
GO
ALTER TABLE [dbo].[Böcker_Orderrader]  WITH CHECK ADD  CONSTRAINT [FK_Böcker_Orderrader_Orderrader] FOREIGN KEY([OrderradId])
REFERENCES [dbo].[Orderrader] ([Id])
GO
ALTER TABLE [dbo].[Böcker_Orderrader] CHECK CONSTRAINT [FK_Böcker_Orderrader_Orderrader]
GO
ALTER TABLE [dbo].[Butiker]  WITH CHECK ADD  CONSTRAINT [FK_Butiker_Kontaktuppgifter] FOREIGN KEY([KontaktId])
REFERENCES [dbo].[Kontaktuppgifter] ([Id])
GO
ALTER TABLE [dbo].[Butiker] CHECK CONSTRAINT [FK_Butiker_Kontaktuppgifter]
GO
ALTER TABLE [dbo].[Författare_Böcker]  WITH CHECK ADD  CONSTRAINT [FK_Författare_Böcker_Böcker] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Böcker] ([ISBN13])
GO
ALTER TABLE [dbo].[Författare_Böcker] CHECK CONSTRAINT [FK_Författare_Böcker_Böcker]
GO
ALTER TABLE [dbo].[Författare_Böcker]  WITH CHECK ADD  CONSTRAINT [FK_Författare_Böcker_Författare] FOREIGN KEY([FörfattareId])
REFERENCES [dbo].[Författare] ([Id])
GO
ALTER TABLE [dbo].[Författare_Böcker] CHECK CONSTRAINT [FK_Författare_Böcker_Författare]
GO
ALTER TABLE [dbo].[Förlag]  WITH CHECK ADD  CONSTRAINT [FK_Förlag_Kontaktuppgifter] FOREIGN KEY([KontaktId])
REFERENCES [dbo].[Kontaktuppgifter] ([Id])
GO
ALTER TABLE [dbo].[Förlag] CHECK CONSTRAINT [FK_Förlag_Kontaktuppgifter]
GO
ALTER TABLE [dbo].[Kunder]  WITH CHECK ADD  CONSTRAINT [FK_Kunder_Kontaktuppgifter] FOREIGN KEY([KontaktId])
REFERENCES [dbo].[Kontaktuppgifter] ([Id])
GO
ALTER TABLE [dbo].[Kunder] CHECK CONSTRAINT [FK_Kunder_Kontaktuppgifter]
GO
ALTER TABLE [dbo].[LagerSaldo]  WITH CHECK ADD  CONSTRAINT [FK_LagerSaldo_Böcker1] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Böcker] ([ISBN13])
GO
ALTER TABLE [dbo].[LagerSaldo] CHECK CONSTRAINT [FK_LagerSaldo_Böcker1]
GO
ALTER TABLE [dbo].[LagerSaldo]  WITH CHECK ADD  CONSTRAINT [FK_LagerSaldo_Butiker1] FOREIGN KEY([ButikId])
REFERENCES [dbo].[Butiker] ([Id])
GO
ALTER TABLE [dbo].[LagerSaldo] CHECK CONSTRAINT [FK_LagerSaldo_Butiker1]
GO
ALTER TABLE [dbo].[Orderrader]  WITH CHECK ADD  CONSTRAINT [FK_Orderrader_Ordrar] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Ordrar] ([Id])
GO
ALTER TABLE [dbo].[Orderrader] CHECK CONSTRAINT [FK_Orderrader_Ordrar]
GO
ALTER TABLE [dbo].[Ordrar]  WITH CHECK ADD  CONSTRAINT [FK_Ordrar_Kunder] FOREIGN KEY([KundId])
REFERENCES [dbo].[Kunder] ([Id])
GO
ALTER TABLE [dbo].[Ordrar] CHECK CONSTRAINT [FK_Ordrar_Kunder]
GO
ALTER TABLE [dbo].[Böcker]  WITH CHECK ADD  CONSTRAINT [CK_ISBN13] CHECK  (([ISBN13]>=(9780000000000.) AND [ISBN13]<=(9799999999999.)))
GO
ALTER TABLE [dbo].[Böcker] CHECK CONSTRAINT [CK_ISBN13]
GO
ALTER TABLE [dbo].[Böcker_Orderrader]  WITH CHECK ADD  CONSTRAINT [CK_Böcker_Orderrader_ISBN] CHECK  (([ISBN]>=(9780000000000.) AND [ISBN]<=(9799999999999.)))
GO
ALTER TABLE [dbo].[Böcker_Orderrader] CHECK CONSTRAINT [CK_Böcker_Orderrader_ISBN]
GO
ALTER TABLE [dbo].[LagerSaldo]  WITH CHECK ADD  CONSTRAINT [CK_Antal] CHECK  (([Antal]>=(0)))
GO
ALTER TABLE [dbo].[LagerSaldo] CHECK CONSTRAINT [CK_Antal]
GO
ALTER TABLE [dbo].[LagerSaldo]  WITH CHECK ADD  CONSTRAINT [CK_ISBN] CHECK  (([ISBN]>=(9780000000000.) AND [ISBN]<=(9799999999999.)))
GO
ALTER TABLE [dbo].[LagerSaldo] CHECK CONSTRAINT [CK_ISBN]
GO
/****** Object:  StoredProcedure [dbo].[usp_FlyttaBok]    Script Date: 2021-04-26 18:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_FlyttaBok] @flyttaFrån int, @flyttaTill int, @ISBN bigint, @Antal int = 1
AS
	BEGIN TRANSACTION
		
		BEGIN TRY

			IF (SELECT Antal FROM LagerSaldo WHERE ISBN = @ISBN AND ButikId = @flyttaFrån) - @Antal < 0

				BEGIN
					PRINT 'Det går inte att flytta mer böcker än vad som finns i lager'
					ROLLBACK TRANSACTION
				END

			ELSE IF @Antal < 1 OR @Antal > 255

				BEGIN
					PRINT '@Antal parametern måste vara större än 0 och mindre än 256'
					ROLLBACK TRANSACTION
				END

			ELSE IF (SELECT Antal FROM LagerSaldo WHERE ButikId = @flyttaFrån AND ISBN = @ISBN) IS NULL OR
					(SELECT Antal FROM LagerSaldo WHERE ButikId = @flyttaTill AND ISBN = @ISBN) IS NULL

				BEGIN
					PRINT 'Antalet i tabellen får inte vara NULL'
					ROLLBACK TRANSACTION
				END

			ELSE IF @flyttaFrån = @flyttaTill

				BEGIN
					PRINT 'Flytta till och från parametern får inte vara detsamma'
					ROLLBACK TRANSACTION
				END

			ELSE IF @flyttaTill > CONVERT(int, (SELECT MAX(Id) FROM Butiker)) OR 
					@flyttaTill < CONVERT(int, (SELECT MIN(Id) FROM Butiker))

				BEGIN
					PRINT '@flyttaTill värdet ligger utanför tabellens gränser'
					ROLLBACK TRANSACTION
				END

			ELSE IF @flyttaFrån > CONVERT(int, (SELECT MAX(Id) FROM Butiker)) OR 
					@flyttaFrån < CONVERT(int, (SELECT MIN(Id) FROM Butiker))

				BEGIN
					PRINT '@flyttaFrån värdet ligger utanför tabellens gränser'
					ROLLBACK TRANSACTION
				END

			ELSE IF NOT EXISTS (SELECT ISBN13 FROM Böcker WHERE ISBN13 = @ISBN)

				BEGIN
					PRINT 'Boken med ISBN13 numret "' + 
					CONVERT(varchar(50), @ISBN) + 
					'" finns inte i vårt sortimentet'
					ROLLBACK TRANSACTION
				END

			ELSE

				BEGIN
					UPDATE LagerSaldo
					SET Antal = Antal - @Antal
					WHERE ButikId = @flyttaFrån AND ISBN = @ISBN
						IF @@ROWCOUNT <> 1
							BEGIN
								PRINT 'Något gick fel. Mer än en rad uppdaterades. Transaktionen misslyckades'
								ROLLBACK TRANSACTION
							END
					
					UPDATE LagerSaldo
					SET Antal = Antal + @Antal
					WHERE ButikId = @flyttaTill AND ISBN = @ISBN
						IF @@ROWCOUNT <> 1
							BEGIN
								PRINT 'Något gick fel. Mer än en rad uppdaterades. Transaktionen misslyckades'
								ROLLBACK TRANSACTION
							END
					PRINT 'Boken eller böckerna har flyttats över'
					COMMIT TRANSACTION
				END

		END TRY
		
		BEGIN CATCH

			PRINT 'Något gick fel. Transaktionen misslyckades'
		    ROLLBACK TRANSACTION
		
		END CATCH
GO
USE [master]
GO
ALTER DATABASE [Labb2KamilNiescieronek] SET  READ_WRITE 
GO
