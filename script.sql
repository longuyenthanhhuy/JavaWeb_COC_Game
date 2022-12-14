USE [master]
GO
/****** Object:  Database [PRJ301_SE1630]    Script Date: 7/20/2022 5:09:41 PM ******/
CREATE DATABASE [PRJ301_SE1630] ON  PRIMARY 
( NAME = N'AssPRJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AssPRJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssPRJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AssPRJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SE1630].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SE1630] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_SE1630] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SE1630] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SE1630] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SE1630] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1630] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1630] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SE1630] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SE1630] SET DB_CHAINING OFF 
GO
USE [PRJ301_SE1630]
GO
/****** Object:  Table [dbo].[account_HE169003]    Script Date: 7/20/2022 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_HE169003](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[displayName] [varchar](255) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_HE169003]    Script Date: 7/20/2022 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_HE169003](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail_HE169003]    Script Date: 7/20/2022 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail_HE169003](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders_HE169003]    Script Date: 7/20/2022 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders_HE169003](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_HE169003]    Script Date: 7/20/2022 5:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_HE169003](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[description] [nvarchar](500) NULL,
	[image] [nvarchar](255) NULL,
	[create_date] [date] NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account_HE169003] ON 

INSERT [dbo].[account_HE169003] ([id], [username], [password], [email], [displayName], [role]) VALUES (1, N'admin', N'huy4112002', N'htlvnsid@gmail.com', N'thanhhuy', N'ADMIN')
INSERT [dbo].[account_HE169003] ([id], [username], [password], [email], [displayName], [role]) VALUES (2, N'user', N'huy4112002', N'htlvnsid2@gmail.com', N'user', N'USER')
INSERT [dbo].[account_HE169003] ([id], [username], [password], [email], [displayName], [role]) VALUES (15, N'thanhhuy', N'huy4112002', N'htlvnsid@gmail.com', N'jiancoc', N'USER')
INSERT [dbo].[account_HE169003] ([id], [username], [password], [email], [displayName], [role]) VALUES (16, N'thanhhuyokechua', N'huy4112002', N'htlvnsid@gmail.com', N'thacc411', N'USER')
INSERT [dbo].[account_HE169003] ([id], [username], [password], [email], [displayName], [role]) VALUES (17, N'vanlam', N'huy4112002', N'htlvnsid@gmail.com', N'valam1', N'USER')
SET IDENTITY_INSERT [dbo].[account_HE169003] OFF
GO
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (1, N'action')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (2, N'adventure')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (3, N'simulation')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (4, N'strategy')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (5, N'puzzle')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (6, N'casual')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (7, N'board game')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (8, N'excergame')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (9, N'role playing game')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (10, N'real time strategy')
INSERT [dbo].[category_HE169003] ([id], [name]) VALUES (11, N'sports')
GO
SET IDENTITY_INSERT [dbo].[order_detail_HE169003] ON 

INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (18, 32, 20)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (19, 32, 19)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (20, 32, 18)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (21, 32, 23)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (22, 32, 22)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (25, 34, 18)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (26, 34, 19)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (27, 34, 20)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (28, 34, 17)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (29, 34, 16)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (30, 34, 15)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (31, 34, 14)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (32, 34, 13)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (33, 34, 12)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (34, 34, 44)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (35, 34, 43)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (36, 34, 42)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (37, 34, 41)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (38, 34, 40)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (39, 35, 11)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (40, 36, 11)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (43, 37, 11)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (44, 38, 17)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (45, 38, 16)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (46, 38, 15)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (47, 38, 22)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (48, 38, 21)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (49, 38, 23)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (50, 39, 14)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (51, 40, 14)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (52, 41, 14)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (53, 41, 13)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (54, 41, 16)
INSERT [dbo].[order_detail_HE169003] ([id], [order_id], [product_id]) VALUES (55, 41, 17)
SET IDENTITY_INSERT [dbo].[order_detail_HE169003] OFF
GO
SET IDENTITY_INSERT [dbo].[orders_HE169003] ON 

INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (26, 1, 246.60000610351563, CAST(N'2022-06-24' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (27, 2, 338.89999389648438, CAST(N'2022-06-26' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (28, 2, 213.89999389648438, CAST(N'2022-06-27' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (29, 1, 140.80000305175781, CAST(N'2022-06-27' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (30, 1, 460.20001220703125, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (31, 2, 308.60000610351562, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (32, 1, 256.39999389648438, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (33, 2, 116.90000152587891, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (34, 2, 633, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (35, 15, 80.5, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (36, 16, 80.5, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (37, 16, 199.80000305175781, CAST(N'2022-07-06' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (38, 2, 327.60000610351562, CAST(N'2022-07-06' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (39, 1, 61.299999237060547, CAST(N'2022-07-06' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (40, 1, 61.299999237060547, CAST(N'2022-07-16' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (41, 1, 230.60000610351563, CAST(N'2022-07-16' AS Date))
INSERT [dbo].[orders_HE169003] ([id], [account_id], [totalPrice], [create_date]) VALUES (42, 1, 32.5, CAST(N'2022-07-16' AS Date))
SET IDENTITY_INSERT [dbo].[orders_HE169003] OFF
GO
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (11, N'ban la toi', 11.5, N'Puncture wound without foreign body of right shoulder, initial encounter', N'images/image_game/game_1/anh4.jpg', CAST(N'2022-05-20' AS Date), 11)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (12, N'Latlux', 14.3, N'Poisoning by salicylates, assault, initial encounter', N'images/image_game/game_1/anh5.jpg', CAST(N'2022-07-16' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (13, N'taiwan', 35.6, N'Secondary osteoarthritis, unspecified site', N'images/image_game/game_1/anh6.jpg', CAST(N'2022-02-20' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (14, N'Trippledex', 61.3, N'Osseous stenosis of neural canal of abdomen and other regions', N'images/image_game/game_2/anh2.jpg', CAST(N'2022-03-30' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (15, N'Fintone', 17.9, N'Pressure ulcer of head', N'images/image_game/game_2/anh3.jpg', CAST(N'2022-06-25' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (16, N'Asoka', 52.4, N'Drug or chemical induced diabetes mellitus with moderate nonproliferative diabetic retinopathy without macular edema, right eye', N'images/image_game/game_2/anh4.jpg', CAST(N'2022-05-08' AS Date), 5)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (17, N'Span', 81.3, N'Other specified fracture of left ischium, sequela', N'images/image_game/game_2/anh5.jpg', CAST(N'2022-05-22' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (18, N'Konklab', 53.3, N'Displacement of carotid arterial graft (bypass), sequela', N'images/image_game/game_2/anh6.jpg', CAST(N'2022-01-11' AS Date), 11)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (19, N'Tres-Zap', 77.6, N'Unspecified injury of extensor or abductor muscles, fascia and tendons of right thumb at forearm level', N'images/image_game/game_2/anh7.jpg', CAST(N'2022-01-05' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (20, N'Matsoft', 14.1, N'Unspecified injury of extensor muscle, fascia and tendon of right thumb at wrist and hand level, sequela', N'images/image_game/game_3/anh2.jpg', CAST(N'2022-07-29' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (21, N'Overhold', 64.6, N'Poisoning by smallpox vaccines, intentional self-harm, subsequent encounter', N'images/image_game/game_3/anh3.jpg', CAST(N'2022-07-22' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (22, N'Tempsoft', 13.5, N'Unspecified fracture of shaft of unspecified tibia, initial encounter for open fracture type IIIA, IIIB, or IIIC', N'images/image_game/game_3/anh4.jpg', CAST(N'2022-04-12' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (23, N'Tresom', 97.9, N'Toxic effect of beryllium and its compounds, accidental (unintentional), initial encounter', N'images/image_game/game_3/anh5.jpg', CAST(N'2022-01-19' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (24, N'Treeflex', 62.7, N'Laceration of muscle, fascia and tendon of triceps, right arm, subsequent encounter', N'images/image_game/game_3/anh6.png', CAST(N'2022-05-12' AS Date), 10)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (25, N'Domainer', 95.3, N'Person on outside of heavy transport vehicle injured in collision with car, pick-up truck or van in nontraffic accident, initial encounter', N'images/image_game/game_4/anh2.jpg', CAST(N'2022-06-24' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (26, N'Biodex', 81.7, N'Toxic effect of cadmium and its compounds, accidental (unintentional)', N'images/image_game/game_4/anh3.jpg', CAST(N'2022-01-10' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (27, N'Cardguard', 53.6, N'Puncture wound with foreign body of right little finger with damage to nail, sequela', N'images/image_game/game_4/anh4.jpg', CAST(N'2022-06-26' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (28, N'Fintone', 67.3, N'Traumatic compartment syndrome of right lower extremity, subsequent encounter', N'images/image_game/game_4/anh5.jpg', CAST(N'2022-06-14' AS Date), 8)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (29, N'Bytecard', 93.4, N'Poisoning by tetracyclic antidepressants, intentional self-harm, subsequent encounter', N'images/image_game/game_4/anh6.jpg', CAST(N'2022-01-19' AS Date), 2)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (30, N'Domainer', 35.5, N'Toxic effect of chewing tobacco, intentional self-harm, subsequent encounter', N'images/image_game/game_5/anh2.jpg', CAST(N'2022-07-28' AS Date), 5)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (31, N'Otcom', 35.5, N'Bacteremia', N'images/image_game/game_5/anh3.jpg', CAST(N'2022-06-27' AS Date), 7)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (32, N'Tin', 85.2, N'Corrosion of first degree of left elbow', N'images/image_game/game_5/anh4.jpg', CAST(N'2022-06-04' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (33, N'Trippledex', 20.1, N'Contusion of left front wall of thorax, sequela', N'images/image_game/game_5/anh5.jpg', CAST(N'2022-06-19' AS Date), 2)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (34, N'Biodex', 39, N'Type 2 diabetes mellitus with mild nonproliferative diabetic retinopathy with macular edema, unspecified eye', N'images/image_game/game_5/anh6.jpg', CAST(N'2022-02-04' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (35, N'Toughjoyfax', 33.9, N'Type 1 diabetes mellitus with severe nonproliferative diabetic retinopathy with macular edema, bilateral', N'images/image_game/game_5/anh7.jpg', CAST(N'2022-01-21' AS Date), 7)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (36, N'Andalax', 48.8, N'Poisoning by unspecified hormone antagonists, intentional self-harm, subsequent encounter', N'images/image_game/game_5/anh8.jpg', CAST(N'2022-04-25' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (37, N'Alpha', 94.3, N'Alcoholic cirrhosis of liver with ascites', N'images/image_game/game_6/anh2.jpg', CAST(N'2022-07-09' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (38, N'Konklab', 65.4, N'Coma scale, best motor response, obeys commands', N'images/image_game/game_6/anh3.jpg', CAST(N'2022-06-19' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (39, N'Holdlamis', 34.1, N'Nondisplaced fracture of neck of unspecified radius, subsequent encounter for open fracture type I or II with malunion', N'images/image_game/game_6/anh4.jpg', CAST(N'2022-02-22' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (40, N'Zamit', 83.7, N'Weeks of gestation of pregnancy, weeks 10-19', N'images/image_game/game_6/anh5.jpg', CAST(N'2022-06-27' AS Date), 8)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (41, N'Voyatouch', 38, N'Salter-Harris Type I physeal fracture of unspecified metatarsal, initial encounter for open fracture', N'images/image_game/game_6/anh6.jpg', CAST(N'2022-02-19' AS Date), 11)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (42, N'Zamit', 11.7, N'Puncture wound with foreign body of left index finger with damage to nail, subsequent encounter', N'images/image_game/game_6/anh7.jpg', CAST(N'2022-06-16' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (43, N'Zathin', 25.4, N'Pathological dislocation of unspecified wrist, not elsewhere classified', N'images/image_game/game_7/anh2.jpg', CAST(N'2022-01-10' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (44, N'Matsoft', 66.4, N'Other specified diabetes mellitus with proliferative diabetic retinopathy without macular edema, left eye', N'images/image_game/game_7/anh3.jpg', CAST(N'2022-06-13' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (45, N'Asoka', 71.9, N'Postprocedural seroma of eye and adnexa following other procedure, bilateral', N'images/image_game/game_7/anh4.jpg', CAST(N'2022-07-24' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (46, N'Toughjoyfax', 9.8, N'Other fracture of shaft of left tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', N'images/image_game/game_7/anh5.jpg', CAST(N'2022-03-29' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (47, N'Bitchip', 25.6, N'Postinfective membranous urethral stricture, not elsewhere classified', N'images/image_game/game_7/anh6.jpg', CAST(N'2022-03-29' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (48, N'Overhold', 65.2, N'Displaced subtrochanteric fracture of right femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion', N'images/image_game/game_7/anh7.jpg', CAST(N'2022-02-10' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (49, N'Zoolab', 98.3, N'Labor and delivery complicated by cord around neck, with compression, fetus 5', N'images/image_game/game_8/anh2.jpg', CAST(N'2022-07-05' AS Date), 8)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (50, N'Rank', 70.1, N'Defects in the complement system', N'images/image_game/game_8/anh3.jpg', CAST(N'2022-06-21' AS Date), 10)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (51, N'Kanlam', 98.5, N'Encounter for screening for diseases of the blood and blood-forming organs and certain disorders involving the immune mechanism', N'images/image_game/app_10/anh7.jpg', CAST(N'2022-01-24' AS Date), 7)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (52, N'Cookley', 72.7, N'Poisoning by succinimides and oxazolidinediones, undetermined', N'images/image_game/app_10/anh6.png', CAST(N'2022-06-26' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (53, N'Temp', 70.5, N'Garden or yard on military base as the place of occurrence of the external cause', N'images/image_game/app_10/anh5.jpg', CAST(N'2022-06-06' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (54, N'Opela', 43.8, N'Other malformation of placenta, first trimester', N'images/image_game/app_10/anh4.jpg', CAST(N'2022-01-19' AS Date), 10)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (55, N'Transcof', 76.3, N'Reiter''s disease, unspecified hand', N'images/image_game/app_10/anh3.jpg', CAST(N'2022-02-10' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (56, N'Tresom', 34.2, N'Congenital non-neoplastic nevus', N'images/image_game/app_10/anh2.jpg', CAST(N'2022-06-22' AS Date), 2)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (57, N'Namfix', 98.7, N'War operations involving explosion of sea-based artillery shell', N'images/image_game/app_9/anh5.jpg', CAST(N'2022-03-01' AS Date), 2)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (58, N'Stim', 48.2, N'Myositis ossificans progressiva, left foot', N'images/image_game/app_9/anh4.jpg', CAST(N'2022-02-14' AS Date), 8)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (59, N'Bamity', 59.2, N'Salter-Harris Type III physeal fracture of upper end of left tibia, subsequent encounter for fracture with nonunion', N'images/image_game/app_9/anh3.jpg', CAST(N'2022-07-20' AS Date), 2)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (60, N'Fix San', 8.7, N'Other bursal cyst, shoulder', N'images/image_game/app_9/anh2.jpg', CAST(N'2022-06-18' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (61, N'Latlux', 18.2, N'Contact with alligator', N'images/image_game/app_8/anh6.jpg', CAST(N'2022-01-18' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (62, N'Hatity', 46.3, N'Displaced simple supracondylar fracture without intercondylar fracture of left humerus, initial encounter for open fracture', N'images/image_game/app_8/anh5.jfif', CAST(N'2022-05-06' AS Date), 7)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (63, N'Fixflex', 85.8, N'Unspecified injury of face', N'images/image_game/app_8/anh4.jpeg', CAST(N'2022-01-15' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (64, N'Bitwolf', 21.2, N'Sprain of other ligament of unspecified ankle, sequela', N'images/image_game/app_8/anh3.jpg', CAST(N'2022-07-23' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (65, N'Stronghold', 70.6, N'Supervision of pregnancy with history of molar pregnancy, first trimester', N'images/image_game/app_8/anh2.jpeg', CAST(N'2022-02-17' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (66, N'Vagram', 56.1, N'Traumatic rupture of unspecified ligament of unspecified finger at metacarpophalangeal and interphalangeal joint, subsequent encounter', N'images/image_game/app_7/anh5.jpg', CAST(N'2022-07-24' AS Date), 11)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (67, N'Y-Solowarm', 10.9, N'Other secondary cataract, bilateral', N'images/image_game/app_7/anh4.jpg', CAST(N'2022-06-13' AS Date), 11)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (68, N'Veribet', 99.4, N'Pathological fracture, right radius, subsequent encounter for fracture with delayed healing', N'images/image_game/app_7/anh3.jpg', CAST(N'2022-01-21' AS Date), 11)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (69, N'Y-find', 31.1, N'Burn of respiratory tract, part unspecified, subsequent encounter', N'images/image_game/app_7/anh2.jpg', CAST(N'2022-06-21' AS Date), 7)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (70, N'Matsoft', 56.9, N'Unspecified war operations occurring after cessation of hostilities, military personnel, initial encounter', N'images/image_game/app_6/anh6.jpg', CAST(N'2022-06-10' AS Date), 2)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (71, N'Zoolab', 75.1, N'Poisoning by other synthetic narcotics, undetermined', N'images/image_game/app_6/anh5.jpg', CAST(N'2022-01-21' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (72, N'It', 71.5, N'Unspecified physeal fracture of upper end of radius, unspecified arm, subsequent encounter for fracture with delayed healing', N'images/image_game/app_6/anh4.jpg', CAST(N'2022-02-06' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (73, N'Pannier', 9.6, N'Nondisplaced fracture of middle third of navicular [scaphoid] bone of unspecified wrist, initial encounter for closed fracture', N'images/image_game/app_6/anh3.jpg', CAST(N'2022-04-24' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (74, N'Aerified', 83.5, N'Reiter''s disease, knee', N'images/image_game/app_6/anh2.jpg', CAST(N'2022-04-28' AS Date), 8)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (75, N'Duobam', 74.1, N'Passenger in pick-up truck or van injured in collision with car, pick-up truck or van in nontraffic accident', N'images/image_game/app_5/anh5.png', CAST(N'2022-06-23' AS Date), 8)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (76, N'Wrapsafe', 60.8, N'Spasm of accommodation, unspecified eye', N'images/image_game/app_5/anh4.jpg', CAST(N'2022-03-25' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (77, N'Bitwolf', 50.4, N'Displaced segmental fracture of shaft of right fibula, subsequent encounter for closed fracture with nonunion', N'images/image_game/app_5/anh3.jpg', CAST(N'2022-03-09' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (78, N'Mat Lam Tam', 97.1, N'Poisoning by other agents primarily affecting gastrointestinal system, accidental (unintentional), initial encounter', N'images/image_game/app_5/anh2.jpg', CAST(N'2022-07-06' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (79, N'Overhold', 46.9, N'Complication of other artery following a procedure, not elsewhere classified', N'images/image_game/app_4/anh6.jpg', CAST(N'2022-03-09' AS Date), 7)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (80, N'Transcof', 6.8, N'Laceration of unspecified muscles, fascia and tendons at thigh level, left thigh, sequela', N'images/image_game/app_4/anh5.jpg', CAST(N'2022-07-13' AS Date), 2)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (81, N'Cardguard', 82.8, N'Lateral dislocation of proximal end of tibia, left knee', N'images/image_game/app_4/anh4.jpg', CAST(N'2022-05-10' AS Date), 10)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (82, N'Lotlux', 21.2, N'Pathological fracture, left hand, subsequent encounter for fracture with routine healing', N'images/image_game/app_4/anh3.jpg', CAST(N'2022-03-25' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (83, N'Hatity', 73.7, N'Toxic effect of 2-Propanol, intentional self-harm, subsequent encounter', N'images/image_game/app_4/anh2.jpg', CAST(N'2022-03-08' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (84, N'Daltfresh', 63.7, N'Dentofacial anomaly, unspecified', N'images/image_game/app_3/anh5.jpg', CAST(N'2022-01-14' AS Date), 5)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (85, N'Solarbreeze', 84.1, N'Subacute osteomyelitis, right radius and ulna', N'images/image_game/app_3/anh4.jpg', CAST(N'2022-05-30' AS Date), 5)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (86, N'Transcof', 39.6, N'Open bite, right foot, initial encounter', N'images/image_game/app_3/anh3.jpg', CAST(N'2022-06-27' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (87, N'Matsoft', 22, N'Occupant of railway train or railway vehicle injured in unspecified railway accident', N'images/image_game/app_3/anh2.jpg', CAST(N'2022-04-04' AS Date), 11)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (88, N'Alphazap', 26.4, N'Displaced fracture of olecranon process without intraarticular extension of right ulna, subsequent encounter for closed fracture with malunion', N'images/image_game/app_2/anh5.png', CAST(N'2022-02-25' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (89, N'Pannier', 80.2, N'Displaced fracture of base of neck of left femur, initial encounter for open fracture type IIIA, IIIB, or IIIC', N'images/image_game/app_2/anh4.jpg', CAST(N'2022-01-28' AS Date), 5)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (90, N'Temp', 70.8, N'Salter-Harris Type III physeal fracture of lower end of tibia', N'images/image_game/app_2/anh3.jpg', CAST(N'2022-05-10' AS Date), 9)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (91, N'Ventosanzap', 90.5, N'Adverse effect of carbonic-anhydrase inhibitors, benzothiadiazides and other diuretics, sequela', N'images/image_game/app_2/anh2.jpg', CAST(N'2022-03-01' AS Date), 3)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (92, N'Temp', 69, N'Dislocation of metacarpophalangeal joint of unspecified finger, sequela', N'images/image_game/app_1/anh6.jpg', CAST(N'2022-06-08' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (93, N'Cardguard', 81, N'Exposure to domestic wiring and appliances, sequela', N'images/image_game/app_1/anh5.jpg', CAST(N'2022-06-27' AS Date), 2)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (94, N'Sub-Ex', 85.7, N'Cystic meniscus, anterior horn of lateral meniscus, right knee', N'images/image_game/app_1/anh4.jpg', CAST(N'2022-07-08' AS Date), 4)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (95, N'Zaam-Dox', 56.2, N'Sprain of unspecified parts of right shoulder girdle, initial encounter', N'images/image_game/app_1/anh3.jpg', CAST(N'2022-06-23' AS Date), 5)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (96, N'Zoolab', 79.6, N'Other physeal fracture of upper end of radius, unspecified arm, subsequent encounter for fracture with malunion', N'images/image_game/app_1/anh2.jpg', CAST(N'2022-05-03' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (97, N'Span', 17.4, N'Injury of digital nerve of right ring finger, subsequent encounter', N'images/image_game/game_60/anh6.jpg', CAST(N'2022-02-19' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (98, N'Redhold', 74.4, N'External constriction, unspecified hip', N'images/image_game/game_60/anh5.jpg', CAST(N'2022-07-03' AS Date), 1)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (99, N'Domainer', 86.5, N'Child sexual abuse, suspected, subsequent encounter', N'images/image_game/game_60/anh4.jpg', CAST(N'2022-03-16' AS Date), 6)
INSERT [dbo].[products_HE169003] ([id], [name], [price], [description], [image], [create_date], [categoryID]) VALUES (100, N'Zathin', 96.6, N'Paratyphoid fever C', N'images/image_game/game_60/anh3.jpg', CAST(N'2022-06-13' AS Date), 8)
GO
ALTER TABLE [dbo].[account_HE169003] ADD  CONSTRAINT [DF_account_role]  DEFAULT ('USER') FOR [role]
GO
ALTER TABLE [dbo].[orders_HE169003] ADD  CONSTRAINT [DF_orders_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[order_detail_HE169003]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders_HE169003] ([id])
GO
ALTER TABLE [dbo].[order_detail_HE169003] CHECK CONSTRAINT [FK_order_detail_orders]
GO
ALTER TABLE [dbo].[order_detail_HE169003]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products_HE169003] ([id])
GO
ALTER TABLE [dbo].[order_detail_HE169003] CHECK CONSTRAINT [FK_order_detail_products]
GO
ALTER TABLE [dbo].[orders_HE169003]  WITH CHECK ADD  CONSTRAINT [FK_orders_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account_HE169003] ([id])
GO
ALTER TABLE [dbo].[orders_HE169003] CHECK CONSTRAINT [FK_orders_account]
GO
ALTER TABLE [dbo].[products_HE169003]  WITH CHECK ADD  CONSTRAINT [FK_products_category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[category_HE169003] ([id])
GO
ALTER TABLE [dbo].[products_HE169003] CHECK CONSTRAINT [FK_products_category]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SE1630] SET  READ_WRITE 
GO
