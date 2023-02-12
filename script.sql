USE [SWP]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/10/2023 4:25:17 PM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 2/10/2023 4:25:18 PM ******/
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
/****** Object:  Table [dbo].[Guest]    Script Date: 2/10/2023 4:25:18 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 2/10/2023 4:25:18 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2/10/2023 4:25:18 PM ******/
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
/****** Object:  Table [dbo].[Order Detail]    Script Date: 2/10/2023 4:25:18 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2/10/2023 4:25:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[AddedBy] [int] NULL,
	[CATID] [int] NULL,
	[Price] [float] NULL,
	[Name] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[Resolution] [varchar](50) NULL,
	[Insurance] [int] NULL,
	[CreateDate] [datetime] NULL,
	[TID] [int] NULL,
	[ImageDefault] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/10/2023 4:25:18 PM ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 2/10/2023 4:25:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[PID] [int] NULL,
	[Size] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 2/10/2023 4:25:18 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/10/2023 4:25:18 PM ******/
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
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (1, 1, N'Anh1.jpg')
INSERT [dbo].[Image] ([IID], [PID], [Image]) VALUES (2, 1, N'Anh2.jpg')
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

INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (1, 1, 7, 3790000, N'Smart tivi Xiaomi A2', N'Đen', N'Tivi Xiaomi A2 32 inch L32M7 có thiết kế viền màn hình siêu mỏng mang đến cảm giác màn hình lớn hơn.Khung TV Xiaomi 32 inch được chế tạo dựa trên quy trình đúc nguyên khối Unibody siêu bền và chắc chắn.

Tivi còn trang bị chân đế chữ V úp ngược chắc chắn. Bên cạnh đó, bạn có thể treo tivi trên tường một cách gọn gàng. Với kích thước màn hình là 32 inch, tivi phù hợp với không gian có diện tích dưới 20m2. Tivi Xiaomi A2 có độ phân giải HD tích hợp công cụ chất lượng hình ảnh TV PQ mang đến những thước phim sống động, sắc nét. 

', N'HD', 4, CAST(N'2019-12-12T00:00:00.000' AS DateTime), 1, N'Anh1.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (2, 1, 1, 10000000, N'Smart Tivi Samsung Crystal 4K', N'Đen', NULL, N'4K', 4, CAST(N'2019-12-12T00:00:00.000' AS DateTime), 1, N'Anh3.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (3, 1, 1, 7400000, N'Smart Tivi Samsung 4K  UA43AU7002KXXV - Model 2022', N'Đen', NULL, N'HD', 3, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 3, N'Anh7.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (4, 1, 1, 8400000, N'UA65AU7000KXXV', N'Đen', NULL, N'4K', 3, CAST(N'2020-12-12T00:00:00.000' AS DateTime), NULL, N'Anh10.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh11.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh12.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh13.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh14.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh15.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh16.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh17.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh18.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh19.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh20.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh21.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh22.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh23.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh24.jpg')
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [Price], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault]) VALUES (19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anh25.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RID], [RName]) VALUES (1, N'Nhân viên nhập hàng')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SID], [Quantity], [PID], [Size]) VALUES (1, 15, 1, 32)
INSERT [dbo].[Size] ([SID], [Quantity], [PID], [Size]) VALUES (2, 22, 1, 43)
INSERT [dbo].[Size] ([SID], [Quantity], [PID], [Size]) VALUES (3, 48, 1, 64)
INSERT [dbo].[Size] ([SID], [Quantity], [PID], [Size]) VALUES (4, 23, 2, 50)
SET IDENTITY_INSERT [dbo].[Size] OFF
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

INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (1, 1, N'Vũ', N'Chiến', N'chien', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (2, 1, NULL, NULL, N'mra', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (3, 1, NULL, NULL, N'mrb', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([AddedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([TID])
REFERENCES [dbo].[Type] ([TID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CATID])
REFERENCES [dbo].[Category] ([CATID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[Product] ([PID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([RID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
