USE [SWP]
GO

ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Order Detail] DROP CONSTRAINT [FK_Order Detail_Product]
GO
ALTER TABLE [dbo].[Order Detail] DROP CONSTRAINT [FK_Order Detail_Order]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Guest]
GO
ALTER TABLE [dbo].[Image] DROP CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[FeedBack] DROP CONSTRAINT [FK_FeedBack_User]
GO
ALTER TABLE [dbo].[FeedBack] DROP CONSTRAINT [FK_FeedBack_Product]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Order Detail]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Detail]') AND type in (N'U'))
DROP TABLE [dbo].[Order Detail]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Image]') AND type in (N'U'))
DROP TABLE [dbo].[Image]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guest]') AND type in (N'U'))
DROP TABLE [dbo].[Guest]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedBack]') AND type in (N'U'))
DROP TABLE [dbo].[FeedBack]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/3/2023 10:14:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CATID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CATID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int]  NULL,
	[PID] [int]  NULL,
	[Description] [nvarchar](50)  NULL,
	[Date] [datetime]  NULL,
	[Vote] [int]  NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[FID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[Guest] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50)  NULL,
	[Address] [nvarchar](200)  NULL,
	[Phone] [nchar](15) NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[Guest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[IID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int]  NULL,
	[Image] [varchar](200)  NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int]  NULL,
	[Address] [nvarchar](50)  NULL,
	[Date] [datetime]  NULL,
	[Note] [nvarchar](200)  NULL,
	[TotalPrice] [bigint]  NULL,
	[GID] [int]  NULL,
	[Phone] [char](15) NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Detail]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Detail](
	[ODID] [int] IDENTITY(1,1) NOT NULL,
	[OID] [int]  NULL,
	[PID] [int]  NULL,
	[Price] [bigint]  NULL,
	[Amount] [int]  NULL,
 CONSTRAINT [PK_Order Detail] PRIMARY KEY CLUSTERED 
(
	[ODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[AddedBy] [int]  NULL,
	[CATID] [int]  NULL,
	[Price] [float]  NULL,
	[Name] [nvarchar](50)  NULL,
	[Color] [nvarchar](50)  NULL,
	[Size] [float]  NULL,
	[Quantity] [int]  NULL,
	[Description] [ntext] NULL,
	[Resolution] [varchar](50)  NULL,
	[Insurance] [int] NULL,
	[CreateDate] [datetime]  NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[RName] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/3/2023 10:14:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [int] NOT NULL,
	[LName] [nvarchar](50)  NULL,
	[FName] [nvarchar](50)  NULL,
	[UserName] [nvarchar](50)  NULL,
	[PassWord] [varchar](50)  NULL,
	[Address] [nvarchar](200) NULL,
	[image] [nvarchar](200) NULL,
	[DOB] [datetime] NULL,
	[Gender] [bit] NULL,
	[Phone] [char](15) NULL,
	[Email] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Product] FOREIGN KEY([PID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Product]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_User] FOREIGN KEY([UID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_User]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([PID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Guest] FOREIGN KEY([GID])
REFERENCES [dbo].[Guest] ([Guest])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Guest]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order Detail_Order] FOREIGN KEY([OID])
REFERENCES [dbo].[Order] ([OID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order Detail] CHECK CONSTRAINT [FK_Order Detail_Order]
GO
ALTER TABLE [dbo].[Order Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order Detail_Product] FOREIGN KEY([PID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order Detail] CHECK CONSTRAINT [FK_Order Detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CATID])
REFERENCES [dbo].[Category] ([CATID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([RID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
