USE [master]
GO
/****** Object:  Database [MilkANDhoney]    Script Date: 12/6/2022 1:53:05 AM ******/
CREATE DATABASE [MilkANDhoney]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Database1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MilkANDhoney.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Database1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MilkANDhoney.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MilkANDhoney] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MilkANDhoney].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MilkANDhoney] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MilkANDhoney] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MilkANDhoney] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MilkANDhoney] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MilkANDhoney] SET ARITHABORT OFF 
GO
ALTER DATABASE [MilkANDhoney] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MilkANDhoney] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [MilkANDhoney] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MilkANDhoney] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MilkANDhoney] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MilkANDhoney] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MilkANDhoney] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MilkANDhoney] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MilkANDhoney] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MilkANDhoney] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MilkANDhoney] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MilkANDhoney] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MilkANDhoney] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MilkANDhoney] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MilkANDhoney] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MilkANDhoney] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MilkANDhoney] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MilkANDhoney] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MilkANDhoney] SET  MULTI_USER 
GO
ALTER DATABASE [MilkANDhoney] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MilkANDhoney] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MilkANDhoney] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MilkANDhoney] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MilkANDhoney] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MilkANDhoney] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MilkANDhoney', N'ON'
GO
ALTER DATABASE [MilkANDhoney] SET QUERY_STORE = OFF
GO
USE [MilkANDhoney]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/6/2022 1:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Oid] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
	[Odate] [nvarchar](50) NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/6/2022 1:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](60) NULL,
	[Gender] [nvarchar](6) NULL,
	[JoinedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/6/2022 1:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [nvarchar](50) NULL,
	[PDescription] [nvarchar](max) NULL,
	[PPrice] [decimal](18, 2) NULL,
	[PQuantity] [int] NULL,
	[PImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCart]    Script Date: 12/6/2022 1:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCart](
	[ShopCartID] [int] IDENTITY(1,1) NOT NULL,
	[Oid] [int] NOT NULL,
	[PID] [int] NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[PPrice] [decimal](18, 2) NOT NULL,
	[PTotal] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Oid], [PersonID], [Odate], [FullName], [Address]) VALUES (19, 5, N'Dec  6 2022  1:48AM', N'', N'')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([ID], [Name], [Email], [Password], [Gender], [JoinedDate]) VALUES (5, N'a', N'a', N'a', N'Male', CAST(N'2022-12-06T01:47:46.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (1, N'SCENT FREE FACIAL SUN CREAM - SPF30 50ML', N'High factor, scent-free SPF30 facial sun cream for sensitive skin', CAST(24.50 AS Decimal(18, 2)), 7, N'Products/G032-box-tube_26953ad2-6309-4332-8704-19e353f33cfe_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (2, N'SCENT FREE ANTI-AGEING 24-HOUR CREAM 50ML', N'An ultra-gentle anti-ageing moisturiser to soothe and nourish sensitive skin', CAST(23.50 AS Decimal(18, 2)), -4, N'Products/H002_BOX-50_002_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (3, N'NORDIC ROOTS HYALURONIC BOOSTER SERUM 28ML', N'A natural, scent free serum with hyaluronic acid for calm, dewy skin', CAST(30.00 AS Decimal(18, 2)), 0, N'Products/R102_7f1b6252-55b7-434b-ae89-61ee243799bf_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (4, N'AGE DEFY+ LIQUID GOLD TANNING DROPS 30ML', N'Natural and organic tanning drops for a perfect sun-kissed glow for face and body', CAST(35.00 AS Decimal(18, 2)), 199, N'Products/n059936x936_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (5, N'OY! CLEAR SKIN FOAMING FACE WASH 100ML', N'Foamy face wash for acne-prone teenage skin', CAST(15.00 AS Decimal(18, 2)), 33, N'Products/t002.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (14, N'OY! CLEAR SKIN CLEANSING MOISTURISER 50ML', N'Light, purifying organic moisturiser for teen skin', CAST(12.50 AS Decimal(18, 2)), 96, N'Products/t001-tube_box-50_3_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (15, N'AGE DEFY+ CELL ENRICH FACIAL OIL 30ML', N'A nutrient-rich facial oil which promotes cell regeneration and reduces wrinkles', CAST(40.00 AS Decimal(18, 2)), 74, N'Products/N014_BOX-30_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (16, N'AGE DEFY+ HYDRA-GLOW SLEEP MASK 50ML', N'A beauty-boosting, deeply hydrating face mask which rejuvenates skin overnight', CAST(37.00 AS Decimal(18, 2)), 90, N'Products/n054_2_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (26, N'GREEN PEOPLE FOR MEN ANTIOXIDANT REPAIR SERUM 50ML', N'Anti-ageing facial repair serum for men', CAST(22.00 AS Decimal(18, 2)), 22, N'Products/sdas2.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (27, N'OY! MY SKIN GOALS - SPECIAL EDITION', N'A 3-step teenage skin care gift set with soothing organic botanicals for clear skin confidence', CAST(40.00 AS Decimal(18, 2)), 40, N'Products/t042_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (28, N'ONE BALM 30ML', N'Multi-tasking skin saviour in a 100% biodegradable pot ', CAST(21.00 AS Decimal(18, 2)), 22, N'Products/B072-Box_Pot_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (29, N'HERITAGE BEAUTY TRIO', N'A limited-edition gift set to help skin stay soft and nourished all summer long', CAST(44.25 AS Decimal(18, 2)), 32, N'Products/B077_2_large.jpg')
INSERT [dbo].[Product] ([PID], [PName], [PDescription], [PPrice], [PQuantity], [PImage]) VALUES (30, N'RESET ME ORGANIC DUO', N'A limited-edition organic skin care routine for bright, radiant skin', CAST(31.50 AS Decimal(18, 2)), 38, N'Products/BP01-25th-Anniversary-Gift-Box-Autumn-pack-shot-box_products_002_large.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopCart] ON 

INSERT [dbo].[ShopCart] ([ShopCartID], [Oid], [PID], [OrderQuantity], [PPrice], [PTotal]) VALUES (16, 19, 5, 1, CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ShopCart] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ToPerson] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ToPerson]
GO
ALTER TABLE [dbo].[ShopCart]  WITH CHECK ADD  CONSTRAINT [FK_ShopCart_ToOrder] FOREIGN KEY([Oid])
REFERENCES [dbo].[Order] ([Oid])
GO
ALTER TABLE [dbo].[ShopCart] CHECK CONSTRAINT [FK_ShopCart_ToOrder]
GO
ALTER TABLE [dbo].[ShopCart]  WITH CHECK ADD  CONSTRAINT [FK_ShopCart_ToProduct] FOREIGN KEY([PID])
REFERENCES [dbo].[Product] ([PID])
GO
ALTER TABLE [dbo].[ShopCart] CHECK CONSTRAINT [FK_ShopCart_ToProduct]
GO
USE [master]
GO
ALTER DATABASE [MilkANDhoney] SET  READ_WRITE 
GO
