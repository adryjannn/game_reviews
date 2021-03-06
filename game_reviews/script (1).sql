USE [master]
GO
/****** Object:  Database [GameReviews]    Script Date: 05.07.2022 17:04:50 ******/
CREATE DATABASE [GameReviews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GameReviews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GameReviews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GameReviews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GameReviews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GameReviews] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameReviews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameReviews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameReviews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameReviews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameReviews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameReviews] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameReviews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GameReviews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameReviews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameReviews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameReviews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameReviews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameReviews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameReviews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameReviews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameReviews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GameReviews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameReviews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameReviews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameReviews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameReviews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameReviews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameReviews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameReviews] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GameReviews] SET  MULTI_USER 
GO
ALTER DATABASE [GameReviews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameReviews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameReviews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameReviews] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameReviews] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GameReviews] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GameReviews] SET QUERY_STORE = OFF
GO
USE [GameReviews]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 05.07.2022 17:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Categories] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 05.07.2022 17:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ID_producer] [int] NOT NULL,
	[ID_category] [int] NOT NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 05.07.2022 17:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 05.07.2022 17:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Game] [int] NOT NULL,
	[ID_User] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](70) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05.07.2022 17:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (1, N'Sandbox')
INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (2, N'Platform')
INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (3, N'Shooters')
INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (4, N'MOBA')
INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (5, N'Action-adventure')
INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (6, N'Survival and horror')
INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (7, N'RPG')
INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (8, N'Sport')
INSERT [dbo].[Categories] ([ID], [Categories]) VALUES (9, N'Racing')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (1, N'Cyberpunk 2077', 1, 7)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (3, N'Wiedźmin 3 Dziki Gon', 1, 5)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (4, N'Wiedźmin 2 Zabójcy królów', 1, 5)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (5, N'Fallout 4', 4, 7)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (6, N'The Elder Scrolls V: Skyrim', 4, 7)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (7, N'Doom', 4, 3)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (8, N'Diablo 2', 5, 7)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (10, N'Diablo 3', 5, 7)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (12, N'The Sims 4', 8, 1)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (13, N'Fifa 2022', 8, 8)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (14, N'Need for Speed: Underground 2', 8, 9)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (15, N'Need for Speed: Most Wanted', 8, 9)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (16, N'Assassin''s Creed: Valhalla', 2, 7)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (17, N'Far Cry 6', 2, 1)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (18, N'Dirt Rally 2.0', 10, 9)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (19, N'Dying Light', 10, 5)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (20, N'Half-Life 2', 7, 5)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (21, N'Counter-Strike: Global Offensive', 7, 5)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (22, N'Grand Theft Auto V', 3, 1)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (23, N'Red Dead Redemption 2', 3, 5)
INSERT [dbo].[Games] ([ID], [Title], [ID_producer], [ID_category]) VALUES (24, N'League of Legends', 9, 4)
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([ID], [Name]) VALUES (1, N'CD Projekt RED')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (2, N'Ubisoft')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (3, N'Rockstar Games')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (4, N'Bethesda Softworks')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (5, N'Blizzard Entertainment')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (6, N'Sony Interactive Entertainment')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (7, N'Valve Software')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (8, N'EA')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (9, N'Riot Games')
INSERT [dbo].[Producers] ([ID], [Name]) VALUES (10, N'Techland')
SET IDENTITY_INSERT [dbo].[Producers] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (1, 1, 2, 4, N'Magiczna gra, nie sugerować się negatymi opiniami, tylko grać')
INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (2, 3, 2, 5, N'Nic dodać nic ująć')
INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (3, 8, 3, 5, N'Będe do niej wracać')
INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (4, 10, 3, 5, N'Super')
INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (5, 12, 2, 3, N'Nie mój gust')
INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (6, 8, 2, 5, N'Wciągająca')
INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (7, 20, 3, 5, N'Duży sentyment do tej gry')
INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (8, 7, 2, 4, NULL)
INSERT [dbo].[Reviews] ([ID], [ID_Game], [ID_User], [Rating], [Comment]) VALUES (9, 7, 3, 5, NULL)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [login], [password]) VALUES (1, N'admin', N'admin123')
INSERT [dbo].[Users] ([ID], [login], [password]) VALUES (2, N'user1', N'user1')
INSERT [dbo].[Users] ([ID], [login], [password]) VALUES (3, N'malpa', N'@@@')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Games] FOREIGN KEY([ID_Game])
REFERENCES [dbo].[Games] ([ID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Games]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
USE [master]
GO
ALTER DATABASE [GameReviews] SET  READ_WRITE 
GO
