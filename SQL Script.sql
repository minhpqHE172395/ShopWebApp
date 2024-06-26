USE [master]
GO
/****** Object:  Database [project]    Script Date: 5/30/2024 11:15:57 AM ******/
CREATE DATABASE [project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MINHPQ23\MSSQL\DATA\project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MINHPQ23\MSSQL\DATA\project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project] SET ARITHABORT OFF 
GO
ALTER DATABASE [project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project] SET RECOVERY FULL 
GO
ALTER DATABASE [project] SET  MULTI_USER 
GO
ALTER DATABASE [project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'project', N'ON'
GO
ALTER DATABASE [project] SET QUERY_STORE = ON
GO
ALTER DATABASE [project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/30/2024 11:15:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/30/2024 11:15:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/30/2024 11:15:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChangePassword]    Script Date: 5/30/2024 11:15:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangePassword](
	[changeID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[newPassword] [varchar](255) NOT NULL,
	[changeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[changeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/30/2024 11:15:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/30/2024 11:15:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/30/2024 11:15:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 5/30/2024 11:15:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1, N'admin', N'123', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (2, N'tester', N'123', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (3, N'tester2', N'234', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (4, N'testseller', N'333', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (5, N'Zahir', N'2222', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (6, N'Conan', N'3', 1, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (7, N'Cade', N'333', 1, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (8, N'Micah', N'2', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (9, N'Rowan', N'3', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (10, N'Kirby', N'3', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (11, N'Tanisha', N'22', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (12, N'Howard', N'2', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (13, N'Tana', N'2', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (14, N'Hadassah', N'2', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (15, N'Echo', N'IGE8TN', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (16, N'Slade', N'4', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (17, N'Devin', N'5', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (18, N'Rowan', N'5', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (19, N'Rafael', N'5', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (20, N'Madaline', N'5', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (21, N'Vera', N'5', 0, 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (22, N'Declan', N'5', 1, 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (23, N'Katell', N'5', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (24, N'Summer', N'5', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (25, N'Robin', N'5', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (26, N'Dominique', N'5', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (27, N'admin', N'123', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (28, N'mra', N'5', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (29, N'mrb', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (30, N'Camden', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (31, N'manhdsz', N'123456', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (32, N'sfdfds', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (33, N'aaaaa', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (34, N'bbbb', N'1234', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (35, N'luong', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (38, N'mit', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (39, N'aaaaaaaa', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (40, N'efef', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (41, N'fef', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (42, N'cd', N'1234', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (43, N'fefr', N'123', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (44, N'fdef', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (45, N'fds', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (46, N'phaminh1909', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (47, N'1', N'1', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (48, N'test1', N'1', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (49, N'user1', N'2', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (50, N'usse', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (51, N'2', N'1234', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (52, N'miiii', N'123', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Sách Kinh Dị')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Sách Phiêu lưu')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Tiểu Thuyết')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Sách Văn Học')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'Sách Ngôn tình')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (6, N'Sách Lịch Sử')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (7, N'Sách Khoa học viễn tưởng')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (8, N'Sách Trinh Thám')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (9, N'Tiểu thuyết người lớn')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (12, N'Truyện Hài')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (13, N'Sách thiếu nhi')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (14, N'Sách Bí ẩn ')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (15, N'Sách Tiểu sử, tự truyện và hồi ký')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (16, N'Sách Truyện ngắn')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (17, N'Viễn tưởng')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (46, 19, N'Nanh Trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 140, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (47, 19, N'Lịch Sử Hiện Đại', N'https://salt.tikicdn.com/ts/product/45/1b/c2/e23f8afc23074c835ab525f56a06d154.jpg', 150, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (48, 20, N'Số Đỏ', N'https://cdn0.fahasa.com/media/catalog/product/s/o/so-do_vu-trong-phung_1.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (49, 21, N'Hai vạn dặm dưới đáy biển', N'https://cf.shopee.vn/file/60626de1fae2bd22c0ca5f768702abf1', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (50, 22, N'Star War', N'https://specials-images.forbesimg.com/imageserve/5d2675c34c687b00085c5503/Star-Wars/960x0.jpg?fit=scale', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (51, 23, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (52, 23, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (53, 24, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (54, 24, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (55, 25, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (56, 25, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (57, 25, N'Lịch sử hiện đại', N'https://salt.tikicdn.com/ts/product/45/1b/c2/e23f8afc23074c835ab525f56a06d154.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (58, 26, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (59, 26, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (61, 28, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (62, 28, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (63, 29, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (64, 30, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (65, 30, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (66, 31, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (67, 32, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (69, 34, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (70, 35, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (71, 36, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (72, 36, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (73, 38, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (74, 39, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (75, 40, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (76, 41, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (77, 42, N'Nanh trắng', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/n/a/nanh-trang-300.u335.d20160505.t105441.jpg', 160, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (79, 44, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (80, 46, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (81, 47, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (82, 48, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (83, 52, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (84, 53, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (85, 54, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (19, 1, 290, N'hang de vo', CAST(N'2022-04-23' AS Date), 19)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (20, 1, 100, N'', CAST(N'2023-02-10' AS Date), 20)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (21, 4, 100, N'1', CAST(N'2023-02-10' AS Date), 21)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (22, 1, 160, N'd', CAST(N'2023-02-11' AS Date), 22)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (23, 1, 260, N'1', CAST(N'2024-03-11' AS Date), 23)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (24, 1, 260, N'1', CAST(N'2024-03-11' AS Date), 24)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (25, 1, 360, N'1', CAST(N'2024-03-11' AS Date), 25)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (26, 1, 260, N'1', CAST(N'2024-03-11' AS Date), 26)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (28, 1, 260, N'1', CAST(N'2024-03-12' AS Date), 28)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (29, 4, 160, N'1', CAST(N'2024-03-12' AS Date), 29)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (30, 1, 260, N'1', CAST(N'2024-03-12' AS Date), 30)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (31, 1, 160, N'1', CAST(N'2024-03-12' AS Date), 31)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (32, 1, 160, N'1', CAST(N'2024-03-13' AS Date), 32)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (34, 1, 160, N'1', CAST(N'2024-03-14' AS Date), 34)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (35, 1, 160, N'1', CAST(N'2024-03-14' AS Date), 35)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (36, 1, 260, N'1', CAST(N'2024-03-14' AS Date), 36)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (37, 1, 0, N'1', CAST(N'2024-03-14' AS Date), 37)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (38, 1, 160, N'1', CAST(N'2024-03-14' AS Date), 38)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (39, 1, 160, N'1', CAST(N'2024-03-14' AS Date), 39)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (40, 1, 160, N'1', CAST(N'2024-03-14' AS Date), 40)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (41, 1, 160, N'1', CAST(N'2024-03-14' AS Date), 41)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (42, 1, 160, N'1', CAST(N'2024-03-14' AS Date), 42)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (44, 1, 200, N'1', CAST(N'2024-03-21' AS Date), 44)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (45, 1, 0, N'1', CAST(N'2024-03-21' AS Date), 45)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (46, 1, 100, N'1', CAST(N'2024-03-21' AS Date), 46)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (47, 1, 100, N'1', CAST(N'2024-03-21' AS Date), 47)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (48, 1, 100, N'1', CAST(N'2024-03-21' AS Date), 48)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (49, 1, 0, N'1', CAST(N'2024-03-21' AS Date), 49)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (50, 1, 0, N'1', CAST(N'2024-03-21' AS Date), 50)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (51, 1, 0, N'1', CAST(N'2024-03-21' AS Date), 51)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (52, 1, 100, N'1', CAST(N'2024-03-21' AS Date), 52)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (53, 1, 100, N'1', CAST(N'2024-03-21' AS Date), 53)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (54, 51, 100, N'1', CAST(N'2024-03-21' AS Date), 54)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (55, 51, 0, N'1', CAST(N'2024-03-21' AS Date), 55)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (56, 51, 0, N'1', CAST(N'2024-03-21' AS Date), 56)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (27, N'Tiếng gọi nơi hoang dã', N'https://salt.tikicdn.com/media/catalog/product/i/m/img226_11.jpg', 100.0000, N'Tiếng gọi của hoang dã (nguyên bản tiếng Anh: The Call of the Wild) là một tiểu thuyết của nhà văn Mỹ Jack London. Cốt truyện kể về một con chó tên là Buck đã được thuần hóa, cưng chiều. Nhưng một loạt các sự kiện xảy ra khi Buck bị bắt khỏi trang trại để trở thành chó kéo xe ở khu vực Alaska lạnh giá, trong giai đoạn mọi người đổ xô đi tìm vàng thế kỷ 19, thiên nhiên nguyên thủy đã đánh thức bản năng của Buck. Buck trở lại cuộc sống hoang dã. Buck trở về rừng, và sống chung với lũ sói.

', N'Xuất bản lần đầu năm 1903, Tiếng gọi nơi hoang dã là tiểu thuyết được nhiều người đọc nhất của Jack London và được xem là tác phẩm hay nhất của ông. Do nhân vật chính là một con chó, đôi khi người ta phân loại tiểu thuyết này là một tiểu thuyết dành cho thanh thiếu niên, phù hợp cho trẻ con, tuy trong tác phẩm không thiếu những cảnh hành hạ súc vật, sự chết chóc, sự tranh đoạt, và chứa đựng nhiều cảnh bạo lực thô bạo.

Sau tiểu thuyết này, năm 1906 Jack London viết quyển Nanh Trắng (White Fang), một tiểu thuyết với bối cảnh tương tự (phương bắc lạnh giá), nhưng chủ đề lại trái ngược, kể về một con sói hoang dã được Weedon Scott, một chuyên gia khai khoáng đến từ San Francisco thuần hóa.

', 3, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (28, N'Lịch sử hiện đại', N'https://salt.tikicdn.com/ts/product/45/1b/c2/e23f8afc23074c835ab525f56a06d154.jpg', 100.0000, N'"Cách mạng xã hội chủ nghĩa tháng Mười Nga năm 1917 mở ra một thời kì mới trong lịch sử thế giới - thời kì hiện đại. Từ Cách mạng tháng Mười Nga đến nay, lịch sử thế giới đã diễn ra rất nhiều sự kiện trọng đại, chằng chéo và phức tạp. Trong khuôn khổ của chương trình, chúng tôi tập trung vào những nội dung cơ bản sau đây:
', N'- Thắng lợi của Cách mạng tháng Mười Nga đã dẫn đến sự ra đời của Nhà nước xã hội chủ nghĩa đầu tiên trên thế giới - Liên bang Cộng hoà xã hội chủ nghĩa Xô viết (gọi tắt là Liên Xô), chiếm 1/6 diện tích Trái Đất. Nằm giữa vòng vây thù địch của chủ nghĩa đế quốc, nhân dân Liên Xô đã kiên cường xây dựng chế độ mới xã hội chủ nghĩa, thu nhiều thành tựu to lớn và liên tiếp đánh bại mọi âm mưu tấn công của chủ nghĩa đế quốc, tiêu biểu là thắng lợi của cuộc chiến tranh vệ quốc chống chủ nghĩa phát xít Đức trong những năm 1941 - 1945. Chính nhờ đó, sau Chiến tranh thế giới thứ hai, chủ nghĩa xã hội đã vượt ra khỏi phạm vi một nước, bước đầu hình thành một hệ thống thế giới với nhiều nước xã hội chủ nghĩa trên những lục địa khác nhau. Trong các thập niên 50 - 60 và 70, chủ nghĩa xã hội đã thực sự tồn tại như một lực lượng hùng hậu trên vũ đài quốc tế, góp phần quan trọng thúc đẩy sự nghiệp đấu tranh vì hòa bình, độc lập dân tộc, dân chủ và tiến bộ xã hội của toàn nhân loại. Từ nửa sau những năm 80, chế độ xã hội chủ nghĩa ở nhiều nước lâm vào cuộc khủng hoảng trầm trọng rồi sụp đổ ở Liên Xô và các nước Đông  u. Hiểu rõ những bước thăng trầm của chủ nghĩa xã hội trong gần một thế kỷ qua và những bài học kinh nghiệm của nó sẽ giúp chúng ta có những nhận thức đúng đắn để củng cố niềm tin về chủ nghĩa xã hội khoa học.
- Sự phát triển và thắng lợi của cách mạng giải phóng dân tộc trong thời kì hiện đại : bước phát triển mới của cách mạng giải phóng dân tộc sau Cách mạng tháng Mười (1918 - 1945); thắng lợi của cách mạng giải phóng dân tộc và sự sụp đổ của hệ thống thuộc địa của chủ nghĩa đế quốc sau Chiến tranh thế giới thứ hai ; công cuộc xây dựng đất nước của các dân tộc Á, Phi, Mĩ Latinh sau khi giành được độc lập dân tộc. Thắng lợi của sự nghiệp cách mạng giải phóng dân tộc là một trong những biến chuyển to lớn làm thay đổi căn bản tình hình thế giới và bộ mặt của xã hội loài người, Cần hiểu rõ những thách thức và khó khăn ở một số nước Á, Phi, Mỹ Latinh hiện nay và nguồn gốc của nó.
', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (29, N'Truyện Kiều', N'https://palda.vn/wp-content/uploads/2021/04/truyen-kieu.jpg', 120.0000, N'Đoạn trường tân thanh (chữ Hán: 斷腸新聲), thường được biết đến với cái tên đơn giản là Truyện Kiều (chữ Nôm: 傳翹), là một truyện thơ của đại thi hào Nguyễn Du. Đây được xem là truyện thơ nổi tiếng nhất và xét vào hàng kinh điển trong văn học Việt Nam, tác phẩm được viết bằng chữ Nôm, theo thể lục bát, gồm 3.254 câu.

', N'Hàng trăm năm qua, Truyện Kiều luôn là đại thi phẩm được mọi người dân Việt Nam biết đến, trở nên quen thuộc như giếng nước, bờ ao, lũy tre quanh nhà. Mê Kiều, say Kiều, người dân nước Việt sáng tạo ra nhiều hình thức sinh hoạt văn hóa phong phú và độc đáo như ngâm Kiều, vịnh Kiều, lẩy Kiều, đố Kiều, dẫn Kiều, ru Kiều, bói Kiều, nhại Kiều...

', 4, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (30, N'Số Đỏ', N'https://cdn0.fahasa.com/media/catalog/product/s/o/so-do_vu-trong-phung_1.jpg', 120.0000, N'Số đỏ là một tiểu thuyết văn học của nhà văn Vũ Trọng Phụng (ông vua phóng sự đất Bắc) đăng ở Hà Nội báo từ số 40 ngày 7 tháng 10 năm 1936 và được in thành sách lần đầu vào năm 1938. Nhiều nhân vật và câu nói trong tác phẩm đã đi vào cuộc sống đời thường và tác phẩm đã được dựng thành kịch, phim. Nhân vật chính của Số đỏ là Xuân - biệt danh là Xuân Tóc đỏ, từ chỗ là một kẻ bị coi là hạ lưu, bỗng nhảy lên tầng lớp danh giá của xã hội nhờ trào lưu Âu hóa của giới tiểu tư sản Hà Nội khi đó. Tác phẩm Số đỏ, cũng như các tác phẩm khác của Vũ Trọng Phụng đã từng bị cấm lưu hành tại Việt Nam Dân chủ Cộng hòa trước năm 1975 cũng như tại Việt Nam thống nhất từ năm 1975 cho đến năm 1986.[1]

', N'Truyện dài 20 chương và được bắt đầu khi bà Phó Đoan đến chơi ở sân quần vợt nơi Xuân tóc đỏ làm việc. Vô tình Xuân tóc đỏ vì xem trộm 1 cô đầm thay đồ nên bị cảnh sát bắt giam và được bà Phó Đoan bảo lãnh. Sau đó, bà Phó Đoan giới thiệu Xuân đến làm việc ở tiệm may Âu Hóa, từ đó Xuân bắt đầu tham gia vào việc cải cách xã hội. Nhờ thuộc lòng những bài quảng cáo thuốc lậu, hắn được vợ chồng Văn Minh gọi là "sinh viên trường thuốc", "đốc tờ Xuân". Hắn gia nhập xã hội thượng lưu, quen với những người giàu và có thế lực, quyến rũ được cô Tuyết và phát hiện cô Hoàng Hôn ngoại tình. Xuân còn được bà Phó Đoan nhờ dạy dỗ cậu Phước, được nhà sư Tăng Phú mời làm cố vấn cho báo Gõ Mõ. Vì vô tình, hắn gây ra cái chết cho cụ cố tổ nên được mọi người mang ơn. Văn Minh vì nghĩ ơn của Xuân nên dẫn Xuân đi xóa bỏ lý lịch trước kia rồi đăng ký đi tranh giải quần vợt nhân dịp vua Xiêm đến Bắc Kì. Bằng thủ đoạn xảo trá, hắn làm 2 vận động viên quán quân bị bắt ngay trước hôm thi đấu nên Xuân được dịp thi tài với quán quân Xiêm. Vì để giữ tình giao hảo, hắn được lệnh phải thua. Kết thúc trận đấu, khi bị đám đông phản đối, Xuân hùng hồn diễn thuyết cho đám đông dân chúng hiểu hành động "hy sinh vì tổ quốc của mình", được mời vào hội Khai trí tiến đức, được nhận huân chương Bắc Đẩu bội tinh và cuối cùng trở thành con rể cụ cố Hồng.

', 4, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (32, N'Sherlock Holmes', N'http://product.hstatic.net/1000237375/product/f8380fa2630080c89bd66910bacfa3ba_e71beff73a294b1aa792de04a8a6e1d2_grande.jpg', 150.0000, N'Sherlock Holmes', N'Sherlock Holmes', 3, 15)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (33, N'Star Treck', N'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781501146312/star-trek-the-original-series-the-weight-of-worlds-9781501146312_hr.jpg', 185.0000, N'Star Treck', N'Star Treck', 7, 18)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (34, N'Star War', N'https://specials-images.forbesimg.com/imageserve/5d2675c34c687b00085c5503/Star-Wars/960x0.jpg?fit=scale', 150.0000, N'Star War', N'Star War', 7, 17)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (35, N'Vạn dặm dưới đáy biển', N'https://cf.shopee.vn/file/60626de1fae2bd22c0ca5f768702abf1', 180.0000, N'Vạn dặm dưới đáy biển', N'Vạn dặm dưới đáy biển', 3, 15)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (37, N'Kỳ án ánh trăng - Quỷ Cổ Nữ', N'https://images.toplist.vn/images/800px/ky-an-anh-trang-quy-co-nu-63813.jpg', 169.0000, N'Kỳ án ánh trăng lấy bối cảnh là những vụ án kỳ lạ, thảm khốc ở một trường đại học Trung Quốc. Quỷ Cổ Nữ đã thực sự thành công trong việc thu hút người đọc vào những khung cảnh ma mị và bất ngờ tột cùng. Toàn truyện chất chứa biết bao câu hỏi, bao thắc mắc nhưng chỉ với một cái kết khá đơn giản, nhà văn đã "cởi nút thắt hàng loạt" những mối nghi ngờ trong lòng độc giả.', N'Những cái chết trong câu chuyện Kỳ án ánh trăng đều là của những nữ sinh xinh đẹp, cùng ở một địa điểm - phòng 405, cùng nhảy lầu tự vẫn trong đêm trăng sáng. Bao trùm lên khung cảnh của truyện là ánh trăng ma quái, tưởng chừng như có thể nuốt chửng bất cứ ai vào bất cứ lúc nào vậy... Đây là một trong những tiểu thuyết hay nhất của Quỷ Cổ Nữ, xứng đáng nằm trong danh sách lựa chọn của bạn!

', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (38, N'Lá cờ ma - Na Đa', N'https://images.toplist.vn/images/800px/la-co-ma-na-da-63821.jpg', 199.0000, N'Được đánh giá là một trong những tiểu thuyết kinh dị được nhiều người đọc nhất, Lá cờ ma với sự xuất hiện của phóng viên trẻ Na Đa đi khắp nơi để khám phá, tìm hiểu những vụ án bí ẩn đã khiến cho người đọc khâm phục và đầy ngưỡng mộ.

', N'Truyện lấy bối cảnh ở thành phố Thượng Hải thời hiện đại, khi anh chàng Na Đa được giao nhiệm vụ tìm hiểu khu nhà 3 tầng đầy bí ẩn. Từ đây cũng là lúc anh dấn thân vào những hiểm nguy để tìm ra ẩn số về lá cờ ma. Đọc truyện của tác giả Na Đa, người đọc sẽ chìm vào một thế giới trinh thám với những cuộc phiêu lưu cực kì thú vị nhưng không kém phần bí ẩn, kì ảo.
', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (39, N'Quán trọ hoang thôn - Sái Tuấn', N'https://images.toplist.vn/images/800px/quan-tro-hoang-thon-sai-tuan-63823.jpg', 139.0000, N'Quán trọ hoang thôn không chỉ là một tiểu thuyết kinh dị mà còn là một câu chuyện tình yêu đầy ma mị và hãi hùng nhưng không kém phần cảm động và chua xót. Đó là một tình yêu sâu nặng, vượt qua thời gian năm nghìn năm, vượt qua không gian của thành phố và hoang thôn, vượt qua cả sự sống và cái chết để tồn tại vĩnh hằng. Nhà văn đã thực sự thành công trong việc khiến người đọc tiếc nuối, bâng khuâng ở cuối truyện.

', N'Với nhân vật chính là Nhiếp Tiểu Sảnh - một cô gái xinh đẹp, đã có một chuyến đi cùng nhóm bạn đến hoang thôn, để rồi những sự kiện ma quái cứ từ đó bám lấy cô và bạn bè không dứt. Xuyên suốt câu chuyện, người đọc dường như phút nào giây nào cũng phải nín thở, chờ đợi những gì sắp diễn ra. Thế nhưng, đọc Quán trọ hoang thôn, tất cả đọng lại trong lòng người đọc không phải là những tình tiết ghê rợn mà lại là những xúc cảm về một tình yêu vĩnh cửu.

', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (40, N'Rạp chiếu phim kinh dị - Hắc Sắc Hỏa Chủng', N'https://images.toplist.vn/images/800px/rap-chieu-phim-kinh-di-hac-sac-hoa-chung-63824.jpg', 199.0000, N'Với hơn 500 chương và chưa có chương kết thúc, tiểu thuyết Rạp chiếu phim kinh dị của nhà văn Hắc Sắc Hỏa Chủng hẳn đã khiến cho người đọc choáng ngợp bởi dung lượng đồ sộ của nó.

', N'Nội dung truyện xoay quanh nhân vật Diệp Tưởng, vô tình bị cuốn vào kịch bản của ma quỷ. Rạp chiếu phim kinh dị có một lời nhắn nhỏ đó là: "Nếu bạn nhặt được một tờ rơi phim kinh dị của Rạp Chiếu Phim Địa Ngục, bạn sẽ phát hiện ra tên của mình xuất hiện trong danh sách các diễn viên của bộ phim. Không những thế, bạn bắt buộc phải tham gia bộ phim đó. Đóng vai một nhân vật trong đó, bạn nhất thiết phải tuân theo yêu cầu của kịch bản phim. Theo sự phát triển của tình tiết phim, những lời nguyền rủa kỳ quái khiến người ta rợn tóc gáy, không nơi nào là không có quỷ ảnh âm u, tất cả sẽ cùng xuất hiện". Đọc truyện, độc giả sẽ thấy những tình tiết mà nhà văn miêu tả thật huyễn hoặc và lôi cuốn, chất chứa biết bao triết lí nhân sinh sâu sắc.

', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (41, N'Nhà giả kim', N'https://images.toplist.vn/images/800px/nha-gia-kim-1269206.jpg', 199.0000, N'Nhà giả kim là một trong những quyển sách hay nhất thời đại của nhà văn Paulo Coelho, tác phẩm là hành trình của cậu thanh niên chăn cừu Santiago tìm kiếm vàng cũng như giấc mơ đời mình. Tác phẩm không đơn thuần là một cuộc phiêu lưu mà còn mang những tư tưởng triết lý rất sâu sắc mà gần gũi, giọng văn cũng nhẹ nhàng như thơ. Liệu đọc xong bạn có tìm được cuộc hành trình phiêu lưu của chính đời mình.

', N'Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.

', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (42, N'Harry Potter Trọn bộ ', N'https://images.toplist.vn/images/800px/harry-potter-1269711.jpg', 499.0000, N'Harry Potter, tác phẩm thành công nhất của J.K.Rowling cũng như nền xuất bản thế giới. Tác phẩm lập nhiều kỷ lục như sách bán chạy nhất, số lượng doanh thu cao nhất,...Tác phẩm là cuộc hành trình học tập của Harry Potter tại Hogwarts cũng như chống lại sự trỗi dậy của phù thuỷ hắc ám Voldemort. Đây hứa hẹn sẽ là tác phẩm hay nhất mà ai cũng nên đọc một lần trong đời.

', N'Nội dung câu chuyện giả tưởng từng gây sốt trên nhiều thị trường sách này kể về cuộc chiến của cậu bé Harry Potter một mình chống lại một phù thủy hắc ám Chúa tể Voldemort, người đã giết cha mẹ cậu để thực hiện tham vọng làm chủ thế giới phù thủy. Harry Potter đã chắp cánh cho trí tưởng tượng của trẻ em trên toàn thế giới bay cao bay xa trong thế giới pháp thuật huyền hoặc. Truyện bắt đầu với một nhân vật bình thường, thậm chí là có phần tầm thường và nó diễn ra ngay bên cạnh chúng ta, bắt đầu từ sân ga 9¾ ở nhà ga Ngã tư Vua. Lần lượt bảy tập truyện sẽ đưa độc giả đi khám phá con đường trở thành pháp sư đầy chông gai, thử thách của Harry cùng với các bạn của mình tại ngôi trường phù thủy Hogwarts.

', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (43, N'Đất rừng phương Nam – Đoàn Giỏi', N'https://images.toplist.vn/images/800px/dat-rung-phuong-nam-doan-gioi-381972.jpg', 179.0000, N'Sau hơn nửa thế kỷ cầm bút, Đoàn Giỏi được ghi nhận là một trong số ít nhà văn Việt Nam đã dành cả cuộc đời gắn bó với một vùng đất. Ông là nhà văn Nam Bộ với tính cách “đặc biệt Nam Bộ”.

', N'Xuất thân là họa sĩ, Đoàn Giỏi vẽ thiên nhiên bằng thứ văn chương đầy màu sắc. Trong Đất rừng phương Nam, ông mượn hành trình phiêu bạt của một cậu bé để giới thiệu địa danh này. Đó là một vùng đất rộng lớn với bạt ngàn rừng tràm, bập bềnh đò nước và mênh mông sông rộng. Đoàn Giỏi đã tái hiện thành công một thế giới vừa hoang dã, thô sơ, vừa trù phú, giàu có – thế giới thuở ông cha ta mở cõi, mang gươm, sống và chiến đấu với thiên nhiên hoang dã.
Ở Đất rừng phương Nam, cảnh vật và con người cùng hiện lên một cách sống động qua từng chi tiết nhỏ, từ những chiếc khăn rằn, xuồng, ghe, những chợ nổi, miệt vườn lúc nào cũng ăm ắp nhựa sống. Vùng đất phương Nam kỳ thú còn gắn với tuổi thơ của nhiều thế hệ khi được chuyển thể thành bộ phim truyền hình cùng tên.

', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (44, N'Đảo giấu vàng – Robert Stevenson', N'https://images.toplist.vn/images/800px/dao-giau-vang-robert-stevenson-381966.jpg', 169.0000, N'Đảo giấu vàng của Stevenson chính là một hòn đảo châu báu mà các cô bé, cậu bé hay mơ mộng về. Chúng có thể nhỏ bé hoặc to lớn, có thể kỳ vĩ hoặc hoang sơ, biệt lập giữa một vùng biển lạ hay ẩn giấu giữa hàng vạn đảo quen, nhưng chắc chắn, chúng ẩn chứa đầy nguy hiểm và bí mật. Cuộc đời của cậu bé Jim Hawkins có lẽ sẽ chẳng có gì, nếu không vì một cơ duyên xảo hợp có được tấm bản đồ bí ẩn của một cựu cướp biển đang trốn chạy đồng bọn. Jim, điền chủ John Tralawney và bác sĩ Lee Livesey đã quyết định lên đường tìm kiếm số kho báu này. Và cuộc phiêu lưu trốn chạy bọn phản loạn, hành trình lạc khỏi nhóm rồi gặp gỡ một người kỳ lạ trên hoang đảo của Jim đã bắt đầu…

', N'Ngay từ khi sinh ra, Robert Stevenson đã mắc bệnh lao, khi lớn lên, ông dành phần lớn thời gian nằm trên giường bệnh. Nhưng óc tưởng tượng tuyệt vời đã đưa Robert đến những miền đất xa lạ của thế giới. Ông đã sáng tạo nên một Đảo giấu vàng từ khát khao được đón nhận thế giới bên ngoài.

', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (45, N'Tây du ký', N'https://images.toplist.vn/images/800px/tay-du-ky-1269197.jpg', 189.0000, N'Tây du ký đã trở nên quá quen thuộc với mọi độc giả gần xa, tác phẩm được chuyển thể thành phim nhiều lần đến nỗi mỗi năm đều có vài tác phẩm mới. Tại sao lại như vậy? Bởi lẽ sức hấp dẫn từ hành trình đi thỉnh kinh cũng như hành trình của đại thánh quá lớn đến mọi tầng lớp. Tác phẩm mang hứa hẹn sẽ mang độc giả đến những vùng đất thần tiên và những cuộc phiêu lưu thú vị nhất.

', N'Tây du ký được xem là tác phẩm văn học đạt đến độ mẫu mực, đứng trong 4 tác phẩm văn học cổ điển vĩ đại nhất của Trung Hoa, gọi là Tứ đại danh tác (cùng với Tam Quốc Diễn Nghĩa của La Quán Trung, Thủy Hử của Thi Nại Am và Hồng Lâu Mộng của Tào Tuyết Cần).

', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (46, N'Hai vặn dặm dưới biển', N'https://images.toplist.vn/images/800px/hai-van-dam-duoi-bien-225183.jpg', 189.0000, N'Hai vặn dặm dưới biển là một trong những tác phẩm thành công và kinh điển nhất của nhà văn Pháp Jules Verne. Biển sâu luôn là một bí ẩn mà ngay cả những nhà khoa học đại tài cùng những thiết bị hiện đại nhất cũng không thể khai phá tìm hiểu được. Tác phẩm sẽ mở ra một đại dương mênh mông đầy những khám phá cho người đọc.

', N'Trong chuyến săn tìm một sinh vật lạ lùng mới xuất hiện ở biển khơi, đoàn thám hiểm của giáo sư Pierre Aronnax bất ngờ bị “con cá” khổng lồ đó nuốt vào bụng. Nhưng cũng nhờ thế, họ đã được chu du khắp các đại dương cùng thuyền trưởng Nemo trong chiếc tàu ngầm Nautilus. Những phát minh kì lạ, những cuộc chạm trán hiểm nguy, những bí mật li kì tất cả đã tạo nên một chuyến phiêu lưu vô cùng thú vị.

Qua cuốn tiểu thuyết viễn tưởng cực kì hấp dẫn của Jules Verne, người đọc cảm nhận được ngọn lửa nhiệt tình không bao giờ tắt trên con đường khám phá thiên nhiên, tìm tòi khoa học và theo đuổi tự do chân chính. Chính điều đó đã góp phần giúp Hai vạn dặm dưới biển làm say lòng hàng triệu độc giả trên khắp thế giới từ hàng trăm năm nay.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (47, N'Anh chàng Hobbit', N'https://images.toplist.vn/images/800px/anh-chang-hobbit-225178.jpg', 169.0000, N'Anh chàng Hobbit sẽ mang bạn đến với một xứ sở thần kỳ đầy màu sắc, nới đây đầy diệu kỳ nhưng cũng đây những cuộc phiêu lưu. Tác phẩm sẽ mang đến nhiều chủng loại người như: Người lùn, Hobbit, Orc... Tác phẩm sẽ theo chân một người Hobbit nhỏ bé Bilbo Baggins thích sống một cuộc sống hưởng thụ, thế nhưng một ngày anh gặp lão phù thuỷ Gandalf đã thay đổi hoàn toàn cuộc đời mình sau này.

', N'Chàng Hobbit nhỏ bé bị cuốn vào một cuộc phiêu lưu đầy nguy hiểm với sứ mạng thiêng liêng, từ đó biết bao tình huống dở khóc dở cười hay nghẹt thở cũng từ nhân vật này.
', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (48, N'Không Gia Đình - Hector Malot', N'https://simg.zalopay.com.vn/zlp-website/assets/khong_gia_dinh_8ae2708ff5.jpg', 159.0000, N'Không Gia Đình - Hector Malot', N'Không Gia Đình là một trong những cuốn tiểu thuyết hay và nổi tiếng trong giới văn học, đã mang đến thành công vang dội cho nhà văn Hector Malot. Nội dung cuốn tiểu thuyết kể về cuộc đời phiêu bạt của một cậu bé Remi - không có cha, không có mẹ. Cậu được đem về nuôi trong một gia đình sống ở vùng quê xa xôi, hẻo lánh nhưng may mắn thay, Remi được mẹ nuôi Barberin yêu thương và xem như con ruột của mình. Do bị tai nạn và những vụ kiện tụng bất thành, ông Barberin vốn dĩ không có tình thương dành cho Remi đã tìm cách đem bán cậu cho ông bầu Vitalis - chủ của một đoàn xiếc rong. Cũng chính từ lúc này, cuộc sống Không Gia Đình của Remi bước sang một trang mới.

', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (49, N'Ông Già Và Biển Cả - Ernest Hemingway', N'https://simg.zalopay.com.vn/zlp-website/assets/Ong_Gia_Va_Bien_Ca_Ernest_Hemingway_835dd9296a.jpg', 149.0000, N'Ông Già Và Biển Cả - Ernest Hemingway', N'Ông Già Và Biển Cả hay còn có tên tiếng Anh là The Old Man and the Sea, đây là một cuốn tiểu thuyết hay và vô cùng nổi tiếng được viết dưới ngòi bút của nhà văn người Mỹ - Ernest Hemingway. Tác phẩm được nhà văn sáng tác vào năm 1951 tại Cuba, đã mang về giải thưởng giá trị Pulitzer. Cuốn tiểu thuyết này được xem là tác phẩm thành công nhất trong sự nghiệp văn chương của nhà văn.

', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (50, N'Tội ác và trừng phạt', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/17081.jpg', 189.0000, N'Tội ác và trừng phạt là cuốn tiểu thuyết hay nên đọc của bậc thầy văn học Nga - Dostoevsky. Mang đậm văn phong cùng dấu ấn của nước Nga, Tội ác và trừng phạt là cuốn tiểu thuyết kinh điển làm rúng động cả thế giới. Tạp chí Times đã bình chọn Tội ác và trừng phạt là một trong những cuốn sách vĩ đại nhất mọi thời đại. Truyện vẽ ra một tình huống bi ai, cùng quẫn nhằm khắc hoạ sâu sắc tính người, giá trị chân - thiện - mỹ trong đời sống xã hội. Đây là một tác phẩm nặng về giá trị tư tưởng nhưng lại rất phù hợp với những độc giả yêu thích văn học kinh điển và lối viết của nó.

Chuyện kể về chàng sinh viên nghèo Raxkônnikốp. Vì cuộc sống bị đẩy đến túng quẫn chàng đã ra tay giết hại hai chị em bà lão cầm đồ. Từ đó, cuộc sống của Raxkônnikốp chìm trong u ám, tuyệt vọng, bế tắc vì phải che giấu tội ác mà mình gây ra. Mặc dù không bị trừng trị thể xác nhưng chính tâm hồn chàng đang bị giày vò và héo mòn từng ngày. Bên cạnh chàng luôn có những người bạn cao quý, nhân hậu và bao dung như nàng Xônya. Nhờ sự quan tâm, giúp đỡ của mọi người xung quanh, chàng dần cảm nhận được hơi ấm tình người cao đẹp và quyết tâm ra đầu thú.', N' ', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (51, N'Sherlock Homles', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/10416.jpg', 189.0000, N'Với những người yêu thích truyện trinh thám, Sherlock Homles là một tượng đài văn học khó lòng có thể thay thế. Tác phẩm vừa giống như một cuốn nhập môn trinh thám lại vừa giống một tác phẩm trinh thám kinh điển không thể nào quên. Sherlock Homles - nhân vật cùng tên trong tác phẩm cũng được bình chọn là nhân vật văn học được yêu thích nhất trên thế giới. Chính Sherlock Homles đã đưa tác giả Authur Conan Doyle lên hàng bậc thầy trinh thám thế giới. Dù hiện nay, văn học trinh thám thiên nhiều về hướng hiện đại thì những tác phẩm trinh thám cổ điển phá án theo lối tư duy truyền thống như Sherlock Homles vẫn còn nguyên sức hút khó cưỡng.

Sherlock Homles là câu chuyện xoay quanh vị thám tử cùng tên nổi tiếng với tài phá án thần kì, trí nhớ xuất sắc và sự phán đoán sắc bén. Truyện được kể lại qua lời của bác sĩ Watson - trợ lý của thám tử Sherlock Homles. Truyện gồm nhiều phần, mỗi phần là một vụ án mà cả hai đã tham gia.', N' ', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (52, N'Carol', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/19405.jpg', 169.0000, N'Carol là câu chuyện tình yêu đồng tính giữa Carol - người phụ nữ giàu có đang chuẩn bị ly dị chồng và Therese - một nhân viên thu ngân với ước mơ trở thành nhà thiết kế sân khấu. Lần đầu tiên Therese gặp Carol, cô đã biết mình trúng tiếng sét ái tình dẫu đang quen một chàng trai tên Richard. Đó là tình yêu xuất hiện một cách tự nhiên, ngọt ngào, nhẹ nhàng mà cả hai đều không thể cắt nghĩa.

Carol là cuốn tiểu thuyết hay nên đọc về tình yêu đồng tính. Đó giống như một lời tuyên bố với thế giới về sức lan rộng và quyền bình đẳng của giới LGBT. Trên hết, đó là câu chuyện về một nước Mỹ những năm 50 - xa hoa, thân thiện và đáng mến. Dẫu vậy, người ta vẫn không thể bao dung cho những mối tình đồng tính. Nhưng đi ngược với kết thúc buồn thảm, bi thương, Carol mang đến cái kết tràn đầy hi vọng cho các cặp đôi đồng tình nữ.', N' ', 4, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (53, N'Đề thi đẫm máu', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/12121.jpg', 149.0000, N'Thêm một cuốn tiểu thuyết hay nên đọc thể loại trinh thám xếp trong list hôm nay nhưng khác với Sherlock Homles là trinh thám Anh thì Đề thi đẫm máu là trinh thám Trung Quốc. Đề thi đẫm máu mang hơi thở của trinh thám hiện đại và phương Đông với những câu chuyện giả ma giả quỷ u ám, rợn người. Truyện khai thác sâu nghệ thuật phân tích tâm lý tội phạm để mỗi vụ án trở nên hấp dẫn, kỳ bí hơn. Chính nhờ những yếu tố đặc sắc trên, Đề thi đẫm máu đã trở thành cuốn tiểu thuyết trinh thám ăn khách của Trung Quốc và thế giới. Ngoài bộ truyện này, các bạn có thể tìm thêm những cuốn sách khác trong cùng series của Lôi Mễ như Độc giả thứ 7, Giáo hoá trường, ....

Phương Mộc là sinh viên chuyên ngành Pháp lý đại học J. Trong lớp, Phương Mộc vốn là nam sinh trầm ổn, nhạt nhoà nhưng thành tích học tập tương đối xuất sắc. Một sự kiện giết người hàng loạt gây chấn động thành phố lúc bấy giờ xảy ra. Khi cảnh sát còn đang lâm vào bế tắc, chàng sinh viên Phương Mộc đã ra tay chỉ điểm, giúp đỡ cảnh sát truy bắt hung thủ. Nhưng từ đấy, xung quanh Phương Mộc xảy ra nhiều vụ án liên tiếp với những cái chết vô cùng thương tâm. Phải chăng, có ai đó trong bóng tối đang thách thức khả năng của anh?', N' ', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (54, N'Âm thanh và cuồng nộ', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/18389.jpg', 169.0000, N'Âm thanh và cuồng nộ là cuốn sách nổi bật trong nền văn học hiện đại. Tác phẩm được sáng tác bởi William Faulkner - một tác giả xuất sắc được thế giới ca tụng ngang hàng với nhiều nhà văn lỗi lạc như Dostoevsky. Ông cũng nằm trong hàng ngũ tiên phong sáng tạo văn học mới cùng với Franz Kafka, Marcel Proust,... Âm thanh và cuồng nộ là tác phẩm thứ tư của Faulkner và cũng là tác phẩm được bạn đọc Việt Nam vô cùng yêu thích. Truyện mở ra một thế giới âm u, náo động, hàng chục trang không có lấy một dấu chấm, những ẩn dụ rắc rối bí hiểm nhưng chính là nét phong cách độc đáo của ông. Với Faulkner, tác phẩm sẽ không theo lối viết thông thường mà buộc độc giả phải đọc chậm rãi, suy tư và ngâm cứu kĩ càng.

Câu chuyện xoay quanh gia đình Compson - đó là một gia tộc từng một thời giàu có, quyền quý trong vùng Missississipi. Truyện kể lại tấn thảm kịch gia đình sụp đổ, tan vỡ.', N' ', 4, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (55, N'Báu vật của đời', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/16994.jpg', 179.0000, N'Nói về những tiểu thuyết hay nên đọc của Trung Quốc thì không thể không nhắc đến truyện Báu vật của đời của tác giả Mạc Ngôn. Mạc Ngôn là một nhà văn lớn của nền văn học Trung Quốc. Ông có tác phẩm Cao Lương Đỏ vô cùng nổi tiếng đã được đạo diễn Trương Nghệ Mưu chuyển thể thành phim. Báu vật ở đời là tác phẩm khái quát trọn vẹn một thời kì lịch sử Trung Quốc, những chuyển biến xã hội sâu sắc và những nét văn hoá rất riêng của Trung Quốc. Đây là một tác phẩm chứa đựng nhiều ý nghĩa to lớn.

Báu vật ở đời xoay quanh các thế hệ trong gia đình nhà Thượng Quan, nổi bật nhất là cuộc đời của người phụ nữ Thượng Quan Lỗ Thị gắn liền với đau thương, thăng trầm và lịch sử phát triển của Trung Quốc.', N' ', 4, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (56, N'Nữ sinh', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/12026.jpg', 99.0000, N'Nữ sinh là một tác phẩm của văn học Nhật vô cùng nổi tiếng và tạo tiếng vang toàn thế giới. Truyện mang đậm đặc điểm nổi bật của văn học Nhật Bản là khuynh hướng hướng tâm, ngôn từ nhẹ nhàng, kín đáo, lặng lẽ. Câu chuyện cũng đan xen hài hoà những hơi hướm mới của thế giới đương đại để thổi một làn gió mát vào từng chương truyện. Nữ sinh là một cuốn sách vô cùng thích hợp đọc để tìm hiểu về văn hoá và con người Nhật Bản.

Truyện chia ra thành nhiều chương nhỏ, mỗi chương là câu chuyện về một nhân vật khác nhau nhưng tất cả bọn họ đều là những nữ sinh Nhật Bản. Ở họ có chung nét tính cách của người phụ nữ xứ Phù Tang: dịu dàng, khép kín và bền bỉ.', N' ', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (57, N'Lĩnh Nam chích quái', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/6108.jpg', 109.0000, N'Đã là người Việt Nam, chắc hẳn mọi người đều nghe đến cuốn tiểu thuyết hay nên đọc mang tên Lĩnh Nam chích quái. Đây là bản truyện cổ gồm 22 thần thoại, truyền thuyết, sự tích xuyên suốt lịch sử hình thành và xây dựng nước Việt Nam. Lĩnh Nam chích quái đã thể hiện sự sáng tạo phong phú của các tác giả Việt, những câu chuyện về văn hoá, tôn giáo, tín ngưỡng của người Việt. Truyện có ý nghĩa quan trọng trong việc xây dựng ý thức quốc gia dân tộc Việt, tấm gương phản chiếu đời sống tinh thần phong phú của người Việt cổ, sự giao lưu văn hoá với các nước bạn như Trung Quốc, Chiêm Thành…

Lĩnh Nam chích quái là cuốn sách cần phải đọc cho những ai muốn tìm hiểu về văn hoá nước Việt.', N' ', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (58, N'All In Love - Ngập Tràn Yêu Thương', N'https://img.vn.my-best.com/product_images/48632373059cd810bca04f13876907ee.png?ixlib=rails-4.3.1&q=70&lossless=0&w=240&h=240&fit=fill&fill=solid&fill-color=FFFFFF&s=f8b0adf419b3225e5333199004e429f8', 99.0000, N'Nhật Ký Yêu Thương Tràn Ngập Tiếng Cười', N' ', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (59, N'Yêu Em Từ Cái Nhìn Đầu Tiên', N'https://img.vn.my-best.com/product_images/888c3e812be942e78016839a7fafd858.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=240&h=240&fit=fill&fill=solid&fill-color=FFFFFF&s=50a740b4734ad71b97fa216a29cecf0d', 89.0000, N'Tình Yêu Qua Game Đến Đời Thực', N' ', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (60, N'Mãi Mãi Là Bao Xa', N'https://img.vn.my-best.com/product_images/a211b26463fe37e0eab660fa2dc89e6b.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=240&h=240&fit=fill&fill=solid&fill-color=FFFFFF&s=e04b1635a3d97a44174af8fc6c7414df', 79.0000, N'Tình Yêu Vượt Qua Mọi Khoảng Cách', N' ', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (61, N'Từng Có Người Yêu Tôi Như Sinh Mệnh', N'https://img.vn.my-best.com/product_images/4f3b9c3b128871de98f43877f88d9f3b.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=b10b84d2f43e0c5699fe3ca54124d81e', 69.0000, N'Đây là bộ truyện ngôn tình buồn đã đánh động trái tim của nhiều độc giả. Thứ tình cảm chân chất mộc mạc mà Gia Ngộ dành cho Triệu Mai khiến người đọc không khỏi day dứt và cảm phục. Anh vì yêu mà sẵn sàng buông tay, chỉ tâm niệm "Chúc em một đời bình an vui vẻ".

', N' ', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (62, N'Bên Nhau Trọn Đời', N'https://img.vn.my-best.com/product_images/fedb51240071a0eaff8bea32dfeb030b.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=bb926192705ce934a52215402ac3896e', 59.0000, N'Tình yêu chớm nở thời đại học bỗng kết thúc do một hiểu lầm tai hại. 7 năm sau, Triệu Mặc Sênh và Hà Dĩ Thâm một lần nữa gặp lại nhau. Cuộc hôn nhân bất ngờ do anh đề nghị tưởng như khiên cưỡng lại là sợi dây gắn kết họ, xóa tan hiểu lầm trong quá khứ.

', N' ', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (63, N'Tịch Mịch', N'https://img.vn.my-best.com/product_images/5ed1ce0a6cdd7caad9475f73935c1ed6.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=57c7165c0fb1c589617d0c7922d8a5eb', 89.0000, N'Tác phẩm là bộ truyện ngôn tình Trung Quốc lấy bối cảnh cung đình triều Mãn Thanh, về mối tình giữa hoàng đế Khang Hy và nàng Lâm Lang. Câu chuyện tình cảm không toàn vẹn ấy thật đẹp nhưng cũng đầy nuối tiếc, khiến người đọc cảm nhận một cách sâu sắc về tình yêu của bậc đế vương.

', N' ', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (64, N'Nụ Hôn Của Sói', N'https://img.vn.my-best.com/product_images/b8adce6238ac95dc2613bed03e3a635d.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=4f3969b9fcc4565d781384e1a3dcf658', 79.0000, N'Nụ Hôn Của Sói là một trong những tác phẩm ngôn tình đầu tiên của Diệp Lạc Vô Tâm ghi dấu ấn trong lòng độc giả Việt. Nội dung hài hước, đầy kích thích về tình yêu giữa cô cảnh sát trẻ luôn nêu cao tinh thần chính nghĩa Tư Đồ Thuần và An Dĩ Phong đại ca xã hội đen nức tiếng tạo nên bầu không khí mới mẻ, gợi trí tò mò. 

', N' Người đọc không khỏi hồi hộp chờ đón những diễn tiếp tiếp theo của chuyện tình tréo ngoe. Giọng văn hài hước đan cài nhiều câu từ mang tính trào phúng tạo nên tính giải trí rất riêng, cuốn hút của bộ truyện. 

', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (65, N'Không Kịp Nói Yêu Em', N'https://img.vn.my-best.com/product_images/ab1d19760446e0f3ab030bd285cb17b2.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=4cd72f31c4a580f4ab5799e259a89059', 89.0000, N'Không Kịp Nói Yêu Em là bộ truyện ngôn tình dân quốc nổi tiếng của Trung Quốc về chuyện tình đẹp mà bi thương giữa Mộ Dung Phong và Doãn Tĩnh Uyển. Thời thế tạo cho họ cơ duyên gặp nhau nhưng cũng chính thời thế ấy đẩy họ đến kết cục sinh li đầy bi lụy, ai oán.

', N'Bộ truyện khắc họa một cách chân thực tình yêu trong thời kỳ loạn lạc với nguy hiểm luôn rình rập của bom đạn chiến tranh và những âm mưu, toan tính. Không chỉ nổi tiếng với bản nguyên tác, bộ truyện còn tạo ấn tượng mạnh mẽ ở phiên bản phim chuyển thể năm 2010 đến nay vẫn còn nguyên sức hút. 

', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (66, N'Cô Gái Năm Ấy Chúng Ta Cùng Theo Đuổi', N'https://img.vn.my-best.com/product_images/e38133d22b7c6e221a49fc39fe57a99f.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=517acb14d0a97e179ac650650551c315', 99.0000, N'Cô Gái Năm Ấy Chúng Ta Từng Theo Đuổi đưa bạn đi một hành trình toàn vẹn từ  từ sôi nổi, nhiệt huyết của tình cảm tuổi mới lớn đến lắng đọng, trưởng thành khi nhìn lại từ hiện tại. Câu chuyện xoay quanh Kha Cảnh Đằng, cậu học sinh ngỗ ngược quậy phá và nhóm bạn 5 người cùng thầm thương cô bạn lớp trưởng học giỏi xinh xắn Thẩm Giai Nghi.

', N'Âm hưởng man mát buồn từ hồi kết của chuyện tình học đường ngây ngô sẽ còn đọng lại mãi trong lòng người đọc. Đề tài học đường gần gũi, lời văn giản dị dễ gần đã tạo nên bộ truyện thanh xuân chân thực, dễ đọc mà ngay cả người không quen với dòng văn ngôn tình cũng sẽ yêu thích khi đến với tác phẩm.

', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (67, N'Sinh Viên Tồi Trường Bắc Đại', N'https://img.vn.my-best.com/product_images/b1654dfc9766f0b5da6eb6a70dc7636b.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=456ba3f0ace0c5722b2c180778456e8e', 89.0000, N'Mối Tình Thanh Xuân Của Oan Gia Trường Bắc Đại
', N'Câu chuyện xoay quanh Chu Lâm Lâm và Phương Dư Khả cùng cuộc sống sinh viên xa nhà tại Đại học Bắc Kinh danh tiếng. Nữ chính là cô gái ngây ngô tính tình vô lo vô ưu vào Bắc đại với chỉ một mục tiêu để không bị đuổi học! Trong khi, nam chính Phương Dư Khả lại là một học bá tài giỏi nhưng độc miệng, luôn chôn giấu mối tình đơn phương với cô bạn ngốc ngếch.

', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (68, N'WOLF HALL- HILARY MANTEL', N'http://static.ybox.vn/2017/8/23/a52df8b2-87de-11e7-a7c3-56c566ee3692.jpg', 99.0000, N'Tiểu thuyết Wolf Hall (Đại sảnh sói) là tác phẩm từng giúp nữ văn sĩ Anh Hilary Mantel giành giải Man Booker danh giá năm 2009.

', N'Tiểu thuyết kể về cuộc đời của 1 chính khách dòng Tudo là Thomas Cromwell. Với phong cách viết đi thẳng vào vấn đề rất ấn tượng, Matel đã khắc họa lên một nhân vật chính đầy tham vọng, khôn ngoan, dẻo dai và trí tuệ. Qua đó những sự kiện lịch sử về Tudo, vua Henry VIII ly dị vợ Catherine thành Aragon được thể hiện qua cái nhìn sắc sảo của nhân vật chính Cromwell, đại diện cho lực lượng tiến bộ này.

', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (69, N'ROMOLA- GEORGE ELIOT', N'http://static.ybox.vn/2017/8/23/eb21d4e2-87de-11e7-95d5-2e995a9a3302.jpg', 109.0000, N'Tác phẩm là một “cú đại bác” bắn vào thế giới tiểu thuyết lịch sử', N'Lấy bối cảnh miền Florence thời kỳ Phục Hưng thế kỷ 15, thiên anh hùng ca viết về câu chuyện tình lịch sử giữa nhà truyền giáo Romola và học giả người Ý gốc Hy lạp Tito Melema, người sau này trở thành 1 chính trị gia thâm hiểm. Cuốn tiểu thuyết chứa nhiều những mốc lịch sử quan trọng. Điểm độc đáo và không kém phần bí ẩn là sự tương đồng đến kỳ lạ giữa thành Florence trong truyện với Vương quốc Anh, giữa Romola và chính tác giả: cả 2 đều có cuộc sống cực khổ nhưng luôn vươn lên trong học tập.', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (70, N'THE LEOPARD – GIUSEPPE TOMASI DI LAMPADUSA', N'http://static.ybox.vn/2017/8/23/f99c91c4-87de-11e7-b01b-cac091044fd5.jpg', 199.0000, N'Lấy bối cảnh Sicily thời Phục hưng Thống nhất nước Ý những năm 1860', N'Đây là cuốn tiểu thuyết duy nhất của Lampadusa, được xuất bản sau năm 1958, là một bức chân dung phong phú về một dòng dõi quý tộc đương suy tàn, dựa trên cuộc đời ông cố của chính tác giả. Lampadusa mang lại một cảm giác hiện đại cho lịch sử thế kỷ 19, miêu tả lại cuộc đời giàu sang nhưng đầy trắc trở của Hoàng tử Fabrizio – “chú báo” trong tiêu đề tác phẩm. Những miêu tả về nhà cửa, phong cảnh cực kỳ quyến rũ của tiểu thuyết cũng đã được truyền tải xuất sắc trong bộ phim lộng lẫy của Visconti vào năm 1963, với Burt Lancaster vào vai vị Thái tử.', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (71, N'BROOKLYN – COLM TÓIBÍN', N'http://static.ybox.vn/2017/8/23/08a960c0-87df-11e7-bad9-2e995a9a3302.jpg', 109.0000, N'Colm Tóibín là một trong những nhà văn Ireland tài năng nhất ở thế hệ của ông. Các tác phẩm của Tóibín không chỉ được nhiều độc giả yêu thích mà còn được các đồng nghiệp ngưỡng mộ.

', N'Tiểu thuyết Brooklyn kể về chuyến di cư của một phụ nữ trẻ Eilis Lacey từ Ireland rời nhà đi tìm cuộc sống mới ở Brooklyn vào những năm 1950 theo dòng chảy của thời cuộc, trải nghiệm sự cô độc nhưng cũng không kém phần thú vị. Nhờ hóa thân tới tài tình vào nhân vật Eilis cũng những nhận định sắc sảo của nhân vật này, Tóibín đã rất thành công trong việc đưa độc giả tới những trải nghiệm tươi mới và đầy thực tế.
Mặc dù đạt được thành công lớn trong nghiệp viết văn khi đoạt giải văn chương Costa nhưng nhà văn từng thổ lộ, ông thật sự không thích thú gì với công việc viết lách và điều hấp dẫn nhất của công việc này chính là tiền.


', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (72, N'PURE – ANDREW MILLER', N'http://static.ybox.vn/2017/8/23/194c4c44-87df-11e7-8c47-cac091044fd5.jpg', 109.0000, N'Tác phẩm Pure (Tinh khiết) giành giải Costa 2011 kể về những bước tiến tiền cách mạng Paris của chàng kỹ sư trẻ Jean-Baptiste Baratte, người gánh trọng trách giám sát việc phá hủy nhà thờ Les Innocents và san bằng nghĩa trang tại đó.

', N'Không chỉ kể lại một câu chuyện hấp dẫn, cuốn tiểu thuyết kịch tính hoá một số mâu thuẫn chủ đạo của thời Khai sáng: giữa lịch sử và tiến bộ, giữa nhớ và quên. Miller đã gợi lại một cách xuất sắc cảm quan, hình ảnh và âm thanh của Paris thế kỷ 18 bằng những áng văn xuôi súc tích, kéo độc giả vào một thời đại mới mẻ thật dễ dàng.

', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (73, N'THE BLUE FLOWER – PENELOPE FITZGERALD', N'http://static.ybox.vn/2017/8/23/26f1c5b8-87df-11e7-80f1-cac091044fd5.jpg', 109.0000, N'Là tác phẩm cuối cùng của Fitzgerald, được xuất bản năm 1995, tiểu thuyết Blue Flower (Bông hoa xanh dương) khắc họa sinh động cuộc sống của nhà quý tộc người đức Friederich von Hardenberg hồi thế kỷ 18. Đây là câu chuyện tình yêu của nhà quý tộc dành cho nàng Sophie von Kühn. Chàng “mới” 20 còn nàng “đã” 12. Nhưng họ đã đính hôn và nàng qua đời 2 năm sau đó vì bệnh nhiễm khuẩn.

', N'Giống như tất cả các tiểu thuyết của Fitzgerald, tác phẩm này khá mỏng, có đầy sự vận chuyển trong quan điểm và những đoạn súc tích theo trường phái ấn tượng. Nhiều người đánh giá đây là tác phẩm hay nhất của Penelope Fitzgerald, nhưng nó đã không lọt được vào danh sách tác phẩm đề cử cho giải Booker năm 1995 – một quyết định mà nhiều người cho là không thể hiểu nổi.

', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (74, N'I, CLAUDIUS – ROBERT GRAVES', N'http://static.ybox.vn/2017/8/23/31dc1280-87df-11e7-93b5-2e995a9a3302.jpg', 109.0000, N'Quyển tiểu thuyết cực kỳ nổi tiếng này ra đời từ năm 1934, là quyển tự truyện hư cấu của Hoàng đế La Mã đệ tứ. Graves sử dụng cách này để kể lại lịch sử người tiền nhiệm của Claudius Augustus: Tiberius và Caligula – trong khi tác phẩm theo sau của ông vào năm 1935, Claudius the God, lại tập trung vào chính nhân vật này.

', N'Những khiếm khuyết của Claudius – bao gồm cả tật nói lắp – dẫn tới việc ngài bị cách ly trong đời sống xã hội thời niên thiếu. Graves không hề miêu tả Claudius như một gã ngốc vô hại, mà là một con người can đảm. Về sau này Graves đã phớt lờ các quyển sách này vì viết chúng chỉ đơn thuần với mục đích lợi nhuận, nhưng chúng vẫn được liệt vào hàng tác phẩm cổ điển trong dòng văn học này.

', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (75, N'PROPERTY – VALERIE MARTIN', N'http://static.ybox.vn/2017/8/23/3cfb7034-87df-11e7-9201-2e995a9a3302.jpg', 109.0000, N'Tiểu thuyết của Martin như viên đạn mang đầy tính châm biếm và coi thường bắn vào giai cấp chủ nô. Bà đã đoạt giải văn chương Orange Prize nhờ tác phẩm mang đầy tính nhân văn và lịch sử này.

', N'Cuốn tiểu thuyết được xuất bản năm 2003 của Martin là bức tranh tự họa chân thực về cuộc sống của một đồn điền nô lệ những năm 1830. Nhân vật chính là Manon, 1 phụ nữ trẻ sa lầy trong cuộc hôn nhân không tình yêu với người chồng ngu đần và thô bạo, đồng thời là ông chủ của mình. Cô luôn âm thầm chống lại cuộc hôn nhân mang đầy tính phục dịch và nô lệ này với tinh thần và lòng dũng cảm tuyệt vời và trở thành người tiên phong đấu tranh chống chế độ nô lệ.

', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (76, N'REGENERATION TRILOGY – PAT BARKER', N'http://static.ybox.vn/2017/8/23/48552f06-87df-11e7-98a7-2e995a9a3302.jpg', 109.0000, N'Bộ sách rất được hoan nghênh khi xuất bản, và quyển thứ 3, The Road Home, đã giành giải Booker năm 1995. Barker đến nhận giải cùng chồng bà, một nhà thần kinh học khá thân thiết với Rivers.

', N'Bộ 3 tiểu thuyết của Barker đầu những năm 90 là câu chuyện về bác sĩ tâm thần William Rivers và cuộc điều trị tiên phong của ông trên các binh lính Thế chiến thứ nhất – Bao gồm Siegfried Sassoon và Wilfred Owen – với phương pháp sốc điện tại Bệnh viện chiến tranh Craiglockhart gần Edinburgh. Barker pha trộn thực tế với những tưởng tượng hư cấu nhằm tạo ra một câu chuyện vô cùng thu hút, liên quan đến nhiều mảng đề tài ngoài chiến tranh, bao gồm bệnh tâm thần, giai cấp, vấn đề đồng tính, lẫn sự sáng tạo.

', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (77, N'OLD GORIOT – HONORÉ DE BALZAC', N'http://static.ybox.vn/2017/8/23/51459f2e-87df-11e7-aab4-2e995a9a3302.jpg', 109.0000, N'Old Goriot (Lão Goriot) là một tiểu thuyết xuất bản lần đầu năm 1835 của nhà văn Pháp Honoré de Balzac. Đây là một tác phẩm thuộc phần Những cảnh đời của bộ tiểu thuyết đồ sộ Tấn trò đời.

', N'Lấy bối cảnh là kinh đô Paris năm 1819, Lão Goriot đề cập tới số phận của ba nhân vật, ông lão Goriot, tên tù khổ sai vượt ngục Vautrin và anh sinh viên luật Eugène de Rastignac. Tiểu thuyết này được coi là một trong những tác phẩm quan trọng nhất của Balzac.
Lão Goriot cũng là điển hình cho chủ nghĩa hiện thực trong phong cách viết của Balzac với những nhân vật được mô tả chi tiết và có chiều sâu.


', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (78, N'451 Độ F', N'https://img.vn.my-best.com/product_images/ce04a68d32b94eb58ac7cff4452755ae.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=7a2eeb7eb73f01b9d9d9d43fa72b40e7', 199.0000, N'Sách Vở Bị Cấm Đoán, Sự Tù Túng Mang Dáng Dấp Thực Tại
', N'Tại một thế giới trong tương lai, sách vở trở thành thứ hàng cấm vì nó khiến con người ta “có suy nghĩ” – một thứ nguy hiểm và thừa thãi đối với xã hội, anh lính Montag khi làm nhiệm vụ thiêu hủy sách thường nhật đã bắt gặp một cô gái trẻ, và lần đầu trong đời anh sững sờ đối diện với những suy nghĩ về chính mình và xã hội này.
Tác phẩm gây ấn tượng bằng cốt truyện dị thường, đảo lộn trong nhận thức về một xã hội bài trừ sách vở. Đâu đó trong câu truyện là những nét tái hiện chân thật về xã hội hiện đại, nơi thông tin được gói gọn và sách vở dần bị thay thế. Hồi chuông báo động mà tác giả gióng lên qua câu chuyện giả tưởng làm người đọc không khỏi tự vấn về giá trị cốt lõi của nhân loại mà con người cần bảo vệ là gì trong xã hội phát triển ngày nay. 

', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (79, N'Nhà Hàng Ở Tận Cùng Vũ Trụ', N'https://img.vn.my-best.com/product_images/1c0c8e6964da7239d90e83de8d4e3b15.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=b929faf4c79dc929d9f062c0ce791691', 189.0000, N'Độc Đáo Với Phong Cách Sci-Fi Ngẫu Hứng Hài Hước!
', N'Tác phẩm sở hữu giọng văn hóm hỉnh, ngẫu hứng như một món ăn tinh thần mới lạ trong thế giới của dòng khoa học viễn tưởng. Không hề mang nội dung nặng nề, cốt truyện khó nắm bắt, chuyến du hành đầy tính trào phúng của anh chàng Arthur và nhóm bạn lạc trôi giữa vũ trụ sẽ đem lại cho bạn những tràng cười sảng khoái. 

Tác phẩm là tập truyện thứ 2 trong series tiểu thuyết Sci-fi của Douglas Adams, vốn bắt nguồn từ một chương trình trên đài BBC của chính ông. Bằng ngôn từ gần gũi đậm nét hài hước, Douglas đưa người đọc đến cuộc hành trình có một không hai tiến vào vũ trụ, với những tình huống ngặt nghèo dở khóc dở cười. Tiến bộ khoa học, bước tiến của con người vào không gian?! Ai quan tâm chứ, nhà hàng tận cùng vũ trụ có đồ ăn dâng tận miệng, trò giải trí thả ga còn đang đợi cơ mà!

', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (80, N'Animorphs – Người Hóa Thú', N'https://img.vn.my-best.com/product_images/e6b1be2b7b2f37b314a173c3e0298b35.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=5066eae6e4186d1b3eb20ec32592a97b', 189.0000, N'Thiếu Niên Chiến Đấu Bảo Vệ Trái Đất Với Quyền Năng Hóa Thú
', N'Animorphs là một trong những tác phẩm kinh điển với nhiều thế hệ độc giả. Nội dung truyện xoay quanh nhóm bạn 5 thành viên được trao quyền năng hóa thú để bảo vệ trái đất trước sự đổ bộ của những giống loài ngoài hành tinh. Điểm nhấn ở đây nằm ở cách xây dựng nhân vật từ chính diện đến phản diện có chiều sâu, thu hút người đọc đến với trang sách và không ngừng dõi theo sự phát triển của nhân vật.
Truyện thuộc loại tiểu thuyết dài kì, đã phát hành 12 tập tại Việt Nam. Cốt truyện chiến đấu giết quái thú khá dễ tiếp cận với người đọc đại chúng, tình tiết truyện giữa các tập có tính liên kết chặt chẽ duy trì cảm giác phấn khích hồi hộp. Đây là một tuyển tập ly kỳ hướng đến độc giả trẻ nhưng không hề trẻ con một chút nào.

', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (81, N'Cỗ Máy Thời Gian', N'https://img.vn.my-best.com/product_images/31d41cd2bb8a27764400bf48796f1148.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=afea41f3ca0f13b87a20c270a67a7915', 189.0000, N'Lời Cảnh Tỉnh Cho Con Người Về Hiểm Họa Tương Lai
', N'Đây là một câu chuyện thuộc thể loại du hành vượt thời gian. Nhân vật chính sử dụng phát minh "Cỗ máy Thời Gian" của mình để du hành vào tương lai hàng nghìn năm sau của nhân loại và bàng hoàng trước sự hoang tàn, tiêu đều thoái hóa của xã hội tương lai.

Truyện ra đời từ thế kỉ 19, đánh dấu sự ra đời của thuật ngữ "Cỗ máy thời gian - Time Machine" trong dòng văn học Sci-fi. Thế giới mà tác giả xây dựng thể hiện một tầm nhìn rộng mở, tiến bộ của người đi trước, để lại nhiều suy ngẫm và trăn trở cho chúng ta về tham vọng không kìm hãm của con người và hậu họa để lại cho thế hệ tương lai.

', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (82, N'Người Truyền Ký Ức', N'https://img.vn.my-best.com/product_images/7f23a3ef719c833001a660306c8e00be.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=5bea8697bbca871653e8843b3aa7565a', 199.0000, N'"Thế Giới Hoàn Hảo" Liệu Có Thật Sự Hoàn Hảo?
', N'Tác phẩm mở đầu bằng bối cảnh quen thuộc trong dòng khoa học viễn tưởng – Utopia hay còn gọi là thế giới hoàn hảo. Ở một thế giới không có chiến tranh, không xung đột, không có đói nghèo, không cướp bóc, tưởng chừng như hoàn hảo,  ứa trẻ được chọn làm người được “truyền kí ức” tên Jonas dần khám phá ra hình hài thật của xã hội.
Đây là một câu chuyện giả tưởng không hề khó hiểu khi tác giả xây dựng thế giới qua góc nhìn của một cậu bé với  sự tương phản giữa cái đẹp của cảm xúc, của tinh yêu gia đình và sự tàn khốc ẩn mình trong xã hội. Bất kể là trẻ em hay người lớn đều có thể tận hưởng câu chuyện theo cách riêng của mình. 
', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (83, N'Kẻ Trộm Giấc Mơ', N'https://img.vn.my-best.com/product_images/16c201281467528806e824526039f0cd.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=b0b5913b913ce08a6b97670014e8db8c', 199.0000, N'Bản Thể Con Người Qua Hình Hài Giấc Mơ
', N'Bằng vỏ bọc Paprika – thám tử giấc mơ, Chiba Atsuko đã phát minh ra thiết bị DC Mini giúp các bác sĩ xâm nhập vào giấc mơ để điều trị cho các bệnh nhân. Biến cố bắt đầu khi 3 chiếc DC Mini bị đánh cắp và trên hành trình tìm lại DC Mini, cô bắt đầu khám phá ra hiện thực của xã hội đen tối, phô bày hình hài méo mó trong bản chất con người.
Đây là một tác phẩm khoa học tâm lý giả tưởng kịch tính, nghẹt thở, nơi tác giả đã xây dựng nên một thế giới nhập nhằng giữa hư thực khi con người có khả năng đi vào giấc mơ của người khác. Mặt tối của xã hội hiện đại được khéo léo lồng ghép trong bối cảnh viễn tưởng, dấy lên nhiều suy ngẫm về bản chất con người. Tác phẩm có nội dung và bối cảnh gần gũi với đời thực, khiến bạn dễ dàng hòa vào không khí của mạch truyện.

', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (84, N'Sáu Đợt Thức Tỉnh', N'https://img.vn.my-best.com/product_images/dbb55af8f7f1fdb7c97f2a543a21bd4e.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=7aefb06a9a605396027d7d6bb2f89f9b', 199.0000, N'Trinh Thám Viễn Tưởng Đầy Lôi Cuốn
', N'Nếu bạn là một fan của văn học trinh thám nhưng lại muốn thử đọc Sci-fi thì đây chính là cuốn sách phù hợp. Trên con tàu phi hành Dormine là 6 cô gái, những bản thể vô tính cứ một lần chết đi là một lần “thức tỉnh” trong thân xác mới. Truyện mở đầu đầy kịch tích khi 6 cô gái “thức tỉnh” trong thân xác mới trên con tàu đầy máu, không ai nhớ gì về chuyện đã xảy ra. Vậy là, 6 thân xác cũ đã bị giết, hung thủ chỉ có thể là một trong số họ!
', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (85, N'All You Need Is Kill – Cuộc Chiến Luân Hồi', N'https://img.vn.my-best.com/product_images/dc15d68b71951182d61ecde97269351c.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=4033d1102ebaf83628a88dfd9098f15a', 99.0000, N'Cuộc Chiến Với Quái Vật Ngoài Hành Tinh Được Chuyển Thể Thành Phim
', N'Đứng trước thảm họa tấn công của sinh vật vũ trụ Gitai, cậu thiếu niên Kiriya Kenji chính là chìa khóa mang lại hòa bình cho nhân loại. Vòng lặp được tái lập, cuộc chiến mới lại bắt đầu cho đến khi diệt sạch lũ quái vật.  Tác phẩm đã gây tiếng vang ở nhiều nước sau khi ra mắt và được chuyển thể thành manga, phim bom tấn Hollywood do diễn viên Tom Cruise thủ vai chính. 
Mach truyện khá dồn dập, căng thẳng ngay từ những trang đầu với không khí chiến trường khốc liệt. Đặc biệt, sự kết hợp giữa truyện chữ và minh họa đặc trưng của dòng Light novel, giúp người đọc dễ nắm bắt nội dung, không khí của truyện hơn.

', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (86, N'Tam Thể', N'https://img.vn.my-best.com/product_images/4b0d1877eff500e0f8c71a31b48c098f.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=2ed89d35cf3d7e588d8356e5e7ba6666', 199.0000, N'Trải Nghiệm Một Thế Giới Ảo Chưa Từng Có Trước Đây
', N'Đây là một câu chuyện đan xen giữa cuộc sống trong một thế giới thật và một thế giới ảo tưởng vô cùng khắc nghiệt được khắc họa với những tình tiết mới lạ chưa từng xuất hiện trước đây. Bạn sẽ sinh tồn ra sao nếu một nền văn minh chỉ kéo dài vài ngày, sẽ thế nào nếu cùng lúc xuất hiện 3 mặt trời? Phải chăng giải pháp duy nhất chính là tìm cách xâm chiếm một hành tinh khác?

Điểm hấp dẫn của tác phẩm là sự đan xen một khối lượng kiến thức khoa học khổng lồ, đặc biệt là về lĩnh vực vật lý khiến nhiều người trầm trồ nhưng cũng khá khó hiểu. Đi kèm theo đó là những thông điệp về môi trường, tài nguyên được lồng ghép khéo léo để sau tất cả, câu hỏi được đặt ra khiến tất thảy đều giật mình "Loài người đã làm gì chính mình?"

', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (87, N'Hai Vạn Dặm Dưới Biển', N'https://img.vn.my-best.com/product_images/a270472a8a5ac1bd1eb2f4b8bb16ab6c.jpg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=b1c741d8550a69da0b63d8db4ffecf99', 199.0000, N'Khám Phá Đáy Đại Dương Huyền Bí
', N'Đến với cuốn sách này, bạn có thể bắt đầu một hành trình khám phá thế giới đại dương nhiều bí ẩn với thuyền trưởng Nemo và các thủy thủ trên tàu Nautilus.
Tác phẩm được viết bằng giọng văn lôi cuốn, tình tiết hấp dẫn với sự xuất hiện của những sinh vật biển. Được phát hành lần đầu năm 1869, tác phẩm đến nay vẫn còn nguyên sức hút, đặc biệt là với những người ham tìm tòi về đại dương. Ngoài ra, bạn đọc có thể tham khảo review hoặc đọc thử trên các trang bán để chọn mua bản dịch ưng ý nhất.
', 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (88, N'Mật mã Da Vinci – Dan Brown', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Mat_ma_Da_Vinci_75274bd227.jpg', 199.0000, N'Mật mã Da Vinci – Dan Brown', N'Nhắc đến những cuốn sách trinh thám hay nhất mọi thời đại, không thể không đề cập đến tác phẩm Mật mã Da Vinci - một cuốn tiểu thuyết nổi tiếng của tác giả Dan Brown. Cuốn sách gây ấn tượng mạnh với nhiều độc giả bởi sự pha trộn giữa 2 yếu tố trinh thám và thần thoại. Cốt truyện kể về hành trình truy tìm địa điểm cất giấu Chén Thánh của Robert Langdon - một giáo sư đang giảng dạy tại Harvard và Sophie Neveu - một chuyên viên giải mã đang làm việc trong lực lượng cảnh sát Pháp thông qua một vụ giết người. Với những tình tiết hấp dẫn, kịch tính, chân thực, tác phẩm này sẽ đưa bạn đi từ bất ngờ này đến bất ngờ khác, khiến độc giả không thể rời mắt cho đến những trang sách cuối cùng. 

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (89, N'Sherlock Holmes – Arthur Conan Doyle', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Sherlock_Holmes_6ae8e27e2f.jpg', 199.0000, N'Sherlock Holmes – Arthur Conan Doyle', N'Sherlock Holmes là một tác phẩm kinh điển thuộc thể loại trinh thám nổi danh trên khắp thế giới. Tuy chỉ là một nhân vật hư cấu, nhưng Sherlock Holmes đã trở thành nguồn cảm hứng cho nhiều tác phẩm ở nhiều loại hình nghệ thuật khác nhau như nhạc kịch, điện ảnh,... Tác phẩm không chứa đựng những tình tiết giật gân hay giết người tàn nhẫn, nhưng vẫn thu hút đông đảo độc giả bởi những tình tiết logic, sáng tạo cùng với cuộc đấu trí cân não giữa thám tử Sherlock Holmes và giáo sư Moriarty.

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (90, N'Sự im lặng của bầy cừu - Thomas Harris', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Su_im_lang_cua_bay_cuu_48932b9722.jpg', 199.0000, N'Sự im lặng của bầy cừu - Thomas Harris', N'Sự im lặng của bầy cừu được xuất bản vào năm 1988, là phần tiếp theo của cuốn tiểu thuyết Rồng đỏ phát hành năm 1981. Nội dung tác phẩm kể về Tiến sĩ Hannibal Lecter - một kẻ giết người hàng loạt và ăn thịt người. Clarice Starling, một nhân viên thực tập của FBI được phân công thu thập thông tin từ Lecter nhằm điều tra về một kẻ giết người hàng loạt bí ẩn - “Buffalo Bill”. Cuộc đối đầu giữa Clarice và Hannibal đạt đến đỉnh điểm khi con gái của một Thượng nghị sĩ bị bắt cóc. Những cuộc đấu trí căng thẳng, những màn giết người ám ảnh, Sự im lặng của bầy cừu hội tụ đầy đủ các yếu tố của một cuốn tiểu thuyết trinh thám hay nhất mọi thời đại.

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (91, N'Án mạng trên sông Nile - Agatha Christie', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_An_mang_tren_song_Nile_153254ff19.jpg', 199.0000, N'Án mạng trên sông Nile - Agatha Christie', N'Án mạng trên sông Nile là một cuốn tiểu thuyết trinh thám, hình sự được nhà văn Agatha Christie phát hành vào ngày 1/11/1937. Nội dung chính của tác phẩm là một vụ án mạng xảy ra tại một con tàu du lịch trên sông Nile trong hành trình đến Ai Cập.  

Linnet Ridgeway là một thiếu nữ có trong tay tất cả mọi thứ từ nhan sắc đến của cải. Được cô bạn thân Jacqueline nhờ vả, Linnet đã sắp xếp cho Simon - vị hôn thê của Jacqueline vào làm việc tại điền trang của cô. Nhưng trớ trêu thay, sau khi Simon bắt đầu làm việc tại đây, anh và Linnet lại phải lòng nhau. Hai người tiến tới hôn nhân trước sự ngỡ ngàng của Jacqueline. Vì quá đau đớn và uất hận khi bị 2 người mình tin tưởng nhất phản bội, Jacqueline quyết tâm phải trả thù cặp đôi này bằng mọi giá. Đó cũng là lý do vì sao cả 3 người cùng xuất hiện trên con tàu du lịch trên sông Nile. Mọi chuyện trở nên rối loạn khi cô hầu gái của Linnet phát hiện cô chủ của mình đã bị giết chết. Không lâu sau đó, cô hầu gái cũng được phát hiện là đã thiệt mạng. Liệu ai là người đứng sau những vụ giết người bí ẩn này? 

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (92, N'Án mạng trên chuyến tàu tốc hành Phương Đông - Agatha Christie', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_An_mang_tren_chuyen_tau_toc_hanh_phuong_Dong_0319c16b51.jpg', 199.0000, N'Án mạng trên chuyến tàu tốc hành Phương Đông - Agatha Christie', N'Án mạng trên chuyến tàu tốc hành phương Đông là một cuốn sách trinh thám kinh điển khác của tác giả nổi tiếng thế giới - Agatha Christie. Nội dung cuốn sách kể về một vụ án mạng bí ẩn xảy ra trên chuyến tàu tốc hành Phương Đông theo lộ trình từ Istanbul về Calais. Và thật tình cờ, thám tử Hercule Poirot cũng có mặt trên chuyến tàu này. Khoang tàu được khóa kín từ bên trong và nạn nhân bị đâm đến 12 nhát dao. Tuy nhiên, 12 nhát dao này lại không phải của cùng 1 hung thủ. Sau khi khám xét hành lý và thẩm vấn từng người, thám tử Hercule phát hiện ra rằng có đến 12 người là nghi phạm trong vụ án hóc búa này. Vậy ai mới là kẻ gây án thật sự?

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (93, N' Phía sau Nghi can X - Higashino Keigo', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Phia_sau_nghi_can_x_b40006ec49.jpg', 199.0000, N' Phía sau Nghi can X - Higashino Keigo', N'Phía sau nghi can X là một trong những cuốn sách trinh thám hay nhất của tác giả Higashino Keigo. Togashi và Yasuki là một đôi vợ chồng đã ly hôn với nhau 5 năm. Sự trở lại đột ngột của Togashi sau 5 năm đã khiến mọi chuyện trở nên hỗn loạn. Sau một hồi giằng co, Yasuki đã vô tình giết hại chồng cũ. Hàng xóm của Yasuki - Ishigami đã đề nghị giúp đỡ cô xử lý cái xác và dàn xếp mọi chuyện ổn thỏa. Điều tra viên Kusanagi và phó giáo sư vật lý Manabu Yukawa đã cùng nhau phối hợp điều tra vụ án mạng này. Cuốn sách trinh thám này đã công khai hung thủ và đồng phạm ngay từ những giây phút đầu tiên nhưng dưới ngòi bút của Keigo, cuốn tiểu thuyết vẫn khiến người bị cuốn theo những giây phút tìm kiếm sự thật về cách mà một thiên tài toán học - Ishigami gây án. Đây không chỉ đơn thuần là một cuốn sách trinh thám với những yếu tố kịch tính, gay cấn, và tình tiết gây án đầy logic mà còn ẩn chứa cả là tình yêu đầy đau đớn mà Ishigami dành cho Yasuki.

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (94, N'Hỏa ngục - Dan Brown', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Hoa_nguc_bf5867e304.jpg', 199.0000, N'Hỏa ngục - Dan Brown', N'Nhắc đến những cuốn tiểu thuyết trinh thám nổi tiếng trên thế giới, chắc chắn chúng ta không thể bỏ qua một tác phẩm cực kì nổi tiếng là Hỏa Ngục của nhà văn người Mỹ - Dan Brown. Tác phẩm được xuất bản vào năm 2013 và ngay lập tức trở thành một trong những cuốn tiểu thuyết bán chạy nhất trên danh sách New York Times Best Seller.
Trong tác phẩm này, Robert Langdon bị mắc kẹt trong một chuỗi mật mã bí ẩn, được sáng tạo bởi một nhà khoa học xuất chúng. Nhà khoa học này có một nỗi ám ảnh đáng sợ về sự diệt vong và gia tăng dân số. Vì thế, ông đã tạo ra một loại virus có thể làm lây lan dịch bệnh gây chết người và giấu nó ở một nơi bí mật. Hỏa Ngục là hành trình Langdon đi qua các địa điểm trên thế giới để cố gắng tìm ra loại virus nguy hiểm và cứu thế giới khỏi sự diệt vong.


', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (95, N'Cô gái có hình xăm rồng - Stieg Larsson', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Co_gai_co_hinh_xam_rong_9c9d76307a.jpg', 199.0000, N'Cô gái có hình xăm rồng - Stieg Larsson', N'Cô gái có hình xăm rồng được xuất bản vào năm 2005, là một trong những cuốn sách trinh thám bán chạy nhất tại Châu Âu và Hoa Kỳ. Henrik Vanger là người đứng đầu cả một dòng họ danh giá nên ông sẵn sàng chi ra một khoản tiền lớn để điều tra về vụ mất tích cách đây hơn 40 năm của cháu gái mình, Harriet. Mikael Blomkvist, một nhà báo và Lisbeth Slander, một hacker trẻ tuổi đã cùng nhau khám phá và điều tra về vụ mất tích bí ẩn này. Không chỉ khám phá ra những bí ẩn đáng sợ về sự mất tích của Harrier, cặp đôi này còn điều tra ra những bí mật kinh hoàng và những vụ giết người hàng loạt phía sau dòng họ Vanger.

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (96, N'Kỳ án ánh trăng – Quỷ Cổ Nữ', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Ky_an_anh_trang_678137b803.jpg', 189.0000, N'Kỳ án ánh trăng – Quỷ Cổ Nữ', N'Kỳ án ánh trăng xoay quanh một sự kiện kỳ lạ xảy ra tại ký túc xá của một Trường Đại học Y nổi tiếng ở Trung Quốc. Vào ngày 16/6 hàng năm, sẽ có một nữ sinh trèo lên cửa sổ của phòng 405, khu nhà 13 và nhảy lầu tự vẫn. Sự kiện này xảy ra trong vòng 12 năm liên tiếp nhưng không một ai có thể tìm được lý do dù đã cố gắng tìm mọi cách để ngăn cản. Đặc biệt, trước khi tự vẫn, các nữ sinh này đều sẽ lẩm nhẩm rằng “Ánh trăng là gì?”. Đồng thời, họ cũng sẽ đi qua khu phẫu thuật của trường vào ban đêm. Liệu nguyên nhân thật sự của sự kiện bí ẩn này là gì?', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (97, N'Vòng tròn máu – Edgar Wallace', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Vong_tron_mau_79a2417b48.jpg', 199.0000, N'Vòng tròn máu – Edgar Wallace', N'Được xuất bản vào năm 1922, Vòng tròn máu là một tác phẩm trinh thám đã tạo nên tiếng vang lớn tại Châu Âu vào thời điểm phát hành. James Beaardmore - một triệu phú, đã nhận được thư tống tiền và cũng là “lời cảnh cáo cuối cùng” từ tổ chức VÒNG TRÒN MÁU, nhưng ông vẫn nhất quyết không khoan nhượng. Kết quả, ông đã bị sát hại ngay tại nhà mình vào ngày hôm sau. Mọi chuyện trở nên rắc rối hơn khi ngày càng có nhiều người giàu có nhận được những lá thư tống tiền, với một yêu cầu ngắn gọn: NỘP NGƯỜI HAY NỘP MẠNG. Nhận thấy mức độ nghiêm trọng của vấn đề, cảnh sát đã bắt tay vào điều tra, khám phá. Đồng thời, đây cũng chính mở đầu cho những cuộc đấu trí cân não, căng thẳng giữa VÒNG TRÒN MÁU với cảnh sát.

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (98, N'Đề thi đẫm máu - Lôi Mễ', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_De_thi_dam_mau_26e35ed8e1.jpg', 199.0000, N'Đề thi đẫm máu - Lôi Mễ', N'Đề thi đẫm máu là một tác phẩm tiểu thuyết trinh thám, kinh dị nổi tiếng của tác giả Lôi Mễ. Những vụ án giết người hàng loạt, những vụ cưỡng hiếp giết người, tên tội phạm biến thái có sở thích uống máu nạn nhân pha trộn với sữa tươi, tất cả đều được khắc họa hết sức chân thực, lôi cuốn dưới ngòi bút của Lôi Mễ. Phương Mộc, một sinh viên vô cùng thông minh bỗng bị kéo vào quá trình điều tra, cùng phối hợp với cảnh sát để tìm ra chân tướng kẻ thủ ác. Liệu anh có thể tìm ra lời giải cho đề thi khó nhằn này hay không?

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (99, N'Sát nhân mạng - Jeffery Deaver', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Sat_nhan_mang_6fe7642d69.jpg', 199.0000, N'Sát nhân mạng - Jeffery Deaver', N'Sát nhân mạng là một tiểu thuyết trinh thám có cốt truyện khá mới lạ, độc đáo, khi Jeffery Deaver lựa chọn khai thác chủ đề hacker và thế giới máy tính. Phate là một hacker tài ba, xuất chúng. Thế nhưng, bị ruồng bỏ từ khi còn nhỏ và nỗi cô đơn bủa vây đã khiến hắn trở thành một hacker máu lạnh. Hắn tin rằng cuộc sống ở ngoài thế giới thực cũng chỉ là một trò chơi mà ở đó, hắn chỉ xem việc giết người như một nhiệm vụ để chiến thắng trò chơi. Vô số con người vô tội đã bị hắn sát hại. Hắn hành động một cách bí ẩn và bất ngờ tới mức nạn nhân không kịp trở tay. Cuốn sách này sẽ mang đến cho người đọc những pha rượt đuổi gay cấn, những bất ngờ không lường trước được khiến bạn không thể rời mắt khỏi những trang sách cho đến khi kết thúc.

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (100, N'Chim cổ đỏ - Jo Nesbo', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Chim_co_do_0667b24736.jpg', 199.0000, N'Chim cổ đỏ - Jo Nesbo', N'Chim cổ đỏ là một tác phẩm trinh thám kinh điển, đan xen giữa các sự kiện trong lịch sử với các vấn đề hiện tại của thế giới. Tác phẩm không chỉ đề cập đến những vụ án bí ẩn xảy ra ở thời điểm hiện tại mà còn khơi dậy những sự kiện đã bị vùi lấp trong quá khứ. Harry - một viên sĩ quan, là người đảm nhận trọng trách theo dõi hoạt động của chủ nghĩa phát xít mới tại Na Uy. Trong quá trình làm nhiệm vụ, anh phát hiện ra một âm mưu bí ẩn, tàn ác, cùng với việc phát hiện ra âm mưu có liên hệ mật thiết tới một người đang làm việc trong giới cảnh sát. Đây chính là điểm khởi đầu, mở ra hành trình chạy đua với thời gian để ngăn chặn những hành động tàn ác của Harry.

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (101, N'Hang dã thú - Jeffery Deaver', N'https://simg.zalopay.com.vn/zlp-website/assets/Sach_trinh_tham_Hang_da_thu_d68c69b82d.jpg', 199.0000, N'Hang dã thú - Jeffery Deaver', N'Hang dã thú có bối cảnh vào năm 1936, kể về một người Mỹ gốc Đức và hiện đang sinh sống tại New York, Paul Schumann. Gã là một sát thủ nổi tiếng với những kỹ năng đỉnh cao cùng chiến thuật xuất sắc. Mọi chuyện trở nên rắc rối khi Paul bị cảnh sát bắt khi đang thực hiện một nhiệm vụ. Anh có 2 sự lựa chọn, hoặc là ăn cơm tù, hoặc là đảm nhận một nhiệm vụ bí ẩn của Chính phủ. Hang dã thú chắc chắn sẽ là một cuốn sách trinh thám khiến bạn không thể rời mắt bởi những pha hành động, đối đầu đầy gây cấn.

', 8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (102, N'Nhiệm Vụ Của Mackenzie', N'https://www.dtv-ebook.com/images/truyen-online/ebook-mackenzie-samily-saga-tap-2-full-prc-pdf-epub-azw3.jpg', 89.0000, N'Nhiệm Vụ Của Mackenzie', N'Anh là một đại tá tài năng, “cục cưng” trong Không quân Hoa Kỳ bất chấp tuổi đời chỉ mới vượt ngưỡng ba mươi. Những kỹ năng và phản xạ tuyệt vời cùng ý chí sắt đá đã khiến anh trở thành một phi công lái chiến đấu cơ xuất sắc nhất. Không quan tâm đến sự thăng tiến hay tiền tài, trong đôi mắt xanh sắc lạnh của anh chỉ có sự đam mê với việc bay lượn trên bầu trời, trong những chiếc chiến đấu cơ - những “bé cưng” của anh. Vậy cảm giác của anh sẽ ra sao khi phát hiện ra, có một thứ còn khiến cho anh bùng nổ, khiến cho anh thấy mình “đang sống” còn hơn cả khi anh đưa lên Mach 3? Liệu chinh phục quý cô Caroline Evans, Tiến sĩ vật lý học thiên tài nhưng lại chẳng có chút kinh nghiệm nào đối phó với đàn ông có dễ dàng giống với việc cầm cương thuần hóa một con ngựa cái non như anh đã tưởng tượng? Cuối cùng ai sẽ là người chinh phục và bị chinh phục?
Tiếp nối series Mackenzie, Linda Howard đã ưu ái giành cho nhân vật Joe - con trai của Wolf trong tập 1 một câu chuyện của riêng mình. Lấy bối cảnh chính là căn cứ quân sự Nellis tại bang Nevada, nằm giữa vùng sa mạc hoang vu hẻo lánh, chuyện tình của Joe Mackenzie và Caroline Evans hứa hẹn sẽ là câu chuyện nóng bỏng, đầy kịch tính nhưng vẫn khắc họa được những nét dữ dội trong chiều sâu tâm hồn của nhân vật đúng theo phong cách của Linda.

', 9, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (103, N'Bộ 2 cuốn tiểu thuyết 18+ của L.S.Hilton: Bậc Thầy - Chiếu Trên', N'https://salt.tikicdn.com/cache/750x750/ts/product/5e/4d/4a/128da0bf2a173fc9fc72d193fc377c8e.png.webp', 299.0000, N'Cuốn tiểu thuyết được nhắc đến nhiều nhất năm 2016. — Washington Post

', N'Judith, một trợ lý đấu giá tranh nghệ thuật, quyết tâm vượt qua tình trạng bị đối xử tệ. Từ một người phụ nữ tham vọng, cô trở thành một con người khác, sử dụng trí thông minh và tài ngụy tạo để đạt được cuộc sống mà cô mong muốn.

Chiếu Trên

Trong thành phố Venice, Judith đã trở thành Elisabeth Teerlinc, sống cuộc sống mơ ước. Nhưng quá khứ đen tối của cô bắt đầu trỗi dậy, và cô phải tìm cách tự cứu mình. Tuy nhiên, kẻ thù của cô càng ngày càng tàn nhẫn và quyết tâm trả thù.

Vì sao bạn nên đọc

Khám phá cuộc hành trình đầy xúc động và căng thẳng của Judith, một người phụ nữ kiên cường và xảo quyệt. Bộ 2 cuốn tiểu thuyết này sẽ đưa bạn vào thế giới nghệ thuật hào nhoáng và đen tối, nơi tình trạng đối xử xấu xa và tìm kiếm sự tự rửa tội gặp nhau.

Tác giả L.S. Hilton

L.S. Hilton là một nhà văn người Anh, tác giả của bộ 2 cuốn tiểu thuyết 18+ này.', 9, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (104, N'Kim Bình Mai (Trọn Bộ 3 Tập) - Bản Quyền', N'https://salt.tikicdn.com/media/catalog/product/k/i/kim_binh_mai.jpg', 399.0000, N'Kim Bình Mai (Trọn Bộ 3 Tập) - Bản Quyền

', N'Giới thiệu

Kim Bình Mai là một trong những tác phẩm nổi tiếng của văn học cổ điển Trung Quốc. Được coi là bộ trường thiên tiểu thuyết mở đường cho thể loại truyện "thế tình" với sức hấp dẫn lớn đối với người đọc. Tác phẩm khắc họa cuộc sống hưởng lạc đồi trụy của đám quan lại, thổ hào giàu tiền của thời đại đó.

Điểm nổi bật

Tác phẩm được dựa theo và phát triển từ một số tình tiết trong tác phẩm Thủy Hử của Thi Nại Am.
Miêu tả cặn kẽ về thói ăn chơi sa đọa, dâm dục - vùng cấm kị của văn chương Nho giáo.
Mặc dù bị cấm, cuốn tiểu thuyết vẫn được chép tay, khắc bản, in ấn, lưu truyền rộng rãi trong dân chúng.
Về tác giả Lan Lăng Tiếu Tiếu

Không có thông tin về tác giả Lan Lăng Tiếu Tiếu.', 9, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (105, N'Cô Giáo Thảo - 18+', N'https://hoimesach.com/wp-content/uploads/2022/05/co-giao-thao-ebook-mien-phi-epub-mobi-pdf-hoimesach.com.png', 99.0000, N'  ', N'Chú ý: Truyện có nội dung 18+, mong các bạn cân nhắc trước khi đọc.

Tôi là một thanh niên 17 tuổi đang theo học trung học tại Sài Gòn. Tuy mới 17 tuổi nhưng thân thể tôi trông khỏe như một chàng trai 20, lứa tuổi mà các chàng trai bắt đầu tò mò về tình yêu và bị kích thích về…', 9, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (106, N'Không Gia Đình – Tác giả: Hector Malot', N'https://mcdn.coolmate.me/image/May2023/tieu-thuyet-la-gi-7.jpg', 99.0000, N'Là một trong những cuốn tiểu thuyết hay và nổi tiếng của tác giả Hector Malot, “Không gia đình” mang tới câu chuyện về cậu bé Remi – không có cha và mẹ.

', N'Cậu bé được đem về nuôi trong một gia đình sống ở vùng quê xa xôi và may mắn là Remi được mẹ nuôi Barberin hết mực yêu thương. Nhưng ông Barberin lại không ưa gì cậu và tìm cách đem bán Remi cho ông bầu Vitalis – chủ của một đoàn xiếc rong. Từ đây, cuộc sống của cậu bé “không gia đình” bước sang giai đoạn mới.
Ông bầu Vitalis chính là người thầy đầu tiên chỉ dạy và giáo dục Remi những đức tính quý giá của con người. Điều này đã giúp cậu bé rất nhiều trong cuộc sống. Cuốn tuyển thuyết là gì thực sự hay và ý nghĩa, không chỉ dành cho các em thiếu niên mà ngay cả người trưởng thành cũng nên đọc một lần trong đời.


', 4, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (107, N'Đồi Gió Hú – Tác giả: Emily Bronte', N'https://mcdn.coolmate.me/image/May2023/tieu-thuyet-la-gi-9-1.jpg', 99.0000, N'Tiểu thuyết “Đồi gió hú” là câu chuyện tình yêu ngang trái của cô con gái nổi loạn trong gia đình Earnshaw và gã đàn ông thô ráp, điên rồ mà cha cô đã mang về nhà rồi đặt tên là Heathcliff. “Đồi gió hú” của Emily Bronte là cuốn sách đã tới tay công chúng với nhiều bình luận trái ngược vào năm 1847.

', N'Nếu tình yêu của Romeo và Juliet trong tác phẩm cùng tên của William Shakespeare mang đậm sự lãng mạn và nồng cháy thì “Đồi gió hú” lại miêu tả một tình yêu dưới góc nhìn của sự chân thật, hận thù và đầy ám ảnh. Đây là thứ tình yêu khác biệt, nó vượt qua những giá trị chuẩn mực về ý niệm đạo đức và bỏ qua những định kiện của xã hội.

Tiểu thuyết là gì“Đồi gió hú” như bức tranh đầy sắc màu về sự tăm tối của lòng người, niềm hạnh phúc hay nỗi đau khổ, … Do đó, tác phẩm này trở thành một trong những cuốn tiểu thuyết vĩ đại và bi thương nhất về tình yêu', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (108, N'Cuốn Theo Chiều Gió – Tác giả: Margaret Munnerlyn Mitchel', N'https://mcdn.coolmate.me/image/May2023/tieu-thuyet-la-gi-10.jpg', 99.0000, N'Tác phẩm văn học kinh điển mà chắc chắn bạn không thể bỏ lỡ chính là “Cuốn theo chiều gió” của Margaret Munnerlyn Mitchell. “Cuốn theo chiều gió” đã được chuyển thể thành phim điện ảnh và giành 8 giải thưởng Oscars năm 1940.

', N'Cuốn sách xoay quanh câu chuyện tình yêu ngọt ngào của chàng trai và cô gái trong cuộc nội chiến Nam – Bắc Mỹ. Không chỉ đơn thuần là tình yêu đôi lứa mà còn là tình yêu quê hương đất nước, tình đoàn kết và tình thương thân tương ái.

', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (109, N' Alice ở xứ sở diệu kỳ - Lewis Carroll', N'https://cdn.tgdd.vn/Files/2023/03/10/1516424/10-cuon-sach-thieu-nhi-hay-bo-ich-co-tinh-giao-duc-cao-202303110737151888.jpg', 99.0000, N'Lewis Carroll là bút danh của Charles Lutwidge Dodgson, một nhà văn, nhà toán học và nhà giáo dục người Anh. Với tài năng viết văn đặc biệt và sự sáng tạo phi thường, ông đã tạo ra một trong những tác phẩm kinh điển nhất của thế giới - "Alice ở xứ sở diệu kỳ".

', N'Cuốn sách "Alice ở xứ sở diệu kỳ" là một tác phẩm văn học kinh điển của thế kỷ 19, kể về cuộc phiêu lưu đầy màu sắc và phù phiếm của cô bé Alice trong thế giới kỳ diệu của tác giả. Với sự pha trộn giữa thực tế và tưởng tượng, Alice đã trải qua những màn phiêu lưu đầy bất ngờ, gặp gỡ các nhân vật kỳ lạ và đôi khi cả những hiểm nguy đáng sợ.

Cuốn sách này có tác dụng giúp người đọc phát triển tư duy sáng tạo, khám phá thế giới của mình và hiểu rõ hơn về giá trị của sự tò mò. Đồng thời, tác phẩm còn có giá trị giáo dục, giúp trẻ em học cách tìm kiếm giải pháp trong cuộc sống và giữ vững bản thân trong các tình huống khó khăn.

', 13, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (110, N'Charlie và nhà máy Sô-cô-la – Roald Dahl', N'https://cdn.tgdd.vn/Files/2023/03/10/1516424/10-cuon-sach-thieu-nhi-hay-bo-ich-co-tinh-giao-duc-cao-202303110737332796.jpg', 99.0000, N'"Charlie và nhà máy Sô-cô-la" của Roald Dahl là một tác phẩm văn học thiếu nhi tuyệt vời, kể về hành trình đầy phiêu lưu của cậu bé nghèo Charlie Bucket trong nhà máy Sô-cô-la kỳ diệu của Willy Wonka - một người đàn ông kỳ quặc và tài hoa. Tuy sống trong cảnh nghèo khó nhưng Charlie luôn giữ trái tim lương thiện và lòng nhân ái, và vì thế, ông Wonka đã chọn cậu là một trong năm đứa trẻ may mắn được thăm quan và trải nghiệm nhà máy Sô-cô-la của mình.

', N'Với phong cách viết hài hước, sáng tạo và linh hoạt, Roald Dahl đã tạo ra một câu chuyện kỳ diệu, mang đến những trải nghiệm tuyệt vời cho các em nhỏ, đồng thời gợi mở về tình bạn, sự khát khao tìm kiếm và niềm tin vào những điều tốt đẹp trong cuộc sống. Nếu bạn đang tìm kiếm một cuốn sách vui nhộn, lý thú và có ý nghĩa, "Charlie và nhà máy Sô-cô-la" chắc chắn là một lựa chọn tuyệt vời.

', 13, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (111, N'Totto-Chan: Cô bé bên cửa sổ - Tetsuko Kuroyanagi', N'https://cdn.tgdd.vn/Files/2023/03/10/1516424/10-cuon-sach-thieu-nhi-hay-bo-ich-co-tinh-giao-duc-cao-202303110738597248.jpg', 99.0000, N'"Totto-Chan: Cô bé bên cửa sổ" là một tác phẩm nổi tiếng của tác giả Tetsuko Kuroyanagi, kể về câu chuyện thời thơ ấu của chính cô tác giả trong một trường học đặc biệt ở Nhật Bản. Cuốn sách này đã trở thành một trong những cuốn sách nổi tiếng nhất của Nhật Bản, được dịch sang nhiều thứ tiếng và bán được hàng triệu bản trên toàn thế giới.

', N'Trong cuốn sách, Totto-chan là một cô bé hiếu động, không giống những học sinh khác và đã bị đuổi học nhiều lần trước khi tìm được trường mới. Tại trường này, cô gặp một hiệu trưởng đầy tình yêu thương và sự thông cảm. Ông ấy đã giúp Totto-chan hiểu rằng cô không phải là kẻ xấu, mà chỉ là một đứa trẻ có năng lực đặc biệt mà cần được giáo dục và phát triển đúng cách. Totto-chan đã học được nhiều kinh nghiệm quý báu từ những thầy cô giáo và bạn bè ở trường này, giúp cô trưởng thành và tự tin hơn.

', 13, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (112, N'Những cuộc phiêu lưu của Pinocchio - Carlo Collodi', N'https://cdn.tgdd.vn/Files/2023/03/10/1516424/10-cuon-sach-thieu-nhi-hay-bo-ich-co-tinh-giao-duc-cao-202303110739443559.jpg', 99.0000, N'Tác giả Carlo Collodi (1826 - 1890) là một nhà văn, nhà báo và nhà hoạt động xã hội người Ý. Ông đã viết nhiều truyện ngắn và tiểu thuyết, tuy nhiên, "Những cuộc phiêu lưu của Pinocchio" được coi là tác phẩm nổi tiếng nhất của ông. Cuốn sách được xuất bản lần đầu tiên vào năm 1883 và đã được dịch sang nhiều ngôn ngữ trên thế giới.

', N'Cuốn sách kể về một chú búp bê gỗ sống, tên là Pinocchio, được tạo ra bởi một ông thợ mộc tên là Gepetto. Pinocchio không ngoan và hay nghịch ngợm, cậu đã rời khỏi nhà của Gepetto để đi khám phá thế giới. Trong suốt cuộc hành trình của mình, Pinocchio đã phải trải qua rất nhiều thử thách và học được những bài học quý giá về sự ngoan ngoãn và trung thực.

"Những cuộc phiêu lưu của Pinocchio" là một trong những câu chuyện cổ tích kinh điển được yêu thích trên toàn thế giới. Được viết với phong cách dí dỏm, hài hước nhưng cũng đầy sâu sắc, cuốn sách này là một bài học về nhân cách và giá trị của sự ngoan ngoãn, lòng trung thực và tình yêu thương.

', 13, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (113, N'Đồi thỏ - Richard Adams', N'https://cdn.tgdd.vn/Files/2023/03/10/1516424/10-cuon-sach-thieu-nhi-hay-bo-ich-co-tinh-giao-duc-cao-202303110740088431.jpg', 99.0000, N'Richard Adams là một nhà văn người Anh sinh năm 1920. Ông được biết đến như là tác giả của nhiều tác phẩm văn học nổi tiếng, trong đó có "Đồi thỏ". Tác phẩm này được xuất bản lần đầu tiên vào năm 1972 và nhanh chóng trở thành một trong những cuốn sách bán chạy nhất thập niên 70. Với sự thành công của "Đồi thỏ", Richard Adams đã trở thành một trong những nhà văn được yêu thích nhất của thế giới.

', N'Cuốn sách kể về cuộc phiêu lưu của một bầy thỏ trong việc tìm kiếm một vùng đất mới để sinh sống sau khi đồng cỏ của họ bị phá hủy. Tuy nhiên, hành trình đầy gian nan của bầy thỏ không chỉ đối mặt với những khó khăn từ thiên nhiên mà còn phải đấu tranh với những thách thức và mối đe dọa từ con người.

"Đồi thỏ" là một câu chuyện rất đặc biệt vì tác giả đã viết nó từ góc nhìn của những con thỏ, đưa người đọc vào thế giới tự nhiên hoang dã và cảm nhận được sự sống động, tình cảm và sự hi sinh của chúng. Ngoài ra, cuốn sách còn chứa đựng những thông điệp về sự đoàn kết, lòng trung thành, tình bạn và tình yêu.', 13, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (114, N'Người Nói Đạo Lý Thường Sống Khá Giả', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935235240803.jpg', 39.0000, N'Người Nói Đạo Lý Thường Sống Khá Giả

', N'Lê Bích - Nhân vật ảo với chiếc bụng phệ, rốn lồi, khuôn mặt luôn tỏ vẻ tư lự, trên thông thiên văn, dưới tường địa lý, tam giáo, cửu lưu, tứ thư, ngũ kinh, tinh thần yêu nước trung trinh, đạo đức lung linh, phong tục, luật lệ, bản quyền, Horoscope, vật lý lượng tử... cái gì Lê Bích cũng tưởng là chàng biết.

Và nay, Lê Bích quyết định sử dụng tất cả hiểu biết của mình để... nói đạo lý, trở thành một vị thiền sư giúp đời!

... Hay có thật là thế không nhỉ?', 12, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (115, N'Truyện Cười Việt Nam Thời @', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_222793.jpg', 69.0000, N'Truyện Cười Việt Nam Thời @
', N'Từ những cốt truyện hiện đại , tác giả đã thổi hồn mình vào trong đó , nhào nặn câu chữ , chắt lọc tình tiết , văn phòng trôi chảy , cách kể hấp dẫn , các nhân vật cười trong truyện cứ hiện ra , nhớ mãi để có dịp hội ngộ , đông người được bung ra cùng nhau cười nghiêng ngả 

', 12, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (116, N'SỐ ĐỎ - LÝ TOÉT - XUÂN TÓC ĐỎ TÂN KỲ DỊ TRUYỆN', N'https://newshop.vn/public/uploads/content/truyen-cuoi-hay-nhat-so-do-min.jpg', 79.0000, N'Văn hào Lỗ Tấn bảo: "Vốn dĩ trên thế giới này làm gì có đường, người ta đi mãi rồi thành đường đó thôi". Trộm nghĩ, nếu muốn xây dựng điển tích, điển cố của người Việt, trước hết cần đọc kỹ bộ Đại Việt sử ký toàn thư và các tác phẩm văn học, chính luận từ thời dựng nước đến giữ nước, lấy đó làm căn bản thì có thể thu thập được nhiều sử liệu, văn liệu rất quan trọng.
', N'Riêng tôi, khi viết tiểu phẩm, truyện ngắn trào phúng, hài hước cụ thể ở tập Số đỏ Lý Toét Xuân Tóc Đỏ tân kỳ dị truyện, tôi cố tình mượn tên các nhân vật trong dòng văn học hiện thực phê phán, nhân vật trào phúng trong dân gian Việt Nam cũng nhằm thực hiện ý đồ trên, ít ra cũng là một cách nhắc đi, nhắc lại những nhân vật điển hình đó với bạn đọc hôm nay.

Với cách làm này, tôi mạo muội nghĩ rằng, một khi các nhà văn tiền bối như Vũ Trọng Phụng, Nguyễn Công Hoan, Nam Cao, Ngô Tất Tố... đã xây dựng thành công những nhân vật làm rạng rỡ cho cả một nền văn học không chỉ của một thời; một khi nhóm Tự Lực Văn Đoàn đã ""khai sinh"" ra Lý Toét, Xã Xệ, Bang Bạnh...; vậy, sự kế thừa, nối tiếp đưa các nhân vật ấy ""sống lại"" trong thời buổi này, cũng là một cách phổ cập nhiều hơn nữa với thế hệ trẻ.

Những ước mơ rằng, những nhân vật này đi vào đời sống, và một khi ngày càng quen thuộc hơn nữa, hễ một khi cần ví von, cần khái quát về một tính cách, diện mạo nào đó, ta có thể vận dụng đến, chứ không cần phải vay mượn từ điển tích, điển cố của nước ngoài.

Số Đỏ - Lý Toét - Xuân Tóc Đỏ Tân Kỳ Dị Truyện là tập truyện trào phúng và những mẩu chuyện hài hước, vẽ thêm bộ tịch của các nhân vật văn học nổi tiếng thời xưa để cười cả trăm kiểu. Cười và thấm và ngẫm.', 12, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (117, N'JESSE CƯỜI VÀ CUỘC PHIÊU LƯU HÀI HƯỚC', N'https://newshop.vn/public/uploads/content/truyen-cuoi-hay-nhat-jesse-min.jpg', 79.0000, N'Jesse là một nhà văn Canada, anh từng là quản lý một Trung tâm tiếng Anh tại TP.HCM trước khi làm việc tại báo Tuổi Trẻ Cười và làm MC cho kênh truyền hình VTC 10, đồng thời tham gia các talk show, viết cho nhiều tờ báo lớn… Jesse cũng là một hiện tượng mạng xã hội với rất nhiều người theo dõi. 

', N'Cuốn sách “Jesse cười và chuyến phiêu lưu hài hước” gồm những câu chuyện hóm hỉnh, vui nhộn của một anh Tây sống tại VN, rất hòa nhập nhưng cũng đặc biệt độc đáo với các góc nhìn thâm trầm sâu sắc.

Chỉ nghe cái tên câu chuyện thôi thì ngay lập tức đã cho thấy sự hóm hỉnh, hài hước của Jesse rồi chứ chưa nói tới chuyện đọc nó:

Hormone tình yêu, thứ hormone cà trớn!

Chin giờ rồi, nhậu đi thôi!

Điên cuồng như bợm nhậu

Lấy vợ đi!

Đừng để bị mất não!

Con gà qua đường.', 12, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (118, N'ĐỜI VỀ CƠ BẢN LÀ BUỒN', N'https://newshop.vn/public/uploads/content/truyen-cuoi-hay-nhat-doi-co-ban-la-buon-min.jpg', 39.0000, N'"Đời về cơ bản là buồn......cười." - Đọc để cười và sống vui!

Tại sao không? Có người nói quyển sách này chỉ mang tính chất giải trí, gây cười, không sâu sắc. ', N'Nhưng nếu bạn bắt đầu mở từng trang truyện tranh, từng trang một của cuốn sách, đọc từng dòng văn ngắn chia sẻ ý kiến, cảm nhận riêng được hài hước hóa theo một góc nhìn lạ chưa từng có thì bạn sẽ dễ bật cười giòn tan, tiếp đến là đập đùi đen đét "Thánh phán!", "chí lí" hoặc có người còn bị cái mặt ngu ngu, chắt lưỡi ngậm ngùi: "sao mà đúng thế!"

Với giọng văn dí dỏm, châm biếm sâu cay nhưng lại gợi lên những thông điệp tích cực. Lê Bích châm biếm nhẹ nhàng những tính xấu của chính mình - một cư dân mạng điển hình - khiến độc giả bật cười, để rồi phải dừng lại suy nghĩ: suy nghĩ về tính a dua theo phong trào, hay hô khẩu hiệu nhưng ít hành động, "trên thông thiên văn, dưới tường địa lý, tam giáo, cửu lưu, tứ thư, ngũ kinh, tinh thần yêu nước trung trinh, đạo đức lung linh, phong tục, luật lệ, bản quyền, Horoscope, vật lý lượng tử" cái gì cũng tưởng là mình biết...

', 12, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (119, N'CHUYỆN "CƯỜI" HOÀNG THIẾU PHỦ', N'https://newshop.vn/public/uploads/content/truyen-cuoi-hay-nhat-hoang-thieu-phu-min.jpg', 49.0000, N'Ông bà ta luôn nói: "Một nụ cười bằng mười thang thuốc bổ". Thế nhưng, cuộc sống ngày càng tất bật, bộn bề và chúng ta dường như luôn chạy theo nhịp sống đó và dần chìm vào những áp lực, căng thẳng. Và vì thế, những mẫu chuyện cười luôn rất cần thiết cho chúng ta.
', N'"Bao năm góp nhặt nụ cười
Mua vui cũng được một “vười” trống canh."

Ấy là lời “tự bạch” hài hước của nhà văn Hoàng Thiếu Phủ - một “lão tướng” có “máu mặt” trong làng cười Việt Nam. Từ năm 1984, ông xuất hiện trên trường văn trận bút thì lập tức đã tạo được tiếng vang nhất định. Nếu Lê Hoàng tạo ra cái cười bằng những tình huống oái oăm, bằng câu văn châm chích đầy “trí tuệ”; nếu Đồ Bì với giọng văn đĩnh đạc, trầm tĩnh, sắc sảo buộc người đọc “phì cười”; nếu Lê Văn Nghĩa trung thành với nhân vật Đại Văn Mỗ ngớ ngẩn bi hài... thì Hoàng Thiếu Phủ vẫn có ưu thế hơn bởi kiến thức uyên bác của ông.

Cũng là một vấn đề thời sự cần phê phán với cái nhìn “lệch pha”, hài hước như nhiều người khác, thì ông còn hấp dẫn với sự am hiểu tường tận của vấn đề đang đặt ra. Ở Hoàng Thiếu Phủ theo tôi, hấp dẫn vẫn là mối liên hệ với những chuyện “thời xửa thời xưa” để liên hệ đến nay rất “biện chứng”. Tập sách Chuyện “cười” (NXB Trẻ) vừa phát hành “tài sản” mà Hoàng Thiếu Phủ đã “góp nhặt” từ mấy chục năm qua, giồm hai tập với gần 1.000 trang in. Sức viết như thế cũng đáng nể.

“Chơi” với thể loại trào phúng phải chấp nhận một khắc nghiệt: khi vấn đề thời sự đã đi qua thì liệu tiểu phẩm ấy có “đứng lại” với thời gian hay không? Ấy là tài năng của người viết. Dù trong tập sách này vẫn có một vài tiểu phẩm “không còn tính thời sự”, nhưng theo Hoàng Thiếu Phủ: “Nhưng thiết nghĩ, nếu không có dịp nhìn lại nhưng gì đã xẩy ra trong “cái đêm hôm ấy” thì làm sao hiểu được giá trị quý báu của cuộc sống hôm nay”. Nghe ra cũng có lý.

Tôi muốn bổ sung thêm, dù không còn tính thời sự như chuyện đặt tên đường, chửa bệnh bằng “niệu liệu pháp”, con tem không dán keo phía sau khiến “dân thất nghiệp đứng ở bưu điện lè lưởi  cho người ta dán tem” v.v... thì nó vẫn có ích khi ta nhìn lại một thời đã qua với bao ‘chứng tích” bi hài. Mà giá trị của tiếng cười là gì? Là “tống khứ” cái quá khứ nhùng nhằng, nhốn nháo bằng sự lạc quan vốn có.

Trước khi bước vào làng cười, Hoàng Thiếu Phủ là sinh viên y khoa, tham gia phong trào đấu tranh SVHS tại vùng đô thị bị tạm chiếm, sau đó ông thoát ly lên chiến khu ở Huế làm báo Cờ Giải phóng; rồi ròng rã mấy chục năm nay ông “chuyên trị” về tiểu phẩm cười. Cứ nhìn gương mặt của ông, vừa khắc khổ vừa “hà tiện” nụ cười hì ta không ngờ con người ấy lại hài hước, vui nhộn đến thế. Thì ra trong trường hợp này không thể “xem mặt mà bắt hình dong”. Bằng chứng là tập Chuyện “cười” của ông thật sự hấp dẫn bạn đọc.

Vậy tại sao các bạn không sống chậm lại một chút, tạm gác những bộn bề, lo toan lại, cầm trên tay tập sách này để đọc và bật lên những tiếng cười thật sảng khoái. Các bạn sẽ thấy ngoài những stress kia thì cuộc sống này rất thú vị, đáng sống biết bao !!.', 12, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (120, N'Cô Gái Mù Chữ Phá Bom Nguyên Tử', N'http://static.ybox.vn/2017/10/27/3ca0239a-bb16-11e7-955e-2e995a9a3302.jpg', 69.0000, N'Nombeko được sinh ra trong một căn lều bé tí tẹo ở Johannesburg, thành phố lớn nhất Nam Phi. Ngay từ lúc nhỏ xíu, cô đã mau chóng hiểu rằng thế gian này chẳng hứa hẹn gì với cô ngoài việc cô hoặc chết sớm, vì ma túy, vì rượu hay chỉ vì đơn giản là tuyệt vọng vì màu da châu Phi. Thay vì thế, Nombeko có những kế hoạch vĩ đại hơn nhiều. Cô tự học đọc học viết, bằng mưu mẹo và sự liều lĩnh đáng kinh ngạc, cô thoát khỏi khu ổ chuột với những viên kim cương lậu bạc triệu.

', N'Đời cô là chuỗi sự cố điên khùng nối tiếp điên khùng. Cô chẳng hề muốn sống đời nô lệ ở đất nước phân biệt chủng tộc nhưng cũng chẳng mong mình trở thành cố vấn bất đắc dĩ cho dự án bom nguyên tử. Vậy mà cô phải làm cả hai với trí tuệ siêu việt về tính toán. Nhưng không gì có thể ngăn cản cô lập kế hoạch trốn thoát tới Thụy Điển, nơi cô gặp cặp sinh đôi Holger, mà một trong số đó nuôi âm mưu làm cách mạng lật đổ vương triều.

Cuộc đời Nombeko đan cài đầy tréo ngoe vào cuộc đời của cặp sinh đôi, và khi cặp đôi dàn xếp vụ bắt cóc vua và thủ tướng Thụy Điển thì điệp vụ giải cứu đã sẵn đợi nữ người hùng ra tay – để cứu cả thế giới khỏi thảm họa. Quả bom nguyên tử sẽ hoàn tất sứ mệnh của nó ở đâu, hay là trong tay một siêu cường có nhu cầu?

Cuốn sách ăn khách toàn cầu của Jonas Jonasson – Cô gái mù chữ phá bom nguyên tử – khiến người đọc phấn khích về cách đùa với các nhân vật lịch sử có thực và các câu chuyện chính trị sặc mùi thuyết âm mưu ở thế giới này.', 12, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (121, N'Biên niên sử điềm báo và tiên tri  ', N'https://trithucvn.co/wp-content/uploads/2020/11/quyen-sach-bi-an-1-image.jpg', 99.0000, N'Quyển sách này (Chronicle of Portents and Prophecies) được nhà chủ nghĩa nhân văn người Pháp Conrad Lycosthenes viết vào năm 1557. Bên trong ghi chép về nhiều điều, từ Adam và Eva cho đến đế quốc La Mã, so sánh với những câu chuyện cận đại, quyển sách này giống như một quyển bách khoa toàn thư.



Bạn đang sao chép nội dung của Trí Thức VN. Nếu là cá nhân sử dụng, vui lòng ghi rõ nguồn trithucvn.co. Nếu là website, kênh truyền thông, vui lòng chỉ sử dụng nội dung khi có sự  cho phép của Trí Thức VN.', N'Quyển sách có rất nhiều loài động vật giống như bản khắc của tê giác và lạc đà, nhưng cũng có loài người khác lạ và những quái vật khác. Quyển sách bí ẩn này đã miêu tả nhiều sự vật mà chúng ta đều công nhận, nhưng cũng có những hiện tượng như UFO hay quái vật biển.



Bạn đang sao chép nội dung của Trí Thức VN. Nếu là cá nhân sử dụng, vui lòng ghi rõ nguồn trithucvn.co. Nếu là website, kênh truyền thông, vui lòng chỉ sử dụng nội dung khi có sự  cho phép của Trí Thức VN.', 14, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (122, N'Bộ sách Bí Ẩn Mãi Mãi Là Bí Ẩn', N'https://readvii.com/wp-content/uploads/2020/06/sach-bo-sach-bi-an-mai-mai-la-bi-an-198x300.png', 89.0000, N'Bộ sách Bí Ẩn Mãi Mãi Là Bí Ẩn giới thiệu cùng các bạn những điều bí ẩn đã và đang tồn tại xung quanh cuộc sống của chúng ta; những điều mà khoa học còn chưa có lời giải thích.

', N'Bộ sách Bí Ẩn Mãi Mãi Là Bí Ẩn giới thiệu cùng các bạn những điều bí ẩn đã và đang tồn tại xung quanh cuộc sống của chúng ta; những điều mà khoa học còn chưa có lời giải thích.

', 14, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (123, N'109 Hiện Tượng Bí Ẩn Trên Thế Giới', N'https://readvii.com/wp-content/uploads/2020/06/sach-109-hien-tuong-bi-an-tren-the-gioi-205x300.png', 99.0000, N'Vũ trụ bao la đầy huyền bí luôn kích thích trí tưởng tượng vô cùng vô tận của con người. Nhưng đến nay, vũ trụ vẫn giấu kín trong mình vô số những bí mật, những câu đố thách thức nền khoa học nhân loại. Dù một phần nào đó những nghi vấn đã được giải đáp, nhưng Trái Đất của chúng ta vẫn còn rất nhiều điều bí ẩn mà các nhà khoa học vẫn chưa thể lý giải được.

', N'Cuốn sách “109 hiện tượng bí ẩn trên thế giới” được nhiều tác giả biên soạn, với mong muốn mang đến cho độc giả những thông tin về sự vật, hiện tượng “lạ” đầy bí ẩn mà cho đến nay nhân loại vẫn chưa tìm được lời giải đáp. Hy vọng cuốn sách sẽ đưa bạn đọc đi từ bất ngờ này đến bất ngờ khác với những địa danh kỳ bí, những sinh vật lạ lùng, và những hiện tượng siêu nhiên vô cùng huyền bí.

', 14, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (124, N'Những Bí Ẩn Trên Thế Giới Chưa Được Giải Đáp', N'https://readvii.com/wp-content/uploads/2020/06/sach-nhung-bi-an-tren-the-gioi-chua-duoc-giai-dap-211x300.png', 99.0000, N'Những hiện tượng kỳ lạ và những kỳ quan của thế giới tự nhiên này sẽ dần sáng tỏ trong cuốn sách Những Bí Ẩn Trên Thế Giới Chưa Được Giải Đáp.

', N'Nhiều hiện tượng kỳ lạ trên thế giới vượt xa mọi trí tưởng tượng của con người, vượt xa tầm với của khoa học kỹ thuật. Trong đó, rất nhiều vấn đề về địa lý bí ẩn tới mức nhiều nhà khoa học bỏ cả cuộc đời để tìm hiểu, nhưng cuối cùng cũng chưa thể tìm ra lời giải đáp. Như thế giới dưới lòng đáy biển, hồ không đóng băng ở Nam Cực v.v…

', 14, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (125, N'Bí Ẩn Những Nền Văn Minh Trên Thế Giới', N'https://readvii.com/wp-content/uploads/2020/06/sach-bi-an-nhung-nen-van-minh-tren-the-gioi-191x300.png', 99.0000, N'Bí Ẩn Những Nền Văn Minh Trên Thế Giới sẽ giới thiệu với bạn đọc vê các nền văn minh trên giới. Bạn sẽ được đến thăm cảnh tiên trên dãy Hy Mã Lạp Sơn, thăm bức tường vạn dặm Vạn Lý Trường Thành, bước trên con đường tơ lụa nối hai nền văn minh Âu- A,…

', N'Cuốn sách còn đưa bạn tới Lon đon- thủ đô sương mù, tới Italia để được chiêm ngưỡng tháp nghiêng Piza, chìm đắm trong thung lũng hoa hồng ở Bugari; đến với Aten- thành phố của ánh nắng và nước biển, hay thử sức mình bộ hành trên đệ nhất sa mạc Shahara… hay vượt qua Đại Tây Dương để tới thăm những nền văn minh của châu Mỹ, leo lên dãy Andes quê hương của người India hay đến chiêm ngưỡng sự hùng vĩ của con sông Amazon lớn nhất châu Mỹ…

', 14, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (126, N'Bí Ẩn Hiện Tượng Đáng Sợ Nhất Thế Giới', N'https://readvii.com/wp-content/uploads/2020/06/sach-bi-an-hien-tuong-dang-so-nhat-the-gioi-196x300.png', 99.0000, N'Tất cả đang còn là bí ẩn chưa có lời giải đáp. Những vấn đề đó được giới thiệu trong “Bí Ẩn Hiện Tượng Đáng Sợ Nhất Thế Giới” đều có sự lựa chọn, dẫn chứng tiêu biểu, xác thực.

', N'Thế giới xung quanh ta luôn tồn tại biết bao điều thần kỳ. Nó song hành với cuộc sống của loài người và là đề tài nghiên cứu muôn thuở của khoa học bí ẩn. Theo quan niệm Phật giáo, đã là con người thì đều phải trải qua các giai đoạn: Sinh – lão – bệnh – tử. Nhưng trên thực tế, cuộc đời của từng người sẽ có sự khác biệt.

Những hiện tượng như sự mất tích rồi trở về đột ngột của người, của máy bay, thuyền bè gây ra sự bất ngờ, khó hiểu. Vẫn con người đó, sự vật đó, sau rất nhiều năm không có thay đổi gì.

', 14, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (127, N'Thế Giới 5000 Năm Những Điều Bí Ẩn', N'https://readvii.com/wp-content/uploads/2020/06/sach-the-gioi-5000-nam-nhung-dieu-bi-an-200x300.png', 99.0000, N'Ẩn dưới lớp bụi thời gian của 5000 năm lịch sử, có biết bao nhiêu bí mật, những bí ấn trên khắp hành tinh này. Cuốn sách “Thế Giới 5000 năm những điều bí ẩn” sẽ hé mở rất nhiều kiến thức cũng như những bí mật lịch sử trên khắp thế giới mà bạn chưa biết. Con người dù ở thời đại nào cũng luôn quan tâm tìm hiểu, lý giải những bí ẩn của tự nhiên, xã hội và đời sống của con người trong quá khứ để hướng tới một tương lai tốt đẹp hơn.

', N'Nội dung của cuốn bách khoa lịch sử này, được chia thành 9 phần chính, trong các phần lại được chia thành nhiều chương khác nhau tổng hợp một lượng lớn các thông tin liên quan tới nhiều sự kiện lịch sử, các bí mật về những danh nhân nổi tiếng, những bí ẩn trên khắp hành tinh. Cuốn sách được soạn thảo công phu, trình bày hệ thống, giàu tính thông tin, khoa học, mang giá trị thực tiễn, hấp dẫn và lý thú.

', 14, 1)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (128, N'“Miền đất hứa” - Barack Obama', N'https://media.baoquangninh.vn/upload/image/202112/medium/1923414_19ea37dddaa136e7774f6479d038da86.jpg', 99.0000, N'Cuối năm 2020, cựu Tổng thống Mỹ Barack Obama ra mắt tập đầu tiên trong chuỗi hồi ký về cuộc đời tổng thống của mình, dưới cái tên Miền đất hứa. Sau khi phát hành, Miền đất hứa trở thành một trong những tựa sách bán chạy nhất năm ngoái với hơn 3 triệu bản sách được in trong lần đầu phát hành.

', N'Cuốn hồi ký bao quát sự nghiệp chính trị đời đầu của Obama cùng sứ mệnh tiêu diệt khủng bố Osama Bin Laden vào năm 2011. Thông qua cuốn sách, người đọc có thể theo dõi một phần lịch sử nước Mỹ và cách những người lãnh đạo vượt qua thử thách.

', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (129, N'“Becoming - Chất Michelle” - Michelle Obama', N'https://media.baoquangninh.vn/upload/image/202112/medium/1923416_65d497f2d954d1ef57084403849876fa.jpg', 99.0000, N'Cuốn hồi ký Becoming - Chất Michelle phản ánh chân thực cuộc đời Michelle Obama. Qua từng trang sách, Michelle dẫn dắt người đọc bước vào thế giới riêng của bà, từ tuổi thơ ở Chicago đến 8 năm sống tại Nhà Trắng. Tác phẩm hấp dẫn độc giả không chỉ vì câu chuyện riêng tư của một đệ nhất phu nhân mà còn về quá trình vươn lên của người phụ nữ da màu.

', N'Với những chia sẻ chân thực, hồi ký Becoming - Chất Michelle trở thành “hiện tượng” trên toàn thế giới sau 15 ngày phát hành, hơn 2 triệu bản được bán ở thị trường Bắc Mỹ, trở thành một trong những tựa sách bán chạy nhất năm 2018 tại Mỹ. Sách đang được bán trên Tiki với giá khoảng 360.000 đồng.

', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (130, N'“Không bao giờ là thất bại, tất cả là thử thách” - Chung Ju-yung', N'https://media.baoquangninh.vn/upload/image/202112/medium/1923418_8a9d9ecca6624138215583cd00d84f6d.jpg', 99.0000, N'Không bao giờ là thất bại, tất cả là thử thách là cuốn tự truyện xúc động của nhà sáng lập Hyundai Chung Ju-yung. Bắt đầu sự nghiệp với hai bàn tay trắng, xuất thân trong gia đình có truyền thống làm nông nghiệp, điều gì thúc đẩy ông có thể gầy dựng đế chế công nghiệp có sức ảnh hưởng mạnh mẽ như Hyundai?

', N'Trong ấn bản tiếng Việt mới nhất được phân phối độc quyền bởi Tiki, lần đầu tiên First News công bố bức tâm thư của người con trai Chung Mong-joon viết về người cha quá cố của mình. Hiện sách được bán trên Tiki với giá ưu đãi 261.000 đồng.

', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (131, N'“Keanu Reeves - Ma trận cuộc đời” - Marc Shapiro', N'https://media.baoquangninh.vn/upload/image/202112/medium/1923420_9abd02a77ce6b0aaeb1c097ebb3bd372.jpg', 99.0000, N'Sau loạt vai diễn thành công trong John Wick, Ma trận, tài tử Keanu Reeves vẫn giữ lối sống giản dị và hào phóng.', N'Điều gì làm nên một Keanu Reeves tài năng, thông minh nhưng lại khiêm nhường? Tất cả sẽ được giải đáp trong Keanu Reeves - Ma trận cuộc đời. Sách được viết bởi Marc Shapiro - cha đẻ của loạt sách bán chạy nhất trên New York Times như J.K. Rowling: Phù thủy đằng sau Harry Potter, Justin Bieber: Cơn sốt...', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (132, N'“Khi hơi thở hoá thinh không” - Paul Kalanithi', N'https://media.baoquangninh.vn/upload/image/202112/medium/1923422_dff040f83ba7020f2c7f197e6febf212.jpg', 99.0000, N'Khi hơi thở hóa thinh không là cuốn tự truyện dở dang của bác sĩ phẫu thuật thần kinh Paul Kalanithi, người bị chẩn đoán mắc bệnh ung thư phổi ở tuổi 36, thời kỳ đỉnh cao sự nghiệp của anh. ', N'Với đủ cung bậc cảm xúc hỷ nộ ái ố, từ hy vọng đến tuyệt vọng, từ buồn đau đến sung sướng, cuốn tự truyện chứa đầy sự nuối tiếc về một sự nghiệp đáng trân trọng. Tuy nhiên thay vì chìm trong đau khổ, Paul dũng cảm đối mặt.', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (133, N'Tiểu sử Steve Jobs', N'https://anybooks.vn/uploads/images/tieu-su-steve-jobs.jpg', 99.0000, N'“Tiểu sử Steve Jobs” tiết lộ những bí mật về cuộc đời của thiên tài công nghệ, là chủ tịch và cựu giám đốc điều hành của hãng Apple – Steve Jobs. Đây là cuốn tiểu sử đầu tiên và duy nhất nhận được sự đồng ý của Steve Jobs.

', N'Cuốn sách mang đến bạn đọc những thông tin chưa từng được nghe về nhà sáng chế công nghệ tài ba này, những tính cách lập dị, quái gỡ và quá trình ông chiến đấu với căn bệnh ung thư quái ác. Bạn đọc mong muốn có cái nhìn đầy đủ và sâu sắc nhất về cuộc đời Steve Jobs thì đây chính là một cuốn sách mà bạn không thể bỏ qua.

', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (134, N'Nhà tiên tri Vanga và vũ trụ huyền bí', N'https://anybooks.vn/uploads/images/nha-tien-tri-va%CC%82ng-va-vu-tru-huyen-bi.jpeg', 99.0000, N'Vanganổi tiếng là một nhà tiên tri người Bulgaria, sau khi bị một cơn bão cát cuốn đi thì hai mắt của bà không thể nhìn thấy và lúc này cuộc đời bà thay đổi hoàn toàn khi nhiều người tin rằng bà có thể tiên đoán trước tương lai của không chỉ một con người, một quốc gia mà là cả toàn nhân loại.', N'Có thể chúng ta chỉ biết đến Vanga như một nhà tiên tri nhưng qua lời kể của những nhân chứng đặc biệt ở bên cạnh nhà tiên tri đã ghi lại những kí ức về cách Vanga “làm việc”, bộc lộ khả năng tiên tri được đặc biệt ban riêng cho bà. Không ít những bí ẩn xoay quanh cuộc sống cùng những lời tiên tri của Vanga sẽ được tiết lộ trong cuốn sách này. “Nhà tiên tri Vanga và vũ trụ huyền bí” kết hợp những cách sống, suy luận của Vanga và nhiều trích đoạn từ Kinh Thánh Lửa, Kinh Thánh mà Vanga cho rằng sẽ cứu rỗi cả thế giới.', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (135, N'Được học', N'https://anybooks.vn/uploads/images/sach-hay-duoc-hoc.jpg', 99.0000, N'Hành trình 10 năm nỗ lực không ngừng nghỉ trên con đường “được học” của Tara, cô gái nhỏ sinh ra trong một gia đình không êm ấm. Tara không có giấy khai sinh, cô sống chỉ để chuẩn bị cho ngày tận thế và hiển nhiên là Tara không được đi học. Cuộc sống của cô dựa vào những định kiến vô cùng cực đoan của bố mẹ, hàng ngày kiếm sống cùng gia đình ở bãi phế liệu… Đọc cuốn sách “Được học” bạn đọc sẽ không khỏi thương xót cho số phận của Tara nhưng cũng vô cùng ngưỡng mộ cuộc đời phi thường của một cô gái nỗ lực hết mình để được học và sống cuộc đời tự do…

', N'Không gặp rào cản về sức khỏe hay trí tuệ, gia cảnh cũng không đến nỗi nghèo túng, lại sống ở nước Mỹ - nơi mà dường như cả thế giới đổ xô để học, vậy mà Tara Westover phải đợi đến năm 17 tuổi mới được cắp sách đến trường.

Cô từng phải lái xe ba tiếng đồng hồ để tìm người giảng cho mình vài bài lượng giác.

Cô đã phải vừa làm bảo vệ cho một tòa nhà, vừa đi lau dọn nhà thuê để trang trải chi phí ở trường đại học.

Có lúc, cô nhận ra thực tế phũ phàng rằng dù có nỗ lực qua được tất cả các môn, cô cũng không có tiền để mà học tiếp.

Ấy vậy mà 10 năm sau ngày đầu tiên được học, Tara Westover đã giành học vị Tiến sĩ nghành Sử học tại Đại học Cambridge danh tiếng”', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (136, N' Mặt trời vẫn tỏa sáng', N'https://anybooks.vn/uploads/images/mat-troi-van-toa-sang.jpg', 99.0000, N'Cuộc sống sẽ chẳng còn ý nghĩa gì nếu con người ta sống mà chẳng còn nổi một tia hy vọng, sẽ như thế nào nếu bạn bị khép vào tội tử hình về một lỗi lầm không phải do mình gây ra…

', N'Sự tự do, quyền cơ bản nhất của một con người bị đánh mất thì chẳng ai trong chúng ta có thể tưởng tượng nổi điều gì đã xảy ra với cuộc đời của người đàn ông chịu ngồi tù oan 30 năm. Mọi ngôn từ cũng chẳng đủ sức nặng để diễn tả được sự uất ức, thống khổ, căm phẫn của Anthony Ray Hinton trong 30 năm cuộc đời. Anthony Ray Hinton đã mất 30 năm ròng rã để đấu tranh dành lại công lý và tự do của cuộc đời…Hành trình đó được ông ghi lại qua cuốn sách Mặt trời vẫn tỏa sáng. Từ tình yêu thương của mẹ, tình bạn vĩ đại hay niềm tin mãnh liệt vào kế hoạch của Chúa,… Mặt trời vẫn tỏa sáng truyền cảm hứng sống mạnh mẽ về đức tin, sức sống mãnh liệt của một con người trong hoàn cảnh tối tăm nhất của cuộc đời khi mà mọi bất hạnh đều đổ dồn về Anthony Ray Hinton nhưng sau tất cả, ông vẫn chọn cách sống tha thứ cho tất cả mọi người và sống với niềm tin tưởng ở Chúa, ở cuộc đời tươi đẹp.

', 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (137, N'Tư duy cá mập suy nghĩ cá vàng', N'https://sachhay24h.com/uploads/images/sach-tu-duy-ca-map-suy-nghi-ca-vang.jpeg', 99.0000, N'“Tư duy cá mập, suy nghĩ cá vàng” chia sẻ đến bạn đọc câu chuyện của chú cá vàng tên Gordy, chú có một cuộc sống nhàn nhạ và tuyệt vời khi luôn sống trong vùng an toàn, hằng ngày được chủ cho ăn vàGordy luôn có đầy đủ thức ăn, bơi lội quanh hồ cá mà không phải bận tâm điều gì…

', N'Vào một ngày đẹp trời, Gordy được cậu chủ cho đi biển cùng, được vẫy vùng nơi biển lớn khiến tâm trạng Gordy phấn khích và mọi chuyện vẫn êm đẹp đến thế cho đến khi một cơn sóng lớn đập vào bờ, đánh trôi tòa thành “kiên cố” và cuốn theo chú cá vàng ra đại dương… và hành trình học cách trưởng thành để làm chủ cuộc đời của chú cá vàng Gordy cũng bắt đầu từ đây. Bằng cách chia sẻ câu chuyện của Gordy, tác giả lồng ghép vào đó những thông điệp giá trị cho bất cứ ai đang mất niềm tin vào cuộc sống hay e dè sự thay đổi.

', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (138, N'Không gục ngã', N'https://sachhay24h.com/uploads/images/khong-guc-nga.jpeg', 99.0000, N'Trưởng thành trong nghịch cảnh là bài học ý nghĩa nhất trên hành trình tìm kiếm ước mơ, đam mê của mỗi người.', N'Cuốn sách “Không gục ngã” mang những câu chuyện, trích dẫn đầy ý nghĩa, khơi dậy tinh thần sống tích cực hơn đến bạn đọc. Nếu vẫn chưa cân bằng được cảm xúc, dễ dàng làm nô lệ của những cám dỗ ở ngoài kia thì bạn hãy tìm và đọc cuốn sách này nhé.', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (139, N'Hãy có lòng tốt', N'https://sachhay24h.com/uploads/images/sach-hay-co-long-tot.jpeg', 99.0000, N'Lòng từ bi luôn có trong mỗi chúng ta, chỉ cần những hành động nhỏ và đơn giản thôi cũng đủ góp phần làm thế giới trở nên tốt đẹp hơn rồi.', N'Cuốn sách “Hãy có lòng tốt” của Đức Đạt-lai Lạt-ma thứ 14 giúp bạn đọc thay đổi nhận thức để làm đẹp hơn cho tâm hồn, có cách nhìn đúng đắn về sự tử tế với đời.', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (140, N'An lạc từng bước chân', N'https://sachhay24h.com/uploads/images/an-lac-tung-buoc-chan-2.jpeg', 99.0000, N'
“Thức dậy miệng mỉm cười
Hai bốn giờ tinh khôi
Xin nguyện sống trọn vẹn
Mắt thương nhìn cuộc đời”', N'Trong từng phút giây được sống bạn có ý thức được việc mình đang làm không hay tâm vốn lơ đễnh đi sự bình an của hiện tại? Cùng “An lạc từng bước chân” nhìn lại cuộc sống, tìm kiếm sự an yên từ những điều xung quanh, gieo trồng những hạt giống tích cực với đời.', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (141, N'Bạn chỉ sống có một lần', N'https://sachhay24h.com/uploads/images/ban-chi-song-co-mot-lan-2.jpg', 99.0000, N'Làm thế nào để sống một cuộc đời thật ý nghĩa, để không phải hối tiếc với bất cứ một điều gì là sự trăn trở của rất nhiều người. Vậy hãy tìm đáp án đó qua cuốn sách “Bạn chỉ sống có một lần”

', N'“Bạn chỉ sống có một lần” là cuốn sách tổng hợp những câu chuyện, câu nói hay về cuộc sống. Những dòng triết lý ngắn gọn, nội dung hướng bạn đọc đến những suy nghĩ tích cực hơn về nhiều khía cạnh trong cuộc sống. Bạn không cần phải đọc cuốn sách này theo bất cứ trình tự nhất định nào, lật ngẫu nhiên một trang sách cũng sẽ giúp bạn tìm thấy được nguồn năng lượng tích cực từ sách.

', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (142, N'Lagom - Vừa đủ - Đẳng cấp sống của người Thụy Điển', N'https://sachhay24h.com/uploads/images/review-sach-lagom-dang-cap-song-cua-nguoi-thuy-dien-6.jpg', 89.0000, N'“Nếu biết như thế nào là vừa đủ thì sao ta cứ muốn nhiều hơn?”

“Vừa đủ” không đơn thuần chỉ là một lối sống mà đây chính xác là nghệ thuật sống một cách đủ đầy từ việc xây dựng hạnh phúc dựa trên những giá trị bền vững. Phong cách sống đặc biệt này được thể hiện qua cuốn sách “Lagom - Vừa đủ - Đẳng cấp sống của người Thụy Điển”', N'Cuốn sách “Lagom - Vừa đủ - Đẳng cấp sống của người Thụy Điển” với độ dài vừa đủ, nhiều hình ảnh minh họa và trích dẫn ý nghĩa sẽ giúp bạn đọc thư giãn trên những trang sách cùng việc học hỏi được rất nhiều bài học đặc biệt về sự đơn giản, liên kết hài hòa với cuộc sống từ một quốc gia luôn nằm trong top những quốc gia hạnh phúc nhất thế giới.', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (143, N'Thay đổi tư duy – Hãy cứ phi lý', N'https://sachhay24h.com/uploads/images/sach-thay-doi-tu-duy-hay-cu-phi-ly-di-1.jpg', 99.0000, N'“Đừng cố làm mọi thứ có nghĩa. Đừng sử dụng công cụ truyền thống. Đừng lo lắng những rào cản vô hình. Đừng tin vào chân lý. Đừng cố trở thành nguyên bản. Đừng chờ đợi cảm hứng. Đừng để ý tưởng nằm im trong đầu. Đừng biện minh bằng các lý do. Đừng bị giới hạn bởi giới hạn của chính mình. Và đặc biệt đừng xấu hổ với chuyện tiền nong”

', N'Những chia sẻ đặc biệt cho những bạn trẻ đang mong muốn bứt phá bản thân, trở nên sáng tạo hơn trong cuộc sống và công việc nằm trong cuốn sách “Thay đổi tư duy – Hãy cứ phi lý”. Mọi thứ đều tư duy theo một trình tự, logic không hẳn là sẽ đưa bạn đến kết quả mà bạn mong muốn, cuốn sách nhỏ này sẽ giúp tư duy của bạn trở nên mới mẻ hơn. Những thay đổi tích cực về sự chủ động, tự do hơn trong lối suy nghĩ, tư duy hàng ngày sẽ là đáp án hoàn hảo cho mọi sự sáng tạo, thú vị trong cuộc sống.

', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (144, N'Loài Plastic – Khi nhựa trỗi dậy', N'https://sachhay24h.com/uploads/images/loai-plastic-khi-nhua-troi-day-2.jpg', 99.0000, N'Có những hành động ta vẫn mặc nhiên làm mỗi ngày tưởng chừng là vô hại nhưng lại gieo đến không ít rắc rối cho mẹ thiên nhiên - người mẹ chung của toàn nhân loại. Sự phụ thuộc vào nhựa dùng một lần là một trong số đó. Để tìm hiểu về nhựa và tác hại của nó đối với đời sống thì “Loài Plastic -  Khi nhựa trỗi dậy” là một trong những cuốn sách bạn nên tìm đọc.

', N'Tất tần tật những kiến thức về nhựa, bài kiểm tra về sự hiểu biết của bạn, những con số biết nói và các thông tin liên quan đến“kẻ giết người thầm lặng” này đều sẽ có trong cuốn sách “Loài Plastic -  Khi nhựa trỗi dậy”.

', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (145, N'Phong cách sống Minimalism - Sống tối giản cho đời thanh thản', N'https://sachhay24h.com/uploads/images/phong-cach-song-minimalism-song-toi-gian-cho-doi-thanh-than-2.jpg', 99.0000, N'Chủ nghĩa sống tối giản giúp bạn đọc giảm bớt những gánh nặng vô hình, trân trọng tình yêu thương với bạn bè, gia đình cùng sự thảnh thơi của bản thân.', N'Nếu bạn đang mong muốn tìm kiếm một cuốn sách để tìm hiểu về lối sống đặc biệt này hãy đọc “Phong cách sống Minimalism - Sống tối giản cho đời thanh thản” cuốn sách có nội dung khá ngắn gọn, ngôn từ gần gũi, nhiều ảnh minh họa sẽ giúp bạn đọc hiểu về lối sống tối giản từ đó sẽ có những thay đổi tích cực hơn.', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (146, N'Trói buộc', N'https://sachhay24h.com/uploads/images/sach-troi-buoc.jpeg', 99.0000, N'Những bài học đớn đau, trải nghiệm tồi tệ khi cảm xúc bị rơi xuống hố sâu tận cùng của bóng tối, bản thân đứng trước ranh giới mong manh giữa sự sống và cái chết thì hẳn chúng ta sẽ chiêm nghiệm được rất nhiều chân lý sống đắt giá. Cuốn sách “Trói buộc” sẽ giúp bạn đọc hiểu được ý nghĩa đặc biệt về chính bạn và cuộc sống này.

', N'Người dẫn chuyện phải sống đời thực vật sau tai nạn, không thể giao tiếp được với mọi người xung quanh. Trong hoàn cảnh đó, anh ta bắt đầu đối thoại nội tâm với chính mình – đó cũng là hành trình khám phá bản thân, mang đến cho anh nhận thức mới, thấu hiểu bản ngã sâu thẳm ẩn bên trong.

', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (147, N'Tâm tình với Đất Mẹ', N'https://sachhay24h.com/uploads/images/review-sach-tam-tinh-voi-dat-me-3.jpeg', 99.0000, N'“Tâm tình với Đất Mẹ” không chỉ hướng trái tim bạn đọc đến mẹ Trái Đất, mà còn là một chỉ dẫn nhẹ nhàng cho việc yêu thương, tự chữa lành cho chính mình.

', N'Những lời tâm sự trong cuốn sách chan chứa đầy tình yêu thương, tôn kính đến người tạo ra sự sống cho con người - mẹ thiên nhiên được thiền sư Thích Nhất Hạnh bộc bạch trong cuốn sách “Tâm tình với Đất Mẹ”. Cuốn sách đánh thức con người trở về với chính mình, với sự hiện diện để sống có trách nhiệm với bản thân và chăm sóc cho Đất Mẹ. Bởi lẽ cuộc sống hiện đại đã kéo theo không ít những hậu quả từ việc con người quá chú trọng đến những tiện nghi, ích kỷ cho riêng mình mà đánh mất kết nối với môi trường khiến mẹ thiên nhiên phải chịu đựng vô vàn đau khổ.

', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (148, N'Tất cả đều là chuyện nhỏ', N'https://sachhay24h.com/uploads/images/tat-ca-deu-la-chuyen-nho.jpg', 89.0000, N'Không phải là cảm xúc là thứ khó nắm bắt mà chính việc dễ dàng để tâm trí bị tác động bởi những chuyện vặt vãnh mới là căn bệnh khiến cuộc sống trở nên căng thẳng hơn bao giờ hết. Cùng tìm hiểu những phương thức sống nhẹ nhàng, thanh thản từ việc thay đổi góc nhìn một cách tích cực hơn qua cuốn sách “Tất cả đều là chuyện nhỏ”

', N'      Hãy hỏi chính mình: “Có nên để việc này làm mình bận tâm suốt năm hay không?”

·         Làm việc tốt một cách thầm lặng.

·         Đừng cho rằng cuộc đời không công bằng với bạn.

·         Lắng nghe cảm giác của bạn.

·         Hãy nhớ rằng, khi bạn qua đời “khay công việc” của bạn vẫn chưa hết.', 16, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (149, N'Harry Potter Và Hòn Đá Phù Thuỷ – Tập 1 (Tái Bản 2017)', N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_thumb_21542017_035423.jpg', 99.0000, N'Khi một lá thư được gởi đến cho cậu bé Harry Potter bình thường và bất hạnh, cậu khám phá ra một bí mật đã được che giấu suốt cả một thập kỉ. Cha mẹ cậu chính là phù thủy và cả hai đã bị lời nguyền của Chúa tể Hắc ám giết hại khi Harry mới chỉ là một đứa trẻ, và bằng cách nào đó, cậu đã giữ được mạng sống của mình.

', N'Thoát khỏi những người giám hộ Muggle không thể chịu đựng nổi để nhập học vào trường Hogwarts, một trường đào tạo phù thủy với những bóng ma và phép thuật, Harry tình cờ dấn thân vào một cuộc phiêu lưu đầy gai góc khi cậu phát hiện ra một con chó ba đầu đang canh giữ một căn phòng trên tầng ba. Rồi Harry nghe nói đến một viên đá bị mất tích sở hữu những sức mạnh lạ kì, rất quí giá, vô cùng nguy hiểm, mà cũng có thể là mang cả hai đặc điểm trên.

', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (150, N'Harry Potter Và Phòng Chứa Bí Mật (Tái Bản 2017)', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8934974145615.jpg', 99.0000, N'Harry khổ sở mong ngóng cho kì nghỉ hè kinh khủng với gia đình Dursley kết thúc. Nhưng một con gia tinh bé nhỏ tội nghiệp đã cảnh báo cho Harry biết về mối nguy hiểm chết người đang chờ cậu ở trường Hogwarts.

', N'Trở lại trường học, Harry nghe một tin đồn đang lan truyền về phòng chứa bí mật, nơi cất giữ những bí ẩn đáng sợ dành cho giới phù thủy có nguồn gốc Muggle. Có kẻ nào đó đang phù phép làm tê liệt mọi người, khiến họ gần như đã chết, và một lời cảnh báo kinh hoàng được tìm thấy trên bức tường. Mối nghi ngờ hàng đầu – và luôn luôn sai lầm – là Harry. Nhưng một việc còn đen tối hơn thế đã được hé mở.

Harry Potter và phòng chứa bí mật, không như những bộ truyện nhiều tập khác, vẫn tuyệt hay như người anh em trước… Hogwarts là sáng tạo của một thiên tài.’- Times Literary Supplement.', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (151, N'Harry Potter Và Tên Tù Nhân Ngục Azkaban – Tập 3 (Tái Bản 2017)', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8934974148050.jpg', 99.0000, N'Harry Potter may mắn sống sót đến tuổi 13, sau nhiều cuộc tấn công của Chúa tể hắc ám.

', N'Nhưng hy vọng có một học kỳ yên ổn với Quidditch của cậu đã tiêu tan thành mây khói khi một kẻ điên cuồng giết người hàng loạt vừa thoát khỏi nhà tù Azkaban, với sự lùng sục của những cai tù là giám ngục.

Dường như trường Hogwarts là nơi an toàn nhất cho Harry lúc này. Nhưng có phải là sự trùng hợp khi cậu luôn cảm giác có ai đang quan sát mình từ bóng đêm, và những điềm báo của giáo sư Trelawney liệu có chính xác?

‘Câu chuyện được kể với trí tưởng tượng bay bổng, sự hài hước bất tận có thể quyến rũ cả người lớn lẫn trẻ em.’ – Sunday Express', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (152, N'Harry Potter Và Chiếc Cốc Lửa – Tập 4 (Tái Bản 2017)', N'https://cdn0.fahasa.com/media/catalog/product/h/a/harrypottervachieccoclua.jpg', 99.0000, N'Khi giải Quidditch Thế giới bị cắt ngang bởi những kẻ ủng hộ Chúa tể Voldemort và sự trở lại của Dấu hiệu hắc ám khủng khiếp, Harry ý thức được rõ ràng rằng, Chúa tể Voldemort đang ngày càng mạnh hơn. ', N'Và để trở lại thế giới phép thuật, Chúa tể hắc ám cần phải đánh bại kẻ duy nhất sống sót từ lời nguyền chết chóc của hắn – Harry Potter. Vì lẽ đó, khi Harry bị buộc phải bước vào giải đấu Tam Pháp thuật uy tín nhưng nguy hiểm, cậu nhận ra rằng trên cả chiến thắng, cậu phải giữ được mạng sống của mình.

‘Bốn năm của Harry cũng như của chúng tôi ở trường Hogwarts thật vui nhộn, một thế giới đầy hài hước cùng nhiều hoạt động thú vị.’', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (153, N'Harry Potter Và Hội Phượng Hoàng – Tập 5 (Tái Bản 2017)', N'https://cdn0.fahasa.com/media/catalog/product/h/a/harrypottervahondaphuthuytap5.jpg', 99.0000, N'Harry tức giận vì bị bỏ rơi ở nhà Dursley trong dịp hè, cậu ngờ rằng Chúa tể hắc ám Voldemort đang tập hợp lực lượng, và vì cậu có nguy cơ bị tấn công, những người Harry luôn coi là bạn đang cố che giấu tung tích cậu.

', N'Cuối cùng, sau khi được giải cứu, Harry khám phá ra rằng giáo sư Dumbledore đang tập hợp lại Hội Phượng Hoàng – một đoàn quân bí mật đã được thành lập từ những năm trước nhằm chống lại Chúa tể Voldemort.

Tuy nhiên, Bộ Pháp thuật không ủng hộ Hội Phượng Hoàng, những lời bịa đặt nhanh chóng được đăng tải trên Nhật báo Tiên tri – một tờ báo của giới phù thủy, Harry lo ngại rằng rất có khả năng cậu sẽ phải gánh vác trách nhiệm chống lại cái ác một mình.

‘Hoang đường nhưng không hoang tưởng, trí tưởng tượng của Rowling cùng sự táo bạo của cô đã tạo cho cô một phong cách riêng.’ – The Times.', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (154, N'Harry Potter Và Hoàng Tử Lai – Tập 6 (Tái Bản 2017)', N'https://cdn0.fahasa.com/media/catalog/product/h/a/harrypottervahoangtulaitap6.jpg', 99.0000, N'Đây là năm thứ 6 của Harry Potter tại trường Hogwarts. ', N' Trong lúc những thế lực hắc ám của Voldemort gieo rắc nỗi kinh hoàng và sợ hãi ở khắp nơi, mọi chuyện càng lúc càng trở nên rõ ràng hơn đối với Harry, rằng cậu sẽ sớm phải đối diện với định mệnh của mình. Nhưng liệu Harry đã sẵn sàng vượt qua những thử thách đang chờ đợi phía trước?

Trong cuộc phiêu lưu tăm tối và nghẹt thở nhất của mình, J.K.Rowling bắt đầu tài tình tháo gỡ từng mắc lưới phức tạp mà cô đã mạng lên, cũng là lúc chúng ta khám phá ra sự thật về Harry, cụ Dumblebore, thầy Snape và, tất nhiên, Kẻ Chớ Gọi Tên Ra…

‘Diễn biến nhanh, huyền bí, hấp dẫn và chặt chẽ trong từng chi tiết.’ – Daily Mail', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (155, N'Harry Potter Và Bảo Bối Tử Thần – Tập 7 (Tái Bản 2017)', N'https://cdn0.fahasa.com/media/catalog/product/h/a/harrypottervabaoboituthantap7.jpg', 99.0000, N'Harry Potter đang chuẩn bị rời khỏi nhà Dursley và đường Privet Drive trong thời khắc cuối cùng.', N'Tuy nhiên, tương lai Harry đầy rẫy hiểm nguy, không chỉ cho cậu mà cả những người gần gũi – và Harry đã mất mát quá nhiều. Chỉ bằng cách tiêu hủy những Trường Sinh Linh Giá, Harry Potter mới có thể tự cứu mình và vượt qua những thế lực đen tối của Chúa tể hắc ám.

Ở phần kết đầy kịch tính của loạt truyện Harry Potter này, Harry phải để những người bạn trung thành nhất ở lại tuyến sau để dấn thân vào cuộc hành trình nguy hiểm cuối cùng hòng tìm kiếm sức mạnh và đối mặt với số phận đáng sợ của cậu: một cuộc chiến sinh tử và đơn độc.

‘Điều hay nhất ở cuốn sách này là cuối cùng nó cũng trả lời các câu hỏi mà chúng ta khao khát được biết.’ – Daily Mirror.', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (156, N'Cuộc xâm lược của người ngoài hành tinh trong cuốn tiểu thuyết Đại chiến thế giới của', N'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/War-of-the-worlds-tripod.jpg/220px-War-of-the-worlds-tripod.jpg', 19.0000, N'adawdgqe', N'adqwdqd', 17, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (19, N'viet', N'12345678', N'hanoi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (20, N'', N'', N'')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (21, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (22, N'd', N'd', N'd')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (23, N'1', N'1', N'3')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (24, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (25, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (26, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (27, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (28, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (29, N'1', N'2', N'2')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (30, N'1', N'1', N'Đại Học FPT')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (31, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (32, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (33, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (34, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (35, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (36, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (37, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (38, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (39, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (40, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (41, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (42, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (43, N'1', N'2', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (44, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (45, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (46, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (47, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (48, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (49, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (50, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (51, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (52, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (53, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (54, N'1', N'123456789', N'Đại Học FPT')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (55, N'1', N'123456789', N'Đại Học FPT')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (56, N'1', N'123456789', N'Đại Học FPT')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[ChangePassword] ADD  DEFAULT (getdate()) FOR [changeDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([AccountID])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[ChangePassword]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
USE [master]
GO
ALTER DATABASE [project] SET  READ_WRITE 
GO
