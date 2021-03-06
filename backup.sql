USE [master]
GO
/****** Object:  Database [course_work]    Script Date: 10.06.2020 19:31:20 ******/
CREATE DATABASE [course_work]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'course_work', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\course_work.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'course_work_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\course_work_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [course_work] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [course_work].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [course_work] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [course_work] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [course_work] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [course_work] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [course_work] SET ARITHABORT OFF 
GO
ALTER DATABASE [course_work] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [course_work] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [course_work] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [course_work] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [course_work] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [course_work] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [course_work] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [course_work] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [course_work] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [course_work] SET  DISABLE_BROKER 
GO
ALTER DATABASE [course_work] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [course_work] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [course_work] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [course_work] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [course_work] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [course_work] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [course_work] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [course_work] SET RECOVERY FULL 
GO
ALTER DATABASE [course_work] SET  MULTI_USER 
GO
ALTER DATABASE [course_work] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [course_work] SET DB_CHAINING OFF 
GO
ALTER DATABASE [course_work] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [course_work] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [course_work] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'course_work', N'ON'
GO
ALTER DATABASE [course_work] SET QUERY_STORE = OFF
GO
USE [course_work]
GO
/****** Object:  Table [dbo].[sat_estate]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sat_estate](
	[id] [tinyint] NOT NULL,
	[availability] [bit] NOT NULL,
	[price] [decimal](18, 10) NOT NULL,
	[parking_capacity] [smallint] NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[pets_allowed] [bit] NOT NULL,
	[floor_space] [float] NOT NULL,
	[number_of_bedrooms] [tinyint] NOT NULL,
	[number_of_bathrooms] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hub_estate]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hub_estate](
	[id] [tinyint] NOT NULL,
 CONSTRAINT [PK_hub_estate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sat_place]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sat_place](
	[id] [tinyint] NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[house] [tinyint] NOT NULL,
	[appartment] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hub_place]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hub_place](
	[id] [tinyint] NOT NULL,
 CONSTRAINT [PK_hub_place] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[link_estate_place]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[link_estate_place](
	[id_estate] [tinyint] NOT NULL,
	[id_place] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hub_contracts]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hub_contracts](
	[id] [int] NOT NULL,
 CONSTRAINT [PK_hub_contracts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sat_contracts]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sat_contracts](
	[id] [int] NOT NULL,
	[date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[link_estate_contract]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[link_estate_contract](
	[estate_id] [tinyint] NOT NULL,
	[contract_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ContractInfo]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ContractInfo]
AS
SELECT dbo.sat_contracts.date AS DateOfContract, dbo.sat_place.street AS Street, dbo.sat_place.house AS House, dbo.sat_place.appartment AS AppartmentNumber, dbo.sat_estate.price AS Price
FROM   dbo.hub_estate INNER JOIN
           dbo.link_estate_contract ON dbo.hub_estate.id = dbo.link_estate_contract.estate_id INNER JOIN
           dbo.sat_estate ON dbo.hub_estate.id = dbo.sat_estate.id INNER JOIN
           dbo.hub_contracts ON dbo.link_estate_contract.contract_id = dbo.hub_contracts.id INNER JOIN
           dbo.sat_contracts ON dbo.hub_contracts.id = dbo.sat_contracts.id INNER JOIN
           dbo.link_estate_place ON dbo.hub_estate.id = dbo.link_estate_place.id_estate INNER JOIN
           dbo.hub_place ON dbo.link_estate_place.id_place = dbo.hub_place.id INNER JOIN
           dbo.sat_place ON dbo.hub_place.id = dbo.sat_place.id
GO
/****** Object:  Table [dbo].[hub_city]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hub_city](
	[id] [tinyint] NOT NULL,
 CONSTRAINT [PK_hub_city] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hub_country]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hub_country](
	[country_code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_hub_country] PRIMARY KEY CLUSTERED 
(
	[country_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hub_user]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hub_user](
	[id] [int] NOT NULL,
 CONSTRAINT [PK_hub_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hub_view_history]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hub_view_history](
	[id] [bigint] NOT NULL,
 CONSTRAINT [PK_hub_view_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[link_country_city]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[link_country_city](
	[country_code] [nvarchar](50) NOT NULL,
	[id_city] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[link_estate_history]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[link_estate_history](
	[id_estate] [tinyint] NOT NULL,
	[id_history] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[link_place_city]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[link_place_city](
	[id_place] [tinyint] NOT NULL,
	[id_city] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[link_user_history]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[link_user_history](
	[id_user] [int] NOT NULL,
	[id_view_history] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sat_city]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sat_city](
	[id] [tinyint] NOT NULL,
	[time_zone] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sat_country]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sat_country](
	[country_code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[population] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sat_user]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sat_user](
	[id] [int] NOT NULL,
	[username] [nchar](50) NOT NULL,
	[password] [nchar](50) NOT NULL,
	[DOR] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sat_view_history]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sat_view_history](
	[id] [bigint] NOT NULL,
	[date] [date] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[hub_city] ([id]) VALUES (0)
INSERT [dbo].[hub_city] ([id]) VALUES (1)
INSERT [dbo].[hub_city] ([id]) VALUES (2)
INSERT [dbo].[hub_city] ([id]) VALUES (3)
INSERT [dbo].[hub_city] ([id]) VALUES (4)
INSERT [dbo].[hub_contracts] ([id]) VALUES (0)
INSERT [dbo].[hub_contracts] ([id]) VALUES (1)
INSERT [dbo].[hub_country] ([country_code]) VALUES (N'+1')
INSERT [dbo].[hub_country] ([country_code]) VALUES (N'+34')
INSERT [dbo].[hub_country] ([country_code]) VALUES (N'+354')
INSERT [dbo].[hub_country] ([country_code]) VALUES (N'+44')
INSERT [dbo].[hub_country] ([country_code]) VALUES (N'+7')
INSERT [dbo].[hub_estate] ([id]) VALUES (0)
INSERT [dbo].[hub_estate] ([id]) VALUES (1)
INSERT [dbo].[hub_estate] ([id]) VALUES (2)
INSERT [dbo].[hub_estate] ([id]) VALUES (3)
INSERT [dbo].[hub_estate] ([id]) VALUES (4)
INSERT [dbo].[hub_estate] ([id]) VALUES (5)
INSERT [dbo].[hub_estate] ([id]) VALUES (6)
INSERT [dbo].[hub_estate] ([id]) VALUES (7)
INSERT [dbo].[hub_estate] ([id]) VALUES (8)
INSERT [dbo].[hub_estate] ([id]) VALUES (9)
INSERT [dbo].[hub_estate] ([id]) VALUES (10)
INSERT [dbo].[hub_estate] ([id]) VALUES (11)
INSERT [dbo].[hub_estate] ([id]) VALUES (12)
INSERT [dbo].[hub_estate] ([id]) VALUES (13)
INSERT [dbo].[hub_estate] ([id]) VALUES (14)
INSERT [dbo].[hub_estate] ([id]) VALUES (15)
INSERT [dbo].[hub_estate] ([id]) VALUES (16)
INSERT [dbo].[hub_estate] ([id]) VALUES (17)
INSERT [dbo].[hub_estate] ([id]) VALUES (18)
INSERT [dbo].[hub_estate] ([id]) VALUES (19)
INSERT [dbo].[hub_estate] ([id]) VALUES (20)
INSERT [dbo].[hub_estate] ([id]) VALUES (21)
INSERT [dbo].[hub_estate] ([id]) VALUES (22)
INSERT [dbo].[hub_estate] ([id]) VALUES (23)
INSERT [dbo].[hub_estate] ([id]) VALUES (24)
INSERT [dbo].[hub_estate] ([id]) VALUES (25)
INSERT [dbo].[hub_estate] ([id]) VALUES (26)
INSERT [dbo].[hub_estate] ([id]) VALUES (27)
INSERT [dbo].[hub_estate] ([id]) VALUES (28)
INSERT [dbo].[hub_estate] ([id]) VALUES (29)
INSERT [dbo].[hub_estate] ([id]) VALUES (30)
INSERT [dbo].[hub_estate] ([id]) VALUES (31)
INSERT [dbo].[hub_estate] ([id]) VALUES (32)
INSERT [dbo].[hub_estate] ([id]) VALUES (33)
INSERT [dbo].[hub_estate] ([id]) VALUES (34)
INSERT [dbo].[hub_estate] ([id]) VALUES (35)
INSERT [dbo].[hub_estate] ([id]) VALUES (36)
INSERT [dbo].[hub_estate] ([id]) VALUES (37)
INSERT [dbo].[hub_estate] ([id]) VALUES (38)
INSERT [dbo].[hub_estate] ([id]) VALUES (39)
INSERT [dbo].[hub_estate] ([id]) VALUES (40)
INSERT [dbo].[hub_estate] ([id]) VALUES (41)
INSERT [dbo].[hub_estate] ([id]) VALUES (42)
INSERT [dbo].[hub_estate] ([id]) VALUES (43)
INSERT [dbo].[hub_estate] ([id]) VALUES (44)
INSERT [dbo].[hub_estate] ([id]) VALUES (45)
INSERT [dbo].[hub_estate] ([id]) VALUES (46)
INSERT [dbo].[hub_estate] ([id]) VALUES (47)
INSERT [dbo].[hub_estate] ([id]) VALUES (48)
INSERT [dbo].[hub_estate] ([id]) VALUES (49)
INSERT [dbo].[hub_estate] ([id]) VALUES (50)
INSERT [dbo].[hub_estate] ([id]) VALUES (51)
INSERT [dbo].[hub_estate] ([id]) VALUES (52)
INSERT [dbo].[hub_estate] ([id]) VALUES (53)
INSERT [dbo].[hub_estate] ([id]) VALUES (54)
INSERT [dbo].[hub_estate] ([id]) VALUES (55)
INSERT [dbo].[hub_estate] ([id]) VALUES (56)
INSERT [dbo].[hub_estate] ([id]) VALUES (57)
INSERT [dbo].[hub_estate] ([id]) VALUES (58)
INSERT [dbo].[hub_estate] ([id]) VALUES (59)
INSERT [dbo].[hub_estate] ([id]) VALUES (60)
INSERT [dbo].[hub_estate] ([id]) VALUES (61)
INSERT [dbo].[hub_estate] ([id]) VALUES (62)
INSERT [dbo].[hub_estate] ([id]) VALUES (63)
INSERT [dbo].[hub_estate] ([id]) VALUES (64)
INSERT [dbo].[hub_estate] ([id]) VALUES (65)
INSERT [dbo].[hub_estate] ([id]) VALUES (66)
INSERT [dbo].[hub_estate] ([id]) VALUES (67)
INSERT [dbo].[hub_estate] ([id]) VALUES (68)
INSERT [dbo].[hub_estate] ([id]) VALUES (69)
INSERT [dbo].[hub_estate] ([id]) VALUES (70)
INSERT [dbo].[hub_estate] ([id]) VALUES (71)
INSERT [dbo].[hub_estate] ([id]) VALUES (72)
INSERT [dbo].[hub_estate] ([id]) VALUES (73)
INSERT [dbo].[hub_estate] ([id]) VALUES (74)
INSERT [dbo].[hub_estate] ([id]) VALUES (75)
INSERT [dbo].[hub_estate] ([id]) VALUES (76)
INSERT [dbo].[hub_estate] ([id]) VALUES (77)
INSERT [dbo].[hub_estate] ([id]) VALUES (78)
INSERT [dbo].[hub_estate] ([id]) VALUES (79)
INSERT [dbo].[hub_estate] ([id]) VALUES (80)
INSERT [dbo].[hub_estate] ([id]) VALUES (81)
INSERT [dbo].[hub_estate] ([id]) VALUES (82)
INSERT [dbo].[hub_estate] ([id]) VALUES (83)
INSERT [dbo].[hub_estate] ([id]) VALUES (84)
INSERT [dbo].[hub_estate] ([id]) VALUES (85)
INSERT [dbo].[hub_estate] ([id]) VALUES (86)
INSERT [dbo].[hub_estate] ([id]) VALUES (87)
INSERT [dbo].[hub_estate] ([id]) VALUES (88)
INSERT [dbo].[hub_estate] ([id]) VALUES (89)
INSERT [dbo].[hub_estate] ([id]) VALUES (90)
INSERT [dbo].[hub_estate] ([id]) VALUES (91)
INSERT [dbo].[hub_estate] ([id]) VALUES (92)
INSERT [dbo].[hub_estate] ([id]) VALUES (93)
INSERT [dbo].[hub_estate] ([id]) VALUES (94)
INSERT [dbo].[hub_estate] ([id]) VALUES (95)
INSERT [dbo].[hub_estate] ([id]) VALUES (96)
INSERT [dbo].[hub_estate] ([id]) VALUES (97)
INSERT [dbo].[hub_estate] ([id]) VALUES (98)
INSERT [dbo].[hub_estate] ([id]) VALUES (99)
GO
INSERT [dbo].[hub_estate] ([id]) VALUES (100)
INSERT [dbo].[hub_estate] ([id]) VALUES (101)
INSERT [dbo].[hub_estate] ([id]) VALUES (102)
INSERT [dbo].[hub_estate] ([id]) VALUES (103)
INSERT [dbo].[hub_estate] ([id]) VALUES (104)
INSERT [dbo].[hub_estate] ([id]) VALUES (105)
INSERT [dbo].[hub_estate] ([id]) VALUES (106)
INSERT [dbo].[hub_estate] ([id]) VALUES (107)
INSERT [dbo].[hub_estate] ([id]) VALUES (108)
INSERT [dbo].[hub_estate] ([id]) VALUES (109)
INSERT [dbo].[hub_estate] ([id]) VALUES (110)
INSERT [dbo].[hub_estate] ([id]) VALUES (111)
INSERT [dbo].[hub_estate] ([id]) VALUES (112)
INSERT [dbo].[hub_estate] ([id]) VALUES (113)
INSERT [dbo].[hub_estate] ([id]) VALUES (114)
INSERT [dbo].[hub_estate] ([id]) VALUES (115)
INSERT [dbo].[hub_estate] ([id]) VALUES (116)
INSERT [dbo].[hub_estate] ([id]) VALUES (117)
INSERT [dbo].[hub_estate] ([id]) VALUES (118)
INSERT [dbo].[hub_estate] ([id]) VALUES (119)
INSERT [dbo].[hub_estate] ([id]) VALUES (120)
INSERT [dbo].[hub_estate] ([id]) VALUES (121)
INSERT [dbo].[hub_estate] ([id]) VALUES (122)
INSERT [dbo].[hub_estate] ([id]) VALUES (123)
INSERT [dbo].[hub_estate] ([id]) VALUES (124)
INSERT [dbo].[hub_estate] ([id]) VALUES (125)
INSERT [dbo].[hub_estate] ([id]) VALUES (126)
INSERT [dbo].[hub_estate] ([id]) VALUES (127)
INSERT [dbo].[hub_estate] ([id]) VALUES (128)
INSERT [dbo].[hub_estate] ([id]) VALUES (129)
INSERT [dbo].[hub_estate] ([id]) VALUES (130)
INSERT [dbo].[hub_estate] ([id]) VALUES (131)
INSERT [dbo].[hub_estate] ([id]) VALUES (132)
INSERT [dbo].[hub_estate] ([id]) VALUES (133)
INSERT [dbo].[hub_estate] ([id]) VALUES (134)
INSERT [dbo].[hub_estate] ([id]) VALUES (135)
INSERT [dbo].[hub_estate] ([id]) VALUES (136)
INSERT [dbo].[hub_estate] ([id]) VALUES (137)
INSERT [dbo].[hub_estate] ([id]) VALUES (138)
INSERT [dbo].[hub_estate] ([id]) VALUES (139)
INSERT [dbo].[hub_estate] ([id]) VALUES (140)
INSERT [dbo].[hub_estate] ([id]) VALUES (141)
INSERT [dbo].[hub_estate] ([id]) VALUES (142)
INSERT [dbo].[hub_estate] ([id]) VALUES (143)
INSERT [dbo].[hub_estate] ([id]) VALUES (144)
INSERT [dbo].[hub_estate] ([id]) VALUES (145)
INSERT [dbo].[hub_estate] ([id]) VALUES (146)
INSERT [dbo].[hub_estate] ([id]) VALUES (147)
INSERT [dbo].[hub_estate] ([id]) VALUES (148)
INSERT [dbo].[hub_estate] ([id]) VALUES (149)
INSERT [dbo].[hub_estate] ([id]) VALUES (150)
INSERT [dbo].[hub_estate] ([id]) VALUES (151)
INSERT [dbo].[hub_estate] ([id]) VALUES (152)
INSERT [dbo].[hub_estate] ([id]) VALUES (153)
INSERT [dbo].[hub_estate] ([id]) VALUES (154)
INSERT [dbo].[hub_estate] ([id]) VALUES (155)
INSERT [dbo].[hub_estate] ([id]) VALUES (156)
INSERT [dbo].[hub_estate] ([id]) VALUES (157)
INSERT [dbo].[hub_estate] ([id]) VALUES (158)
INSERT [dbo].[hub_estate] ([id]) VALUES (159)
INSERT [dbo].[hub_estate] ([id]) VALUES (160)
INSERT [dbo].[hub_estate] ([id]) VALUES (161)
INSERT [dbo].[hub_estate] ([id]) VALUES (162)
INSERT [dbo].[hub_estate] ([id]) VALUES (163)
INSERT [dbo].[hub_estate] ([id]) VALUES (164)
INSERT [dbo].[hub_estate] ([id]) VALUES (165)
INSERT [dbo].[hub_estate] ([id]) VALUES (166)
INSERT [dbo].[hub_estate] ([id]) VALUES (167)
INSERT [dbo].[hub_estate] ([id]) VALUES (168)
INSERT [dbo].[hub_estate] ([id]) VALUES (169)
INSERT [dbo].[hub_estate] ([id]) VALUES (170)
INSERT [dbo].[hub_estate] ([id]) VALUES (171)
INSERT [dbo].[hub_estate] ([id]) VALUES (172)
INSERT [dbo].[hub_estate] ([id]) VALUES (173)
INSERT [dbo].[hub_estate] ([id]) VALUES (174)
INSERT [dbo].[hub_estate] ([id]) VALUES (175)
INSERT [dbo].[hub_estate] ([id]) VALUES (176)
INSERT [dbo].[hub_estate] ([id]) VALUES (177)
INSERT [dbo].[hub_estate] ([id]) VALUES (178)
INSERT [dbo].[hub_estate] ([id]) VALUES (179)
INSERT [dbo].[hub_estate] ([id]) VALUES (180)
INSERT [dbo].[hub_estate] ([id]) VALUES (181)
INSERT [dbo].[hub_estate] ([id]) VALUES (182)
INSERT [dbo].[hub_estate] ([id]) VALUES (183)
INSERT [dbo].[hub_estate] ([id]) VALUES (184)
INSERT [dbo].[hub_estate] ([id]) VALUES (185)
INSERT [dbo].[hub_estate] ([id]) VALUES (186)
INSERT [dbo].[hub_estate] ([id]) VALUES (187)
INSERT [dbo].[hub_estate] ([id]) VALUES (188)
INSERT [dbo].[hub_estate] ([id]) VALUES (189)
INSERT [dbo].[hub_estate] ([id]) VALUES (190)
INSERT [dbo].[hub_estate] ([id]) VALUES (191)
INSERT [dbo].[hub_estate] ([id]) VALUES (192)
INSERT [dbo].[hub_estate] ([id]) VALUES (193)
INSERT [dbo].[hub_estate] ([id]) VALUES (194)
INSERT [dbo].[hub_estate] ([id]) VALUES (195)
INSERT [dbo].[hub_estate] ([id]) VALUES (196)
INSERT [dbo].[hub_estate] ([id]) VALUES (197)
INSERT [dbo].[hub_estate] ([id]) VALUES (198)
INSERT [dbo].[hub_estate] ([id]) VALUES (199)
GO
INSERT [dbo].[hub_place] ([id]) VALUES (0)
INSERT [dbo].[hub_place] ([id]) VALUES (1)
INSERT [dbo].[hub_place] ([id]) VALUES (2)
INSERT [dbo].[hub_place] ([id]) VALUES (3)
INSERT [dbo].[hub_place] ([id]) VALUES (4)
INSERT [dbo].[hub_place] ([id]) VALUES (5)
INSERT [dbo].[hub_place] ([id]) VALUES (6)
INSERT [dbo].[hub_place] ([id]) VALUES (7)
INSERT [dbo].[hub_place] ([id]) VALUES (8)
INSERT [dbo].[hub_place] ([id]) VALUES (9)
INSERT [dbo].[hub_place] ([id]) VALUES (10)
INSERT [dbo].[hub_place] ([id]) VALUES (11)
INSERT [dbo].[hub_place] ([id]) VALUES (12)
INSERT [dbo].[hub_place] ([id]) VALUES (13)
INSERT [dbo].[hub_place] ([id]) VALUES (14)
INSERT [dbo].[hub_place] ([id]) VALUES (15)
INSERT [dbo].[hub_place] ([id]) VALUES (16)
INSERT [dbo].[hub_place] ([id]) VALUES (17)
INSERT [dbo].[hub_place] ([id]) VALUES (18)
INSERT [dbo].[hub_place] ([id]) VALUES (19)
INSERT [dbo].[hub_place] ([id]) VALUES (20)
INSERT [dbo].[hub_place] ([id]) VALUES (21)
INSERT [dbo].[hub_place] ([id]) VALUES (22)
INSERT [dbo].[hub_place] ([id]) VALUES (23)
INSERT [dbo].[hub_place] ([id]) VALUES (24)
INSERT [dbo].[hub_place] ([id]) VALUES (25)
INSERT [dbo].[hub_place] ([id]) VALUES (26)
INSERT [dbo].[hub_place] ([id]) VALUES (27)
INSERT [dbo].[hub_place] ([id]) VALUES (28)
INSERT [dbo].[hub_place] ([id]) VALUES (29)
INSERT [dbo].[hub_place] ([id]) VALUES (30)
INSERT [dbo].[hub_place] ([id]) VALUES (31)
INSERT [dbo].[hub_place] ([id]) VALUES (32)
INSERT [dbo].[hub_place] ([id]) VALUES (33)
INSERT [dbo].[hub_place] ([id]) VALUES (34)
INSERT [dbo].[hub_place] ([id]) VALUES (35)
INSERT [dbo].[hub_place] ([id]) VALUES (36)
INSERT [dbo].[hub_place] ([id]) VALUES (37)
INSERT [dbo].[hub_place] ([id]) VALUES (38)
INSERT [dbo].[hub_place] ([id]) VALUES (39)
INSERT [dbo].[hub_place] ([id]) VALUES (40)
INSERT [dbo].[hub_place] ([id]) VALUES (41)
INSERT [dbo].[hub_place] ([id]) VALUES (42)
INSERT [dbo].[hub_place] ([id]) VALUES (43)
INSERT [dbo].[hub_place] ([id]) VALUES (44)
INSERT [dbo].[hub_place] ([id]) VALUES (45)
INSERT [dbo].[hub_place] ([id]) VALUES (46)
INSERT [dbo].[hub_place] ([id]) VALUES (47)
INSERT [dbo].[hub_place] ([id]) VALUES (48)
INSERT [dbo].[hub_place] ([id]) VALUES (49)
INSERT [dbo].[hub_place] ([id]) VALUES (50)
INSERT [dbo].[hub_place] ([id]) VALUES (51)
INSERT [dbo].[hub_place] ([id]) VALUES (52)
INSERT [dbo].[hub_place] ([id]) VALUES (53)
INSERT [dbo].[hub_place] ([id]) VALUES (54)
INSERT [dbo].[hub_place] ([id]) VALUES (55)
INSERT [dbo].[hub_place] ([id]) VALUES (56)
INSERT [dbo].[hub_place] ([id]) VALUES (57)
INSERT [dbo].[hub_place] ([id]) VALUES (58)
INSERT [dbo].[hub_place] ([id]) VALUES (59)
INSERT [dbo].[hub_place] ([id]) VALUES (60)
INSERT [dbo].[hub_place] ([id]) VALUES (61)
INSERT [dbo].[hub_place] ([id]) VALUES (62)
INSERT [dbo].[hub_place] ([id]) VALUES (63)
INSERT [dbo].[hub_place] ([id]) VALUES (64)
INSERT [dbo].[hub_place] ([id]) VALUES (65)
INSERT [dbo].[hub_place] ([id]) VALUES (66)
INSERT [dbo].[hub_place] ([id]) VALUES (67)
INSERT [dbo].[hub_place] ([id]) VALUES (68)
INSERT [dbo].[hub_place] ([id]) VALUES (69)
INSERT [dbo].[hub_place] ([id]) VALUES (70)
INSERT [dbo].[hub_place] ([id]) VALUES (71)
INSERT [dbo].[hub_place] ([id]) VALUES (72)
INSERT [dbo].[hub_place] ([id]) VALUES (73)
INSERT [dbo].[hub_place] ([id]) VALUES (74)
INSERT [dbo].[hub_place] ([id]) VALUES (75)
INSERT [dbo].[hub_place] ([id]) VALUES (76)
INSERT [dbo].[hub_place] ([id]) VALUES (77)
INSERT [dbo].[hub_place] ([id]) VALUES (78)
INSERT [dbo].[hub_place] ([id]) VALUES (79)
INSERT [dbo].[hub_place] ([id]) VALUES (80)
INSERT [dbo].[hub_place] ([id]) VALUES (81)
INSERT [dbo].[hub_place] ([id]) VALUES (82)
INSERT [dbo].[hub_place] ([id]) VALUES (83)
INSERT [dbo].[hub_place] ([id]) VALUES (84)
INSERT [dbo].[hub_place] ([id]) VALUES (85)
INSERT [dbo].[hub_place] ([id]) VALUES (86)
INSERT [dbo].[hub_place] ([id]) VALUES (87)
INSERT [dbo].[hub_place] ([id]) VALUES (88)
INSERT [dbo].[hub_place] ([id]) VALUES (89)
INSERT [dbo].[hub_place] ([id]) VALUES (90)
INSERT [dbo].[hub_place] ([id]) VALUES (91)
INSERT [dbo].[hub_place] ([id]) VALUES (92)
INSERT [dbo].[hub_place] ([id]) VALUES (93)
INSERT [dbo].[hub_place] ([id]) VALUES (94)
INSERT [dbo].[hub_place] ([id]) VALUES (95)
INSERT [dbo].[hub_place] ([id]) VALUES (96)
INSERT [dbo].[hub_place] ([id]) VALUES (97)
INSERT [dbo].[hub_place] ([id]) VALUES (98)
INSERT [dbo].[hub_place] ([id]) VALUES (99)
GO
INSERT [dbo].[hub_place] ([id]) VALUES (100)
INSERT [dbo].[hub_place] ([id]) VALUES (101)
INSERT [dbo].[hub_place] ([id]) VALUES (102)
INSERT [dbo].[hub_place] ([id]) VALUES (103)
INSERT [dbo].[hub_place] ([id]) VALUES (104)
INSERT [dbo].[hub_place] ([id]) VALUES (105)
INSERT [dbo].[hub_place] ([id]) VALUES (106)
INSERT [dbo].[hub_place] ([id]) VALUES (107)
INSERT [dbo].[hub_place] ([id]) VALUES (108)
INSERT [dbo].[hub_place] ([id]) VALUES (109)
INSERT [dbo].[hub_place] ([id]) VALUES (110)
INSERT [dbo].[hub_place] ([id]) VALUES (111)
INSERT [dbo].[hub_place] ([id]) VALUES (112)
INSERT [dbo].[hub_place] ([id]) VALUES (113)
INSERT [dbo].[hub_place] ([id]) VALUES (114)
INSERT [dbo].[hub_place] ([id]) VALUES (115)
INSERT [dbo].[hub_place] ([id]) VALUES (116)
INSERT [dbo].[hub_place] ([id]) VALUES (117)
INSERT [dbo].[hub_place] ([id]) VALUES (118)
INSERT [dbo].[hub_place] ([id]) VALUES (119)
INSERT [dbo].[hub_place] ([id]) VALUES (120)
INSERT [dbo].[hub_place] ([id]) VALUES (121)
INSERT [dbo].[hub_place] ([id]) VALUES (122)
INSERT [dbo].[hub_place] ([id]) VALUES (123)
INSERT [dbo].[hub_place] ([id]) VALUES (124)
INSERT [dbo].[hub_place] ([id]) VALUES (125)
INSERT [dbo].[hub_place] ([id]) VALUES (126)
INSERT [dbo].[hub_place] ([id]) VALUES (127)
INSERT [dbo].[hub_place] ([id]) VALUES (128)
INSERT [dbo].[hub_place] ([id]) VALUES (129)
INSERT [dbo].[hub_place] ([id]) VALUES (130)
INSERT [dbo].[hub_place] ([id]) VALUES (131)
INSERT [dbo].[hub_place] ([id]) VALUES (132)
INSERT [dbo].[hub_place] ([id]) VALUES (133)
INSERT [dbo].[hub_place] ([id]) VALUES (134)
INSERT [dbo].[hub_place] ([id]) VALUES (135)
INSERT [dbo].[hub_place] ([id]) VALUES (136)
INSERT [dbo].[hub_place] ([id]) VALUES (137)
INSERT [dbo].[hub_place] ([id]) VALUES (138)
INSERT [dbo].[hub_place] ([id]) VALUES (139)
INSERT [dbo].[hub_place] ([id]) VALUES (140)
INSERT [dbo].[hub_place] ([id]) VALUES (141)
INSERT [dbo].[hub_place] ([id]) VALUES (142)
INSERT [dbo].[hub_place] ([id]) VALUES (143)
INSERT [dbo].[hub_place] ([id]) VALUES (144)
INSERT [dbo].[hub_place] ([id]) VALUES (145)
INSERT [dbo].[hub_place] ([id]) VALUES (146)
INSERT [dbo].[hub_place] ([id]) VALUES (147)
INSERT [dbo].[hub_place] ([id]) VALUES (148)
INSERT [dbo].[hub_place] ([id]) VALUES (149)
INSERT [dbo].[hub_place] ([id]) VALUES (150)
INSERT [dbo].[hub_place] ([id]) VALUES (151)
INSERT [dbo].[hub_place] ([id]) VALUES (152)
INSERT [dbo].[hub_place] ([id]) VALUES (153)
INSERT [dbo].[hub_place] ([id]) VALUES (154)
INSERT [dbo].[hub_place] ([id]) VALUES (155)
INSERT [dbo].[hub_place] ([id]) VALUES (156)
INSERT [dbo].[hub_place] ([id]) VALUES (157)
INSERT [dbo].[hub_place] ([id]) VALUES (158)
INSERT [dbo].[hub_place] ([id]) VALUES (159)
INSERT [dbo].[hub_place] ([id]) VALUES (160)
INSERT [dbo].[hub_place] ([id]) VALUES (161)
INSERT [dbo].[hub_place] ([id]) VALUES (162)
INSERT [dbo].[hub_place] ([id]) VALUES (163)
INSERT [dbo].[hub_place] ([id]) VALUES (164)
INSERT [dbo].[hub_place] ([id]) VALUES (165)
INSERT [dbo].[hub_place] ([id]) VALUES (166)
INSERT [dbo].[hub_place] ([id]) VALUES (167)
INSERT [dbo].[hub_place] ([id]) VALUES (168)
INSERT [dbo].[hub_place] ([id]) VALUES (169)
INSERT [dbo].[hub_place] ([id]) VALUES (170)
INSERT [dbo].[hub_place] ([id]) VALUES (171)
INSERT [dbo].[hub_place] ([id]) VALUES (172)
INSERT [dbo].[hub_place] ([id]) VALUES (173)
INSERT [dbo].[hub_place] ([id]) VALUES (174)
INSERT [dbo].[hub_place] ([id]) VALUES (175)
INSERT [dbo].[hub_place] ([id]) VALUES (176)
INSERT [dbo].[hub_place] ([id]) VALUES (177)
INSERT [dbo].[hub_place] ([id]) VALUES (178)
INSERT [dbo].[hub_place] ([id]) VALUES (179)
INSERT [dbo].[hub_place] ([id]) VALUES (180)
INSERT [dbo].[hub_place] ([id]) VALUES (181)
INSERT [dbo].[hub_place] ([id]) VALUES (182)
INSERT [dbo].[hub_place] ([id]) VALUES (183)
INSERT [dbo].[hub_place] ([id]) VALUES (184)
INSERT [dbo].[hub_place] ([id]) VALUES (185)
INSERT [dbo].[hub_place] ([id]) VALUES (186)
INSERT [dbo].[hub_place] ([id]) VALUES (187)
INSERT [dbo].[hub_place] ([id]) VALUES (188)
INSERT [dbo].[hub_place] ([id]) VALUES (189)
INSERT [dbo].[hub_place] ([id]) VALUES (190)
INSERT [dbo].[hub_place] ([id]) VALUES (191)
INSERT [dbo].[hub_place] ([id]) VALUES (192)
INSERT [dbo].[hub_place] ([id]) VALUES (193)
INSERT [dbo].[hub_place] ([id]) VALUES (194)
INSERT [dbo].[hub_place] ([id]) VALUES (195)
INSERT [dbo].[hub_place] ([id]) VALUES (196)
INSERT [dbo].[hub_place] ([id]) VALUES (197)
INSERT [dbo].[hub_place] ([id]) VALUES (198)
INSERT [dbo].[hub_place] ([id]) VALUES (199)
GO
INSERT [dbo].[hub_user] ([id]) VALUES (0)
INSERT [dbo].[hub_user] ([id]) VALUES (1)
INSERT [dbo].[hub_user] ([id]) VALUES (2)
INSERT [dbo].[hub_user] ([id]) VALUES (3)
INSERT [dbo].[hub_view_history] ([id]) VALUES (0)
INSERT [dbo].[link_country_city] ([country_code], [id_city]) VALUES (N'+34', 1)
INSERT [dbo].[link_country_city] ([country_code], [id_city]) VALUES (N'+34', 2)
INSERT [dbo].[link_country_city] ([country_code], [id_city]) VALUES (N'+44', 0)
INSERT [dbo].[link_country_city] ([country_code], [id_city]) VALUES (N'+354', 3)
INSERT [dbo].[link_country_city] ([country_code], [id_city]) VALUES (N'+1', 4)
INSERT [dbo].[link_estate_contract] ([estate_id], [contract_id]) VALUES (0, 0)
INSERT [dbo].[link_estate_contract] ([estate_id], [contract_id]) VALUES (1, 1)
INSERT [dbo].[link_estate_history] ([id_estate], [id_history]) VALUES (0, 0)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (0, 163)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (1, 67)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (2, 69)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (3, 147)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (4, 88)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (5, 61)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (6, 92)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (7, 131)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (8, 187)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (9, 28)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (10, 37)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (11, 11)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (12, 123)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (13, 174)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (14, 0)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (15, 144)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (16, 53)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (17, 12)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (18, 57)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (19, 190)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (20, 44)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (21, 21)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (22, 7)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (23, 55)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (24, 132)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (25, 22)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (26, 19)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (27, 49)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (28, 51)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (29, 156)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (30, 25)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (31, 186)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (32, 65)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (33, 195)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (34, 34)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (35, 153)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (36, 124)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (37, 152)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (38, 188)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (39, 134)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (40, 158)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (41, 60)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (42, 98)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (43, 76)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (44, 193)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (45, 74)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (46, 108)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (47, 91)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (48, 137)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (49, 84)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (50, 140)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (51, 75)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (52, 77)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (53, 129)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (54, 130)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (55, 176)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (56, 165)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (57, 78)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (58, 183)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (59, 128)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (60, 119)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (61, 125)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (62, 1)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (63, 106)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (64, 32)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (65, 56)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (66, 150)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (67, 43)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (68, 23)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (69, 182)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (70, 79)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (71, 42)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (72, 50)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (73, 148)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (74, 120)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (75, 112)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (76, 54)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (77, 105)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (78, 71)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (79, 173)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (80, 159)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (81, 16)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (82, 73)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (83, 110)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (84, 30)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (85, 177)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (86, 10)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (87, 40)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (88, 15)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (89, 95)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (90, 3)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (91, 45)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (92, 6)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (93, 70)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (94, 31)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (95, 139)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (96, 169)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (97, 26)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (98, 170)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (99, 102)
GO
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (100, 39)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (101, 80)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (102, 14)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (103, 100)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (104, 97)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (105, 167)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (106, 166)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (107, 107)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (108, 20)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (109, 2)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (110, 93)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (111, 111)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (112, 136)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (113, 154)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (114, 62)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (115, 87)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (116, 175)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (117, 116)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (118, 103)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (119, 5)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (120, 146)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (121, 171)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (122, 149)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (123, 36)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (124, 4)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (125, 179)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (126, 161)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (127, 191)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (128, 96)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (129, 83)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (130, 18)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (131, 114)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (132, 68)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (133, 126)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (134, 113)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (135, 115)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (136, 122)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (137, 104)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (138, 82)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (139, 143)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (140, 160)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (141, 121)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (142, 127)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (143, 64)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (144, 81)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (145, 184)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (146, 99)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (147, 133)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (148, 29)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (149, 145)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (150, 24)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (151, 138)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (152, 72)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (153, 162)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (154, 199)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (155, 48)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (156, 109)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (157, 58)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (158, 117)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (159, 180)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (160, 118)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (161, 85)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (162, 17)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (163, 157)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (164, 194)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (165, 47)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (166, 164)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (167, 185)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (168, 181)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (169, 63)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (170, 8)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (171, 101)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (172, 66)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (173, 89)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (174, 27)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (175, 90)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (176, 59)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (177, 38)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (178, 197)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (179, 189)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (180, 35)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (181, 198)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (182, 94)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (183, 196)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (184, 46)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (185, 9)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (186, 135)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (187, 142)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (188, 178)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (189, 172)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (190, 168)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (191, 192)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (192, 52)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (193, 86)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (194, 155)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (195, 13)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (196, 33)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (197, 151)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (198, 141)
INSERT [dbo].[link_estate_place] ([id_estate], [id_place]) VALUES (199, 41)
GO
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (0, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (1, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (2, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (3, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (4, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (5, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (6, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (7, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (8, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (9, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (10, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (11, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (12, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (13, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (14, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (15, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (16, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (17, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (18, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (19, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (20, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (21, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (22, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (23, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (24, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (25, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (26, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (27, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (28, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (29, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (30, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (31, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (32, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (33, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (34, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (35, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (36, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (37, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (38, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (39, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (40, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (41, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (42, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (43, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (44, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (45, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (46, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (47, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (48, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (49, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (50, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (51, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (52, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (53, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (54, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (55, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (56, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (57, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (58, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (59, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (60, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (61, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (62, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (63, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (64, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (65, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (66, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (67, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (68, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (69, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (70, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (71, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (72, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (73, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (74, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (75, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (76, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (77, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (78, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (79, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (80, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (81, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (82, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (83, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (84, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (85, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (86, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (87, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (88, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (89, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (90, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (91, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (92, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (93, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (94, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (95, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (96, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (97, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (98, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (99, 4)
GO
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (100, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (101, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (102, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (103, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (104, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (105, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (106, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (107, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (108, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (109, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (110, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (111, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (112, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (113, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (114, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (115, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (116, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (117, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (118, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (119, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (120, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (121, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (122, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (123, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (124, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (125, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (126, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (127, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (128, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (129, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (130, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (131, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (132, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (133, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (134, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (135, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (136, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (137, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (138, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (139, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (140, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (141, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (142, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (143, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (144, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (145, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (146, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (147, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (148, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (149, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (150, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (151, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (152, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (153, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (154, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (155, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (156, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (157, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (158, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (159, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (160, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (161, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (162, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (163, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (164, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (165, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (166, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (167, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (168, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (169, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (170, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (171, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (172, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (173, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (174, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (175, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (176, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (177, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (178, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (179, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (180, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (181, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (182, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (183, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (184, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (185, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (186, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (187, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (188, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (189, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (190, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (191, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (192, 4)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (193, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (194, 2)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (195, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (196, 0)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (197, 3)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (198, 1)
INSERT [dbo].[link_place_city] ([id_place], [id_city]) VALUES (199, 3)
GO
INSERT [dbo].[link_user_history] ([id_user], [id_view_history]) VALUES (0, 0)
INSERT [dbo].[sat_city] ([id], [time_zone], [name]) VALUES (0, N'UTC/GMT +1 hour', N'London')
INSERT [dbo].[sat_city] ([id], [time_zone], [name]) VALUES (1, N'UTC/GMT +2 hours', N'Madrid')
INSERT [dbo].[sat_city] ([id], [time_zone], [name]) VALUES (2, N'UTC/GMT +2 hours', N'Barcelona')
INSERT [dbo].[sat_city] ([id], [time_zone], [name]) VALUES (3, N'GMT', N'Reykjavik')
INSERT [dbo].[sat_city] ([id], [time_zone], [name]) VALUES (4, N'UTC/GMT -4:00 hours', N'Orlando')
INSERT [dbo].[sat_contracts] ([id], [date]) VALUES (0, CAST(N'2020-06-05' AS Date))
INSERT [dbo].[sat_contracts] ([id], [date]) VALUES (1, CAST(N'2020-10-06' AS Date))
INSERT [dbo].[sat_country] ([country_code], [name], [population]) VALUES (N'+34', N'Spain', 46753394)
INSERT [dbo].[sat_country] ([country_code], [name], [population]) VALUES (N'+44', N'United Kingdom', 67859798)
INSERT [dbo].[sat_country] ([country_code], [name], [population]) VALUES (N'+354', N'Iceland', 364134)
INSERT [dbo].[sat_country] ([country_code], [name], [population]) VALUES (N'+1', N'United States', 331002651)
INSERT [dbo].[sat_country] ([country_code], [name], [population]) VALUES (N'+7', N'Russia', 146800000)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (0, 0, CAST(544033.5837886340 AS Decimal(18, 10)), 136, N'appartment', 0, 47.04339075331967, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (1, 0, CAST(40847.6622536682 AS Decimal(18, 10)), 121, N'room', 0, 156.42143369417772, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (2, 1, CAST(328594.6683510951 AS Decimal(18, 10)), 167, N'appartment', 1, 92.765518762269153, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (3, 1, CAST(747781.0863381153 AS Decimal(18, 10)), 195, N'appart house', 1, 86.188956473191979, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (4, 1, CAST(583023.9087388447 AS Decimal(18, 10)), 287, N'pent-house', 1, 293.25373206117769, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (5, 1, CAST(514727.6585454593 AS Decimal(18, 10)), 237, N'pent-house', 0, 283.75845382674197, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (6, 1, CAST(388499.0095227302 AS Decimal(18, 10)), 119, N'pent-house', 0, 167.92724699766524, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (7, 1, CAST(89728.6875527734 AS Decimal(18, 10)), 245, N'room', 1, 92.854542899843835, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (8, 1, CAST(552611.9972091601 AS Decimal(18, 10)), 199, N'room', 1, 339.526908358206, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (9, 1, CAST(611180.7080269492 AS Decimal(18, 10)), 166, N'room', 1, 172.46987411569472, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (10, 1, CAST(702641.4029934262 AS Decimal(18, 10)), 136, N'appartment', 0, 125.3568438706028, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (11, 1, CAST(68611.6856272085 AS Decimal(18, 10)), 163, N'pent-house', 1, 115.50855285481607, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (12, 1, CAST(108626.6430538464 AS Decimal(18, 10)), 284, N'pent-house', 1, 48.134184688371391, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (13, 1, CAST(611670.8256662355 AS Decimal(18, 10)), 212, N'appartment', 1, 184.26369131946152, 2, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (14, 1, CAST(347516.5123923384 AS Decimal(18, 10)), 265, N'appartment', 0, 225.69211927345432, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (15, 1, CAST(110797.0342343687 AS Decimal(18, 10)), 138, N'appartment', 1, 182.14333937499157, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (16, 1, CAST(541582.0200379172 AS Decimal(18, 10)), 261, N'room', 0, 144.07752855714921, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (17, 1, CAST(330771.3832150576 AS Decimal(18, 10)), 154, N'room', 1, 284.2063997498492, 5, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (18, 1, CAST(379037.9138666580 AS Decimal(18, 10)), 163, N'pent-house', 0, 268.54354628508105, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (19, 1, CAST(113708.8091814767 AS Decimal(18, 10)), 159, N'appart house', 1, 120.10522639125942, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (20, 1, CAST(424220.9808697216 AS Decimal(18, 10)), 190, N'room', 0, 281.67487104704804, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (21, 1, CAST(515581.4534832727 AS Decimal(18, 10)), 203, N'appartment', 1, 60.097386033160817, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (22, 1, CAST(771672.2463871213 AS Decimal(18, 10)), 276, N'room', 1, 170.78984781209709, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (23, 1, CAST(611122.4395601378 AS Decimal(18, 10)), 158, N'pent-house', 1, 104.83391383403838, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (24, 1, CAST(33775.6221393927 AS Decimal(18, 10)), 149, N'appart house', 1, 284.0090856689016, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (25, 1, CAST(881603.3026649872 AS Decimal(18, 10)), 299, N'room', 1, 32.083338084537743, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (26, 1, CAST(266707.7786475493 AS Decimal(18, 10)), 105, N'appart house', 1, 192.61526145259165, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (27, 1, CAST(876871.1739762624 AS Decimal(18, 10)), 118, N'appart house', 1, 110.4685194568665, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (28, 1, CAST(775072.0834029755 AS Decimal(18, 10)), 242, N'appartment', 0, 84.915797087467809, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (29, 1, CAST(532554.0699320561 AS Decimal(18, 10)), 281, N'room', 1, 145.33421728083553, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (30, 1, CAST(708893.8220897237 AS Decimal(18, 10)), 273, N'room', 1, 200.699288805556, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (31, 1, CAST(831323.6522155144 AS Decimal(18, 10)), 179, N'appart house', 1, 334.22317293380587, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (32, 1, CAST(602445.6094912942 AS Decimal(18, 10)), 221, N'room', 0, 53.769969927149376, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (33, 1, CAST(991775.3859453604 AS Decimal(18, 10)), 170, N'pent-house', 0, 191.73809186046958, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (34, 1, CAST(292202.7800654892 AS Decimal(18, 10)), 132, N'pent-house', 0, 139.36780804644428, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (35, 1, CAST(286993.2152310085 AS Decimal(18, 10)), 159, N'appart house', 0, 394.52140594054515, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (36, 1, CAST(62687.9569998291 AS Decimal(18, 10)), 264, N'pent-house', 0, 279.48740667119466, 5, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (37, 1, CAST(543321.0066336723 AS Decimal(18, 10)), 111, N'pent-house', 0, 39.906725498901984, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (38, 1, CAST(658098.3869768486 AS Decimal(18, 10)), 106, N'pent-house', 1, 325.76847490167546, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (39, 1, CAST(853653.8554355786 AS Decimal(18, 10)), 262, N'appartment', 0, 306.03018822864755, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (40, 1, CAST(847812.5420601157 AS Decimal(18, 10)), 191, N'appart house', 1, 126.3803374704877, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (41, 1, CAST(115050.6386756021 AS Decimal(18, 10)), 150, N'pent-house', 0, 245.61695095330938, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (42, 1, CAST(452580.6471462115 AS Decimal(18, 10)), 297, N'room', 1, 373.67900249620885, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (43, 1, CAST(845840.4008384293 AS Decimal(18, 10)), 266, N'room', 0, 179.61835747021775, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (44, 1, CAST(755195.9201758819 AS Decimal(18, 10)), 182, N'room', 0, 170.05007499855063, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (45, 1, CAST(858723.5669814307 AS Decimal(18, 10)), 157, N'room', 0, 133.58242452714325, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (46, 1, CAST(384832.7538088879 AS Decimal(18, 10)), 157, N'appartment', 1, 253.95377798519286, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (47, 1, CAST(892849.1547440405 AS Decimal(18, 10)), 193, N'appart house', 0, 190.72745210512292, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (48, 1, CAST(212594.9429664971 AS Decimal(18, 10)), 272, N'appartment', 0, 372.71711632830289, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (49, 1, CAST(863017.2507068383 AS Decimal(18, 10)), 179, N'pent-house', 1, 154.23045052490812, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (50, 1, CAST(75506.3080170440 AS Decimal(18, 10)), 197, N'room', 1, 76.97486938867047, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (51, 1, CAST(445215.5618137424 AS Decimal(18, 10)), 286, N'appart house', 1, 176.41016034546203, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (52, 1, CAST(222966.1770018641 AS Decimal(18, 10)), 229, N'room', 0, 143.2160408167922, 2, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (53, 1, CAST(129629.7047449066 AS Decimal(18, 10)), 225, N'pent-house', 1, 106.62876659531706, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (54, 1, CAST(669350.2644742737 AS Decimal(18, 10)), 288, N'appart house', 1, 107.88898903568794, 5, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (55, 1, CAST(270719.8702944607 AS Decimal(18, 10)), 118, N'appartment', 1, 384.07382835472913, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (56, 1, CAST(359050.1993199665 AS Decimal(18, 10)), 239, N'appartment', 0, 308.25164365603388, 2, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (57, 1, CAST(310388.6038627630 AS Decimal(18, 10)), 163, N'appart house', 1, 386.14205247107, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (58, 1, CAST(561543.7145161076 AS Decimal(18, 10)), 252, N'appartment', 1, 248.60136100827097, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (59, 1, CAST(983516.5803066085 AS Decimal(18, 10)), 215, N'pent-house', 1, 142.52924909357989, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (60, 1, CAST(653627.2854571979 AS Decimal(18, 10)), 287, N'appartment', 0, 72.667865502461154, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (61, 1, CAST(779995.9774312008 AS Decimal(18, 10)), 170, N'room', 0, 194.27699417411492, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (62, 1, CAST(638526.8613451093 AS Decimal(18, 10)), 159, N'appart house', 1, 290.37315635299655, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (63, 1, CAST(292370.4091781573 AS Decimal(18, 10)), 249, N'room', 1, 131.10358933629868, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (64, 1, CAST(11122.9665659875 AS Decimal(18, 10)), 157, N'room', 1, 258.75079610658645, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (65, 1, CAST(663650.2676405839 AS Decimal(18, 10)), 145, N'appartment', 1, 120.68046110797704, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (66, 1, CAST(30465.3078801226 AS Decimal(18, 10)), 179, N'pent-house', 1, 326.66928105280067, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (67, 1, CAST(147509.0553661095 AS Decimal(18, 10)), 114, N'room', 1, 373.25763202068259, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (68, 1, CAST(876805.8373192577 AS Decimal(18, 10)), 122, N'appart house', 0, 76.548642895915336, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (69, 1, CAST(175226.4782888919 AS Decimal(18, 10)), 177, N'room', 1, 53.516342180537208, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (70, 1, CAST(130761.9011435593 AS Decimal(18, 10)), 229, N'appartment', 0, 244.78564323760435, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (71, 1, CAST(418275.9639883919 AS Decimal(18, 10)), 126, N'room', 0, 337.23133069174469, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (72, 1, CAST(705108.9307014254 AS Decimal(18, 10)), 220, N'appartment', 0, 45.427656157788967, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (73, 1, CAST(502919.3881591107 AS Decimal(18, 10)), 192, N'appart house', 0, 130.6084759888852, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (74, 1, CAST(433523.2557727862 AS Decimal(18, 10)), 221, N'pent-house', 0, 322.80572883682026, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (75, 1, CAST(19129.4940742898 AS Decimal(18, 10)), 229, N'pent-house', 0, 163.43450954727979, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (76, 1, CAST(764967.4139799252 AS Decimal(18, 10)), 165, N'pent-house', 1, 144.99262585195996, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (77, 1, CAST(295278.3610432360 AS Decimal(18, 10)), 201, N'pent-house', 1, 194.27435144068983, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (78, 1, CAST(27465.9295138439 AS Decimal(18, 10)), 171, N'pent-house', 1, 215.8534200150184, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (79, 1, CAST(439825.4312204044 AS Decimal(18, 10)), 150, N'appartment', 0, 37.613550176382631, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (80, 1, CAST(388815.3322436687 AS Decimal(18, 10)), 112, N'room', 0, 333.10154438104968, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (81, 1, CAST(250949.6208166042 AS Decimal(18, 10)), 199, N'pent-house', 0, 317.34511312044526, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (82, 1, CAST(282047.2408861611 AS Decimal(18, 10)), 213, N'room', 1, 342.62332557916756, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (83, 1, CAST(230465.7675812394 AS Decimal(18, 10)), 274, N'appart house', 0, 167.92025778429354, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (84, 1, CAST(572612.0746617431 AS Decimal(18, 10)), 179, N'appart house', 1, 382.68630049585613, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (85, 1, CAST(890541.2102192995 AS Decimal(18, 10)), 106, N'appartment', 1, 57.683916419849773, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (86, 1, CAST(710270.3189005879 AS Decimal(18, 10)), 256, N'room', 0, 201.97622005325391, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (87, 1, CAST(296233.8296351289 AS Decimal(18, 10)), 253, N'pent-house', 0, 182.88476467263624, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (88, 1, CAST(533311.6964754519 AS Decimal(18, 10)), 141, N'pent-house', 0, 222.72940354616083, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (89, 1, CAST(863235.7089967070 AS Decimal(18, 10)), 269, N'appart house', 1, 275.6968695586466, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (90, 1, CAST(14428.4966868254 AS Decimal(18, 10)), 168, N'appart house', 0, 307.0360410779976, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (91, 1, CAST(206779.8658574583 AS Decimal(18, 10)), 295, N'appartment', 0, 170.1217364805124, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (92, 1, CAST(605701.5533317982 AS Decimal(18, 10)), 250, N'appart house', 0, 357.3812418147308, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (93, 1, CAST(382997.5571252142 AS Decimal(18, 10)), 220, N'appartment', 0, 255.83250729384844, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (94, 1, CAST(714254.3307276621 AS Decimal(18, 10)), 144, N'appartment', 1, 185.76205146344762, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (95, 1, CAST(625597.7603504226 AS Decimal(18, 10)), 185, N'pent-house', 1, 62.269423522574691, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (96, 1, CAST(820619.9971867395 AS Decimal(18, 10)), 239, N'appartment', 1, 372.85495416123428, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (97, 1, CAST(675672.2789314176 AS Decimal(18, 10)), 253, N'room', 1, 283.25826527392292, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (98, 1, CAST(650179.3331247183 AS Decimal(18, 10)), 251, N'appart house', 1, 175.14143936309603, 2, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (99, 1, CAST(470944.3493573281 AS Decimal(18, 10)), 219, N'pent-house', 1, 256.65120927579613, 4, 2)
GO
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (100, 1, CAST(371358.3279333015 AS Decimal(18, 10)), 271, N'appartment', 0, 205.2618243313228, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (101, 1, CAST(712887.7008127624 AS Decimal(18, 10)), 285, N'appartment', 1, 399.34814492234818, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (102, 1, CAST(513382.3167534761 AS Decimal(18, 10)), 164, N'appartment', 0, 197.03749791339641, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (103, 1, CAST(651808.5723017902 AS Decimal(18, 10)), 186, N'appartment', 0, 193.69352352611563, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (104, 1, CAST(299544.8319681923 AS Decimal(18, 10)), 123, N'appartment', 1, 262.402057112797, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (105, 1, CAST(978322.1783655743 AS Decimal(18, 10)), 112, N'appart house', 0, 243.9755401948093, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (106, 1, CAST(208812.6373928282 AS Decimal(18, 10)), 221, N'appart house', 1, 381.78546728705612, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (107, 1, CAST(730056.7044798916 AS Decimal(18, 10)), 289, N'appart house', 1, 366.89703148734918, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (108, 1, CAST(762774.4786482005 AS Decimal(18, 10)), 264, N'appartment', 1, 120.21355145777669, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (109, 1, CAST(583758.5724912060 AS Decimal(18, 10)), 160, N'pent-house', 1, 133.22326633080166, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (110, 1, CAST(71874.2591059895 AS Decimal(18, 10)), 146, N'appart house', 1, 68.747557022399548, 2, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (111, 1, CAST(148245.2235742225 AS Decimal(18, 10)), 134, N'appart house', 0, 98.713252634655888, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (112, 1, CAST(554051.5694967246 AS Decimal(18, 10)), 149, N'room', 0, 102.90345170019808, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (113, 1, CAST(10430.4750583953 AS Decimal(18, 10)), 284, N'appartment', 0, 315.12075562588979, 5, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (114, 1, CAST(786818.0744857157 AS Decimal(18, 10)), 271, N'appartment', 1, 218.26668358851057, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (115, 1, CAST(441429.5480949269 AS Decimal(18, 10)), 287, N'appart house', 0, 324.20249051421695, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (116, 1, CAST(774067.8017466953 AS Decimal(18, 10)), 113, N'room', 0, 223.16462650559893, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (117, 1, CAST(346277.3126082685 AS Decimal(18, 10)), 289, N'appart house', 1, 242.73547646216807, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (118, 1, CAST(564324.1546140214 AS Decimal(18, 10)), 252, N'room', 1, 50.99955158053195, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (119, 1, CAST(679913.1915473213 AS Decimal(18, 10)), 298, N'pent-house', 1, 52.662044216420156, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (120, 1, CAST(535834.9692047625 AS Decimal(18, 10)), 160, N'pent-house', 1, 142.11881011602515, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (121, 1, CAST(121664.1733255089 AS Decimal(18, 10)), 132, N'room', 1, 39.648961833005387, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (122, 1, CAST(144086.0770807522 AS Decimal(18, 10)), 167, N'room', 0, 79.687260810536685, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (123, 1, CAST(529605.8775588698 AS Decimal(18, 10)), 180, N'appart house', 0, 332.94759431469106, 5, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (124, 1, CAST(652688.6820622000 AS Decimal(18, 10)), 211, N'appartment', 1, 72.549604544786092, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (125, 1, CAST(137361.3711131457 AS Decimal(18, 10)), 107, N'appart house', 0, 175.08960816099619, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (126, 1, CAST(835093.7461074878 AS Decimal(18, 10)), 105, N'room', 1, 164.80460186437907, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (127, 1, CAST(518985.4660918179 AS Decimal(18, 10)), 276, N'appart house', 0, 387.81492930623841, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (128, 1, CAST(227591.5462857383 AS Decimal(18, 10)), 285, N'pent-house', 1, 368.57436876892564, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (129, 1, CAST(685305.3468635262 AS Decimal(18, 10)), 102, N'appart house', 0, 189.70251728442847, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (130, 1, CAST(449208.4312896620 AS Decimal(18, 10)), 151, N'appartment', 1, 201.22995378215111, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (131, 1, CAST(771491.3673610191 AS Decimal(18, 10)), 168, N'appartment', 0, 349.19858567319687, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (132, 1, CAST(575126.8269337121 AS Decimal(18, 10)), 220, N'room', 0, 351.298346682757, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (133, 1, CAST(415865.8526841618 AS Decimal(18, 10)), 104, N'room', 1, 181.01569178414965, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (134, 1, CAST(516104.8712214726 AS Decimal(18, 10)), 139, N'appartment', 1, 85.649429097372689, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (135, 1, CAST(929400.8737723212 AS Decimal(18, 10)), 255, N'room', 1, 371.52811033827743, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (136, 1, CAST(339636.7041389870 AS Decimal(18, 10)), 276, N'appartment', 1, 110.18023265337284, 2, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (137, 1, CAST(396321.0994035315 AS Decimal(18, 10)), 114, N'pent-house', 1, 145.38988882891849, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (138, 1, CAST(465684.1468532156 AS Decimal(18, 10)), 148, N'room', 0, 389.73304450809621, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (139, 1, CAST(179362.1974551446 AS Decimal(18, 10)), 138, N'appartment', 0, 334.85746887811024, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (140, 1, CAST(794348.2676221104 AS Decimal(18, 10)), 150, N'pent-house', 1, 353.27687071602696, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (141, 1, CAST(361480.1114521799 AS Decimal(18, 10)), 261, N'room', 0, 381.05786058386263, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (142, 1, CAST(758445.9120310846 AS Decimal(18, 10)), 202, N'room', 1, 168.22145797111398, 1, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (143, 1, CAST(88628.7200695269 AS Decimal(18, 10)), 145, N'room', 0, 242.69199076966024, 5, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (144, 1, CAST(531009.7024188414 AS Decimal(18, 10)), 181, N'room', 1, 344.99132606111749, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (145, 1, CAST(123523.6231667611 AS Decimal(18, 10)), 292, N'pent-house', 0, 375.96274957748733, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (146, 1, CAST(240236.3450593280 AS Decimal(18, 10)), 175, N'appartment', 0, 358.621955565577, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (147, 1, CAST(437970.4798066368 AS Decimal(18, 10)), 168, N'appartment', 0, 225.31172240350239, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (148, 1, CAST(285450.2613907831 AS Decimal(18, 10)), 285, N'pent-house', 0, 96.033939918180209, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (149, 1, CAST(195458.6113139486 AS Decimal(18, 10)), 235, N'appart house', 0, 228.54248391286126, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (150, 1, CAST(371452.6005792693 AS Decimal(18, 10)), 160, N'appartment', 0, 80.504741119823734, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (151, 1, CAST(327245.9999153701 AS Decimal(18, 10)), 249, N'pent-house', 0, 102.86959207144977, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (152, 1, CAST(339326.4966748972 AS Decimal(18, 10)), 221, N'room', 0, 248.38520203896712, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (153, 1, CAST(750406.1536207829 AS Decimal(18, 10)), 248, N'pent-house', 1, 27.104564854437136, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (154, 1, CAST(572599.7211201004 AS Decimal(18, 10)), 240, N'room', 0, 197.41800671498376, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (155, 1, CAST(842187.5259049102 AS Decimal(18, 10)), 114, N'pent-house', 0, 76.906473352829892, 5, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (156, 1, CAST(646104.2087279238 AS Decimal(18, 10)), 118, N'appartment', 0, 338.44919685929955, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (157, 1, CAST(633974.3299863840 AS Decimal(18, 10)), 102, N'appart house', 1, 311.49120968950928, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (158, 1, CAST(11700.0841225002 AS Decimal(18, 10)), 154, N'appart house', 0, 224.7016916755976, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (159, 1, CAST(456555.1775605488 AS Decimal(18, 10)), 217, N'appart house', 1, 158.04429223695067, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (160, 1, CAST(769814.4129444036 AS Decimal(18, 10)), 198, N'appartment', 1, 398.68411164948822, 5, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (161, 1, CAST(497742.0755947197 AS Decimal(18, 10)), 196, N'room', 0, 181.19200040687883, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (162, 1, CAST(517255.0395568728 AS Decimal(18, 10)), 264, N'room', 1, 243.06502144500314, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (163, 1, CAST(681948.6052380770 AS Decimal(18, 10)), 214, N'pent-house', 0, 319.92665211679883, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (164, 1, CAST(881697.7699299298 AS Decimal(18, 10)), 281, N'appart house', 1, 146.73385815027083, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (165, 1, CAST(801534.3029476361 AS Decimal(18, 10)), 210, N'appartment', 1, 130.63149978513621, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (166, 1, CAST(522736.2492130009 AS Decimal(18, 10)), 241, N'room', 0, 59.175052036169106, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (167, 1, CAST(534066.1994331352 AS Decimal(18, 10)), 249, N'room', 1, 139.85655176126375, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (168, 1, CAST(30016.3145062276 AS Decimal(18, 10)), 247, N'pent-house', 0, 28.12221995444656, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (169, 1, CAST(278687.3122360135 AS Decimal(18, 10)), 250, N'appartment', 1, 359.94572182873173, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (170, 1, CAST(56764.7730451329 AS Decimal(18, 10)), 232, N'appartment', 0, 312.84605193706938, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (171, 1, CAST(907176.3878950846 AS Decimal(18, 10)), 277, N'appart house', 0, 221.64764773091667, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (172, 1, CAST(365607.4883616402 AS Decimal(18, 10)), 204, N'appartment', 0, 289.32743123828203, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (173, 1, CAST(915829.4491089653 AS Decimal(18, 10)), 120, N'room', 0, 374.0661984772662, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (174, 1, CAST(362487.2518800297 AS Decimal(18, 10)), 195, N'appart house', 1, 257.12705784561621, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (175, 1, CAST(606003.2813642726 AS Decimal(18, 10)), 291, N'appartment', 1, 37.71422523242893, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (176, 1, CAST(997917.7684091780 AS Decimal(18, 10)), 182, N'pent-house', 0, 339.08970305481682, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (177, 1, CAST(742024.7036194929 AS Decimal(18, 10)), 124, N'room', 0, 203.59226107146623, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (178, 1, CAST(20130.4096963572 AS Decimal(18, 10)), 117, N'appartment', 1, 130.06509391173739, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (179, 1, CAST(514503.6191239567 AS Decimal(18, 10)), 213, N'pent-house', 1, 111.6970614464216, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (180, 1, CAST(140312.4439863599 AS Decimal(18, 10)), 113, N'appart house', 0, 234.78933414413217, 3, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (181, 1, CAST(746051.2133299081 AS Decimal(18, 10)), 268, N'appartment', 1, 199.54103250552151, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (182, 1, CAST(877118.1365000771 AS Decimal(18, 10)), 190, N'appart house', 1, 307.65293506159435, 5, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (183, 1, CAST(542801.3817989760 AS Decimal(18, 10)), 261, N'appartment', 0, 127.57573942768178, 5, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (184, 1, CAST(806781.3552039601 AS Decimal(18, 10)), 114, N'room', 0, 399.29767735191245, 3, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (185, 1, CAST(755467.6115039939 AS Decimal(18, 10)), 199, N'pent-house', 1, 123.80238838116487, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (186, 1, CAST(109035.4982524886 AS Decimal(18, 10)), 175, N'room', 0, 136.11159629865804, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (187, 1, CAST(258308.7825565316 AS Decimal(18, 10)), 105, N'appartment', 0, 77.337794396933148, 4, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (188, 1, CAST(865504.6706400935 AS Decimal(18, 10)), 126, N'appartment', 1, 136.11850151504933, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (189, 1, CAST(540483.0660833834 AS Decimal(18, 10)), 274, N'appartment', 0, 378.16184434212119, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (190, 1, CAST(879940.6618750127 AS Decimal(18, 10)), 116, N'appartment', 0, 41.209910515595766, 4, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (191, 1, CAST(91537.9151663503 AS Decimal(18, 10)), 189, N'appartment', 1, 326.35524853624042, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (192, 1, CAST(424896.2914429367 AS Decimal(18, 10)), 184, N'appartment', 0, 126.03449386061773, 1, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (193, 1, CAST(56359.8837561268 AS Decimal(18, 10)), 151, N'pent-house', 1, 154.58555505376103, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (194, 1, CAST(375703.5772139632 AS Decimal(18, 10)), 244, N'pent-house', 1, 239.49466917342011, 4, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (195, 1, CAST(938818.0380573873 AS Decimal(18, 10)), 224, N'pent-house', 1, 287.82598275797955, 2, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (196, 1, CAST(751685.1720274962 AS Decimal(18, 10)), 261, N'appart house', 1, 118.21251563508903, 1, 3)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (197, 1, CAST(923977.8232064801 AS Decimal(18, 10)), 163, N'appartment', 0, 257.57915282414388, 2, 1)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (198, 1, CAST(740744.8832419444 AS Decimal(18, 10)), 213, N'appart house', 1, 298.28193594411431, 3, 2)
INSERT [dbo].[sat_estate] ([id], [availability], [price], [parking_capacity], [type], [pets_allowed], [floor_space], [number_of_bedrooms], [number_of_bathrooms]) VALUES (199, 1, CAST(139878.9331520391 AS Decimal(18, 10)), 285, N'appartment', 0, 45.276018839821482, 3, 1)
GO
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (0, N'Howden Quay', 13, 194)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (1, N'White Horse Limes', 10, 225)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (2, N'Waltham Estate', 11, 105)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (3, N'Leamington Pastures', 16, 35)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (4, N'Lucerne Park', 3, 118)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (5, N'Sheridan Street', 4, 1271)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (6, N'Hillary Buildings', 15, 519)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (7, N'Bowness Boulevard', 18, 1461)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (8, N'Waveney Paddocks', 14, 565)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (9, N'Brown Mount', 11, 607)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (10, N'Laxton Avenue', 4, 1305)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (11, N'Lucerne Park', 12, 712)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (12, N'Sandy Path', 18, 1020)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (13, N'Bourne Isaf', 9, 847)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (14, N'Hillary Buildings', 1, 304)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (15, N'Oswald Wharf', 14, 1382)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (16, N'Nether End', 16, 1152)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (17, N'Granary Ridgeway', 1, 134)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (18, N'Edinburgh Mead', 6, 9)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (19, N'Moat Reach', 12, 914)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (20, N'Brown Courtyard', 9, 1400)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (21, N'Hadley Dell', 14, 879)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (22, N'Bourne Isaf', 7, 549)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (23, N'Pier Estate', 17, 1470)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (24, N'Waveney Paddocks', 14, 1253)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (25, N'Sheridan Street', 11, 853)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (26, N'New Park Hey', 1, 987)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (27, N'Nether End', 1, 1301)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (28, N'Farley Road', 14, 1167)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (29, N'Dolphin Esplanade', 18, 1405)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (30, N'Chadwick Cottages', 19, 299)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (31, N'Hunters Dene', 15, 504)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (32, N'Wheatfield Moorings', 5, 980)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (33, N'Chadwick Cottages', 12, 617)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (34, N'Sheridan Street', 2, 1400)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (35, N'Chadwick Cottages', 20, 348)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (36, N'Millbrook Fields', 6, 800)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (37, N'Bourne Isaf', 10, 795)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (38, N'Twyford Close', 20, 1035)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (39, N'Bradford Wharf', 9, 2)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (40, N'Bronte Drift', 3, 1455)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (41, N'Denbigh Isaf', 18, 1138)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (42, N'Laxton Avenue', 4, 1152)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (43, N'Sherbourne Place', 10, 100)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (44, N'Dolphin Esplanade', 11, 348)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (45, N'Moat Royd', 12, 428)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (46, N'Victory Covert', 19, 145)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (47, N'Victory Covert', 4, 840)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (48, N'Edinburgh Mead', 6, 473)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (49, N'Hunters Dene', 14, 647)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (50, N'Leonard Heats', 17, 1216)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (51, N'Hillary Buildings', 14, 897)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (52, N'Walden CelynNorthcote Brook', 8, 1216)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (53, N'Highgrove Court', 20, 390)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (54, N'Walden CelynNorthcote Brook', 5, 740)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (55, N'Waveney Paddocks', 9, 1113)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (56, N'Irvine Ride', 20, 7)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (57, N'Granary Ridgeway', 10, 379)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (58, N'Laurel Grove', 2, 1223)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (59, N'Tunstall Bank', 14, 299)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (60, N'Arran Pines', 5, 768)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (61, N'Millbrook Fields', 8, 642)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (62, N'Webb Villas', 11, 1136)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (63, N'Poppy Banks', 11, 1426)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (64, N'Roebuck Oak', 6, 447)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (65, N'Webb Villas', 17, 684)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (66, N'Roebuck Oak', 10, 310)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (67, N'Farley Road', 3, 1404)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (68, N'Brown Mount', 2, 816)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (69, N'Hadley Dell', 6, 937)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (70, N'Sherbourne Place', 17, 909)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (71, N'Carisbrooke Hills', 5, 44)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (72, N'Spinney Maltings', 16, 787)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (73, N'Brooks Leas', 20, 1146)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (74, N'Walden CelynNorthcote Brook', 4, 493)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (75, N'Newlyn Estate', 16, 1430)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (76, N'Wheatfield Moorings', 13, 157)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (77, N'Denbigh Isaf', 3, 1440)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (78, N'Highgate Meadow', 7, 994)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (79, N'Tunstall Bank', 20, 1476)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (80, N'Florence Dell', 4, 1097)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (81, N'Bradford Wharf', 4, 859)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (82, N'Cranbourne Oak', 1, 1106)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (83, N'Oaks Knoll', 19, 136)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (84, N'Millbrook Fields', 20, 490)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (85, N'Waveney Wynd', 13, 1007)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (86, N'Plantation Yard', 12, 730)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (87, N'Highgate Meadow', 7, 1078)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (88, N'Lucerne Park', 8, 1427)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (89, N'Brown Mount', 3, 872)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (90, N'Hill Top Mews', 3, 72)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (91, N'Richardson Pines', 15, 419)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (92, N'Newlyn Estate', 1, 1197)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (93, N'Irvine Ride', 19, 1096)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (94, N'Anson Laurels', 17, 1343)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (95, N'Sparrow Meadow', 14, 249)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (96, N'Fitzwilliam Woodlands', 10, 1376)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (97, N'Faraday Cloisters', 16, 1028)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (98, N'Millbrook Fields', 5, 222)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (99, N'Oaks Knoll', 7, 1456)
GO
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (100, N'Poppy Banks', 3, 382)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (101, N'Chadwick Cottages', 18, 537)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (102, N'Neptune Brambles', 5, 95)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (103, N'Primrose Heights', 6, 544)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (104, N'Pilgrims Drive', 18, 474)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (105, N'Hill Top Mews', 7, 1022)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (106, N'Wheatfield Moorings', 1, 989)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (107, N'Faraday Cloisters', 20, 702)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (108, N'Richardson Pines', 12, 1361)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (109, N'Southlands Oval', 2, 176)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (110, N'New Park Hey', 7, 1036)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (111, N'Dolphin Esplanade', 14, 887)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (112, N'Howden Quay', 5, 398)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (113, N'Hunters Dene', 7, 998)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (114, N'Bradford Wharf', 9, 1471)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (115, N'Brown Mount', 19, 1017)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (116, N'Sylvan Passage', 3, 1272)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (117, N'Howden Quay', 20, 286)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (118, N'Ashburnham Willows', 10, 1459)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (119, N'Atholl Hollow', 13, 1448)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (120, N'Twyford Close', 1, 696)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (121, N'Edmund Holt', 13, 149)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (122, N'Millbrook Fields', 20, 1328)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (123, N'Chadwick Cottages', 15, 1084)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (124, N'Waveney Paddocks', 3, 953)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (125, N'Oaks Knoll', 15, 497)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (126, N'Irvine Ride', 2, 862)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (127, N'Oswald Wharf', 5, 229)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (128, N'Wheatfield Moorings', 13, 1150)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (129, N'Sandy Path', 19, 1186)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (130, N'Fulford Bridge', 17, 960)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (131, N'Waveney Paddocks', 15, 2)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (132, N'Oaks Knoll', 3, 1485)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (133, N'Oswald Wharf', 8, 800)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (134, N'Chadwick Cottages', 15, 1092)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (135, N'Arran Pines', 8, 302)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (136, N'Primrose Heights', 3, 839)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (137, N'Stevens Warren', 9, 683)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (138, N'Hill Top Mews', 3, 157)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (139, N'Rochester Lea', 6, 1356)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (140, N'Pilgrims Drive', 3, 1028)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (141, N'Highgate Meadow', 14, 1074)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (142, N'Highgate Meadow', 17, 815)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (143, N'Anson Laurels', 12, 1028)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (144, N'Bell Leys', 20, 798)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (145, N'Wheatfield Moorings', 12, 391)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (146, N'Eagle Gait', 14, 1417)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (147, N'Southlands Oval', 9, 1488)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (148, N'Twyford Close', 20, 980)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (149, N'Princes Rise', 3, 181)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (150, N'Poppy Banks', 20, 995)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (151, N'Denbigh Isaf', 13, 49)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (152, N'Home Farm Reach', 19, 1062)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (153, N'Princes Rise', 13, 713)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (154, N'Chadwick Cottages', 10, 157)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (155, N'Oswald Wharf', 15, 80)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (156, N'Powell Lane', 19, 554)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (157, N'Waveney Wynd', 2, 423)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (158, N'Farm Las', 12, 487)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (159, N'Wellington Maltings', 6, 595)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (160, N'Oban South', 20, 767)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (161, N'Twyford Close', 14, 929)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (162, N'Sparrow Meadow', 11, 980)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (163, N'Bell Leys', 9, 496)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (164, N'Sandy Path', 2, 749)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (165, N'Irvine Ride', 17, 667)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (166, N'Hillary Buildings', 3, 968)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (167, N'Lucerne Park', 7, 1469)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (168, N'Denbigh Isaf', 18, 267)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (169, N'Pilgrims Drive', 4, 576)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (170, N'Dolphin Esplanade', 9, 44)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (171, N'Leamington Pastures', 10, 622)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (172, N'Nether End', 5, 336)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (173, N'Edmund Holt', 6, 1379)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (174, N'Stevens Warren', 10, 838)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (175, N'Webb Villas', 18, 942)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (176, N'Lucerne Park', 8, 1476)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (177, N'Walden CelynNorthcote Brook', 19, 433)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (178, N'Poppy Banks', 14, 64)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (179, N'Fitzwilliam Woodlands', 16, 530)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (180, N'Highgrove Court', 2, 1037)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (181, N'Moat Royd', 9, 669)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (182, N'Hill Top Mews', 19, 1308)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (183, N'Alnwick Walk', 1, 206)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (184, N'Newlyn Estate', 12, 1086)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (185, N'Irvine Ride', 4, 339)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (186, N'Howden Quay', 16, 977)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (187, N'Hill Top Mews', 17, 289)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (188, N'Oaks Knoll', 16, 142)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (189, N'Churchfield Alley', 19, 1236)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (190, N'Bell Leys', 1, 768)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (191, N'Rochester Lea', 1, 1092)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (192, N'Poppy Banks', 15, 961)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (193, N'Highgrove Court', 11, 280)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (194, N'Twyford Close', 16, 889)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (195, N'Powell Lane', 10, 1237)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (196, N'Webb Villas', 5, 563)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (197, N'Pennine Drove', 7, 593)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (198, N'Bowness Boulevard', 1, 1259)
INSERT [dbo].[sat_place] ([id], [street], [house], [appartment]) VALUES (199, N'Hunters Dene', 20, 1375)
GO
INSERT [dbo].[sat_user] ([id], [username], [password], [DOR]) VALUES (0, N'test                                              ', N'test                                              ', CAST(N'2020-06-05' AS Date))
INSERT [dbo].[sat_user] ([id], [username], [password], [DOR]) VALUES (1, N'test1                                             ', N'test1                                             ', CAST(N'2020-06-05' AS Date))
INSERT [dbo].[sat_user] ([id], [username], [password], [DOR]) VALUES (2, N'test2                                             ', N'test2                                             ', CAST(N'2020-06-08' AS Date))
INSERT [dbo].[sat_user] ([id], [username], [password], [DOR]) VALUES (3, N'pavel                                             ', N'petrov                                            ', CAST(N'2020-06-10' AS Date))
INSERT [dbo].[sat_view_history] ([id], [date]) VALUES (0, CAST(N'2020-06-10' AS Date))
ALTER TABLE [dbo].[link_country_city]  WITH CHECK ADD  CONSTRAINT [FK_link_country_city_hub_city] FOREIGN KEY([id_city])
REFERENCES [dbo].[hub_city] ([id])
GO
ALTER TABLE [dbo].[link_country_city] CHECK CONSTRAINT [FK_link_country_city_hub_city]
GO
ALTER TABLE [dbo].[link_country_city]  WITH CHECK ADD  CONSTRAINT [FK_link_country_city_hub_country] FOREIGN KEY([country_code])
REFERENCES [dbo].[hub_country] ([country_code])
GO
ALTER TABLE [dbo].[link_country_city] CHECK CONSTRAINT [FK_link_country_city_hub_country]
GO
ALTER TABLE [dbo].[link_estate_contract]  WITH CHECK ADD  CONSTRAINT [FK_link_estate_contract_hub_contracts] FOREIGN KEY([contract_id])
REFERENCES [dbo].[hub_contracts] ([id])
GO
ALTER TABLE [dbo].[link_estate_contract] CHECK CONSTRAINT [FK_link_estate_contract_hub_contracts]
GO
ALTER TABLE [dbo].[link_estate_contract]  WITH CHECK ADD  CONSTRAINT [FK_link_estate_contract_hub_estate] FOREIGN KEY([estate_id])
REFERENCES [dbo].[hub_estate] ([id])
GO
ALTER TABLE [dbo].[link_estate_contract] CHECK CONSTRAINT [FK_link_estate_contract_hub_estate]
GO
ALTER TABLE [dbo].[link_estate_history]  WITH CHECK ADD  CONSTRAINT [FK_link_estate_history_hub_estate] FOREIGN KEY([id_estate])
REFERENCES [dbo].[hub_estate] ([id])
GO
ALTER TABLE [dbo].[link_estate_history] CHECK CONSTRAINT [FK_link_estate_history_hub_estate]
GO
ALTER TABLE [dbo].[link_estate_history]  WITH CHECK ADD  CONSTRAINT [FK_link_estate_history_hub_view_history] FOREIGN KEY([id_history])
REFERENCES [dbo].[hub_view_history] ([id])
GO
ALTER TABLE [dbo].[link_estate_history] CHECK CONSTRAINT [FK_link_estate_history_hub_view_history]
GO
ALTER TABLE [dbo].[link_estate_place]  WITH CHECK ADD  CONSTRAINT [FK_link_estate_place_hub_estate] FOREIGN KEY([id_estate])
REFERENCES [dbo].[hub_estate] ([id])
GO
ALTER TABLE [dbo].[link_estate_place] CHECK CONSTRAINT [FK_link_estate_place_hub_estate]
GO
ALTER TABLE [dbo].[link_estate_place]  WITH CHECK ADD  CONSTRAINT [FK_link_estate_place_hub_place] FOREIGN KEY([id_place])
REFERENCES [dbo].[hub_place] ([id])
GO
ALTER TABLE [dbo].[link_estate_place] CHECK CONSTRAINT [FK_link_estate_place_hub_place]
GO
ALTER TABLE [dbo].[link_place_city]  WITH CHECK ADD  CONSTRAINT [FK_link_place_city_hub_city] FOREIGN KEY([id_city])
REFERENCES [dbo].[hub_city] ([id])
GO
ALTER TABLE [dbo].[link_place_city] CHECK CONSTRAINT [FK_link_place_city_hub_city]
GO
ALTER TABLE [dbo].[link_place_city]  WITH CHECK ADD  CONSTRAINT [FK_link_place_city_hub_place] FOREIGN KEY([id_place])
REFERENCES [dbo].[hub_place] ([id])
GO
ALTER TABLE [dbo].[link_place_city] CHECK CONSTRAINT [FK_link_place_city_hub_place]
GO
ALTER TABLE [dbo].[link_user_history]  WITH CHECK ADD  CONSTRAINT [FK_link_user_history_hub_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[hub_user] ([id])
GO
ALTER TABLE [dbo].[link_user_history] CHECK CONSTRAINT [FK_link_user_history_hub_user]
GO
ALTER TABLE [dbo].[link_user_history]  WITH CHECK ADD  CONSTRAINT [FK_link_user_history_hub_view_history] FOREIGN KEY([id_view_history])
REFERENCES [dbo].[hub_view_history] ([id])
GO
ALTER TABLE [dbo].[link_user_history] CHECK CONSTRAINT [FK_link_user_history_hub_view_history]
GO
ALTER TABLE [dbo].[sat_city]  WITH CHECK ADD  CONSTRAINT [FK_sat_city_hub_city] FOREIGN KEY([id])
REFERENCES [dbo].[hub_city] ([id])
GO
ALTER TABLE [dbo].[sat_city] CHECK CONSTRAINT [FK_sat_city_hub_city]
GO
ALTER TABLE [dbo].[sat_contracts]  WITH CHECK ADD  CONSTRAINT [FK_sat_contracts_hub_contracts] FOREIGN KEY([id])
REFERENCES [dbo].[hub_contracts] ([id])
GO
ALTER TABLE [dbo].[sat_contracts] CHECK CONSTRAINT [FK_sat_contracts_hub_contracts]
GO
ALTER TABLE [dbo].[sat_country]  WITH CHECK ADD  CONSTRAINT [FK_sat_country_hub_country] FOREIGN KEY([country_code])
REFERENCES [dbo].[hub_country] ([country_code])
GO
ALTER TABLE [dbo].[sat_country] CHECK CONSTRAINT [FK_sat_country_hub_country]
GO
ALTER TABLE [dbo].[sat_estate]  WITH CHECK ADD  CONSTRAINT [FK_sat_estate_hub_estate] FOREIGN KEY([id])
REFERENCES [dbo].[hub_estate] ([id])
GO
ALTER TABLE [dbo].[sat_estate] CHECK CONSTRAINT [FK_sat_estate_hub_estate]
GO
ALTER TABLE [dbo].[sat_place]  WITH CHECK ADD  CONSTRAINT [FK_sat_place_hub_place] FOREIGN KEY([id])
REFERENCES [dbo].[hub_place] ([id])
GO
ALTER TABLE [dbo].[sat_place] CHECK CONSTRAINT [FK_sat_place_hub_place]
GO
ALTER TABLE [dbo].[sat_user]  WITH CHECK ADD  CONSTRAINT [FK_sat_user_hub_user] FOREIGN KEY([id])
REFERENCES [dbo].[hub_user] ([id])
GO
ALTER TABLE [dbo].[sat_user] CHECK CONSTRAINT [FK_sat_user_hub_user]
GO
ALTER TABLE [dbo].[sat_view_history]  WITH CHECK ADD  CONSTRAINT [FK_sat_view_history_hub_view_history] FOREIGN KEY([id])
REFERENCES [dbo].[hub_view_history] ([id])
GO
ALTER TABLE [dbo].[sat_view_history] CHECK CONSTRAINT [FK_sat_view_history_hub_view_history]
GO
/****** Object:  StoredProcedure [dbo].[FindEstate]    Script Date: 10.06.2020 19:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindEstate]
    @priceunder decimal(18,10),
    @type NVARCHAR(50),
    @numberofbedrooms INT,
	@petsallowed bit,
    @floor_space float
AS
select price, parking_capacity, type, pets_allowed, floor_space, number_of_bedrooms, number_of_bathrooms, street, house, appartment
From sat_estate
join link_estate_place on
id_estate = sat_estate.id
join sat_place on
id_place = sat_place.id
where price <= @priceunder and type = @type and number_of_bedrooms >= @numberofbedrooms and pets_allowed = @petsallowed and floor_space >= @floor_space

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sat_contracts"
            Begin Extent = 
               Top = 194
               Left = 153
               Bottom = 360
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "link_estate_contract"
            Begin Extent = 
               Top = 10
               Left = 391
               Bottom = 176
               Right = 648
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hub_estate"
            Begin Extent = 
               Top = 10
               Left = 715
               Bottom = 144
               Right = 972
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sat_estate"
            Begin Extent = 
               Top = 10
               Left = 1039
               Bottom = 348
               Right = 1358
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hub_contracts"
            Begin Extent = 
               Top = 10
               Left = 67
               Bottom = 144
               Right = 324
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "link_estate_place"
            Begin Extent = 
               Top = 10
               Left = 1425
               Bottom = 176
               Right = 1682
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hub_place"
            Begin Extent = 
               Top = 10
               Left = 1749
               Bottom = 144
               Right = 2006' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContractInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sat_place"
            Begin Extent = 
               Top = 165
               Left = 1619
               Bottom = 395
               Right = 1876
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 857
         Width = 1123
         Width = 857
         Width = 857
         Width = 1851
         Width = 857
         Width = 857
         Width = 857
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContractInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContractInfo'
GO
USE [master]
GO
ALTER DATABASE [course_work] SET  READ_WRITE 
GO
