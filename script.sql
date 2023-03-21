USE [SWP]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/21/2023 3:38:58 PM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 3/21/2023 3:38:58 PM ******/
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
/****** Object:  Table [dbo].[Guest]    Script Date: 3/21/2023 3:38:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[Guest] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nchar](15) NULL,
	[LName] [nvarchar](50) NULL,
	[FName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[Guest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 3/21/2023 3:38:58 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/21/2023 3:38:58 PM ******/
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
	[Phone] [int] NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Detail]    Script Date: 3/21/2023 3:38:58 PM ******/
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
/****** Object:  Table [dbo].[OrderLog]    Script Date: 3/21/2023 3:38:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLog](
	[OrderLogId] [int] IDENTITY(1,1) NOT NULL,
	[OID] [int] NOT NULL,
	[StatusID] [int] NULL,
	[Date] [date] NOT NULL,
	[Confirm] [bit] NOT NULL,
 CONSTRAINT [PK_OrderLog] PRIMARY KEY CLUSTERED 
(
	[OrderLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/21/2023 3:38:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[AddedBy] [int] NULL,
	[CATID] [int] NULL,
	[PriceIn] [int] NULL,
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
	[PriceOut] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLog]    Script Date: 3/21/2023 3:38:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[UId] [int] NOT NULL,
	[PId] [int] NOT NULL,
	[Action] [int] NOT NULL,
	[PriceIn] [int] NULL,
	[PriceOut] [int] NULL,
	[Quatity] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_ProductLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/21/2023 3:38:58 PM ******/
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
/****** Object:  Table [dbo].[Type]    Script Date: 3/21/2023 3:38:58 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/21/2023 3:38:58 PM ******/
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

INSERT [dbo].[FeedBack] ([FID], [UID], [PID], [Description], [Date], [Vote]) VALUES (25, 2, 26, N'Tốt', CAST(N'2023-03-21T00:00:00.000' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (6, N's', N'1111           ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (8, N'To', N'111            ', N'Vu', N'A')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (9, N'111', N'111            ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (10, N'122', N'11112222       ', N'Hy', N'Not')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (12, N'122', N'113            ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (13, N'Lien Quan', N'1111           ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (16, N'Hà Nội', N'0123456789     ', N'Chiến', N'Vũ')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (17, N'HP', N'122            ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (18, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (19, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (20, N'Lien Quan', N'1111           ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (21, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (22, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (23, N'', N'               ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (24, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (25, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (26, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (27, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (28, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (29, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (30, N'', N'               ', N'', N'')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (31, N'Lien Quan', N'0985429591     ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (32, N'Thach That', N'0987654321     ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (34, N'HP', N'0987654321     ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (35, N'122', N'0987654321     ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (36, N'Thach That', N'0987654321     ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (37, N'Thach That', N'0987654321     ', N'Vu', N'Chien')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (39, N'Lien Quan', N'0987654321     ', N'Vu', N'Vi')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (40, N'Cao Bằng', N'0123456789     ', N'ĐOàn', N'Nhên')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (41, N'Cao Bằng2', N'0123456555     ', N'123', N'123')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (42, N'Cao Bằng', N'0123456789     ', N'ĐOàn', N'Nhên')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (43, N'123', N'0123456789     ', N'123', N'123')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (44, N'Cao Bằng', N'0123456789     ', N'ĐOàn', N'Nhên')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (45, N'Cao Bằng2', N'0123456784     ', N'ĐOàn', N'Nhên')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (46, N'Cao Bằng', N'0123456555     ', N'ĐOàn', N'123')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (47, N'Sa Dec', N'0123456555     ', N'Ba', N'Ga')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (48, N'4444', N'0123456784     ', N'444', N'4444')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (49, N'ĐOàn', N'0987654321     ', N'ĐOàn', N'ĐOàn')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (50, N'scascs', N'0123451112     ', N'scascs', N'scascs')
INSERT [dbo].[Guest] ([Guest], [Address], [Phone], [LName], [FName]) VALUES (51, N'âcs', N'0123456789     ', N'âcsc', N'csc')
SET IDENTITY_INSERT [dbo].[Guest] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (66, 2, N'Ha Noi', CAST(N'2023-03-20T00:00:00.000' AS DateTime), N'mình ko mua', 80588000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (67, 5, N'fffff', CAST(N'2023-03-20T00:00:00.000' AS DateTime), N'umbala', 5990000, NULL, 123456789, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (68, 2, N'Ha Noi', CAST(N'2023-03-20T00:00:00.000' AS DateTime), N'aaaaa', 13700000, NULL, 987654321, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (69, 2, N'Ha Noi', CAST(N'2023-03-20T00:00:00.000' AS DateTime), N'Ngngnqf', 124124, NULL, 123455673, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (70, 2, N'Ha Noi', CAST(N'2023-03-20T00:00:00.000' AS DateTime), N'', 5680000, NULL, 987654321, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (71, NULL, N'ĐOàn', CAST(N'2023-03-20T00:00:00.000' AS DateTime), N'Không tốt lắm', 24690000, 49, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (72, 2, N'Ha Noi', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'ngon', 124124, NULL, 987654321, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (73, 2, N'Ha Noi', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'aaaa', 124124, NULL, 987654321, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (74, 12, N'Sa Dec', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Ngngnqf', 46998000, NULL, 111111111, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (75, 2, N'Ha Noi', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'haha', 11985000, NULL, 987654321, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (76, 2, N'Ha Noi', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'csacascsasc', 13700000, NULL, 987654321, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (77, NULL, N'scascs', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'2', 11670000, 50, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (78, NULL, N'âcs', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'âcs', 11670000, 51, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (79, 2, N'Ha Noi', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'ngon', 13700000, NULL, 987654321, NULL, NULL)
INSERT [dbo].[Order] ([OID], [UID], [Address], [Date], [Note], [TotalPrice], [GID], [Phone], [FName], [LName]) VALUES (80, 5, N'ddd', CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'dádasasd', 24690000, NULL, 123456789, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order Detail] ON 

INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (68, 66, 26, 23499000, 2)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (69, 66, 31, 24690000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (70, 66, 41, 8900000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (71, 67, 40, 5990000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (72, 68, 39, 13700000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (73, 69, 44, 124124, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (74, 70, 32, 5680000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (75, 71, 37, 24690000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (76, 72, 44, 124124, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (77, 73, 44, 124124, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (78, 74, 26, 23499000, 2)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (79, 75, 42, 11985000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (80, 76, 39, 13700000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (81, 77, 40, 5990000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (82, 77, 32, 5680000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (83, 78, 40, 5990000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (84, 78, 32, 5680000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (85, 79, 39, 13700000, 1)
INSERT [dbo].[Order Detail] ([ODID], [OID], [PID], [Price], [Amount]) VALUES (86, 80, 31, 24690000, 1)
SET IDENTITY_INSERT [dbo].[Order Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLog] ON 

INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (89, 66, 1, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (90, 66, 2, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (91, 66, 2, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (92, 66, 2, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (93, 66, 2, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (94, 66, 3, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (95, 66, 3, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (96, 66, 3, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (97, 66, 3, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (98, 67, 1, CAST(N'2023-03-20' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (99, 67, 4, CAST(N'2023-03-20' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (100, 67, 4, CAST(N'2023-03-20' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (101, 67, 4, CAST(N'2023-03-20' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (102, 68, 1, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (103, 69, 1, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (104, 69, 2, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (105, 70, 1, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (106, 71, 1, CAST(N'2023-03-20' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (107, 68, 4, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (108, 70, 2, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (109, 72, 1, CAST(N'2023-03-21' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (110, 72, 4, CAST(N'2023-03-21' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (111, 73, 1, CAST(N'2023-03-21' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (114, 73, 4, CAST(N'2023-03-21' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (115, 71, 4, CAST(N'2023-03-21' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (116, 74, 1, CAST(N'2023-03-21' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (117, 74, 2, CAST(N'2023-03-21' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (118, 74, 3, CAST(N'2023-03-21' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (119, 75, 1, CAST(N'2023-03-21' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (120, 76, 1, CAST(N'2023-03-21' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (121, 77, 1, CAST(N'2023-03-21' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (122, 78, 1, CAST(N'2023-03-21' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (123, 79, 1, CAST(N'2023-03-21' AS Date), 1)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (124, 80, 1, CAST(N'2023-03-21' AS Date), 0)
INSERT [dbo].[OrderLog] ([OrderLogId], [OID], [StatusID], [Date], [Confirm]) VALUES (125, 75, 4, CAST(N'2023-03-21' AS Date), 1)
SET IDENTITY_INSERT [dbo].[OrderLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (26, 2, 1, 20000000, N'Smart Tivi Neo QLED Samsung 4K 55 inch', N'Xanh', N'Chiếu màn hình điện thoại lên tivi, Điều khiển bằng giọng nói, Điều khiển TV bằng điện thoại, Tìm kiếm bằng giọng nói, Trợ lí ảo Google Assistant, Trợ lý ảo Bixby', N'4K', 12, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 3, N'Anh1.jpg', 55, 15, 0.33, 23499000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (31, 2, 2, 20000000, N'Smart Tivi Samsung Crystal 4K2', N'Ðen', N'2', N'4K', 2, CAST(N'2023-03-19T00:00:00.000' AS DateTime), 2, N'Anh12.jpg', 2, 23, 0.4, 24690000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (32, 1, 6, 3790000, N'Smart tivi Xiaomi A2 32 inch L32M7-EAVN', N'Ðen', N'Tìm kiếm bằng giọng nói, Chiếu màn hình điện thoại lên tivi, Trợ lí ảo Google Assistant', N'HD', 24, CAST(N'2023-03-18T00:00:00.000' AS DateTime), 1, N'Anh1.jpg', 32, 7, 0.2, 5680000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (35, 1, 1, 123, N'Android Tivi Sharp 4K 50 inch 4T-C50DJ3X', N'Ðen', N'Công nghệ hình ảnh Dolby Vision
Hình ảnh sắc nét, màu sắc trung thực, nâng cao độ tương phản, khả năng hiển thị tốt hơn, mang đến trải nghiệm hình ảnh cực kỳ sống động trên Android Tivi 4K 50 inch 4T-C50DJ3X.
Hệ điều hành Android 10 dễ sử dụng
Hệ điều hành Android 10 - với giao diện trực quan, cho trải nghiệm giải trí, giáo dục, khoa học, khám phá vô tận với hàng nghìn ứng dụng từ Google Play', N'4K', 23, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1, N'tivi3.png', 50, 5, 0.3, 11535000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (37, 1, 7, 20000000, N'Tivi Sony 4K 43 inch KD-43X75K', N'Ðen', N'Ưu điểm của Google Tivi Sony 4K 43 inch KD-43X75K (Model 2022)
Tivi thiết kế thanh lịch, kích thước màn hình 43 inch, độ phân giải 4K sắc nét.
Bộ xử lý X1 4K HDR cho hình ảnh sắc nét, giảm nhiễu, giảm mờ. 
Công nghệ Dolby Atmos tạo nên âm thanh vòm 3 chiều sống động.
Hệ điều hành Google TV giao diện thân thiện cùng kho ứng dụng phong phú.
Chiếu màn hình điện thoại lên tivi thông qua Chromecast.
Điều khiển, tìm kiếm bằng giọng nói tiếng Việt thông qua Google Assistant.', N'4K', 24, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 5, N'Anh5.jpg', 43, 122, 0.3, 24690000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (38, 1, 1, 123, N'Smart Tivi Neo QLED Samsung 4K 55 inch QA55QN85BAK', N'Ðen', N'ff', N'HD', 666, CAST(N'2023-03-16T00:00:00.000' AS DateTime), 4, N'Anh1.jpg', 666, 11, 0.3, 123)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (39, 1, 6, 1200000, N'Smart Tivi Xiaomi A2 58 inch L58M7-EASEA', N'Ðen', N'Chiếu màn hình điện thoại lên tivi, Trợ lí ảo Google Assistant', N'HD', 24, CAST(N'2023-03-18T00:00:00.000' AS DateTime), 1, N'tivi12.jpg', 58, 3, 0.99, 13700000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (40, 1, 3, 4150000, N'Smart tivi Casper 32 inch 32HG5200', N'Ðen', N'Đặc điểm nổi bật của tivi Casper 32HG5200
Tivi Casper 32 inch 32HG5200 màn hình 32 inch gọn gàng, thiết kế đẹp mắt.
Chất lượng âm thanh, hình ảnh hoàn hảo, đáp ứng nhu cầu giải trí cơ bản.
Hệ điều hành Android 9.0 đơn giản, dễ sử dụng, đa dạng ứng dụng.
Đa dạng phương thức kết nối (không dây và có dây) với các thiết bị ngoại vi.
Giá rẻ, phù hợp trang bị cho phòng ngủ, phòng họp', N'HD', 24, CAST(N'2023-03-20T00:00:00.000' AS DateTime), 1, N'tivi20.png', 32, 2, 0.26, 5990000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (41, 1, 1, 7790000, N'Smart Tivi Casper 4K 50 inch 50UW6000', N'Ðen', N'Đặc điểm nổi bật của smart Tivi Casper 4K 50 inch 50UW6000
Smart Tivi có kích cỡ màn hình 50 inch
Độ phân giải 4K (Ultra HD)
Loại màn hình sử dụng là màn hình LED nền (Direct LED), VA LCD
Hệ điều hành webOS 5.0 dễ dùng
Chân đế và viền tivi làm từ nhựa
Tivi Casper được sản xuất tại Thái Lan
Công nghệ hình ảnh: 4K HDR10
Điều khiển bằng giọng nói: Tìm kiếm giọng nói trên YouTube bằng tiếng Việt
Chiếu hình từ điện thoại lên TV: Chromecast
Remote thông minh: Remote tích hợp micro tìm kiếm bằng giọng nói
Gồm 2 loa với tổng công suất 16W
Công nghệ âm thanh: Dolby Digital Plus
Kết nối Internet: Cổng mạng LAN, Wifi
Có Bluetooth', N'4K', 24, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1, N'tivi21.png', 50, 13, 0.12, 8900000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (42, 1, 1, 7990000, N'Smart tivi Casper 4K 50 inch 50UG6100', N'Ðen', N'Đặc điểm nổi bật
Màn hình 50 inch với thiết kế vô cực tinh tế, sang trọng.
Độ phân giải 4K, hình ảnh sắc nét, màu sắc rực rỡ, sống động.
Âm thanh vòm giả lập đặc sắc, chân thực. 
Hệ điều hành Android 9.0 tiện dụng với kho ứng dụng phong phú.
Remote thông minh hỗ trợ tìm kiếm bằng giọng nói (tiếng Việt).
Đa dạng phương thức kết nối với các thiết bị ngoại vi.', N'4K', 24, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1, N'tivi22.png', 50, 6, 0.34, 11985000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (43, 1, 3, 10790000, N'Smart Tivi Casper 4K 55 Inch 55UW6000', N'Ðen', N'Ưu điểm nổi bật
Smart Tivi QLED Casper 55 inch 55QG8000 thiết kế màn hình tràn viền vô cực, mang lại trải nghiệm chân thực.
Công nghệ hình ảnh Quantum Dot và MEMC mang lại khung hình sống động.
Công nghệ âm thanh Dolby Atmos giúp bạn thưởng thức âm thanh vòm như ngoài rạp ngay tại nhà.
Tivi hỗ trợ điều khiển bằng giọng nói, tìm kiếm bằng giọng nói thông minh.', N'4K', 24, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1, N'tivi23.png', 55, 9, 0.22, 16185000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (44, 1, 5, 10000, N'Smart Tivi Coex 40 inch 40FH6000X Full HD', N'Ðen', N'Coex 32 inch 32F4000X là mẫu tivi màn hình phẳng được thiết kế mỏng ấn tượng, phong cách hiện đại. Tivi kích thước 32 inch, giá rẻ nên phù hợp cho không gian phòng ngủ, phòng khách nhỏ.
Người dùng có thể lắp đặt tivi đặt trên kệ hoặc treo tường tối ưu diện tích.', N'Full HD', 123, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 2, N'tivi25.png', 40, 11, 0.3, 5000000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (45, 5, 10, 5990000, N'Smart Tivi Coex 40 inch 40FH5000X Android 11', N'Ðen', N'Ưu điểm Smart Tivi Coex 40 inch 40FH5000X
Tivi Coex 40FH5000X là một trong 3 mẫu TV thông minh AI chạy hệ điều hành Android 11, thiết kế với màn hình tràn viền vô cực 40 inch, độ phân giải Full HD cho bạn trải nghiệm hình ảnh vô cực, sống động.

Tivi có thể lắp đặt treo tường hoặc đặt trên kệ tại các không gian rộng như phòng khách, phòng họp, phỏng ngủ,...', N'Full HD', 24, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 5, N'tivi26.jpg', 40, 10, 0.4, 8211000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (46, 5, 7, 14990000, N'Tivi Sony 4K 55 inch KD-55X80K', N'Ðen', N'Ưu điểm của dòng Google tivi Sony 4K 55 inch KD-55X80K (Model 2022)
KD-65X80K là dòng tivi google tivi hiện đại ra mắt năm 2022 bởi thương hiệu Sony. Thiết bị sở hữu kiểu dáng sang trọng và ứng dụng nhiều công nghệ hiện đại đem đến sự hoàn hảo trong mỗi khung hình.
Thiết kế sang trọng, thanh lịch
Google tivi Sony 4K 55 inch KD-55X80K thiết kế siêu mỏng, thanh lịch tạo nên điểm nhấn cho không gian phòng khách, phòng ngủ,... Kích thước màn hình 55 inch kết hợp với thiết kế tràn viền giúp người dùng tập trung vào màn hình tốt hơn.', N'4K', 12, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 5, N'tivi28.png', 55, 25, 0.2, 21500000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (47, 5, 1, 7590000, N'Smart Tivi Sony 32 inch KD-32W830K', N'Ðen', N's', N'HD', 8, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 4, N'tivi29.png', 32, 12, 0.1, 8900000)
INSERT [dbo].[Product] ([PID], [AddedBy], [CATID], [PriceIn], [Name], [Color], [Description], [Resolution], [Insurance], [CreateDate], [TID], [ImageDefault], [Size], [Quantity], [Discount], [PriceOut]) VALUES (48, 5, 1, 123, N'Smart Tivi Sony 32 inch KD-32W830K', N'Ðen', N's', N'HD', 41, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1, N'productSmart Tivi Sony 32 inch KD-32W830K38370048.jpg', 999, 666, 0.3, 24690000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductLog] ON 

INSERT [dbo].[ProductLog] ([LogId], [UId], [PId], [Action], [PriceIn], [PriceOut], [Quatity], [Date]) VALUES (81, 5, 26, 4, 20000000, 0, 5, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[ProductLog] ([LogId], [UId], [PId], [Action], [PriceIn], [PriceOut], [Quatity], [Date]) VALUES (82, 5, 26, 4, 20000000, 0, 2, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[ProductLog] ([LogId], [UId], [PId], [Action], [PriceIn], [PriceOut], [Quatity], [Date]) VALUES (106, 5, 45, 1, 5990000, 8211000, 10, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[ProductLog] ([LogId], [UId], [PId], [Action], [PriceIn], [PriceOut], [Quatity], [Date]) VALUES (107, 5, 46, 1, 14990000, 21500000, 25, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[ProductLog] ([LogId], [UId], [PId], [Action], [PriceIn], [PriceOut], [Quatity], [Date]) VALUES (109, 5, 47, 1, 7590000, 8900000, 12, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[ProductLog] ([LogId], [UId], [PId], [Action], [PriceIn], [PriceOut], [Quatity], [Date]) VALUES (123, 5, 48, 1, 123, 24690000, 666, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[ProductLog] ([LogId], [UId], [PId], [Action], [PriceIn], [PriceOut], [Quatity], [Date]) VALUES (125, 2, 38, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductLog] ([LogId], [UId], [PId], [Action], [PriceIn], [PriceOut], [Quatity], [Date]) VALUES (126, 2, 26, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductLog] OFF
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

INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (1, 1, N'Vũ2', N'Chiến', N'chien', N'123456789A', N'Hà Nội', N'avatar136071145.jpg', CAST(N'2002-02-02T00:00:00.000' AS DateTime), 0, N'0123456789     ', N'nhantacbvn@gmail.com', NULL, CAST(N'2023-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (2, 3, N'Nhân', N'Đoàn', N'mra', N'11111111A', N'Ha Noi', N'avatar213285864.jpg', CAST(N'1906-11-09T00:00:00.000' AS DateTime), 0, N'0987654321     ', N'Chien@gmail.com', NULL, CAST(N'2023-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (5, 2, N'Nhan', N'Doan', N'nhantacb', N'12345678A', N'caobang', N'avatar535843005.jpg', CAST(N'2023-03-19T00:00:00.000' AS DateTime), 0, N'0123456789     ', N'Chienfvv15082001@gmail.com', CAST(N'2023-02-10T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (12, 1, NULL, NULL, N'nhantaccb', N'dsvscascasca', NULL, N'avtDF.png', NULL, NULL, N'vdv            ', NULL, CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (14, 4, N'Admin', N'Duc', N'admin', N'99999999A', NULL, N'avtDF.png', NULL, NULL, NULL, N'dsvscascasca@gmail.com', CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([ID], [Role], [LName], [FName], [UserName], [PassWord], [Address], [image], [DOB], [Gender], [Phone], [Email], [CreatedDate], [ModifiedDate]) VALUES (16, 1, N'Đoàn', N'Nhân', N'acquy666', N'66666666A', N'Haha', N'avtDF.png', CAST(N'2002-12-06T00:00:00.000' AS DateTime), 0, N'0987654331     ', N'nhantacbvn@gmail.com', CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime))
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
ALTER TABLE [dbo].[OrderLog]  WITH CHECK ADD  CONSTRAINT [FK__OrderLog__OID__52593CB8] FOREIGN KEY([OID])
REFERENCES [dbo].[Order] ([OID])
GO
ALTER TABLE [dbo].[OrderLog] CHECK CONSTRAINT [FK__OrderLog__OID__52593CB8]
GO
ALTER TABLE [dbo].[ProductLog]  WITH CHECK ADD  CONSTRAINT [FK__ProductLog__PId__5629CD9C] FOREIGN KEY([PId])
REFERENCES [dbo].[Product] ([PID])
GO
ALTER TABLE [dbo].[ProductLog] CHECK CONSTRAINT [FK__ProductLog__PId__5629CD9C]
GO
ALTER TABLE [dbo].[ProductLog]  WITH CHECK ADD  CONSTRAINT [FK__ProductLog__UId__571DF1D5] FOREIGN KEY([UId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[ProductLog] CHECK CONSTRAINT [FK__ProductLog__UId__571DF1D5]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([RID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
