USE [master]
GO
/****** Object:  Database [CRUdWithDatabaseand]    Script Date: 1/21/2020 10:46:01 PM ******/
CREATE DATABASE [CRUdWithDatabaseand]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRUdWithDatabaseand', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CRUdWithDatabaseand.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CRUdWithDatabaseand_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CRUdWithDatabaseand_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CRUdWithDatabaseand] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRUdWithDatabaseand].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRUdWithDatabaseand] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET RECOVERY FULL 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET  MULTI_USER 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRUdWithDatabaseand] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CRUdWithDatabaseand] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRUdWithDatabaseand', N'ON'
GO
USE [CRUdWithDatabaseand]
GO
/****** Object:  Table [dbo].[Adds]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Img] [nvarchar](150) NULL,
	[Link] [nvarchar](150) NULL,
 CONSTRAINT [PK_Adds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Pwd] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cat_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[expire]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expire](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tdate] [date] NULL,
 CONSTRAINT [PK_expire] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cat_id] [int] NULL,
	[Item_name] [nvarchar](50) NULL,
	[Item_img] [nvarchar](200) NULL,
	[Item_price] [decimal](18, 0) NULL,
	[Item_quantity] [decimal](18, 0) NULL,
	[Item_Detalis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Message]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sname] [nvarchar](50) NULL,
	[Stel] [nvarchar](50) NULL,
	[Smail] [nvarchar](50) NULL,
	[Msg] [nvarchar](200) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vistor]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vistor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NULL,
 CONSTRAINT [PK_vistor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [UserName], [Pwd]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Cat_name]) VALUES (2, N'كاميرات')
INSERT [dbo].[Category] ([ID], [Cat_name]) VALUES (3, N'شاشات')
INSERT [dbo].[Category] ([ID], [Cat_name]) VALUES (4, N'طابعات')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ID], [Cat_id], [Item_name], [Item_img], [Item_price], [Item_quantity], [Item_Detalis]) VALUES (2, 2, N'1', N'5.jpg', CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), N'1')
INSERT [dbo].[Items] ([ID], [Cat_id], [Item_name], [Item_img], [Item_price], [Item_quantity], [Item_Detalis]) VALUES (7, 2, N'كاميرا', N'5.jpg', CAST(150 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), N'كاميرا')
INSERT [dbo].[Items] ([ID], [Cat_id], [Item_name], [Item_img], [Item_price], [Item_quantity], [Item_Detalis]) VALUES (8, 2, N'كاميرا بث مباشر', N'10.jpg', CAST(200 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), N'كاميرا بث مباشر')
INSERT [dbo].[Items] ([ID], [Cat_id], [Item_name], [Item_img], [Item_price], [Item_quantity], [Item_Detalis]) VALUES (1008, 2, N'كاميرا', N'Nogoum-Logo-01.png', CAST(20 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), N'لابتوب')
INSERT [dbo].[Items] ([ID], [Cat_id], [Item_name], [Item_img], [Item_price], [Item_quantity], [Item_Detalis]) VALUES (1009, 3, N'لابتوب', N't_Z10T-A161_S.jpg', CAST(100 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), N'لابتوب')
INSERT [dbo].[Items] ([ID], [Cat_id], [Item_name], [Item_img], [Item_price], [Item_quantity], [Item_Detalis]) VALUES (1010, 3, N'صورة', N'p4.gif', CAST(10 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), N'صورة')
INSERT [dbo].[Items] ([ID], [Cat_id], [Item_name], [Item_img], [Item_price], [Item_quantity], [Item_Detalis]) VALUES (2014, 4, N'hp', N'download.jpg', CAST(2000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), N'printer Hp')
INSERT [dbo].[Items] ([ID], [Cat_id], [Item_name], [Item_img], [Item_price], [Item_quantity], [Item_Detalis]) VALUES (3010, 123, N'124', N'124', CAST(124 AS Decimal(18, 0)), CAST(124 AS Decimal(18, 0)), N'124')
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[vistor] ON 

INSERT [dbo].[vistor] ([ID], [number]) VALUES (1, 344)
SET IDENTITY_INSERT [dbo].[vistor] OFF
/****** Object:  StoredProcedure [dbo].[DeleteItems]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    Create Procedure [dbo].[DeleteItems]   
    (    
     @ID integer    
    )    
    as     
    Begin    
     Delete Items where  ID=@ID;    
    End  



GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateItems]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

    Create Procedure [dbo].[InsertUpdateItems]    
    (    
    @ID integer, 
	@Cat_id integer,   
    @Item_name [nvarchar](50),
	@Item_img [nvarchar](200),     
    @Item_price decimal,  
	@Item_quantity decimal,   
    @Item_Detalis [nvarchar](max) ,    
       @Action varchar(10)    
    )    
   As    
Begin    
if @Action='Insert'    
Begin    
     Insert into Items(Cat_id,Item_name,Item_img,Item_price,Item_quantity,Item_Detalis) values(@Cat_id,@Item_name,@Item_img,@Item_price,@Item_quantity,@Item_Detalis);    
    End    
    if @Action='Update'    
    Begin    
     Update Items set Cat_id=@Cat_id,Item_name=@Item_name,Item_img=@Item_img,Item_price=@Item_price,Item_quantity=@Item_quantity,Item_Detalis=@Item_Detalis where ID=@ID;    
    End      
    End  


GO
/****** Object:  StoredProcedure [dbo].[SelectItems]    Script Date: 1/21/2020 10:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   Create Procedure [dbo].[SelectItems]   
    as     
    Begin    
    Select * from Items;    
    End  


GO
USE [master]
GO
ALTER DATABASE [CRUdWithDatabaseand] SET  READ_WRITE 
GO
