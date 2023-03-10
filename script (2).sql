USE [SWP]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/7/2023 4:56:16 PM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PID] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Vote] [int] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[FID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[Guest] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nchar](15) NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[Guest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[IID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[Image] [varchar](200) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Note] [nvarchar](200) NULL,
	[TotalPrice] [bigint] NULL,
	[GID] [int] NULL,
	[Phone] [char](15) NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Detail]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Detail](
	[ODID] [int] IDENTITY(1,1) NOT NULL,
	[OID] [int] NULL,
	[PID] [int] NULL,
	[Price] [bigint] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Order Detail] PRIMARY KEY CLUSTERED 
(
	[ODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLog]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLog](
	[OrderLogId] [int] IDENTITY(1,1) NOT NULL,
	[OID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Confirm] [bit] NOT NULL,
 CONSTRAINT [PK_OrderLog] PRIMARY KEY CLUSTERED 
(
	[OrderLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[AddedBy] [int] NULL,
	[CATID] [int] NULL,
	[PriceIn] [bigint] NULL,
	[Name] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[Resolution] [varchar](50) NULL,
	[Insurance] [int] NULL,
	[CreateDate] [datetime] NULL,
	[TID] [int] NULL,
	[ImageDefault] [nvarchar](max) NULL,
	[Size] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [float] NULL,
	[PriceOut] [bigint] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLog]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[UId] [int] NOT NULL,
	[PId] [int] NOT NULL,
	[Action] [int] NOT NULL,
	[PriceIn] [int] NOT NULL,
	[PriceOut] [int] NOT NULL,
	[Quatity] [int] NOT NULL,
 CONSTRAINT [PK_ProductLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/7/2023 4:56:16 PM ******/
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
/****** Object:  Table [dbo].[Type]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[TName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/7/2023 4:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [int] NOT NULL,
	[LName] [nvarchar](50) NULL,
	[FName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[PassWord] [varchar](50) NULL,
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
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (1, N'Samsung')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (2, N'Sharp')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (3, N'Casper')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (4, N'TCL')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (5, N'LG')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (6, N'Xiaomi')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (7, N'Sony')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (8, N'Coocaa')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (9, N'FFalcon')
INSERT [dbo].[Category] ([CATID], [CatName]) VALUES (10, N'Coex')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([FID], [UID], [PID], [Description], [Date], [Vote]) VALUES (1, 1, 2, N'dep', CAST(N'2023-01-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[FeedBack] ([FID], [UID], [PID], [Description], [Date], [Vote]) VALUES (2, 2, 2, N'Dep lam', CAST(N'2023-01-01T00:00:00.000' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([Guest], [Name], [Address], [Phone]) VALUES (1, N'Chien', N'111', N'1112           ')
SET IDENTITY_INSERT [dbo].[Guest] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (3, 2, N'Anh3.jpg')
INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (4, 2, N'Anh4.jpg')
INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (5, 2, N'Anh5.jpg')
INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (6, 2, N'Anh6.jpg')
INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (7, 3, N'Anh7.jpg')
INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (8, 3, N'Anh8.jpg')
INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (9, 3, N'Anh9.jpg')
INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (10, 4, N'Anh10.jpg')
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (2, 2, 2, 10000, N'Smart Tivi', N'maudo', N'123', N'HD', 120, CAST(N'2023-03-04T00:00:00.000' AS DateTime), 1, NULL, 123, 122, 2, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (3, 2, 1, 7400000, N'Smart Tivi Samsung 4K  UA43AU7002KXXV - Model 2022', N'Đen', N'', N'HD', 3, CAST(N'2023-03-03T00:00:00.000' AS DateTime), 1, NULL, 56, 32, 20, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (4, 2, 3, 8400000, N'UA65AU7000KXXV', N'Đen', N'', N'HD', 3, CAST(N'2023-03-03T00:00:00.000' AS DateTime), 3, NULL, 32, 12, 0, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (6, 2, 9, 555, N'nh', N'123', N'123', N'HD', 123, CAST(N'2023-03-03T00:00:00.000' AS DateTime), 1, NULL, 123, 123, 22, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (7, 2, NULL, 44, N'deptrai', N'44', N'bao hhanh dexs', NULL, 111111, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 8, N'9', 10, 11, 12, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh14.jpg', 32, 23, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (9, 2, NULL, 666, N'NHAN', N'1', N'1', N'1', 1, CAST(N'2023-03-02T00:00:00.000' AS DateTime), 1, N'1', 1, 1, 10000, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (10, 2, NULL, 666, N'NHAN123', N'666', N'666', NULL, 666, CAST(N'2023-03-02T00:00:00.000' AS DateTime), NULL, NULL, 666, 666, 666, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (11, 2, NULL, 12412412, N'nhanpro', N'1', N'1', N'1', 1, CAST(N'2023-03-02T00:00:00.000' AS DateTime), 1, N'1', 1, 1, 10000, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh18.jpg', 56, 32, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh19.jpg', 43, 12, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh20.jpg', 43, 32, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh21.jpg', 43, 43, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh22.jpg', 56, 43, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh23.jpg', 84, 5, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh24.jpg', 32, 6, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh25.jpg', 43, 7, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 8, NULL, NULL)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (21, 1, 10, 0, N'4124', N'Ðen', N'', NULL, 0, CAST(N'2023-03-03T00:00:00.000' AS DateTime), 9, NULL, 0, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RID], [RName]) VALUES (1, N'Khách Hàng')
INSERT [dbo].[Role] ([RID], [RName]) VALUES (2, N'Nhân viên nhập hàng')
INSERT [dbo].[Role] ([RID], [RName]) VALUES (3, N'Nhân viên chốt đơn')
INSERT [dbo].[Role] ([RID], [RName]) VALUES (4, N'Quản lý')
INSERT [dbo].[Role] ([RID], [RName]) VALUES (5, N'Người dùng bị chặn')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([TID], [TName]) VALUES (1, N'Smart TV')
INSERT [dbo].[Type] ([TID], [TName]) VALUES (2, N'LED')
INSERT [dbo].[Type] ([TID], [TName]) VALUES (3, N'QLED')
INSERT [dbo].[Type] ([TID], [TName]) VALUES (4, N'OLED')
INSERT [dbo].[Type] ([TID], [TName]) VALUES (5, N'Android TV')
INSERT [dbo].[Type] ([TID], [TName]) VALUES (6, N'NanoCell')
INSERT [dbo].[Type] ([TID], [TName]) VALUES (7, N'TV màn hình cong')
INSERT [dbo].[Type] ([TID], [TName]) VALUES (8, N'Tivi Khung Tranh')
INSERT [dbo].[Type] ([TID], [TName]) VALUES (9, N'QNED')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (1, 1, N'Vũ', N'Chiến', N'chien', N'123', N'Hà Nội', NULL, CAST(N'2002-05-01T00:00:00.000' AS DateTime), 0, N'0123456789     ', N'nhantacbvn@gmail.com', NULL, CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (2, 1, NULL, NULL, N'mra', N'123', NULL, N'avatar20.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (3, 1, NULL, NULL, N'mrb', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (4, 1, N'Chien', N'Vu Van', N'114785133585666845165', NULL, NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2023-02-10T00:00:00.000' AS DateTime), CAST(N'2023-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (5, 2, N'Nhan', N'Doan', N'nhantacb', N'12345678A', N'caobang', N'avatar50.jpg', NULL, 0, N'0123456789     ', N'Chienfvv15082001@gmail.com', CAST(N'2023-02-10T00:00:00.000' AS DateTime), CAST(N'2023-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (7, 1, NULL, NULL, N'duceptrai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (8, 2, NULL, NULL, N'anh van duc', N'A1234567', NULL, NULL, NULL, NULL, NULL, N'e@123', CAST(N'2023-03-07T00:00:00.000' AS DateTime), CAST(N'2023-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (9, 2, NULL, N'duc', NULL, N'A1234567', NULL, NULL, NULL, NULL, NULL, N'kygame147@gmai.com', CAST(N'2023-03-07T00:00:00.000' AS DateTime), CAST(N'2023-03-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
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
ALTER TABLE [dbo].[OrderLog]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[Order] ([OID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__AddedBy__4E88ABD4] FOREIGN KEY([AddedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__AddedBy__4E88ABD4]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__TID__4F7CD00D] FOREIGN KEY([TID])
REFERENCES [dbo].[Type] ([TID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__TID__4F7CD00D]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CATID])
REFERENCES [dbo].[Category] ([CATID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductLog]  WITH CHECK ADD FOREIGN KEY([PId])
REFERENCES [dbo].[Product] ([PID])
GO
ALTER TABLE [dbo].[ProductLog]  WITH CHECK ADD FOREIGN KEY([UId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([RID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
