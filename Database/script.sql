USE [master]
GO
/****** Object:  Database [QLTV]    Script Date: 7/2/2020 3:54:48 PM ******/
WHILE EXISTS(select NULL from sys.databases where name='QLTV')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'QLTV') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [QLTV]
END
GO

CREATE DATABASE [QLTV]
 GO
ALTER DATABASE [QLTV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLTV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLTV] SET  MULTI_USER 
GO
ALTER DATABASE [QLTV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLTV] SET QUERY_STORE = OFF
GO
USE [QLTV]
GO
/****** Object:  Table [dbo].[CHUC_VU]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUC_VU](
	[IDCV] [char](6) NOT NULL,
	[Ten] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTMUON]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTMUON](
	[IDPM] [int] NOT NULL,
	[IDSach] [int] NOT NULL,
	[SL] [int] NULL,
	[checktra] [int] NULL,
 CONSTRAINT [PK_CTMUON] PRIMARY KEY CLUSTERED 
(
	[IDPM] ASC,
	[IDSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTNHAP]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTNHAP](
	[IDPN] [int] IDENTITY(1,1) NOT NULL,
	[IDSach] [int] NOT NULL,
	[SL] [int] NULL,
	[GiaNhap] [money] NULL,
 CONSTRAINT [PK_CTNHAP] PRIMARY KEY CLUSTERED 
(
	[IDPN] ASC,
	[IDSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTTRA]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTTRA](
	[IDPT] [int] IDENTITY(1,1) NOT NULL,
	[IDSach] [int] NOT NULL,
	[SL] [int] NULL,
	[IDVP] [char](6) NOT NULL,
 CONSTRAINT [PK_CTTRA] PRIMARY KEY CLUSTERED 
(
	[IDPT] ASC,
	[IDSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAI_THANH_VIEN]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI_THANH_VIEN](
	[IDLTV] [char](6) NOT NULL,
	[Ten] [nvarchar](20) NULL,
	[HanMuon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDLTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHA_CUNG_CAP]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHA_CUNG_CAP](
	[IDNCC] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHA_XUAT_BAN]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHA_XUAT_BAN](
	[IDNXB] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAN_VIEN]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAN_VIEN](
	[IDNV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](10) NULL,
	[NgayVaoLam] [smalldatetime] NULL,
	[NgaySinh] [smalldatetime] NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IDCV] [char](6) NOT NULL,
	[Active] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEU_MUON]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEU_MUON](
	[IDPM] [int] IDENTITY(1,1) NOT NULL,
	[IDTV] [int] NULL,
	[IDNV] [int] NULL,
	[NgayMuon] [smalldatetime] NULL,
	[Tra] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEU_NHAP]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEU_NHAP](
	[IDPN] [int] IDENTITY(1,1) NOT NULL,
	[IDNCC] [int] NULL,
	[IDNV] [int] NULL,
	[NgayNhap] [smalldatetime] NULL,
	[TriGia] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEU_TRA]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEU_TRA](
	[IDPT] [int] NOT NULL,
	[IDTV] [int] NULL,
	[IDNV] [int] NULL,
	[NgayTra] [smalldatetime] NULL,
	[TienPhat] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH](
	[IDSach] [int] IDENTITY(1,1) NOT NULL,
	[IDTG] [int] NOT NULL,
	[IDNXB] [int] NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[TheLoai] [nvarchar](100) NULL,
	[ViTri] [varchar](20) NULL,
	[SL] [int] NULL,
	[SLHienTai] [int] NULL,
	[GiaSach] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAC_GIA]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAC_GIA](
	[IDTG] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANH_VIEN]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANH_VIEN](
	[IDTV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](10) NULL,
	[CMND] [varchar](10) NULL,
	[NgayDangKy] [smalldatetime] NULL,
	[NgayHetHan] [smalldatetime] NULL,
	[NgaySinh] [smalldatetime] NULL,
	[IDLTV] [char](6) NOT NULL,
	[email] [nvarchar](100) NULL,
	[Anh] [nvarchar](300) NULL,
	[GioiTinh] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VI_PHAM]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VI_PHAM](
	[IDVP] [char](6) NOT NULL,
	[Ten] [nvarchar](20) NULL,
	[PhiPhat] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDVP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHUC_VU] ([IDCV], [Ten]) VALUES (N'CV01  ', N'Thủ thư')
INSERT [dbo].[CHUC_VU] ([IDCV], [Ten]) VALUES (N'CV02  ', N'Quản lí')
INSERT [dbo].[CHUC_VU] ([IDCV], [Ten]) VALUES (N'CV03  ', N'khác')
GO
INSERT [dbo].[LOAI_THANH_VIEN] ([IDLTV], [Ten], [HanMuon]) VALUES (N'LTV01 ', N'VIP', 30)
INSERT [dbo].[LOAI_THANH_VIEN] ([IDLTV], [Ten], [HanMuon]) VALUES (N'LTV02 ', N'Thân Thiết', 14)
INSERT [dbo].[LOAI_THANH_VIEN] ([IDLTV], [Ten], [HanMuon]) VALUES (N'LTV03 ', N'Tiêu chuẩn', 7)
GO
SET IDENTITY_INSERT [dbo].[NHA_CUNG_CAP] ON 

INSERT [dbo].[NHA_CUNG_CAP] ([IDNCC], [Ten], [DiaChi], [SDT]) VALUES (1, N'Nguyễn Văn A', N'Bình Dương', N'0987456123')
INSERT [dbo].[NHA_CUNG_CAP] ([IDNCC], [Ten], [DiaChi], [SDT]) VALUES (2, N'Nguyễn Văn B', N'Đồng Nai', N'0987433222')
SET IDENTITY_INSERT [dbo].[NHA_CUNG_CAP] OFF
GO
SET IDENTITY_INSERT [dbo].[NHA_XUAT_BAN] ON 

INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (1, N'Nhà xuất bản Chính trị Quốc gia')
INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (2, N'Nhà xuất bản Trẻ')
INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (3, N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh')
INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (4, N'Nhà xuất bản giáo dục')
INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (5, N'Nhà xuất bản Hội Nhà văn')
INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (6, N'Nhà xuất bản Tư pháp')
INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (7, N'Nhà xuất bản thông tin và truyền thông')
INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (8, N'Nhà xuất bản lao động')
INSERT [dbo].[NHA_XUAT_BAN] ([IDNXB], [Ten]) VALUES (9, N'Nhà xuất bản văn học')
SET IDENTITY_INSERT [dbo].[NHA_XUAT_BAN] OFF
GO
SET IDENTITY_INSERT [dbo].[NHAN_VIEN] ON 

INSERT [dbo].[NHAN_VIEN] ([IDNV], [HoTen], [DiaChi], [SDT], [NgayVaoLam], [NgaySinh], [Username], [Password], [IDCV], [Active]) VALUES (1, N'Bùi Nhật Tiến', N'Gò Vấp, TPHCM', N'0212345959', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2000-01-01T00:00:00' AS SmallDateTime), N'admin', N'admin', N'CV01  ', 1)
INSERT [dbo].[NHAN_VIEN] ([IDNV], [HoTen], [DiaChi], [SDT], [NgayVaoLam], [NgaySinh], [Username], [Password], [IDCV], [Active]) VALUES (2, N'Bùi Minh Hiếu', N'Đồng Nai', N'0212345959', CAST(N'2020-02-01T00:00:00' AS SmallDateTime), CAST(N'2001-02-01T00:00:00' AS SmallDateTime), N'nhanvien2', N'aca6320cedd91cfb70c9f954aa239cc7', N'CV02  ', 1)
INSERT [dbo].[NHAN_VIEN] ([IDNV], [HoTen], [DiaChi], [SDT], [NgayVaoLam], [NgaySinh], [Username], [Password], [IDCV], [Active]) VALUES (3, N'Lê Thị Bom', N'Bình Dương', N'0212345959', CAST(N'2020-02-01T00:00:00' AS SmallDateTime), CAST(N'1998-02-21T00:00:00' AS SmallDateTime), N'nhanvien3', N'985558bcd7df5713d066705de5c765d8', N'CV03  ', 1)
INSERT [dbo].[NHAN_VIEN] ([IDNV], [HoTen], [DiaChi], [SDT], [NgayVaoLam], [NgaySinh], [Username], [Password], [IDCV], [Active]) VALUES (4, N'Nguyễn Thị Nổ', N'Biên Hòa', N'0212345959', CAST(N'2020-02-01T00:00:00' AS SmallDateTime), CAST(N'1995-05-11T00:00:00' AS SmallDateTime), N'nhanvien4', N'a3d801c1b3eee84cb217b9407be1b816', N'CV03  ', 1)
SET IDENTITY_INSERT [dbo].[NHAN_VIEN] OFF
GO
SET IDENTITY_INSERT [dbo].[SACH] ON 

INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (1, 1, 9, N'Có Một Ai Đó Đã Đổi Thay', N'Truyện ngắn', N'A1', 100, 59, 75000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (2, 1, 9, N'12 Cách yêu', N'Truyện ngắn', N'A12', 100, 20, 99000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (3, 3, 9, N'Đàn Ông Hay Hứa, Phụ Nữ Hay Tin?', N'Truyện ngắn', N'A10', 100, 50, 89000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (4, 3, 9, N'Sẽ có cách đừng lo', N'Truyện ngắn', N'B5', 100, 50, 69000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (5, 2, 2, N'Mắt biếc', N'Truyện dài', N'B4', 100, 20, 75000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (6, 2, 9, N'Tôi thấy hoa vàng trên cỏ xanh', N'Hư cấu', N'C2', 100, 40, 45000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (7, 4, 9, N'Bao Giờ Là Đúng Lúc', N'Truyện ngắn', N'C1', 100, 50, 79000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (8, 4, 9, N'Ai Cũng Đã Từng Yêu Như Thế', N'Truyện ngắn', N'D2', 100, 50, 59000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (9, 5, 9, N'Mỉm cười cho qua', N'Tiểu thuyết', N'D3', 100, 35, 63000)
INSERT [dbo].[SACH] ([IDSach], [IDTG], [IDNXB], [Ten], [TheLoai], [ViTri], [SL], [SLHienTai], [GiaSach]) VALUES (10, 5, 9, N'Ai rồi cũng khác', N'Truyện ngắn', N'D2', 100, 33, 55000)
SET IDENTITY_INSERT [dbo].[SACH] OFF
GO
SET IDENTITY_INSERT [dbo].[TAC_GIA] ON 

INSERT [dbo].[TAC_GIA] ([IDTG], [Ten]) VALUES (1, N'Hamlet Trương')
INSERT [dbo].[TAC_GIA] ([IDTG], [Ten]) VALUES (2, N'Nguyễn Nhật Ánh')
INSERT [dbo].[TAC_GIA] ([IDTG], [Ten]) VALUES (3, N'Tuệ Nghi')
INSERT [dbo].[TAC_GIA] ([IDTG], [Ten]) VALUES (4, N'Nguyễn Minh Nhật')
INSERT [dbo].[TAC_GIA] ([IDTG], [Ten]) VALUES (5, N'Phan Ý Yên')
INSERT [dbo].[TAC_GIA] ([IDTG], [Ten]) VALUES (6, N'Iris Cao')
SET IDENTITY_INSERT [dbo].[TAC_GIA] OFF
GO
SET IDENTITY_INSERT [dbo].[THANH_VIEN] ON 

INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (1, N'Nguyễn Thị Mén', N'Linh Trung-Thủ Đức', N'0987654321', N'272892919', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'2000-12-07T00:00:00' AS SmallDateTime), N'LTV01 ', N'hieumb749@gmail.com', N'xxx', N'Nữ')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (2, N'Huỳnh Văn Tèo', N'Quận 9 - TPHCM', N'0987232221', N'22233344', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1995-10-02T00:00:00' AS SmallDateTime), N'LTV02 ', N'teohv749@gmail.com', N'xxx', N'Nam')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (3, N'Lê Văn Lú', N'Biên Hòa - Đồng Nai', N'0987444111', N'27668855', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1999-12-02T00:00:00' AS SmallDateTime), N'LTV03 ', N'lulv7022@gmail.com', N'xxx', N'Nam')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (4, N'Nguyễn Văn A', N'Đồng Tháp', N'0987541771', N'22224555', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1999-02-02T00:00:00' AS SmallDateTime), N'LTV03 ', N'adidauday@gmail.com', N'xxx', N'Nam')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (5, N'Trần Thị B', N'Quận 1 - TPHCM', N'0982125511', N'244445584', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1999-10-02T00:00:00' AS SmallDateTime), N'LTV03 ', N'adivenha@gmail.com', N'xxx', N'Nữ')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (6, N'Trần Văn C', N'Lào Cai', N'0984548811', N'26787855', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1999-02-08T00:00:00' AS SmallDateTime), N'LTV03 ', N'okedoiem@gmail.com', N'xxx', N'Nam')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (7, N'Nguyễn Thị T', N'Mỹ Tho', N'0933333311', N'27787855', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1999-06-06T00:00:00' AS SmallDateTime), N'LTV03 ', N'avetruocday@gmail.com', N'xxx', N'Nữ')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (8, N'Bùi Văn N', N'Trảng Bom', N'0256222333', N'299768855', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1997-05-05T00:00:00' AS SmallDateTime), N'LTV03 ', N'khongdoiemdau@gmail.com', N'xxx', N'Nam')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (9, N'Anh D', N'Long Thành', N'0222448811', N'25458855', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1998-03-02T00:00:00' AS SmallDateTime), N'LTV03 ', N'axaulam@gmail.com', N'xxx', N'Nam')
INSERT [dbo].[THANH_VIEN] ([IDTV], [HoTen], [DiaChi], [SDT], [CMND], [NgayDangKy], [NgayHetHan], [NgaySinh], [IDLTV], [email], [Anh], [GioiTinh]) VALUES (10, N'Chị E', N'Biên Hòa', N'0932156987', N'25888855', CAST(N'2020-02-05T00:00:00' AS SmallDateTime), CAST(N'2021-02-05T00:00:00' AS SmallDateTime), CAST(N'1989-02-03T00:00:00' AS SmallDateTime), N'LTV03 ', N'chiataydi@gmail.com', N'xxx', N'Nữ')
SET IDENTITY_INSERT [dbo].[THANH_VIEN] OFF
GO
INSERT [dbo].[VI_PHAM] ([IDVP], [Ten], [PhiPhat]) VALUES (N'VP01  ', N'Không vi phạm', 0.0000)
INSERT [dbo].[VI_PHAM] ([IDVP], [Ten], [PhiPhat]) VALUES (N'VP02  ', N'Quá hạn', 2000.0000)
INSERT [dbo].[VI_PHAM] ([IDVP], [Ten], [PhiPhat]) VALUES (N'VP03  ', N'Làm mất sách', 500000.0000)
INSERT [dbo].[VI_PHAM] ([IDVP], [Ten], [PhiPhat]) VALUES (N'VP04  ', N'Làm hỏng sách', 100000.0000)
GO
ALTER TABLE [dbo].[CTMUON]  WITH CHECK ADD  CONSTRAINT [FK_CTM_PM] FOREIGN KEY([IDPM])
REFERENCES [dbo].[PHIEU_MUON] ([IDPM])
GO
ALTER TABLE [dbo].[CTMUON] CHECK CONSTRAINT [FK_CTM_PM]
GO
ALTER TABLE [dbo].[CTMUON]  WITH CHECK ADD  CONSTRAINT [FK_CTM_S] FOREIGN KEY([IDSach])
REFERENCES [dbo].[SACH] ([IDSach])
GO
ALTER TABLE [dbo].[CTMUON] CHECK CONSTRAINT [FK_CTM_S]
GO
ALTER TABLE [dbo].[CTNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTN_PN] FOREIGN KEY([IDPN])
REFERENCES [dbo].[PHIEU_NHAP] ([IDPN])
GO
ALTER TABLE [dbo].[CTNHAP] CHECK CONSTRAINT [FK_CTN_PN]
GO
ALTER TABLE [dbo].[CTNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTN_S] FOREIGN KEY([IDSach])
REFERENCES [dbo].[SACH] ([IDSach])
GO
ALTER TABLE [dbo].[CTNHAP] CHECK CONSTRAINT [FK_CTN_S]
GO
ALTER TABLE [dbo].[CTTRA]  WITH CHECK ADD  CONSTRAINT [FK_CTT_PT] FOREIGN KEY([IDPT])
REFERENCES [dbo].[PHIEU_TRA] ([IDPT])
GO
ALTER TABLE [dbo].[CTTRA] CHECK CONSTRAINT [FK_CTT_PT]
GO
ALTER TABLE [dbo].[CTTRA]  WITH CHECK ADD  CONSTRAINT [FK_CTT_S] FOREIGN KEY([IDSach])
REFERENCES [dbo].[SACH] ([IDSach])
GO
ALTER TABLE [dbo].[CTTRA] CHECK CONSTRAINT [FK_CTT_S]
GO
ALTER TABLE [dbo].[CTTRA]  WITH CHECK ADD  CONSTRAINT [FK_CTT_VP] FOREIGN KEY([IDVP])
REFERENCES [dbo].[VI_PHAM] ([IDVP])
GO
ALTER TABLE [dbo].[CTTRA] CHECK CONSTRAINT [FK_CTT_VP]
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD  CONSTRAINT [FK_NV_CV] FOREIGN KEY([IDCV])
REFERENCES [dbo].[CHUC_VU] ([IDCV])
GO
ALTER TABLE [dbo].[NHAN_VIEN] CHECK CONSTRAINT [FK_NV_CV]
GO
ALTER TABLE [dbo].[PHIEU_MUON]  WITH CHECK ADD  CONSTRAINT [FK_PM_NV] FOREIGN KEY([IDNV])
REFERENCES [dbo].[NHAN_VIEN] ([IDNV])
GO
ALTER TABLE [dbo].[PHIEU_MUON] CHECK CONSTRAINT [FK_PM_NV]
GO
ALTER TABLE [dbo].[PHIEU_MUON]  WITH CHECK ADD  CONSTRAINT [FK_PM_TV] FOREIGN KEY([IDTV])
REFERENCES [dbo].[THANH_VIEN] ([IDTV])
GO
ALTER TABLE [dbo].[PHIEU_MUON] CHECK CONSTRAINT [FK_PM_TV]
GO
ALTER TABLE [dbo].[PHIEU_NHAP]  WITH CHECK ADD  CONSTRAINT [FK_PN_NCC] FOREIGN KEY([IDNCC])
REFERENCES [dbo].[NHA_CUNG_CAP] ([IDNCC])
GO
ALTER TABLE [dbo].[PHIEU_NHAP] CHECK CONSTRAINT [FK_PN_NCC]
GO
ALTER TABLE [dbo].[PHIEU_NHAP]  WITH CHECK ADD  CONSTRAINT [FK_PN_NV] FOREIGN KEY([IDNV])
REFERENCES [dbo].[NHAN_VIEN] ([IDNV])
GO
ALTER TABLE [dbo].[PHIEU_NHAP] CHECK CONSTRAINT [FK_PN_NV]
GO
ALTER TABLE [dbo].[PHIEU_TRA]  WITH CHECK ADD  CONSTRAINT [FK_PT_NV] FOREIGN KEY([IDNV])
REFERENCES [dbo].[NHAN_VIEN] ([IDNV])
GO
ALTER TABLE [dbo].[PHIEU_TRA] CHECK CONSTRAINT [FK_PT_NV]
GO
ALTER TABLE [dbo].[PHIEU_TRA]  WITH CHECK ADD  CONSTRAINT [FK_PT_TV] FOREIGN KEY([IDTV])
REFERENCES [dbo].[THANH_VIEN] ([IDTV])
GO
ALTER TABLE [dbo].[PHIEU_TRA] CHECK CONSTRAINT [FK_PT_TV]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_S_NXB] FOREIGN KEY([IDNXB])
REFERENCES [dbo].[NHA_XUAT_BAN] ([IDNXB])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_S_NXB]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_S_TG] FOREIGN KEY([IDTG])
REFERENCES [dbo].[TAC_GIA] ([IDTG])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_S_TG]
GO
ALTER TABLE [dbo].[THANH_VIEN]  WITH CHECK ADD  CONSTRAINT [FK_TV_LTV] FOREIGN KEY([IDLTV])
REFERENCES [dbo].[LOAI_THANH_VIEN] ([IDLTV])
GO
ALTER TABLE [dbo].[THANH_VIEN] CHECK CONSTRAINT [FK_TV_LTV]
GO
ALTER TABLE [dbo].[CHUC_VU]  WITH CHECK ADD  CONSTRAINT [Check_CV] CHECK  (([Ten]=N'Thủ thư' OR [Ten]=N'Quản lí' OR [Ten]=N'khác'))
GO
ALTER TABLE [dbo].[CHUC_VU] CHECK CONSTRAINT [Check_CV]
GO
ALTER TABLE [dbo].[CTMUON]  WITH CHECK ADD  CONSTRAINT [Check_SL_CTM] CHECK  (([SL]>=(1)))
GO
ALTER TABLE [dbo].[CTMUON] CHECK CONSTRAINT [Check_SL_CTM]
GO
ALTER TABLE [dbo].[CTNHAP]  WITH CHECK ADD  CONSTRAINT [Check_SL_CTN] CHECK  (([SL]>=(1)))
GO
ALTER TABLE [dbo].[CTNHAP] CHECK CONSTRAINT [Check_SL_CTN]
GO
ALTER TABLE [dbo].[CTTRA]  WITH CHECK ADD  CONSTRAINT [Check_SL_CTR] CHECK  (([SL]>=(1)))
GO
ALTER TABLE [dbo].[CTTRA] CHECK CONSTRAINT [Check_SL_CTR]
GO
ALTER TABLE [dbo].[LOAI_THANH_VIEN]  WITH CHECK ADD  CONSTRAINT [Check_LTV] CHECK  (([Ten]=N'Tiêu chuẩn' OR [Ten]=N'Thân thiết' OR [Ten]=N'VIP'))
GO
ALTER TABLE [dbo].[LOAI_THANH_VIEN] CHECK CONSTRAINT [Check_LTV]
GO
ALTER TABLE [dbo].[NHA_CUNG_CAP]  WITH CHECK ADD  CONSTRAINT [Check_phoneNCC] CHECK  ((NOT [SDT] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[NHA_CUNG_CAP] CHECK CONSTRAINT [Check_phoneNCC]
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD  CONSTRAINT [Check_day_S_VL] CHECK  (([NgaySinh]<[NgayVaoLam]))
GO
ALTER TABLE [dbo].[NHAN_VIEN] CHECK CONSTRAINT [Check_day_S_VL]
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD  CONSTRAINT [Check_phoneNV] CHECK  ((NOT [SDT] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[NHAN_VIEN] CHECK CONSTRAINT [Check_phoneNV]
GO
ALTER TABLE [dbo].[THANH_VIEN]  WITH CHECK ADD  CONSTRAINT [Check_day_DK_HH] CHECK  (([NgayDangKy]<[NgayHetHan]))
GO
ALTER TABLE [dbo].[THANH_VIEN] CHECK CONSTRAINT [Check_day_DK_HH]
GO
ALTER TABLE [dbo].[THANH_VIEN]  WITH CHECK ADD  CONSTRAINT [Check_day_S_DK] CHECK  (([NgaySinh]<[NgayDangKy]))
GO
ALTER TABLE [dbo].[THANH_VIEN] CHECK CONSTRAINT [Check_day_S_DK]
GO
ALTER TABLE [dbo].[THANH_VIEN]  WITH CHECK ADD  CONSTRAINT [Check_emailTV] CHECK  (([email] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[THANH_VIEN] CHECK CONSTRAINT [Check_emailTV]
GO
ALTER TABLE [dbo].[THANH_VIEN]  WITH CHECK ADD  CONSTRAINT [Check_GioiTinh] CHECK  (([GioiTinh]=N'Nam' OR [GioiTinh]=N'Nữ' OR [GioiTinh]=N'Khác'))
GO
ALTER TABLE [dbo].[THANH_VIEN] CHECK CONSTRAINT [Check_GioiTinh]
GO
ALTER TABLE [dbo].[THANH_VIEN]  WITH CHECK ADD  CONSTRAINT [Check_phoneTV] CHECK  ((NOT [SDT] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[THANH_VIEN] CHECK CONSTRAINT [Check_phoneTV]
GO
ALTER TABLE [dbo].[VI_PHAM]  WITH CHECK ADD  CONSTRAINT [Check_VP] CHECK  (([Ten]=N'Không vi phạm' OR [Ten]=N'Quá hạn' OR [Ten]=N'Làm mất sách' OR [Ten]=N'Làm hỏng sách'))
GO
ALTER TABLE [dbo].[VI_PHAM] CHECK CONSTRAINT [Check_VP]
GO
/****** Object:  StoredProcedure [dbo].[USP_DELETE_NV]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete nhan vien
CREATE PROC [dbo].[USP_DELETE_NV]
@IDNV int 
AS
BEGIN
	DELETE FROM NHAN_VIEN WHERE IDNV = @IDNV
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DELETE_TV]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete thanh vien
CREATE PROC [dbo].[USP_DELETE_TV]
@IDTV int 
AS
BEGIN
	DELETE FROM THANH_VIEN WHERE IDTV = @IDTV
END
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERT_CTM]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--insert chi tiet muon
CREATE PROC [dbo].[USP_INSERT_CTM]
	@IDPM int,
	@IDSach int,
	@SL int,
	@checktra int
AS
BEGIN
	INSERT INTO CTMUON
	(
		IDPM,
		IDSach,
		SL,
		checktra
	)
	VALUES
	(
		@IDPM,
		@IDSach,
		@SL,
		@checktra
	)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERT_NV]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--insert nhan vien
CREATE PROC [dbo].[USP_INSERT_NV]
	@IDNV int,
	@hoten nvarchar(100),
	@diachi nvarchar(100),
	@sdt char(10),
	@ngayvaolam smalldatetime,
	@ngaysinh smalldatetime,
	@username nvarchar(50),
	@password nvarchar(50),
	@IDCV char(6),
	@Active int
AS
BEGIN
	SET IDENTITY_INSERT NHAN_VIEN ON
	INSERT INTO NHAN_VIEN
	(
		IDNV,
		HoTen,
		DiaChi,
		SDT,
		NgayVaoLam,
		NgaySinh,
		Username,
		Password,
		IDCV,
		Active		
	)
	VALUES
	(
		@IDNV ,
		@hoten ,
		@diachi ,
		@sdt ,
		@ngayvaolam ,
		@ngaysinh ,
		@username ,
		@password ,
		@IDCV ,
		@Active 
	)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERT_PM]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--////////////////////////////////////////////
--insert phieu muon
CREATE PROC [dbo].[USP_INSERT_PM]
	@IDTV int,
	@IDNV int,
	@NgayMuon smalldatetime,
	@Tra int
AS
BEGIN
	INSERT INTO PHIEU_MUON
	(
		IDTV,
		IDNV,
		NgayMuon,
		Tra
	)
	VALUES
	(
		@IDTV,
		@IDNV,
		@NgayMuon,
		@Tra
	)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERT_PT]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--insert phieu tra
CREATE PROC [dbo].[USP_INSERT_PT]
	@IDPT int ,
	@IDTV int,
	@IDNV int,
	@NgayTra smalldatetime,
	@TienPhat float
AS
BEGIN
	INSERT INTO PHIEU_TRA
	(
		IDPT,
		IDTV,
		IDNV,
		NgayTra,
		TienPhat
	)
	VALUES
	(
		@IDPT,
		@IDTV,
		@IDNV,
		@NgayTra,
		@TienPhat
	)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERT_SACH]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------insert SACH-----------
CREATE PROC [dbo].[USP_INSERT_SACH]
	@IDSach int,
	@IDTG int,
	@IDNXB int,
	@Ten nvarchar(100),
	@TheLoai nvarchar(100),
	@ViTri varchar(20),
	@SL int,
	@SLHienTai int,
	@GiaSach float
	--moneyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
AS
BEGIN
	SET IDENTITY_INSERT SACH ON
	INSERT INTO SACH
	(
		IDSach,
		IDTG,
		IDNXB,
		Ten,
		TheLoai,
		ViTri,
		SL,
		SLHienTai,
		GiaSach		
	)
	VALUES
	(
		@IDSach ,
		@IDTG ,
		@IDNXB ,
		@Ten ,
		@TheLoai ,
		@ViTri ,
		@SL ,
		@SLHienTai ,
		@GiaSach
	)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERT_TV]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--insert thanh vien
CREATE PROC [dbo].[USP_INSERT_TV]
	@IDTV int,
	@hoten nvarchar(100),
	@diachi nvarchar(100),
	@sdt char(10),
	@CMND varchar(10),
	@ngaydangki smalldatetime,
	@ngayhethan smalldatetime,
	@ngaysinh smalldatetime,
	@IDLTV char(6),
	@email nvarchar(100),
	@Image nvarchar(300),
	@Gioitinh nvarchar(10)
AS
BEGIN
	SET IDENTITY_INSERT THANH_VIEN ON
	INSERT INTO THANH_VIEN
	(
		IDTV,
		HoTen,
		DiaChi,
		SDT,
		CMND,
		NgayDangKy,
		NgayHetHan,
		NgaySinh,
		IDLTV,
		email,
		Anh,
		GioiTinh		
	)
	VALUES
	(
		@IDTV ,
		@hoten ,
		@diachi ,
		@sdt ,
		@CMND ,
		@ngaydangki ,
		@ngayhethan ,
		@ngaysinh ,
		@IDLTV ,
		@email ,
		@Image ,
		@Gioitinh 
	)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LOGIN]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--login
CREATE PROC [dbo].[USP_LOGIN]
@username nvarchar(100), @password nvarchar(100)
AS
BEGIN 
SELECT*FROM NHAN_VIEN WHERE Username = @username AND Password = @password
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATE_CTM]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--update chi tiet muon
CREATE PROC [dbo].[USP_UPDATE_CTM]
	@IDPM int,
	@IDSach int,
	@SL int,
	@checktra int
AS
BEGIN
	UPDATE CTMUON
	SET checktra = @checktra
	WHERE IDPM = @IDPM AND IDSach = @IDSach		
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATE_NV]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update nhan vien
CREATE PROC [dbo].[USP_UPDATE_NV]
	@IDNV int,
	@hoten nvarchar(100),
	@diachi nvarchar(100),
	@sdt char(10),
	@ngayvaolam smalldatetime,
	@ngaysinh smalldatetime,
	@username nvarchar(50),
	@password nvarchar(50),
	@IDCV char(6),
	@Active int
AS
BEGIN
	UPDATE NHAN_VIEN 
	SET HoTen = @hoten,
		DiaChi = @diachi,
		SDT = @sdt,
		NgayVaoLam = @ngayvaolam,
		NgaySinh = @ngaysinh,
		Username = @username,
		Password = @password,
		IDCV = @IDCV,
		Active = @Active
	WHERE IDNV = @IDNV				
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATE_PM]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update phieu muon
CREATE PROC [dbo].[USP_UPDATE_PM]
	@IDPM int,
	@Tra int
AS
BEGIN
	UPDATE PHIEU_MUON
	SET Tra = @Tra
	WHERE IDPM = @IDPM				
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATE_SACH]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Update SACH
CREATE PROC [dbo].[USP_UPDATE_SACH]
	@IDSach int,
	@IDTG int,
	@IDNXB int,
	@Ten nvarchar(100),
	@TheLoai nvarchar(100),
	@ViTri varchar(20),
	@SL int,
	@SLHienTai int,
	@GiaSach float
AS
BEGIN
	UPDATE SACH
	SET 
		IDTG = @IDTG,
		IDNXB = @IDNXB,
		Ten = @Ten,
		TheLoai = @TheLoai,
		ViTri = @ViTri,
		SL = @SL,
		SLHienTai = @SLHienTai,
		GiaSach	= @GiaSach
	WHERE IDSach = @IDSach				
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATE_TV]    Script Date: 7/2/2020 3:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update thanh vien
CREATE PROC [dbo].[USP_UPDATE_TV]
	@IDTV int,
	@hoten nvarchar(100),
	@diachi nvarchar(100),
	@sdt char(10),
	@CMND varchar(10),
	@ngaydangki smalldatetime,
	@ngayhethan smalldatetime,
	@ngaysinh smalldatetime,
	@IDLTV char(6),
	@email nvarchar(100),
	@Image nvarchar(300),
	@Gioitinh nvarchar(10)
AS
BEGIN
	UPDATE THANH_VIEN
	SET 
		HoTen = @hoten,
		DiaChi = @diachi,
		SDT = @sdt,
		CMND = @CMND,
		NgayDangKy = @ngaydangki,
		NgayHetHan = @ngayhethan,
		NgaySinh = @ngaysinh,
		IDLTV = @IDLTV,
		email = @email,
		Anh = @Image,
		GioiTinh = @Gioitinh
	WHERE IDTV = @IDTV				
END
GO
USE [master]
GO
ALTER DATABASE [QLTV] SET  READ_WRITE 
GO
