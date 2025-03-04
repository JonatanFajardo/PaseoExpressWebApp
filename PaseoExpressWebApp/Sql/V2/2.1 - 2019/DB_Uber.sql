USE [master]
GO
/****** Object:  Database [DB_Uber]    Script Date: 28/01/2025 23:25:19 ******/
CREATE DATABASE [DB_Uber]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Uber', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Uber.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Uber_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Uber_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_Uber] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Uber].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Uber] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Uber] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Uber] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Uber] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Uber] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Uber] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Uber] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Uber] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Uber] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Uber] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Uber] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Uber] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Uber] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Uber] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Uber] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Uber] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Uber] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Uber] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Uber] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Uber] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Uber] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Uber] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Uber] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Uber] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Uber] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Uber] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Uber] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Uber] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Uber] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Uber] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Uber', N'ON'
GO
ALTER DATABASE [DB_Uber] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_Uber] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_Uber]
GO
/****** Object:  User [jonna]    Script Date: 28/01/2025 23:25:20 ******/
CREATE USER [jonna] FOR LOGIN [jonna] WITH DEFAULT_SCHEMA=[jonna]
GO
ALTER ROLE [db_owner] ADD MEMBER [jonna]
GO
/****** Object:  Schema [chat]    Script Date: 28/01/2025 23:25:20 ******/
CREATE SCHEMA [chat]
GO
/****** Object:  Schema [jonna]    Script Date: 28/01/2025 23:25:20 ******/
CREATE SCHEMA [jonna]
GO
/****** Object:  Schema [seguridad]    Script Date: 28/01/2025 23:25:20 ******/
CREATE SCHEMA [seguridad]
GO
/****** Object:  Table [chat].[tbDetail]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chat].[tbDetail](
	[IdDetail] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[GroupId] [int] NULL,
	[Timestamp] [datetime] NULL,
	[IdMessage] [int] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_tbDetail] PRIMARY KEY CLUSTERED 
(
	[IdDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [chat].[tbGroups]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chat].[tbGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_tbGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [chat].[tbMessage]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chat].[tbMessage](
	[IdMessage] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](650) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_tbMessage] PRIMARY KEY CLUSTERED 
(
	[IdMessage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [chat].[tbRoleChatAuthorization PROXIMAMENTE]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chat].[tbRoleChatAuthorization PROXIMAMENTE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRolFirstPerson] [int] NULL,
	[IdRolSecondPerson] [int] NULL,
 CONSTRAINT [PK_tbRoleChatAuthorization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [chat].[tbTagUsuario]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chat].[tbTagUsuario](
	[IdTag] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[Nombre] [varchar](150) NULL,
	[EsEliminado] [bit] NULL,
 CONSTRAINT [PK_tbTagUsuario] PRIMARY KEY CLUSTERED 
(
	[IdTag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbHistorialMantenimiento]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHistorialMantenimiento](
	[IdMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[IdVehiculo] [int] NULL,
	[FechaMantenimiento] [date] NULL,
	[IdTipoMantenimiento] [int] NULL,
	[DescripcionMantenimiento] [text] NULL,
	[CantidadComprada] [int] NULL,
	[CostoUnitario] [decimal](10, 2) NULL,
	[CostoTotal] [decimal](10, 2) NULL,
	[CostoManoObra] [decimal](10, 2) NULL,
	[MiMano] [bit] NULL,
	[KilometrajeVehiculo] [int] NULL,
	[ProximaFechaMantenimiento] [date] NULL,
 CONSTRAINT [PK__Historia__DD1C4417FAD86A75] PRIMARY KEY CLUSTERED 
(
	[IdMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbServicios]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbServicios](
	[IdServicios] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoServicio] [int] NOT NULL,
	[Imagenes] [nvarchar](4000) NULL,
	[Titulo] [nvarchar](250) NOT NULL,
	[Descripcion] [nvarchar](550) NULL,
	[FechaServicio] [date] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
	[MillajeVehiculo] [int] NULL,
	[ProximoMillaje] [bigint] NULL,
	[CostoTotal] [decimal](10, 2) NULL,
	[Marca] [nvarchar](250) NULL,
	[IdTipoMantenimiento] [int] NOT NULL,
	[ProximaFechaMantenimiento] [date] NULL,
	[EsRecurrente] [bit] NOT NULL,
	[IdUbicacionEnAutomovil] [int] NULL,
	[PrecioManoObra] [decimal](10, 2) NULL,
	[Confirmado] [bit] NOT NULL,
	[Viaticos] [nvarchar](250) NULL,
	[ManoObraPersonal] [int] NULL,
 CONSTRAINT [PK_tbServicio] PRIMARY KEY CLUSTERED 
(
	[IdServicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbServicios_tbTransacciones]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbServicios_tbTransacciones](
	[IdServicios] [int] NOT NULL,
	[IdTransaccion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdServicios] ASC,
	[IdTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTipoMantenimientos]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTipoMantenimientos](
	[IdTipoMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](350) NULL,
 CONSTRAINT [PK_tbTipoMantenimiento] PRIMARY KEY CLUSTERED 
(
	[IdTipoMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTipoServicios]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTipoServicios](
	[IdTipoServicio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](350) NULL,
	[MillajeCambioRecomendado] [varchar](50) NULL,
	[KilometrajeCambioRecomendado] [varchar](50) NULL,
	[Meses] [decimal](10, 2) NULL,
 CONSTRAINT [PK_tbTipoServicio] PRIMARY KEY CLUSTERED 
(
	[IdTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTipoTransaccion]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTipoTransaccion](
	[IdTipoTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NULL,
 CONSTRAINT [PK_tbTipoTransaccion] PRIMARY KEY CLUSTERED 
(
	[IdTipoTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTransacciones]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTransacciones](
	[IdTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](800) NULL,
	[TarifaDiaria] [int] NULL,
	[TarifaAhorro] [int] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
	[IdUsuario] [int] NULL,
	[FechaTransaccion] [date] NOT NULL,
	[FechaTransaccionHasta] [date] NULL,
	[Confirmada] [bit] NOT NULL,
	[UltimaSuma] [int] NULL,
	[Comentario] [varchar](4000) NULL,
	[IdTipoTransaccion] [int] NOT NULL,
	[FechaCreacion] [date] NOT NULL,
 CONSTRAINT [PK_tbTransaccion] PRIMARY KEY CLUSTERED 
(
	[IdTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUbicacionEnAutomovil]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUbicacionEnAutomovil](
	[IdUbicacionEnAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[Ubicacion] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbUbicacionEnAutomovil] PRIMARY KEY CLUSTERED 
(
	[IdUbicacionEnAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbVehiculo]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbVehiculo](
	[IdVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](255) NULL,
	[Modelo] [varchar](255) NULL,
	[Color] [varchar](100) NULL,
	[Anio] [int] NULL,
	[VIN] [varchar](17) NULL,
	[Placa] [varchar](20) NULL,
	[Kilometraje] [bigint] NULL,
	[Millaje] [bigint] NULL,
	[MillajeActual] [bigint] NULL,
	[TarifaDiaria] [int] NOT NULL,
	[TarifaAhorro] [int] NOT NULL,
	[TipoAceite] [varchar](50) NULL,
	[IdPropietario] [int] NULL,
	[IdConductor] [int] NULL,
	[Inhabilitado] [bit] NULL,
	[Imagen] [varchar](600) NULL,
 CONSTRAINT [PK__VehicleI__64D74CC8A61356E4] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[tbRol]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[tbRol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](530) NULL,
	[UsarCodigoMensaje] [bit] NULL,
 CONSTRAINT [PK_tbRol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[tbUsuarios]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[tbUsuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](650) NOT NULL,
	[IdRol] [int] NOT NULL,
	[Usuario] [nvarchar](350) NOT NULL,
	[Password] [nvarchar](350) NOT NULL,
	[Nombre] [nvarchar](350) NULL,
	[Identidad] [varchar](50) NULL,
	[Cuenta] [varchar](350) NULL,
	[TagMensajeria] [varchar](150) NULL,
	[Correo] [varchar](450) NULL,
	[Telefono] [varchar](50) NULL,
	[Ciudad] [nvarchar](50) NULL,
	[EstaActivo] [bit] NULL,
 CONSTRAINT [PK_tbUsuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [chat].[tbDetail] ON 

INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1, 1, 2, NULL, CAST(N'2025-01-07T00:00:00.000' AS DateTime), 2, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (2, 1, 2, 0, CAST(N'2025-01-08T09:13:52.677' AS DateTime), 3, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (4, 1, 2, 0, CAST(N'2025-01-09T01:15:58.003' AS DateTime), 5, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (5, 1, 2, 0, CAST(N'2025-01-09T03:18:32.883' AS DateTime), 6, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (6, 1, 2, 0, CAST(N'2025-01-09T03:18:51.767' AS DateTime), 7, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (7, 1, 2, 0, CAST(N'2025-01-09T03:19:58.577' AS DateTime), 8, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (9, 1, 2, 0, CAST(N'2025-01-09T03:30:16.553' AS DateTime), 10, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (10, 1, 2, 0, CAST(N'2025-01-09T03:48:29.783' AS DateTime), 11, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (11, 1, 2, 0, CAST(N'2025-01-09T03:51:09.667' AS DateTime), 12, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (12, 2, 1, 0, CAST(N'2025-01-09T03:51:20.083' AS DateTime), 13, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (13, 1, 2, 0, CAST(N'2025-01-09T04:07:45.170' AS DateTime), 14, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (14, 1, 2, 0, CAST(N'2025-01-09T04:11:45.430' AS DateTime), 15, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (15, 1, 2, 0, CAST(N'2025-01-09T04:12:18.253' AS DateTime), 16, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (16, 1, 1, 0, CAST(N'2025-01-09T04:14:09.797' AS DateTime), 17, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (17, 1, 1, 0, CAST(N'2025-01-09T04:14:18.670' AS DateTime), 18, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (18, 1, 1, 0, CAST(N'2025-01-09T04:14:36.200' AS DateTime), 19, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (19, 1, 2, 0, CAST(N'2025-01-09T04:15:00.640' AS DateTime), 20, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (20, 1, 2, 0, CAST(N'2025-01-09T04:19:56.780' AS DateTime), 21, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (21, 1, 2, 0, CAST(N'2025-01-09T04:20:04.873' AS DateTime), 22, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (22, 1, 2, 0, CAST(N'2025-01-09T04:21:59.960' AS DateTime), 23, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (23, 1, 2, 0, CAST(N'2025-01-09T04:22:53.000' AS DateTime), 24, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (24, 1, 2, 0, CAST(N'2025-01-09T04:25:50.493' AS DateTime), 25, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (25, 1, 2, 0, CAST(N'2025-01-09T04:27:02.003' AS DateTime), 26, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (26, 1, 1, 0, CAST(N'2025-01-09T04:37:31.067' AS DateTime), 27, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (27, 1, 2, 0, CAST(N'2025-01-09T04:51:08.253' AS DateTime), 28, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (28, 1, 2, 0, CAST(N'2025-01-09T04:52:23.930' AS DateTime), 29, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (29, 1, 2, 0, CAST(N'2025-01-09T04:52:37.680' AS DateTime), 30, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (30, 1, 2, 0, CAST(N'2025-01-09T04:54:01.603' AS DateTime), 31, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (31, 1, 2, 0, CAST(N'2025-01-09T04:54:43.437' AS DateTime), 32, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (32, 1, 2, 0, CAST(N'2025-01-09T16:43:47.777' AS DateTime), 33, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (33, 1, 2, 0, CAST(N'2025-01-09T16:56:06.803' AS DateTime), 34, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (34, 1, 2, 0, CAST(N'2025-01-09T16:56:38.713' AS DateTime), 35, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (35, 1, 2, 0, CAST(N'2025-01-09T17:01:04.290' AS DateTime), 36, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (36, 2, 1, 0, CAST(N'2025-01-09T20:16:13.080' AS DateTime), 37, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (37, 2, 1, 0, CAST(N'2025-01-09T20:16:34.420' AS DateTime), 38, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (38, 1, 2, 0, CAST(N'2025-01-10T00:08:16.753' AS DateTime), 39, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (39, 2, 1, 0, CAST(N'2025-01-10T01:08:36.243' AS DateTime), 40, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (40, 2, 1, 0, CAST(N'2025-01-10T01:08:59.850' AS DateTime), 41, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (41, 2, 1, 0, CAST(N'2025-01-10T01:10:17.447' AS DateTime), 42, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (42, 2, 1, 0, CAST(N'2025-01-10T01:10:19.093' AS DateTime), 43, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1020, 1, 2, 0, CAST(N'2025-01-10T08:08:46.923' AS DateTime), 1021, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1021, 1, 2, 0, CAST(N'2025-01-10T08:08:58.750' AS DateTime), 1022, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1022, 2, 1, 0, CAST(N'2025-01-10T09:11:32.363' AS DateTime), 1023, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1023, 2, 1, 0, CAST(N'2025-01-10T09:11:33.263' AS DateTime), 1024, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1024, 1, 2, 0, CAST(N'2025-01-10T09:11:40.110' AS DateTime), 1025, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1025, 1, 2, 0, CAST(N'2025-01-10T09:14:37.350' AS DateTime), 1026, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1026, 1, 2, 0, CAST(N'2025-01-10T09:14:44.120' AS DateTime), 1027, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1027, 2, 1, 0, CAST(N'2025-01-10T09:15:51.533' AS DateTime), 1028, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1028, 1, 2, 0, CAST(N'2025-01-10T09:16:31.523' AS DateTime), 1029, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1029, 2, 2, 0, CAST(N'2025-01-10T09:43:03.507' AS DateTime), 1030, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1030, 2, 2, 0, CAST(N'2025-01-10T09:43:13.347' AS DateTime), 1031, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1031, 2, 2, 0, CAST(N'2025-01-10T09:43:28.390' AS DateTime), 1032, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1032, 2, 2, 0, CAST(N'2025-01-10T09:45:37.127' AS DateTime), 1033, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1033, 2, 2, 0, CAST(N'2025-01-10T09:45:43.927' AS DateTime), 1034, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1034, 2, 1, 0, CAST(N'2025-01-10T09:46:27.480' AS DateTime), 1035, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1035, 2, 1, 0, CAST(N'2025-01-10T09:46:28.380' AS DateTime), 1036, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1036, 1, 1, 0, CAST(N'2025-01-10T09:48:12.273' AS DateTime), 1037, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1037, 1, 1, 0, CAST(N'2025-01-10T09:48:13.977' AS DateTime), 1038, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1038, 1, 1, 0, CAST(N'2025-01-10T09:48:14.033' AS DateTime), 1039, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1039, 1, 1, 0, CAST(N'2025-01-10T23:29:44.647' AS DateTime), 1040, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1040, 1, 1, 0, CAST(N'2025-01-10T23:29:45.697' AS DateTime), 1041, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1041, 1, 1, 0, CAST(N'2025-01-10T23:29:46.017' AS DateTime), 1042, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1042, 1, 1, 0, CAST(N'2025-01-10T23:29:46.040' AS DateTime), 1043, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1043, 1, 1, 0, CAST(N'2025-01-10T23:51:12.980' AS DateTime), 1044, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1044, 1, 1, 0, CAST(N'2025-01-11T00:41:14.297' AS DateTime), 1045, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1045, 1, 1, 0, CAST(N'2025-01-11T00:46:02.197' AS DateTime), 1046, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1046, 1, 1, 0, CAST(N'2025-01-11T01:16:31.207' AS DateTime), 1047, 0)
INSERT [chat].[tbDetail] ([IdDetail], [SenderId], [ReceiverId], [GroupId], [Timestamp], [IdMessage], [IsRead]) VALUES (1047, 1, 1, 0, CAST(N'2025-01-11T01:53:38.183' AS DateTime), 1048, 0)
SET IDENTITY_INSERT [chat].[tbDetail] OFF
GO
SET IDENTITY_INSERT [chat].[tbMessage] ON 

INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1, N'Hola, ¿cómo estás?', 0, CAST(N'2025-01-07T00:00:00.000' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (2, N'Hola, ¿cómo estás?', 0, CAST(N'2025-01-07T00:00:00.000' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (3, N'hi', 0, CAST(N'2025-01-08T09:13:52.677' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (4, N'hola1', 0, CAST(N'2025-01-09T00:55:40.847' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (5, N'hola', 0, CAST(N'2025-01-09T01:15:58.003' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (6, N'hola2', 0, CAST(N'2025-01-09T03:18:32.883' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (7, N'hola3', 0, CAST(N'2025-01-09T03:18:51.767' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (8, N'hola4', 0, CAST(N'2025-01-09T03:19:58.577' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (9, N'hola5', 0, CAST(N'2025-01-09T03:20:28.837' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (10, N'hola6', 0, CAST(N'2025-01-09T03:30:16.553' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (11, N'hola7', 0, CAST(N'2025-01-09T03:48:29.783' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (12, N'hi7', 0, CAST(N'2025-01-09T03:51:09.667' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (13, N'hi8', 0, CAST(N'2025-01-09T03:51:20.083' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (14, N'hola2', 0, CAST(N'2025-01-09T04:07:45.170' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (15, N'hola', 0, CAST(N'2025-01-09T04:11:45.430' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (16, N'hola', 0, CAST(N'2025-01-09T04:12:18.253' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (17, N'hola', 0, CAST(N'2025-01-09T04:14:09.797' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (18, N'hola', 0, CAST(N'2025-01-09T04:14:18.670' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (19, N'hola', 0, CAST(N'2025-01-09T04:14:36.200' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (20, N'hola', 0, CAST(N'2025-01-09T04:15:00.640' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (21, N'hola', 0, CAST(N'2025-01-09T04:19:56.780' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (22, N'hola', 0, CAST(N'2025-01-09T04:20:04.873' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (23, N'hola', 0, CAST(N'2025-01-09T04:21:59.960' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (24, N'hola', 0, CAST(N'2025-01-09T04:22:53.000' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (25, N'holis', 0, CAST(N'2025-01-09T04:25:50.493' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (26, N'holis', 0, CAST(N'2025-01-09T04:27:02.003' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (27, N'hola4', 0, CAST(N'2025-01-09T04:37:31.067' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (28, N'hola', 0, CAST(N'2025-01-09T04:51:08.253' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (29, N'hola', 0, CAST(N'2025-01-09T04:52:23.930' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (30, N'hola2', 0, CAST(N'2025-01-09T04:52:37.680' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (31, N'hola3', 0, CAST(N'2025-01-09T04:54:01.603' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (32, N'hola4', 0, CAST(N'2025-01-09T04:54:43.437' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (33, N'hola', 0, CAST(N'2025-01-09T16:43:47.777' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (34, N'hola1', 0, CAST(N'2025-01-09T16:56:06.803' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (35, N'hola2', 0, CAST(N'2025-01-09T16:56:38.713' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (36, N'hola3', 0, CAST(N'2025-01-09T17:01:04.290' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (37, N'hola', 0, CAST(N'2025-01-09T20:16:13.080' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (38, N'hola', 0, CAST(N'2025-01-09T20:16:34.420' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (39, N'hola', 0, CAST(N'2025-01-10T00:08:16.753' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (40, N'hola', 0, CAST(N'2025-01-10T01:08:36.243' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (41, N'hola', 0, CAST(N'2025-01-10T01:08:59.850' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (42, N'hola', 0, CAST(N'2025-01-10T01:10:17.447' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (43, N'hola', 0, CAST(N'2025-01-10T01:10:19.093' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1021, N'hola', 0, CAST(N'2025-01-10T08:08:46.923' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1022, N'hola2', 0, CAST(N'2025-01-10T08:08:58.750' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1023, N'hola', 0, CAST(N'2025-01-10T09:11:32.363' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1024, N'hola', 0, CAST(N'2025-01-10T09:11:33.263' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1025, N'hola', 0, CAST(N'2025-01-10T09:11:40.110' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1026, N'hola', 0, CAST(N'2025-01-10T09:14:37.350' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1027, N'hola', 0, CAST(N'2025-01-10T09:14:44.120' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1028, N'hola', 0, CAST(N'2025-01-10T09:15:51.533' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1029, N'hola', 0, CAST(N'2025-01-10T09:16:31.523' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1030, N'gola', 0, CAST(N'2025-01-10T09:43:03.507' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1031, N'gola', 0, CAST(N'2025-01-10T09:43:13.347' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1032, N'gola', 0, CAST(N'2025-01-10T09:43:28.390' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1033, N'ads', 0, CAST(N'2025-01-10T09:45:37.127' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1034, N'ads', 0, CAST(N'2025-01-10T09:45:43.927' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1035, N'ads', 0, CAST(N'2025-01-10T09:46:27.480' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1036, N'ads', 0, CAST(N'2025-01-10T09:46:28.380' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1037, N'hola', 0, CAST(N'2025-01-10T09:48:12.273' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1038, N'hola', 0, CAST(N'2025-01-10T09:48:13.977' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1039, N'hola', 0, CAST(N'2025-01-10T09:48:14.033' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1040, N'hola', 0, CAST(N'2025-01-10T23:29:44.647' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1041, N'hola', 0, CAST(N'2025-01-10T23:29:45.697' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1042, N'hola', 0, CAST(N'2025-01-10T23:29:46.017' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1043, N'hola', 0, CAST(N'2025-01-10T23:29:46.040' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1044, N'hola', 0, CAST(N'2025-01-10T23:51:12.980' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1045, N'gola', 0, CAST(N'2025-01-11T00:41:14.297' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1046, N'HOLA', 0, CAST(N'2025-01-11T00:46:02.197' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1047, N'as', 0, CAST(N'2025-01-11T01:16:31.207' AS DateTime))
INSERT [chat].[tbMessage] ([IdMessage], [Description], [IsRead], [Time]) VALUES (1048, N'as', 0, CAST(N'2025-01-11T01:53:38.183' AS DateTime))
SET IDENTITY_INSERT [chat].[tbMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[tbHistorialMantenimiento] ON 

INSERT [dbo].[tbHistorialMantenimiento] ([IdMantenimiento], [IdVehiculo], [FechaMantenimiento], [IdTipoMantenimiento], [DescripcionMantenimiento], [CantidadComprada], [CostoUnitario], [CostoTotal], [CostoManoObra], [MiMano], [KilometrajeVehiculo], [ProximaFechaMantenimiento]) VALUES (1, 2, NULL, 2, N'Aceite de transmision', 2, CAST(840.00 AS Decimal(10, 2)), CAST(1680.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), NULL, NULL, NULL)
INSERT [dbo].[tbHistorialMantenimiento] ([IdMantenimiento], [IdVehiculo], [FechaMantenimiento], [IdTipoMantenimiento], [DescripcionMantenimiento], [CantidadComprada], [CostoUnitario], [CostoTotal], [CostoManoObra], [MiMano], [KilometrajeVehiculo], [ProximaFechaMantenimiento]) VALUES (2, 2, NULL, 2, N'Elevador de vidrio izquierdo trasero', 1, CAST(1000.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(250.00 AS Decimal(10, 2)), NULL, NULL, NULL)
INSERT [dbo].[tbHistorialMantenimiento] ([IdMantenimiento], [IdVehiculo], [FechaMantenimiento], [IdTipoMantenimiento], [DescripcionMantenimiento], [CantidadComprada], [CostoUnitario], [CostoTotal], [CostoManoObra], [MiMano], [KilometrajeVehiculo], [ProximaFechaMantenimiento]) VALUES (3, 2, CAST(N'2024-06-19' AS Date), 2, N'Reparacion luz trasera derecha no enciende al frenar', 1, CAST(15.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbHistorialMantenimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[tbServicios] ON 

INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (4, 2, NULL, N'Cambio Aceite', NULL, CAST(N'2024-02-15' AS Date), 2, 135300, 138300, NULL, N'chevron', 1, NULL, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (8, 2, NULL, N'Cambio Aceite', NULL, CAST(N'2024-02-10' AS Date), 3, 123453, NULL, NULL, N'kendall', 1, NULL, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (9, 2, NULL, N'Cambio Aceite', NULL, CAST(N'2024-02-10' AS Date), 3, 142000, 145000, NULL, N'valvoline', 1, NULL, 0, 1, NULL, 1, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (14, 1, N'path/to/image.jpg', N'Servicio de Ejemplo', N'Descripción del servicio de ejemplo', CAST(N'2023-06-21' AS Date), 4, 31000, 34100, CAST(1000.00 AS Decimal(10, 2)), N'Marca de Ejemplo', 1, CAST(N'2023-12-21' AS Date), 0, 1, CAST(50.00 AS Decimal(10, 2)), 1, N'N/A', 1)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (15, 1, N'path/to/image.jpg', N'Servicio de Ejemplo', N'Descripción del servicio de ejemplo', CAST(N'2023-06-21' AS Date), 4, 31000, 34100, CAST(1000.00 AS Decimal(10, 2)), N'Marca de Ejemplo', 1, CAST(N'2023-12-21' AS Date), 0, 1, CAST(50.00 AS Decimal(10, 2)), 1, N'N/A', 1)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (21, 1, NULL, N'Cambio de buhias leds', NULL, CAST(N'2024-07-01' AS Date), 2, NULL, NULL, CAST(150.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (26, 1, NULL, N'Reparacion base de amortiguador dañado', NULL, CAST(N'2024-05-04' AS Date), 2, NULL, NULL, CAST(4000.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 2, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (27, 3, NULL, N'Reemplazo de líquidos transmisión', NULL, CAST(N'2024-06-16' AS Date), 2, NULL, NULL, CAST(1680.00 AS Decimal(10, 2)), N'Valvoline', 2, NULL, 0, 1, NULL, 0, NULL, 500)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (28, 9, NULL, N'Filtro transmision', NULL, CAST(N'2024-06-16' AS Date), 2, NULL, NULL, CAST(350.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (29, 1, N'img\servicios\s-l640.jpg', N'Panel de vidrio electrico', N'cable roto, mal estado', CAST(N'2024-04-05' AS Date), 2, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), N'Hyundai', 2, NULL, 0, 4, NULL, 0, NULL, 350)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (31, 1, N'img\servicios\s-l640 (1).jpg', N'bomba de agua elantra 2.0', NULL, CAST(N'2024-05-24' AS Date), 2, NULL, NULL, CAST(1080.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 1, NULL, 0, NULL, 2500)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (33, 1, NULL, N'Radio', NULL, CAST(N'2024-07-05' AS Date), 4, NULL, NULL, CAST(500.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, NULL, NULL, 0, NULL, 250)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (34, 10, NULL, N'Para Brisas', N'Dañados', CAST(N'2024-05-24' AS Date), 4, NULL, NULL, CAST(100.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 3, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (38, 11, NULL, N'Cambio Coolant', NULL, CAST(N'2024-01-04' AS Date), 3, NULL, NULL, CAST(430.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, NULL, NULL, 0, NULL, 150)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (40, 12, NULL, N'Pintura', N'Pintura dañada', CAST(N'2024-07-04' AS Date), 3, NULL, NULL, CAST(1500.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 6, NULL, 0, N'700', NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (42, 7, NULL, N'LLantas', NULL, CAST(N'2024-02-07' AS Date), 3, NULL, NULL, CAST(1800.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 6, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (43, 13, NULL, N'Cuestiones Electricas', NULL, CAST(N'2024-05-22' AS Date), 3, NULL, NULL, CAST(305.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 1, NULL, 0, NULL, 100)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (44, 13, NULL, N'Swich de freno', NULL, CAST(N'2024-05-22' AS Date), 2, NULL, NULL, CAST(305.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 1, NULL, 0, NULL, 100)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (45, 13, NULL, N'Sensor de oxigeno', NULL, CAST(N'2024-05-22' AS Date), 3, NULL, NULL, CAST(2405.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, NULL, CAST(250.00 AS Decimal(10, 2)), 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (46, 14, NULL, N'Cambio Empaques motor', NULL, CAST(N'2024-01-04' AS Date), 3, NULL, NULL, CAST(240.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, NULL, NULL, 0, NULL, 200)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (50, 15, NULL, N'Direccion o ruedas', N'Rodamiento de llanta', CAST(N'2024-05-05' AS Date), 3, NULL, NULL, CAST(550.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 2, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (51, 15, NULL, N'Direccion o ruedas', N'Peine', CAST(N'2024-01-05' AS Date), 3, NULL, NULL, CAST(3500.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 3, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (52, 2, NULL, N'Cambio de aceite', NULL, CAST(N'2024-05-04' AS Date), 3, NULL, NULL, CAST(840.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (53, 16, NULL, N'Refrigeracion', N'Cambio de mangera', CAST(N'2024-04-10' AS Date), 3, NULL, NULL, CAST(250.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 2, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (54, 16, NULL, N'Refrigeracion', N'Cambio de mangera', CAST(N'2024-05-06' AS Date), 3, NULL, NULL, CAST(1300.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 6, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (55, 1, NULL, N'Cambio de foco de stop', NULL, CAST(N'2024-07-01' AS Date), 2, NULL, NULL, CAST(800.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 4, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (56, 1, NULL, N'Cambio amortiguadores', NULL, CAST(N'2024-05-09' AS Date), 2, NULL, NULL, CAST(3800.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 6, CAST(400.00 AS Decimal(10, 2)), 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (57, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 5, NULL, NULL, CAST(2000.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 6, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (58, 1, NULL, N'Arrancador dañado', NULL, CAST(N'2024-06-29' AS Date), 5, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 6, NULL, 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (62, 1, NULL, N'Se apago vehiculo', NULL, CAST(N'2024-05-08' AS Date), 5, NULL, NULL, CAST(1.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 6, CAST(200.00 AS Decimal(10, 2)), 0, N'1600', NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (63, 1, NULL, N'Radio', NULL, CAST(N'2024-06-29' AS Date), 4, NULL, NULL, CAST(500.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 6, NULL, 0, NULL, 200)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (64, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 3, 138000, 148000, CAST(950.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 2, CAST(50.00 AS Decimal(10, 2)), 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (65, 8, NULL, N'Cambio Amortiguador', NULL, CAST(N'2024-07-05' AS Date), 3, NULL, NULL, CAST(700.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 4, CAST(150.00 AS Decimal(10, 2)), 0, NULL, NULL)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (66, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 3, 138000, 148000, CAST(950.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 3, CAST(50.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (67, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 3, 140500, 150500, CAST(950.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 4, CAST(50.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (68, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 3, 135000, 145000, CAST(950.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 5, CAST(50.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (69, 2, NULL, N'Cambio Aceite', NULL, CAST(N'2024-07-10' AS Date), 3, 142000, 145000, CAST(0.00 AS Decimal(10, 2)), N'kendall', 1, NULL, 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (70, 5, NULL, N'Cambio Filtro Cabina', NULL, CAST(N'2024-07-10' AS Date), 3, 138000, 144000, CAST(0.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (71, 6, NULL, N'Cambio Filtro De Motor', NULL, CAST(N'2024-07-10' AS Date), 3, 140000, 145000, CAST(0.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (72, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 4, 83000, 93000, CAST(2000.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 2, NULL, 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (76, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 4, 86000, 96000, CAST(950.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 3, CAST(50.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (77, 8, NULL, N'Cambio Amortiguador', NULL, CAST(N'2024-07-05' AS Date), 4, NULL, NULL, CAST(700.00 AS Decimal(10, 2)), NULL, 2, NULL, 0, 6, CAST(150.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (78, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 4, 89000, 99000, CAST(950.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 4, CAST(50.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (79, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-05' AS Date), 4, 83000, 93000, CAST(950.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 5, CAST(50.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (80, 2, NULL, N'Cambio Aceite', NULL, CAST(N'2024-07-05' AS Date), 4, 90500, 93500, CAST(950.00 AS Decimal(10, 2)), N'Valvoline', 1, NULL, 0, 6, CAST(50.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (81, 5, NULL, N'Cambio Filtro Cabina', NULL, CAST(N'2024-07-10' AS Date), 4, 90800, 92800, CAST(0.00 AS Decimal(10, 2)), N'Null', 1, NULL, 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (82, 6, NULL, N'Cambio Filtro De Motor', NULL, CAST(N'2024-07-10' AS Date), 4, 89500, 94500, CAST(0.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (83, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-10' AS Date), 4, 140000, 145000, CAST(0.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 2, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (84, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-10' AS Date), 4, 140000, 145000, CAST(0.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 3, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (85, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-10' AS Date), 4, 140000, 145000, CAST(0.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 4, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (86, 7, NULL, N'Cambio LLantas', NULL, CAST(N'2024-07-10' AS Date), 4, 140000, 145000, CAST(0.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 5, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (87, 2, NULL, N'Cambio Aceite', NULL, CAST(N'2024-07-05' AS Date), 4, 140500, 150500, CAST(950.00 AS Decimal(10, 2)), N'Valvoline', 1, NULL, 0, 6, CAST(50.00 AS Decimal(10, 2)), 0, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (88, 5, NULL, N'Cambio Filtro Cabina', NULL, CAST(N'2024-07-10' AS Date), 4, 142000, 145000, CAST(0.00 AS Decimal(10, 2)), N'kendall', 1, NULL, 0, 6, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (89, 7, NULL, N'Cambio Filtro De Motor', NULL, CAST(N'2024-07-10' AS Date), 4, 142000, 144000, CAST(0.00 AS Decimal(10, 2)), NULL, 1, NULL, 0, 6, NULL, 1, NULL, 0)
INSERT [dbo].[tbServicios] ([IdServicios], [IdTipoServicio], [Imagenes], [Titulo], [Descripcion], [FechaServicio], [IdVehiculo], [MillajeVehiculo], [ProximoMillaje], [CostoTotal], [Marca], [IdTipoMantenimiento], [ProximaFechaMantenimiento], [EsRecurrente], [IdUbicacionEnAutomovil], [PrecioManoObra], [Confirmado], [Viaticos], [ManoObraPersonal]) VALUES (92, 2, NULL, N'Cambio de aceite', NULL, CAST(N'2025-01-21' AS Date), 2, 1, NULL, NULL, N'qasda', 1, NULL, 0, 1, CAST(1.00 AS Decimal(10, 2)), 0, NULL, 2)
SET IDENTITY_INSERT [dbo].[tbServicios] OFF
GO
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (9, 1207)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (14, 131)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (15, 132)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (21, 142)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (26, 145)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (27, 146)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (28, 147)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (29, 148)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (31, 149)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (33, 150)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (34, 151)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (38, 152)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (40, 153)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (42, 154)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (43, 155)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (44, 156)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (45, 157)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (46, 158)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (50, 161)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (51, 162)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (52, 163)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (53, 164)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (54, 165)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (55, 171)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (56, 172)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (57, 173)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (58, 174)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (62, 178)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (63, 179)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (64, 185)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (65, 186)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (66, 1203)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (67, 1204)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (68, 1205)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (69, 1206)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (70, 1206)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (71, 1207)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (72, 1208)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (76, 1209)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (77, 1210)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (78, 1211)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (79, 1212)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (80, 1213)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (81, 1214)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (82, 1215)
INSERT [dbo].[tbServicios_tbTransacciones] ([IdServicios], [IdTransaccion]) VALUES (92, 1219)
GO
SET IDENTITY_INSERT [dbo].[tbTipoMantenimientos] ON 

INSERT [dbo].[tbTipoMantenimientos] ([IdTipoMantenimiento], [Nombre]) VALUES (1, N'Preventivo')
INSERT [dbo].[tbTipoMantenimientos] ([IdTipoMantenimiento], [Nombre]) VALUES (2, N'Correctivo')
SET IDENTITY_INSERT [dbo].[tbTipoMantenimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbTipoServicios] ON 

INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (1, N'Otros', N'', N'', NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (2, N'Cambio de aceite', N'3000', N'5000', CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (3, N'Reemplazo de líquidos transmisión', N'', N'80000', NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (4, N'Reemplazo de líquidos frenos', NULL, N'35000', NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (5, N'Cambio Filtro Cabina', N'2000', NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (6, N'Cambio Filtro De Motor', N'5000', NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (7, N'Cambio LLantas', N'10000', N'15000', NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (8, N'Cambio Amortiguador', NULL, NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (9, N'Filtro transmision', NULL, NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (10, N'Para Brisas', NULL, NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (11, N'Cambio Coolant', NULL, NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (12, N'Pintura', NULL, NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (13, N'Cuestiones Electricas', NULL, NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (14, N'Cambio Empaques', NULL, NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (15, N'Direccion o ruedas', NULL, NULL, NULL)
INSERT [dbo].[tbTipoServicios] ([IdTipoServicio], [Nombre], [MillajeCambioRecomendado], [KilometrajeCambioRecomendado], [Meses]) VALUES (16, N'Refrigeracion', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbTipoServicios] OFF
GO
SET IDENTITY_INSERT [dbo].[tbTipoTransaccion] ON 

INSERT [dbo].[tbTipoTransaccion] ([IdTipoTransaccion], [Nombre]) VALUES (1, N'CuotaDiaria')
INSERT [dbo].[tbTipoTransaccion] ([IdTipoTransaccion], [Nombre]) VALUES (2, N'Servicio')
SET IDENTITY_INSERT [dbo].[tbTipoTransaccion] OFF
GO
SET IDENTITY_INSERT [dbo].[tbTransacciones] ON 

INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-07' AS Date), CAST(N'2024-02-07' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-07' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (2, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-08' AS Date), CAST(N'2024-02-08' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (3, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-09' AS Date), CAST(N'2024-02-09' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-09' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (4, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-10' AS Date), CAST(N'2024-02-10' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-10' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (5, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-12' AS Date), CAST(N'2024-02-12' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-12' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (6, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-13' AS Date), CAST(N'2024-02-13' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-13' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (7, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-14' AS Date), CAST(N'2024-02-14' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-14' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (8, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-15' AS Date), CAST(N'2024-02-15' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-15' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (9, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-16' AS Date), CAST(N'2024-02-16' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-16' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (10, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-17' AS Date), CAST(N'2024-02-17' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-17' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (11, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-19' AS Date), CAST(N'2024-02-19' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-19' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (12, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-20' AS Date), CAST(N'2024-02-20' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-20' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (13, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-21' AS Date), CAST(N'2024-02-21' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-21' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (14, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-22' AS Date), CAST(N'2024-02-22' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-22' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (15, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-23' AS Date), CAST(N'2024-02-23' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-23' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (16, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-24' AS Date), CAST(N'2024-02-24' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-24' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (17, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-26' AS Date), CAST(N'2024-02-26' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-26' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (18, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-27' AS Date), CAST(N'2024-02-27' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-27' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (19, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-28' AS Date), CAST(N'2024-02-28' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (20, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-02-29' AS Date), CAST(N'2024-02-29' AS Date), 1, NULL, NULL, 1, CAST(N'2024-02-29' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (21, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-01' AS Date), CAST(N'2024-03-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (22, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-02' AS Date), CAST(N'2024-03-02' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-02' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (23, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-04' AS Date), CAST(N'2024-03-04' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (24, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-05' AS Date), CAST(N'2024-03-05' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (25, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-06' AS Date), CAST(N'2024-03-06' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (26, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-07' AS Date), CAST(N'2024-03-07' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-07' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (27, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-08' AS Date), CAST(N'2024-03-08' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (28, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-09' AS Date), CAST(N'2024-03-09' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-09' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (29, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-11' AS Date), CAST(N'2024-03-11' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-11' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (30, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-12' AS Date), CAST(N'2024-03-12' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (31, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-13' AS Date), CAST(N'2024-03-13' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-13' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (32, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-14' AS Date), CAST(N'2024-03-14' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-14' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (33, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-15' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (34, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-16' AS Date), CAST(N'2024-03-16' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (35, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-18' AS Date), CAST(N'2024-03-18' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-18' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (36, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-19' AS Date), CAST(N'2024-03-19' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-19' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (37, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-20' AS Date), CAST(N'2024-03-20' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-20' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (38, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-21' AS Date), CAST(N'2024-03-21' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-21' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (39, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-22' AS Date), CAST(N'2024-03-22' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (40, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-23' AS Date), CAST(N'2024-03-23' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-23' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (41, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-25' AS Date), CAST(N'2024-03-25' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-25' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (42, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-26' AS Date), CAST(N'2024-03-26' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-26' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (43, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-27' AS Date), CAST(N'2024-03-27' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-27' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (44, N'img/servicios/s-l640.jpg', 400, 50, 2, 4, CAST(N'2024-03-28' AS Date), CAST(N'2024-03-28' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-28' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (45, N'img/servicios/s-l640.jpg', 400, -1200, 2, 4, CAST(N'2024-03-29' AS Date), CAST(N'2024-03-29' AS Date), 1, NULL, NULL, 1, CAST(N'2024-03-29' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (46, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-04-24' AS Date), CAST(N'2024-04-24' AS Date), 1, NULL, NULL, 1, CAST(N'2024-04-24' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (47, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-04-25' AS Date), CAST(N'2024-04-25' AS Date), 1, NULL, NULL, 1, CAST(N'2024-04-25' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (48, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-04-26' AS Date), CAST(N'2024-04-26' AS Date), 1, NULL, NULL, 1, CAST(N'2024-04-26' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (49, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-04-27' AS Date), CAST(N'2024-04-27' AS Date), 1, NULL, NULL, 1, CAST(N'2024-04-27' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (50, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-04-29' AS Date), CAST(N'2024-04-29' AS Date), 1, NULL, NULL, 1, CAST(N'2024-04-29' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (51, N'img/servicios/s-l640.jpg', 900, 0, 4, 6, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (52, N'img/servicios/s-l640.jpg', 900, 0, 4, 6, CAST(N'2024-05-02' AS Date), CAST(N'2024-05-02' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-02' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (53, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-05' AS Date), CAST(N'2024-05-05' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (54, N'img/servicios/s-l640.jpg', 900, 0, 4, 6, CAST(N'2024-05-07' AS Date), CAST(N'2024-05-07' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-07' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (55, N'img/servicios/s-l640.jpg', 600, 0, 4, 6, CAST(N'2024-05-11' AS Date), CAST(N'2024-05-11' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-11' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (56, N'img/servicios/s-l640.jpg', 750, 0, 4, 6, CAST(N'2024-05-12' AS Date), CAST(N'2024-05-12' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-12' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (57, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-13' AS Date), CAST(N'2024-05-13' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-13' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (58, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-14' AS Date), CAST(N'2024-05-14' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (59, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-16' AS Date), CAST(N'2024-05-16' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-16' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (60, N'img/servicios/s-l640.jpg', 500, 0, 4, 6, CAST(N'2024-05-17' AS Date), CAST(N'2024-05-17' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-17' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (61, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-19' AS Date), CAST(N'2024-05-19' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-19' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (62, N'img/servicios/s-l640.jpg', 400, 0, 4, 6, CAST(N'2024-05-21' AS Date), CAST(N'2024-05-21' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-21' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (63, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-22' AS Date), CAST(N'2024-05-22' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (64, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-23' AS Date), CAST(N'2024-05-23' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-23' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (65, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-24' AS Date), CAST(N'2024-05-24' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-24' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (66, N'img/servicios/s-l640.jpg', 600, 0, 4, 6, CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-26' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (67, N'img/servicios/s-l640.jpg', 500, 0, 4, 6, CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-27' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (68, N'img/servicios/s-l640.jpg', 500, 0, 4, 6, CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-29' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (69, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-30' AS Date), CAST(N'2024-05-30' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-30' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (70, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-05-31' AS Date), CAST(N'2024-05-31' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-31' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (71, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (72, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-02' AS Date), CAST(N'2024-06-02' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-02' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (73, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-03' AS Date), CAST(N'2024-06-03' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-03' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (74, N'img/servicios/s-l640.jpg', 350, 0, 4, 6, CAST(N'2024-06-05' AS Date), CAST(N'2024-06-05' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (75, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (76, N'img/servicios/s-l640.jpg', 300, 0, 4, 6, CAST(N'2024-06-08' AS Date), CAST(N'2024-06-08' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (77, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-09' AS Date), CAST(N'2024-06-09' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-09' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (78, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-10' AS Date), CAST(N'2024-06-10' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (79, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-12' AS Date), CAST(N'2024-06-12' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-12' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (80, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-13' AS Date), CAST(N'2024-06-13' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (81, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-14' AS Date), CAST(N'2024-06-14' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-14' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (82, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-15' AS Date), CAST(N'2024-06-15' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-15' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (83, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-16' AS Date), CAST(N'2024-06-16' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-16' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (84, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-17' AS Date), CAST(N'2024-06-17' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-17' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (85, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-19' AS Date), CAST(N'2024-06-19' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-19' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (86, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-20' AS Date), CAST(N'2024-06-20' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-20' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (87, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-21' AS Date), CAST(N'2024-06-21' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-21' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (88, N'img/servicios/s-l640.jpg', 450, 0, 4, 3, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (89, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (90, N'img/servicios/s-l640.jpg', 1350, 0, 4, 6, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (91, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-05-30' AS Date), CAST(N'2024-05-30' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-30' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (93, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-05-31' AS Date), CAST(N'2024-05-31' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-31' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (94, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (95, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-03' AS Date), CAST(N'2024-06-03' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-03' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (96, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (97, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-05' AS Date), CAST(N'2024-06-05' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (98, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (99, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-07' AS Date), CAST(N'2024-06-07' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (100, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-08' AS Date), CAST(N'2024-06-08' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-08' AS Date))
GO
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (101, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-10' AS Date), CAST(N'2024-06-10' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (102, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-11' AS Date), CAST(N'2024-06-11' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-11' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (103, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-12' AS Date), CAST(N'2024-06-12' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-12' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (104, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-13' AS Date), CAST(N'2024-06-13' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (105, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-14' AS Date), CAST(N'2024-06-14' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-14' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (106, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-15' AS Date), CAST(N'2024-06-15' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-15' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (107, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-17' AS Date), CAST(N'2024-06-17' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-17' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (108, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-18' AS Date), CAST(N'2024-06-18' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-18' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (109, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-19' AS Date), CAST(N'2024-06-19' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-19' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (110, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-20' AS Date), CAST(N'2024-06-20' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-20' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (111, N'img/servicios/s-l640.jpg', 400, 0, 5, 7, CAST(N'2024-06-21' AS Date), CAST(N'2024-06-21' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-21' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (112, N'img/servicios/s-l640.jpg', 450, 0, 3, 7, CAST(N'2024-05-02' AS Date), CAST(N'2024-05-02' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-02' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (113, N'img/servicios/s-l640.jpg', 450, 0, 3, 7, CAST(N'2024-05-03' AS Date), CAST(N'2024-05-03' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-03' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (114, N'img/servicios/s-l640.jpg', 450, 0, 3, 7, CAST(N'2024-05-04' AS Date), CAST(N'2024-05-04' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (115, N'img/servicios/s-l640.jpg', 450, 0, 3, 7, CAST(N'2024-05-06' AS Date), CAST(N'2024-05-06' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (116, N'img/servicios/s-l640.jpg', 450, 0, 3, 7, CAST(N'2024-05-07' AS Date), CAST(N'2024-05-07' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-07' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (117, N'img/servicios/s-l640.jpg', 450, 0, 3, 7, CAST(N'2024-05-08' AS Date), CAST(N'2024-05-08' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (118, N'img/servicios/s-l640.jpg', 450, 0, 3, 7, CAST(N'2024-05-09' AS Date), CAST(N'2024-05-09' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-09' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (119, N'img/servicios/s-l640.jpg', 400, 50, 3, 9, CAST(N'2024-05-22' AS Date), CAST(N'2024-05-22' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (120, N'img/servicios/s-l640.jpg', 635, 50, 3, 9, CAST(N'2024-05-23' AS Date), CAST(N'2024-05-23' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-23' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (121, N'img/servicios/s-l640.jpg', 900, 50, 3, 9, CAST(N'2024-05-24' AS Date), CAST(N'2024-05-24' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-24' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (122, N'img/servicios/s-l640.jpg', 450, 50, 3, 9, CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date), 1, NULL, NULL, 1, CAST(N'2024-05-29' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (123, N'img/servicios/s-l640.jpg', 500, 0, 3, 10, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (124, N'img/servicios/s-l640.jpg', 850, 0, 3, 10, CAST(N'2024-06-05' AS Date), CAST(N'2024-06-05' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (125, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-06-19' AS Date), CAST(N'2024-06-19' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-19' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (126, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-06-19' AS Date), CAST(N'2024-06-19' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-19' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (127, N'img/servicios/s-l640.jpg', 600, 50, 3, 11, CAST(N'2024-06-19' AS Date), CAST(N'2024-06-19' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-19' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (128, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-06-21' AS Date), CAST(N'2024-06-21' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-21' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (129, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-06-22' AS Date), CAST(N'2024-06-22' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-22' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (130, N'img/servicios/s-l640.jpg', 900, 50, 3, 11, CAST(N'2024-06-23' AS Date), CAST(N'2024-06-23' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-23' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (131, N'img/servicios/s-l640.jpg', -1000, 0, 4, 7, CAST(N'2023-06-21' AS Date), CAST(N'2023-06-21' AS Date), 0, NULL, NULL, 2, CAST(N'2023-06-21' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (132, N'img/servicios/s-l640.jpg', -200, 0, 4, 7, CAST(N'2023-06-21' AS Date), CAST(N'2023-06-21' AS Date), 0, -1000, NULL, 2, CAST(N'2023-06-21' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (134, N'img/servicios/s-l640.jpg', 400, 0, 5, NULL, CAST(N'2024-06-30' AS Date), CAST(N'2024-06-30' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-30' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (135, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-06-30' AS Date), CAST(N'2024-06-30' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-30' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (136, N'img/servicios/s-l640.jpg', 400, 50, 2, 12, CAST(N'2024-07-01' AS Date), CAST(N'2024-07-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (137, N'img/servicios/s-l640.jpg', 400, 50, 4, 12, CAST(N'2024-07-02' AS Date), CAST(N'2024-07-02' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-02' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (138, N'img/servicios/s-l640.jpg', 400, 50, 4, 12, CAST(N'2024-07-03' AS Date), CAST(N'2024-07-03' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (142, N'img/servicios/s-l640.jpg', -150, 0, 2, 1, CAST(N'2024-07-01' AS Date), CAST(N'2024-07-01' AS Date), 0, -150, NULL, 2, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (145, N'img/servicios/s-l640.jpg', -4000, 0, 2, 6, CAST(N'2024-05-04' AS Date), CAST(N'2024-05-04' AS Date), 0, 0, NULL, 2, CAST(N'2024-05-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (146, N'img/servicios/s-l640.jpg', -1680, 0, 2, 1, CAST(N'2024-06-16' AS Date), CAST(N'2024-06-16' AS Date), 0, 0, NULL, 2, CAST(N'2024-06-16' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (147, N'img/servicios/s-l640.jpg', -350, 0, 2, 1, CAST(N'2024-06-16' AS Date), CAST(N'2024-06-16' AS Date), 0, 0, NULL, 2, CAST(N'2024-06-16' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (148, N'img/servicios/s-l640.jpg', -1000, 0, 2, 1, CAST(N'2024-04-05' AS Date), CAST(N'2024-04-05' AS Date), 0, 0, NULL, 2, CAST(N'2024-04-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (149, N'img/servicios/s-l640.jpg', 1100, 0, 2, 6, CAST(N'2024-05-24' AS Date), CAST(N'2024-05-24' AS Date), 0, 0, NULL, 2, CAST(N'2024-05-24' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (150, N'img/servicios/s-l640.jpg', -500, 0, 4, 1, CAST(N'2024-07-05' AS Date), CAST(N'2024-07-05' AS Date), 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (151, N'img/servicios/s-l640.jpg', -100, 0, 4, NULL, CAST(N'2024-05-24' AS Date), CAST(N'2024-05-24' AS Date), 0, 0, NULL, 2, CAST(N'2024-05-24' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (152, N'img/servicios/s-l640.jpg', -860, 0, 3, 3, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-04' AS Date), 0, 0, NULL, 2, CAST(N'2024-01-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (153, N'img/servicios/s-l640.jpg', -1500, 0, 3, 3, CAST(N'2024-02-07' AS Date), CAST(N'2024-02-07' AS Date), 0, 0, NULL, 2, CAST(N'2024-02-07' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (154, N'img/servicios/s-l640.jpg', -1800, 0, 3, 10, CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), 0, 0, NULL, 2, CAST(N'2024-06-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (155, N'img/servicios/s-l640.jpg', -305, 0, 3, 11, CAST(N'2024-05-22' AS Date), CAST(N'2024-05-22' AS Date), 0, 0, NULL, 2, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (156, N'img/servicios/s-l640.jpg', -305, 0, 2, 12, CAST(N'2024-05-22' AS Date), CAST(N'2024-05-22' AS Date), 0, 0, NULL, 2, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (157, N'img/servicios/s-l640.jpg', -2405, 0, 3, 11, CAST(N'2024-05-22' AS Date), CAST(N'2024-05-22' AS Date), 0, 0, NULL, 2, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (158, N'img/servicios/s-l640.jpg', -240, 0, 3, 3, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-04' AS Date), 0, 0, NULL, 2, CAST(N'2024-01-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (159, N'img/servicios/s-l640.jpg', 0, 0, 3, NULL, CAST(N'2024-07-02' AS Date), CAST(N'2024-07-03' AS Date), 0, 450, NULL, 1, CAST(N'2024-07-02' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (160, N'img/servicios/s-l640.jpg', 0, 0, 2, NULL, CAST(N'2024-07-05' AS Date), CAST(N'2024-07-05' AS Date), 0, 450, NULL, 1, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (161, N'img/servicios/s-l640.jpg', -550, 0, 3, 8, CAST(N'2024-05-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-05-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (162, N'img/servicios/s-l640.jpg', -3500, 0, 3, 3, CAST(N'2024-01-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-01-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (163, N'img/servicios/s-l640.jpg', -840, 0, 3, 3, CAST(N'2024-05-04' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-05-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (164, N'img/servicios/s-l640.jpg', -250, 0, 3, 3, CAST(N'2024-04-10' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-04-10' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (165, N'img/servicios/s-l640.jpg', -1300, 0, 3, 3, CAST(N'2024-05-06' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-05-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (166, N'img/servicios/s-l640.jpg', 400, 50, 2, 12, CAST(N'2024-07-02' AS Date), CAST(N'2024-07-02' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-02' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (167, N'img/servicios/s-l640.jpg', 400, 50, 2, 12, CAST(N'2024-07-03' AS Date), CAST(N'2024-07-03' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (168, N'img/servicios/s-l640.jpg', 400, 50, 2, 12, CAST(N'2024-07-04' AS Date), CAST(N'2024-07-04' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (169, N'img/servicios/s-l640.jpg', 400, 50, 2, 12, CAST(N'2024-07-05' AS Date), CAST(N'2024-07-05' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (170, N'img/servicios/s-l640.jpg', 400, 50, 2, 12, CAST(N'2024-07-06' AS Date), CAST(N'2024-07-06' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (171, N'img/servicios/s-l640.jpg', -800, 0, 2, 12, CAST(N'2024-07-01' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (172, N'img/servicios/s-l640.jpg', -3800, 0, 2, 2, CAST(N'2024-05-09' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-05-09' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (173, N'img/servicios/s-l640.jpg', -2000, 0, 5, 7, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (174, N'img/servicios/s-l640.jpg', -1000, 0, 5, 7, CAST(N'2024-06-29' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-06-29' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (178, N'img/servicios/s-l640.jpg', -1, 0, 5, 7, CAST(N'2024-05-08' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-05-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (179, N'img/servicios/s-l640.jpg', -500, 0, 4, 6, CAST(N'2024-06-29' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-06-29' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (180, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-07-01' AS Date), CAST(N'2024-07-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (181, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-07-03' AS Date), CAST(N'2024-07-03' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (182, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-07-04' AS Date), CAST(N'2024-07-04' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (183, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-07-05' AS Date), CAST(N'2024-07-05' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (184, N'img/servicios/s-l640.jpg', 450, 0, 4, 6, CAST(N'2024-07-06' AS Date), CAST(N'2024-07-06' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (185, N'img/servicios/s-l640.jpg', -950, 0, 3, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (186, N'img/servicios/s-l640.jpg', -700, 0, 3, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (187, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-06-24' AS Date), CAST(N'2024-06-24' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (188, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-06-25' AS Date), CAST(N'2024-06-25' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-25' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (189, N'img/servicios/s-l640.jpg', 600, 50, 3, 11, CAST(N'2024-06-26' AS Date), CAST(N'2024-06-26' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-26' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (190, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-06-27' AS Date), CAST(N'2024-06-27' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-27' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (191, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-06-28' AS Date), CAST(N'2024-06-28' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-28' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (192, N'img/servicios/s-l640.jpg', 900, 50, 3, 11, CAST(N'2024-06-29' AS Date), CAST(N'2024-06-29' AS Date), 1, NULL, NULL, 1, CAST(N'2024-06-29' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (193, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-07-01' AS Date), CAST(N'2024-07-01' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (194, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-07-02' AS Date), CAST(N'2024-07-02' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-02' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (195, N'img/servicios/s-l640.jpg', 600, 50, 3, 11, CAST(N'2024-07-03' AS Date), CAST(N'2024-07-03' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (196, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-07-04' AS Date), CAST(N'2024-07-04' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (197, N'img/servicios/s-l640.jpg', 400, 50, 3, 11, CAST(N'2024-07-05' AS Date), CAST(N'2024-07-05' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (198, N'img/servicios/s-l640.jpg', 900, 50, 3, 11, CAST(N'2024-07-06' AS Date), CAST(N'2024-07-06' AS Date), 1, NULL, NULL, 1, CAST(N'2024-07-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (199, N'img/servicios/s-l640.jpg', 0, 0, 2, 12, CAST(N'2024-07-08' AS Date), CAST(N'2024-07-08' AS Date), 0, 450, NULL, 1, CAST(N'2024-07-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (204, N'img/servicios/s-l640.jpg', 400, 50, 3, 12, CAST(N'2024-07-08' AS Date), NULL, 0, 450, NULL, 1, CAST(N'2024-07-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (205, N'img/servicios/s-l640.jpg', 450, 0, 4, 12, CAST(N'2024-07-08' AS Date), NULL, 0, 450, NULL, 1, CAST(N'2024-07-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (206, N'img/servicios/s-l640.jpg', 400, 0, 5, NULL, CAST(N'2024-07-08' AS Date), NULL, 0, 400, NULL, 1, CAST(N'2024-07-08' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1200, N'img/servicios/s-l640.jpg', 0, 0, 2, NULL, CAST(N'2024-09-13' AS Date), CAST(N'2024-09-13' AS Date), 0, 450, NULL, 1, CAST(N'2024-09-13' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1201, N'img/servicios/s-l640.jpg', 0, 0, 3, NULL, CAST(N'2024-09-13' AS Date), CAST(N'2024-09-13' AS Date), 0, 450, NULL, 1, CAST(N'2024-09-13' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1202, N'img/servicios/s-l640.jpg', 0, 0, 2, NULL, CAST(N'2024-10-06' AS Date), CAST(N'2024-10-06' AS Date), 0, 450, NULL, 1, CAST(N'2024-10-06' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1203, N'img/servicios/s-l640.jpg', -950, 0, 3, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1204, N'img/servicios/s-l640.jpg', -950, 0, 3, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1205, N'img/servicios/s-l640.jpg', -950, 0, 3, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1206, N'img/servicios/s-l640.jpg', -200, 0, 3, 11, CAST(N'2024-09-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
GO
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1207, N'img/servicios/s-l640.jpg', -500, 0, 3, 11, CAST(N'2024-09-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1208, N'img/servicios/s-l640.jpg', -900, 0, 4, 11, CAST(N'2024-09-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1209, N'img/servicios/s-l640.jpg', -900, 0, 4, 11, CAST(N'2024-09-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1210, N'img/servicios/s-l640.jpg', -950, 0, 4, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1211, N'img/servicios/s-l640.jpg', -950, 0, 4, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1212, N'img/servicios/s-l640.jpg', -200, 0, 4, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1213, N'img/servicios/s-l640.jpg', -850, 0, 4, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1214, N'img/servicios/s-l640.jpg', -950, 0, 4, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1215, N'img/servicios/s-l640.jpg', -500, 0, 4, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1216, N'img/servicios/s-l640.jpg', -950, 0, 3, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1217, N'img/servicios/s-l640.jpg', -950, 0, 3, 11, CAST(N'2024-07-05' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbTransacciones] ([IdTransaccion], [Imagen], [TarifaDiaria], [TarifaAhorro], [IdVehiculo], [IdUsuario], [FechaTransaccion], [FechaTransaccionHasta], [Confirmada], [UltimaSuma], [Comentario], [IdTipoTransaccion], [FechaCreacion]) VALUES (1219, NULL, NULL, 0, 2, 12, CAST(N'2025-01-21' AS Date), NULL, 0, 0, NULL, 2, CAST(N'2025-01-21' AS Date))
SET IDENTITY_INSERT [dbo].[tbTransacciones] OFF
GO
SET IDENTITY_INSERT [dbo].[tbUbicacionEnAutomovil] ON 

INSERT [dbo].[tbUbicacionEnAutomovil] ([IdUbicacionEnAutomovil], [Ubicacion]) VALUES (1, N'No exacta')
INSERT [dbo].[tbUbicacionEnAutomovil] ([IdUbicacionEnAutomovil], [Ubicacion]) VALUES (2, N'frontal izquierda')
INSERT [dbo].[tbUbicacionEnAutomovil] ([IdUbicacionEnAutomovil], [Ubicacion]) VALUES (3, N'frontal derecha')
INSERT [dbo].[tbUbicacionEnAutomovil] ([IdUbicacionEnAutomovil], [Ubicacion]) VALUES (4, N'izquierda trasera')
INSERT [dbo].[tbUbicacionEnAutomovil] ([IdUbicacionEnAutomovil], [Ubicacion]) VALUES (5, N'derecha trasera')
INSERT [dbo].[tbUbicacionEnAutomovil] ([IdUbicacionEnAutomovil], [Ubicacion]) VALUES (6, N'Frontal')
INSERT [dbo].[tbUbicacionEnAutomovil] ([IdUbicacionEnAutomovil], [Ubicacion]) VALUES (7, N'Atras')
SET IDENTITY_INSERT [dbo].[tbUbicacionEnAutomovil] OFF
GO
SET IDENTITY_INSERT [dbo].[tbVehiculo] ON 

INSERT [dbo].[tbVehiculo] ([IdVehiculo], [Marca], [Modelo], [Color], [Anio], [VIN], [Placa], [Kilometraje], [Millaje], [MillajeActual], [TarifaDiaria], [TarifaAhorro], [TipoAceite], [IdPropietario], [IdConductor], [Inhabilitado], [Imagen]) VALUES (2, N'hyundai', N'elantra', N'rojo', 2010, NULL, N'HBQ7340', 1, 130000, 132000, 400, 50, NULL, 1, 12, 0, N'IMG-20241217-WA0003.jpg')
INSERT [dbo].[tbVehiculo] ([IdVehiculo], [Marca], [Modelo], [Color], [Anio], [VIN], [Placa], [Kilometraje], [Millaje], [MillajeActual], [TarifaDiaria], [TarifaAhorro], [TipoAceite], [IdPropietario], [IdConductor], [Inhabilitado], [Imagen]) VALUES (3, N'hyundai', N'elantra', N'plata', 2010, NULL, N'HAZ5311', 1, 143000, NULL, 400, 50, NULL, 3, 11, 0, N'IMG-20241217-WA0002.jpg')
INSERT [dbo].[tbVehiculo] ([IdVehiculo], [Marca], [Modelo], [Color], [Anio], [VIN], [Placa], [Kilometraje], [Millaje], [MillajeActual], [TarifaDiaria], [TarifaAhorro], [TipoAceite], [IdPropietario], [IdConductor], [Inhabilitado], [Imagen]) VALUES (4, N'hyundai', N'elantra', N'Verde', 2010, NULL, N'HAR8954', 1, 92000, NULL, 450, 0, NULL, 2, 6, 0, N'IMG-20241217-WA0004.jpg')
INSERT [dbo].[tbVehiculo] ([IdVehiculo], [Marca], [Modelo], [Color], [Anio], [VIN], [Placa], [Kilometraje], [Millaje], [MillajeActual], [TarifaDiaria], [TarifaAhorro], [TipoAceite], [IdPropietario], [IdConductor], [Inhabilitado], [Imagen]) VALUES (5, N'hyundai', N'elantra', N'plata', 2013, NULL, N'HAW4255', 1, 97000, 124453, 400, 0, NULL, 2, 7, 0, N'IMG-20241217-WA0001.jpg')
SET IDENTITY_INSERT [dbo].[tbVehiculo] OFF
GO
SET IDENTITY_INSERT [seguridad].[tbRol] ON 

INSERT [seguridad].[tbRol] ([IdRol], [Nombre], [UsarCodigoMensaje]) VALUES (1, N'propietario', NULL)
INSERT [seguridad].[tbRol] ([IdRol], [Nombre], [UsarCodigoMensaje]) VALUES (2, N'conductor', NULL)
SET IDENTITY_INSERT [seguridad].[tbRol] OFF
GO
SET IDENTITY_INSERT [seguridad].[tbUsuarios] ON 

INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (1, N'img\profile\profile-1.jpeg', 1, N'jonna', N'admin', N'Jonatan abimelec fajardo hernandez', N'', N'747763151', N'Administrador', N'jonatan.fajardo@example.com', N'+504 9694-236789', N'San Pedro Sula, Cortés', 1)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (2, N'img\profile\profile-2.jpeg', 1, N'isaac', N'admin', N'isaac elimelec', NULL, NULL, N'Administrador', N'isaac.elimelec@example.com', N'+504 9572-879034', N'San Pedro Sula, Cortés', 1)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (3, N'img\profile\profile-3.jpeg', 1, N'nayeli', N'user', N'nayeli nicolle guillen ramirez', NULL, NULL, N'Administrador', N'nayeli.guillen@example.com', N'+504 9983-458791', N'San Pedro Sula, Cortés', 1)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (4, N'img\profile\profile-4.jpeg', 2, N'carlos', N'user', N'Carlos', NULL, NULL, N'Conductor', N'carlos@example.com
', N'+504 9552-345678', N'San Pedro Sula, Cortés', 0)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (6, N'img\profile\profile-5.jpeg', 2, N'eduardo', N'user', N'Jonatan Eduardo', NULL, NULL, N'Conductor', N'jonatan.eduardo@example.com', N'+504 9743-128901', N'San Pedro Sula, Cortés', 1)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (7, N'img\profile\profile-6.jpeg', 2, N'guardado', N'user', N'Jonatan Guardado Alverto', NULL, NULL, N'Conductor', N'jonatan.guardado@example.com', N'+504 9634-651237', N'San Pedro Sula, Cortés', 1)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (8, N'img\profile\profile-7.jpeg', 2, N'melvin', N'user', N'Melvin', NULL, NULL, N'Conductor', N'melvin@example.com', N'+504 9805-679102', N'San Pedro Sula, Cortés', 0)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (9, N'img\profile\profile-8.jpeg', 2, N'ariel', N'user', N'Ariel', NULL, NULL, N'Conductor', N'ariel@example.com', N'+504 9526-784321', N'San Pedro Sula, Cortés', 0)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (10, N'img\profile\profile-9.jpeg', 2, N'pastor', N'user', N'Pastor', NULL, NULL, N'Conductor', N'pastor@example.com', N'+504 9347-892345', N'San Pedro Sula, Cortés', 0)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (11, N'img\profile\profile-10.jpeg', 2, N'ricardo', N'user', N'Ricardo', NULL, NULL, N'Conductor', N'ricardo@example.com', N'+504 9423-765432', N'San Pedro Sula, Cortés', 1)
INSERT [seguridad].[tbUsuarios] ([IdUsuario], [Imagen], [IdRol], [Usuario], [Password], [Nombre], [Identidad], [Cuenta], [TagMensajeria], [Correo], [Telefono], [Ciudad], [EstaActivo]) VALUES (12, N'img\profile\profile-11.jpeg', 2, N'bryan', N'user', N'Bryan Reynaldo Ruglas', NULL, NULL, N'Conductor', N'bryan.ruglas@example.com', N'+504 9915-432109', N'San Pedro Sula, Cortés', 1)
SET IDENTITY_INSERT [seguridad].[tbUsuarios] OFF
GO
ALTER TABLE [chat].[tbDetail] ADD  CONSTRAINT [DF_tbDetail_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [chat].[tbDetail] ADD  CONSTRAINT [DF_tbDetail_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [chat].[tbGroups] ADD  CONSTRAINT [DF_tbGroups_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [chat].[tbMessage] ADD  CONSTRAINT [DF_tbMessage_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [chat].[tbTagUsuario] ADD  CONSTRAINT [DF_tbTagUsuario_EsEliminado]  DEFAULT ((0)) FOR [EsEliminado]
GO
ALTER TABLE [dbo].[tbHistorialMantenimiento] ADD  CONSTRAINT [DF_tbHistorialMantenimiento_CostoUnitario]  DEFAULT ((0)) FOR [CostoUnitario]
GO
ALTER TABLE [dbo].[tbHistorialMantenimiento] ADD  CONSTRAINT [DF_tbHistorialMantenimiento_CostoTotal]  DEFAULT ((0)) FOR [CostoTotal]
GO
ALTER TABLE [dbo].[tbHistorialMantenimiento] ADD  CONSTRAINT [DF_tbHistorialMantenimiento_CostoManoObra]  DEFAULT ((0)) FOR [CostoManoObra]
GO
ALTER TABLE [dbo].[tbHistorialMantenimiento] ADD  CONSTRAINT [DF_tbHistorialMantenimiento_MiMano]  DEFAULT ((0)) FOR [MiMano]
GO
ALTER TABLE [dbo].[tbServicios] ADD  CONSTRAINT [DF_tbServicios_CostoUnitario]  DEFAULT ((0)) FOR [CostoTotal]
GO
ALTER TABLE [dbo].[tbServicios] ADD  CONSTRAINT [DF_tbServicios_EsRecurrente]  DEFAULT ((0)) FOR [EsRecurrente]
GO
ALTER TABLE [dbo].[tbServicios] ADD  CONSTRAINT [DF_tbServicios_IdUbicacionEnAutomovil]  DEFAULT ((1)) FOR [IdUbicacionEnAutomovil]
GO
ALTER TABLE [dbo].[tbServicios] ADD  CONSTRAINT [DF_tbServicios_Confirmado]  DEFAULT ((0)) FOR [Confirmado]
GO
ALTER TABLE [dbo].[tbServicios] ADD  CONSTRAINT [DF_tbServicios_MiMano]  DEFAULT ((0)) FOR [ManoObraPersonal]
GO
ALTER TABLE [dbo].[tbTransacciones] ADD  CONSTRAINT [DF_tbTransacciones_TarifaDiaria]  DEFAULT ((0)) FOR [TarifaDiaria]
GO
ALTER TABLE [dbo].[tbTransacciones] ADD  CONSTRAINT [DF_tbTransacciones_TarifaAhorro]  DEFAULT ((0)) FOR [TarifaAhorro]
GO
ALTER TABLE [dbo].[tbTransacciones] ADD  CONSTRAINT [DF_tbTransaccion_Confirmada]  DEFAULT ((0)) FOR [Confirmada]
GO
ALTER TABLE [dbo].[tbTransacciones] ADD  CONSTRAINT [DF_tbTransacciones_UltimaSuma]  DEFAULT ((0)) FOR [UltimaSuma]
GO
ALTER TABLE [dbo].[tbVehiculo] ADD  CONSTRAINT [DF_tbVehiculo_Inhabilitado]  DEFAULT ((0)) FOR [Inhabilitado]
GO
ALTER TABLE [seguridad].[tbUsuarios] ADD  CONSTRAINT [DF_tbUsuarios_EstaActivo]  DEFAULT ((1)) FOR [EstaActivo]
GO
ALTER TABLE [chat].[tbDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbDetail_tbMessage] FOREIGN KEY([IdMessage])
REFERENCES [chat].[tbMessage] ([IdMessage])
GO
ALTER TABLE [chat].[tbDetail] CHECK CONSTRAINT [FK_tbDetail_tbMessage]
GO
ALTER TABLE [chat].[tbDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbDetail_tbUsuarios] FOREIGN KEY([SenderId])
REFERENCES [seguridad].[tbUsuarios] ([IdUsuario])
GO
ALTER TABLE [chat].[tbDetail] CHECK CONSTRAINT [FK_tbDetail_tbUsuarios]
GO
ALTER TABLE [chat].[tbDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbDetail_tbUsuarios1] FOREIGN KEY([ReceiverId])
REFERENCES [seguridad].[tbUsuarios] ([IdUsuario])
GO
ALTER TABLE [chat].[tbDetail] CHECK CONSTRAINT [FK_tbDetail_tbUsuarios1]
GO
ALTER TABLE [dbo].[tbServicios]  WITH CHECK ADD  CONSTRAINT [FK_tbServicios_tbInformacionVehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[tbVehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[tbServicios] CHECK CONSTRAINT [FK_tbServicios_tbInformacionVehiculo]
GO
ALTER TABLE [dbo].[tbServicios]  WITH CHECK ADD  CONSTRAINT [FK_tbServicios_tbTipoMantenimientos] FOREIGN KEY([IdTipoMantenimiento])
REFERENCES [dbo].[tbTipoMantenimientos] ([IdTipoMantenimiento])
GO
ALTER TABLE [dbo].[tbServicios] CHECK CONSTRAINT [FK_tbServicios_tbTipoMantenimientos]
GO
ALTER TABLE [dbo].[tbServicios]  WITH CHECK ADD  CONSTRAINT [FK_tbServicios_tbTipoServicio] FOREIGN KEY([IdTipoServicio])
REFERENCES [dbo].[tbTipoServicios] ([IdTipoServicio])
GO
ALTER TABLE [dbo].[tbServicios] CHECK CONSTRAINT [FK_tbServicios_tbTipoServicio]
GO
ALTER TABLE [dbo].[tbServicios_tbTransacciones]  WITH CHECK ADD  CONSTRAINT [FK__tbTipoSer__IdSer__76969D2E] FOREIGN KEY([IdServicios])
REFERENCES [dbo].[tbServicios] ([IdServicios])
GO
ALTER TABLE [dbo].[tbServicios_tbTransacciones] CHECK CONSTRAINT [FK__tbTipoSer__IdSer__76969D2E]
GO
ALTER TABLE [dbo].[tbServicios_tbTransacciones]  WITH CHECK ADD  CONSTRAINT [FK__tbTipoSer__IdTra__778AC167] FOREIGN KEY([IdTransaccion])
REFERENCES [dbo].[tbTransacciones] ([IdTransaccion])
GO
ALTER TABLE [dbo].[tbServicios_tbTransacciones] CHECK CONSTRAINT [FK__tbTipoSer__IdTra__778AC167]
GO
ALTER TABLE [dbo].[tbVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_tbVehiculo_tbUsuarios] FOREIGN KEY([IdConductor])
REFERENCES [seguridad].[tbUsuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[tbVehiculo] CHECK CONSTRAINT [FK_tbVehiculo_tbUsuarios]
GO
ALTER TABLE [seguridad].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbRol] FOREIGN KEY([IdRol])
REFERENCES [seguridad].[tbRol] ([IdRol])
GO
ALTER TABLE [seguridad].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbRol]
GO
/****** Object:  StoredProcedure [dbo].[CierreDiario]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CierreDiario] 
AS
BEGIN
-- Insertar una nueva transacción para cada vehículo habilitado que no tenga una transacción para el día actual

INSERT INTO tbTransacciones ( TarifaDiaria, TarifaAhorro, IdVehiculo, IdUsuario, FechaTransaccion, Confirmada, UltimaSuma, IdTipoTransaccion, FechaCreacion)
SELECT 
    0, 
    0, 
    v.IdVehiculo,
	(SELECT TOP 1 IdUsuario 
            FROM tbTransacciones t 
            WHERE t.IdVehiculo = v.IdVehiculo),
    GETDATE(), 
    0, 
    ISNULL((SELECT TOP 1 UltimaSuma 
            FROM tbTransacciones t 
            WHERE t.IdVehiculo = v.IdVehiculo
            AND CAST(t.FechaTransaccion AS DATE) = CAST(DATEADD(day, -1, GETDATE()) AS DATE)
            ORDER BY t.FechaTransaccion DESC), 0) + (v.TarifaDiaria + v.TarifaAhorro),
	1,
	GETDATE()
FROM 
    tbvehiculo v
WHERE 
    v.Inhabilitado = 0
    AND NOT EXISTS (
        SELECT 1
        FROM tbTransacciones t
        WHERE t.IdVehiculo = v.IdVehiculo
        AND CAST(t.FechaTransaccion AS DATE) = CAST(GETDATE() AS DATE)
    );

END
GO
/****** Object:  StoredProcedure [dbo].[ConfirmarTransaccion]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ConfirmarTransaccion]
as begin

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @IdTransaccion INT = '';

    -- Verificar si la transacción existe y no ha sido confirmada
    IF EXISTS (SELECT 1 FROM tbTransacciones WHERE IdTransaccion = @IdTransaccion AND Confirmada = 0)
    BEGIN
        -- Actualizar el estado de la transacción a confirmada
        UPDATE tbTransacciones
        SET Confirmada = 1
        WHERE IdTransaccion = @IdTransaccion;

        COMMIT TRANSACTION;
        PRINT 'La transacción ha sido confirmada exitosamente.';
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'La transacción no existe o ya ha sido confirmada previamente.';
    END
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Se produjo un error al intentar confirmar la transacción.';
END CATCH;
end
GO
/****** Object:  StoredProcedure [dbo].[InsertarDatosTransaccion]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarDatosTransaccion]
    @Imagen VARCHAR(4000),
    @TarifaDiaria INT,
    @TarifaAhorro INT,
    @IdVehiculo INT,
    @IdUsuario INT,
    --@FechaTransaccion DATE,
    @UltimaSuma INT
AS
BEGIN
    INSERT INTO tbTransacciones(Imagen, TarifaDiaria, TarifaAhorro, IdVehiculo, IdUsuario, FechaTransaccion, Confirmada, UltimaSuma)
    VALUES (@Imagen, @TarifaDiaria, @TarifaAhorro, @IdVehiculo, @IdUsuario, GETDATE(), 0, @UltimaSuma);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarUnServicios]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarUnServicios]
    @IdTipoServicio INT,
    @Imagenes NVARCHAR(4000),
    @Titulo NVARCHAR(250),
    @Descripcion NVARCHAR(550),
    @FechaServicio DATE,
    --@CantidadComprada INT,
    --@CostoUnitario DECIMAL(10, 2),
    @CostoTotal DECIMAL(10, 2),
    @Marca NVARCHAR(250),
    @IdTipoMantenimiento INT,
    --@KilometrajeVehiculo INT,
    @MillajeVehiculo INT,
    @ProximaFechaMantenimiento DATE,
    @IdVehiculo INT,
    @IdUsuario INT,
    @EsRecurrente BIT,
    --@ProximoKilometraje BIGINT,
    @ProximoMillaje BIGINT,
    @IdUbicacionEnAutomovil INT,
    @PrecioManoObra DECIMAL(10, 2),
    @Confirmado BIT,
    @Viaticos NVARCHAR(250),
    @ManoObraPersonal int
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Iniciar una transacción
        BEGIN TRANSACTION;

        DECLARE @IdServicios INT;
        DECLARE @IdTransaccion INT;

        -- Insertar en tbServicios
        INSERT INTO tbServicios (
            IdTipoServicio, Imagenes, Titulo, Descripcion, FechaServicio, 
            CostoTotal, Marca, IdTipoMantenimiento, 
            MillajeVehiculo, ProximaFechaMantenimiento, IdVehiculo, 
            EsRecurrente, ProximoMillaje, IdUbicacionEnAutomovil, 
            PrecioManoObra, Confirmado, Viaticos, ManoObraPersonal
        ) VALUES (
            @IdTipoServicio, @Imagenes, @Titulo, @Descripcion, @FechaServicio, 
            @CostoTotal, @Marca, @IdTipoMantenimiento, 
            @MillajeVehiculo, @ProximaFechaMantenimiento, @IdVehiculo, 
            @EsRecurrente, @ProximoMillaje, @IdUbicacionEnAutomovil, 
            @PrecioManoObra, @Confirmado, @Viaticos, @ManoObraPersonal
        );

        -- Obtener el IdServicios recién insertado
        SET @IdServicios = SCOPE_IDENTITY();

        -- Insertar en tbTransacciones
        INSERT INTO tbTransacciones (
            Imagen, TarifaDiaria, TarifaAhorro, IdVehiculo, IdUsuario,
            FechaTransaccion, Confirmada, UltimaSuma, IdTipoTransaccion, FechaCreacion
        ) VALUES (
            @Imagenes, @CostoTotal * -1, 0, @IdVehiculo, @IdUsuario, @FechaServicio, 0, 0, 2, GETDATE()
        );

        -- Obtener el IdTransaccion recién insertado
        SET @IdTransaccion = SCOPE_IDENTITY();

        -- Insertar en tbTipoServicios_tbTransacciones
        INSERT INTO tbServicios_tbTransacciones (IdServicios, IdTransaccion)
        VALUES (@IdServicios, @IdTransaccion);

        -- Confirmar la transacción
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, deshacer la transacción
        ROLLBACK TRANSACTION;

        -- Rethrow la excepción
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerServicios]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerServicios]
AS
BEGIN
    SELECT 
        s.IdServicios,
        s.IdTipoServicio,
        ts.Nombre AS TipoServicio,
        s.Imagenes,
        s.Titulo,
        s.Descripcion,
        s.FechaServicio,
        s.CostoTotal,
        s.Marca,
        s.IdTipoMantenimiento,
		tm.Nombre,
        s.MillajeVehiculo,
        s.ProximaFechaMantenimiento,
        s.IdVehiculo,
        v.Marca AS VehiculoMarca,
        v.Modelo AS VehiculoModelo,
        v.Anio AS VehiculoAnio,
        s.EsRecurrente,
        s.ProximoMillaje,
        s.IdUbicacionEnAutomovil,
        ua.Ubicacion AS UbicacionEnAutomovil,
        s.PrecioManoObra,
        s.Confirmado,
        s.Viaticos,
        s.ManoObraPersonal
    FROM 
        tbServicios s
    INNER JOIN 
        tbTipoServicios ts ON s.IdTipoServicio = ts.IdTipoServicio
    INNER JOIN 
        tbVehiculo v ON s.IdVehiculo = v.IdVehiculo
    INNER JOIN 
        tbUbicacionEnAutomovil ua ON s.IdUbicacionEnAutomovil = ua.IdUbicacionEnAutomovil
	INNER JOIN 
		tbTipoMantenimientos tm ON s.IdTipoMantenimiento = tm.IdTipoMantenimiento;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerServiciosPorVehiculo]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerServiciosPorVehiculo]
 @IdVehiculo int
AS
BEGIN
    SELECT 
        s.IdServicios,
        s.IdTipoServicio,
        ts.Nombre AS TipoServicio,
        s.Imagenes,
        s.Titulo,
        s.Descripcion,
        s.FechaServicio,
        s.CostoTotal,
        s.Marca,
        s.IdTipoMantenimiento,
		tm.Nombre AS TipoMantenimiento,
        s.MillajeVehiculo,
        s.ProximaFechaMantenimiento,
        s.IdVehiculo,
        v.Marca AS VehiculoMarca,
        v.Modelo AS VehiculoModelo,
        v.Anio AS VehiculoAnio,
        s.EsRecurrente,
        s.ProximoMillaje,
        s.IdUbicacionEnAutomovil,
        ua.Ubicacion AS UbicacionEnAutomovil,
        s.PrecioManoObra,
        s.Confirmado,
        s.Viaticos,
        s.ManoObraPersonal
    FROM 
        tbServicios s
    INNER JOIN 
        tbTipoServicios ts ON s.IdTipoServicio = ts.IdTipoServicio
    INNER JOIN 
        tbVehiculo v ON s.IdVehiculo = v.IdVehiculo
    INNER JOIN 
        tbUbicacionEnAutomovil ua ON s.IdUbicacionEnAutomovil = ua.IdUbicacionEnAutomovil
	INNER JOIN 
		tbTipoMantenimientos tm ON s.IdTipoMantenimiento = tm.IdTipoMantenimiento
	WHERE 
		@IdVehiculo = s.IdVehiculo
	ORDER BY 
        s.FechaServicio DESC
END;


GO
/****** Object:  StoredProcedure [dbo].[ObtenerServiciosProximoCambio]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ObtenerServiciosProximoCambio]
as
begin


SELECT 
    Titulo, 
    vehiculo.MillajeActual, 
    ProximoMillaje,
    (ProximoMillaje - vehiculo.MillajeActual) AS DiferenciaMillas
FROM 
    tbServicios as servicio
	INNER JOIN tbVehiculo vehiculo
	ON servicio.IdVehiculo = vehiculo.IdVehiculo
ORDER BY 
    DiferenciaMillas ASC;


	end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTransacciones]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTransacciones]
AS
BEGIN
    SELECT 
        t.Imagen,
        t.UltimaSuma,
		v.IdVehiculo,
		v.Anio,
		v.Placa,
        u.Nombre,
		u.Imagen as ImagenUsuario,
        t.TarifaDiaria,
        t.TarifaAhorro,
        t.FechaTransaccion,
        t.Comentario,
		t.IdTipoTransaccion,
		tt.Nombre as NombreTipoTransaccion,
		t.Confirmada,
		t.FechaCreacion
    FROM 
        tbTransacciones t
    INNER JOIN 
        tbVehiculo v ON t.IdVehiculo = v.IdVehiculo
    INNER JOIN 
        seguridad.tbUsuarios u ON t.IdUsuario = u.IdUsuario
	INNER JOIN
		tbTipoTransaccion tt ON t.IdTipoTransaccion = tt.IdTipoTransaccion
    ORDER BY 
        t.FechaTransaccion DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTransaccionesPorVehiculo]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerTransaccionesPorVehiculo]
 @IdVehiculo INT
AS
BEGIN
    SELECT 
        t.Imagen,
        t.UltimaSuma,
        u.Nombre Conductor,
        t.TarifaDiaria,
        t.TarifaAhorro,
        t.FechaTransaccion,
        t.FechaTransaccionHasta,
        t.Comentario
    FROM 
        tbTransacciones t
    INNER JOIN 
        tbVehiculo v ON t.IdVehiculo = v.IdVehiculo
    INNER JOIN 
        seguridad.tbUsuarios u ON t.IdUsuario = u.IdUsuario
	WHERE 
		v.IdVehiculo = @IdVehiculo
    ORDER BY 
        t.FechaTransaccion DESC
	
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVehiculoInformacionDashboard]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVehiculoInformacionDashboard]
AS
BEGIN
    -- CTE para Aceite
    WITH CTE_Aceite AS (
        SELECT 
            s.IdVehiculo,
            v.Imagen,
            v.Placa,
			v.Anio,
			v.Marca,
            s.Marca AS MarcaAceite,
            s.FechaServicio,
            MAX(((ts.MillajeCambioRecomendado - (s.ProximoMillaje - v.Millaje)) * 100 / ts.MillajeCambioRecomendado)) AS PorcentajeDesgasteAceite,
            MAX(s.FechaServicio) OVER (PARTITION BY s.IdVehiculo) AS MaxFechaServicio
        FROM tbServicios s
        INNER JOIN [tbServicios_tbTransacciones] st ON st.IdServicios = s.IdServicios
        INNER JOIN tbTransacciones t ON t.IdTransaccion = st.IdTransaccion
        INNER JOIN tbVehiculo v ON v.IdVehiculo = s.IdVehiculo
        INNER JOIN tbTipoServicios ts ON s.IdTipoServicio = ts.IdTipoServicio
        WHERE s.IdTipoServicio = 2
        GROUP BY s.IdVehiculo, v.Imagen, v.Placa, v.Marca, v.Anio, s.Marca, s.FechaServicio
    ),
    CTE_Llantas AS (
        SELECT 
            s.IdVehiculo,
            s.FechaServicio,
            MAX(CASE WHEN s.IdUbicacionEnAutomovil = 2 THEN 
                ((ts.MillajeCambioRecomendado - (s.ProximoMillaje - v.Millaje)) * 100 / ts.MillajeCambioRecomendado) 
            END) AS PorcentajeDesgasteLlanta1,
            MAX(CASE WHEN s.IdUbicacionEnAutomovil = 3 THEN 
                ((ts.MillajeCambioRecomendado - (s.ProximoMillaje - v.Millaje)) * 100 / ts.MillajeCambioRecomendado) 
            END) AS PorcentajeDesgasteLlanta2,
            MAX(CASE WHEN s.IdUbicacionEnAutomovil = 4 THEN 
                ((ts.MillajeCambioRecomendado - (s.ProximoMillaje - v.Millaje)) * 100 / ts.MillajeCambioRecomendado) 
            END) AS PorcentajeDesgasteLlanta3,
            MAX(CASE WHEN s.IdUbicacionEnAutomovil = 5 THEN 
                ((ts.MillajeCambioRecomendado - (s.ProximoMillaje - v.Millaje)) * 100 / ts.MillajeCambioRecomendado) 
            END) AS PorcentajeDesgasteLlanta4,
            MAX(s.FechaServicio) OVER (PARTITION BY s.IdVehiculo) AS MaxFechaServicio
        FROM tbServicios s
        INNER JOIN [tbServicios_tbTransacciones] st ON st.IdServicios = s.IdServicios
        INNER JOIN tbTransacciones t ON t.IdTransaccion = st.IdTransaccion
        INNER JOIN tbVehiculo v ON v.IdVehiculo = s.IdVehiculo
        INNER JOIN tbTipoServicios ts ON s.IdTipoServicio = ts.IdTipoServicio
        WHERE s.IdTipoServicio = 7
        GROUP BY s.IdVehiculo, s.FechaServicio
    ),
    CTE_FiltroMotor AS (
        SELECT 
            s.IdVehiculo,
            s.FechaServicio,
            MAX(((ts.MillajeCambioRecomendado - (s.ProximoMillaje - v.Millaje)) * 100 / ts.MillajeCambioRecomendado)) AS PorcentajeDesgasteFiltroMotor,
            MAX(s.FechaServicio) OVER (PARTITION BY s.IdVehiculo) AS MaxFechaServicio
        FROM tbServicios s
        INNER JOIN [tbServicios_tbTransacciones] st ON st.IdServicios = s.IdServicios
        INNER JOIN tbTransacciones t ON t.IdTransaccion = st.IdTransaccion
        INNER JOIN tbVehiculo v ON v.IdVehiculo = s.IdVehiculo
        INNER JOIN tbTipoServicios ts ON s.IdTipoServicio = ts.IdTipoServicio
        WHERE s.IdTipoServicio = 6
        GROUP BY s.IdVehiculo, s.FechaServicio
    ),
    CTE_FiltroMotorCabina AS (
        SELECT 
            s.IdVehiculo,
            s.FechaServicio,
            MAX(((ts.MillajeCambioRecomendado - (s.ProximoMillaje - v.Millaje)) * 100 / ts.MillajeCambioRecomendado)) AS PorcentajeDesgasteFiltroCabina,
            MAX(s.FechaServicio) OVER (PARTITION BY s.IdVehiculo) AS MaxFechaServicio
        FROM tbServicios s
        INNER JOIN [tbServicios_tbTransacciones] st ON st.IdServicios = s.IdServicios
        INNER JOIN tbTransacciones t ON t.IdTransaccion = st.IdTransaccion
        INNER JOIN tbVehiculo v ON v.IdVehiculo = s.IdVehiculo
        INNER JOIN tbTipoServicios ts ON s.IdTipoServicio = ts.IdTipoServicio
        WHERE s.IdTipoServicio = 5
        GROUP BY s.IdVehiculo, s.FechaServicio
    )
    SELECT 
        a.IdVehiculo,
        a.Imagen,
        a.Placa,
        a.Marca,
		a.Anio,
		a.MarcaAceite,
        a.PorcentajeDesgasteAceite,
        l.PorcentajeDesgasteLlanta1,
        l.PorcentajeDesgasteLlanta2,
        l.PorcentajeDesgasteLlanta3,
        l.PorcentajeDesgasteLlanta4,
        f.PorcentajeDesgasteFiltroMotor,
        c.PorcentajeDesgasteFiltroCabina
    FROM CTE_Aceite a
    LEFT JOIN CTE_Llantas l ON l.IdVehiculo = a.IdVehiculo AND l.MaxFechaServicio = l.FechaServicio
    LEFT JOIN CTE_FiltroMotor f ON f.IdVehiculo = a.IdVehiculo AND f.MaxFechaServicio = f.FechaServicio
    LEFT JOIN CTE_FiltroMotorCabina c ON c.IdVehiculo = a.IdVehiculo AND c.MaxFechaServicio = c.FechaServicio
    WHERE a.MaxFechaServicio = a.FechaServicio
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVehiculos]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVehiculos]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT IdVehiculo, v.Imagen, Marca, Modelo, Anio, VIN, Placa, Kilometraje, Millaje, Color, TarifaDiaria, TarifaAhorro, 
	 usuario.Nombre as Propietario, IdConductor, usuario2.Nombre
    FROM tbVehiculo as v
	INNER JOIN seguridad.tbUsuarios usuario
	ON usuario.IdUsuario = v.IdPropietario
	INNER JOIN seguridad.tbUsuarios usuario2
	ON usuario2.IdUsuario = v.IdConductor
	;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVehiculosSinExistenciaHoy]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVehiculosSinExistenciaHoy]
AS
BEGIN
    DECLARE @FechaActual DATE = GETDATE();
    
    -- Consulta para encontrar vehículos sin existencia para el día actual
    SELECT IdVehiculo, us.Imagen, Anio, Placa, TarifaDiaria, TarifaAhorro, us.Nombre
    FROM tbVehiculo
	Inner Join seguridad.tbUsuarios us on
	tbVehiculo.IdConductor = us.IdUsuario
    WHERE IdVehiculo NOT IN (
        SELECT DISTINCT IdVehiculo
        FROM tbTransacciones
        WHERE FechaTransaccion = @FechaActual
    );
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Chat_ObtenerMensajesUsuario]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Chat_ObtenerMensajesUsuario]
@IdUsuarioOne int,
@IdUsuariotwo int
as 
begin

	SELECT
    [IdDetail],
    [SenderId],
    [ReceiverId],
    [GroupId],
    [Timestamp],
    msj.[IdMessage],
    msj.Description,
    msj.IsRead,
    msj.Time
FROM
    chat.tbDetail AS dt
INNER JOIN
    chat.tbMessage AS msj ON dt.IdMessage = msj.IdMessage
WHERE
    dt.SenderId = @IdUsuarioOne AND dt.ReceiverId = @IdUsuariotwo

UNION ALL

SELECT
    [IdDetail],
    [SenderId],
    [ReceiverId],
    [GroupId],
    [Timestamp],
    msj.[IdMessage],
    msj.Description,
    msj.IsRead,
    msj.Time
FROM
    chat.tbDetail AS dt
INNER JOIN
    chat.tbMessage AS msj ON dt.IdMessage = msj.IdMessage
WHERE
    dt.SenderId = @IdUsuariotwo AND dt.ReceiverId = @IdUsuarioOne

ORDER BY
    msj.Time DESC;
	
end
GO
/****** Object:  StoredProcedure [dbo].[PR_Chat_ObtenerUltimoMensajePorUsuario]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CREATE PROCEDURE PR_Chat_ObtenerUltimosMensajesPorUsuario
CREATE procedure [dbo].[PR_Chat_ObtenerUltimoMensajePorUsuario]  
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener los últimos mensajes de cada usuario que ha hablado con el usuario dado
    WITH UltimosMensajes AS (
        SELECT
            d.ReceiverId AS OtroUsuario,
            ROW_NUMBER() OVER (PARTITION BY d.ReceiverId ORDER BY d.Timestamp DESC) AS Fila,
            us.IdUsuario,
            us.Imagen,
            us.Usuario,
            us.Nombre,
			us.TagMensajeria,
			us.Correo,
			us.Telefono,
			us.Ciudad,
            d.IdDetail,
            d.SenderId,
            d.ReceiverId,
            d.GroupId,
            d.Timestamp,
            m.IdMessage,
            m.Description,
            m.IsRead,
            m.Time
        FROM
            chat.tbDetail d
        JOIN
            chat.tbMessage m ON d.IdMessage = m.IdMessage
        JOIN
            seguridad.tbUsuarios us ON us.IdUsuario = d.ReceiverId
        WHERE
            d.SenderId = @UserId OR d.ReceiverId = @UserId
    )
    SELECT
        IdUsuario,
        Imagen,
        Usuario,
        Nombre,
		TagMensajeria,
		Correo,
		Telefono,
		Ciudad,
        IdDetail,
        SenderId,
        ReceiverId,
        GroupId,
        Timestamp,
        IdMessage,
        Description,
        IsRead,
        Time
    FROM
        UltimosMensajes
    WHERE
        Fila = 1
    ORDER BY
        Timestamp DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[PR_InsertMessageWithDetail]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_InsertMessageWithDetail]
    @Description NVARCHAR(650),
    @IsRead BIT,
    @SenderId INT,
    @ReceiverId INT,
    @GroupId INT,
    @Time DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewMessageId INT;

    -- Inserción en tbMessage
    INSERT INTO chat.tbMessage (Description, IsRead, Time)
    VALUES (@Description, @IsRead, @Time);

    -- Obtener el ID del mensaje recién insertado
    SET @NewMessageId = SCOPE_IDENTITY();

    -- Inserción en tbDetail
    INSERT INTO chat.tbDetail (SenderId, ReceiverId, GroupId, Timestamp, IdMessage, IsRead)
    VALUES (@SenderId, @ReceiverId, @GroupId, @Time, @NewMessageId, @IsRead);

    -- Confirmación
    SELECT @NewMessageId AS IdMessage;
END;
GO
/****** Object:  StoredProcedure [dbo].[PR_VerificandoUsuario]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[PR_VerificandoUsuario]
@usuario varchar(100),
@password varchar(100)
as
begin

SELECT TOP 1 
[IdUsuario], [Imagen], usuario.[IdRol], rol.[nombre] as NombreRol, [Usuario], [Password], usuario.[Nombre], [Identidad], [Cuenta], [EstaActivo]
FROM [seguridad].[tbUsuarios] usuario
INNER JOIN [seguridad].[tbRol] rol
ON	usuario.IdRol = rol.IdRol

WHERE usuario.Usuario = @usuario and usuario.Password =@password 

end
GO
/****** Object:  StoredProcedure [dbo].[ResumenTotal]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ResumenTotal]
as
begin
SELECT 
    IdVehiculo,
     SUM(TarifaDiaria) AS IngresosTotales,
    SUM(TarifaAhorro) AS AhorroTotal,
    COUNT(*) AS DiasTrabajados,
	DATEDIFF(day, MIN(FechaTransaccion), MAX(FechaTransaccion)) + 1 AS TotalDias

FROM 
    tbTransacciones
GROUP BY 
    IdVehiculo
ORDER BY 
    IdVehiculo;
end

GO
/****** Object:  StoredProcedure [dbo].[ro-EnRevisionEliminar]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ro-EnRevisionEliminar]
as
begin
SET DATEFIRST 1 
SELECT vehiculo.TarifaDiaria, vehiculo.TarifaAhorro, DiferenciaEnDias * (vehiculo.TarifaDiaria + vehiculo.TarifaAhorro), DiferenciaEnDias  FROM (
	SELECT IdTransaccion, Imagen, TarifaDiaria, TarifaAhorro, IdVehiculo, IdUsuario, FechaTransaccion, Confirmada,
		DATEDIFF(day, 
			CASE 
				WHEN DATENAME(weekday, FechaTransaccion) = 'Sunday' THEN DATEADD(day, -1, FechaTransaccion) 
				ELSE FechaTransaccion 
			END, 
			GETDATE()) - 
		(DATEDIFF(week, 
			CASE 
				WHEN DATENAME(weekday, FechaTransaccion) = 'Sunday' THEN DATEADD(day, -1, FechaTransaccion) 
				ELSE FechaTransaccion 
			END, 
			GETDATE()) * 1) AS DiferenciaEnDias
	FROM tbTransacciones transaccion
	WHERE 
		(DATENAME(weekday, FechaTransaccion) != 'Sunday' OR DATEDIFF(day, FechaTransaccion, GETDATE()) = 0) -- Excluir domingos a menos que sea la transacción de hoy
	) AS Atransaccion
INNER JOIN tbVehiculo vehiculo
ON vehiculo.IdVehiculo = Atransaccion.IdVehiculo
ORDER BY FechaTransaccion DESC

end
GO
/****** Object:  StoredProcedure [dbo].[TransaccionTarifaNoPagada]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransaccionTarifaNoPagada]
    @IdVehiculo INT,
	@FechaTransaccion Date,
	@FechaTransaccionHasta Date = NULL
AS
BEGIN

    -- Verificar si hay una transacción para el vehículo habilitado con el ID proporcionado
    -- Insertar una nueva transacción si no hay ninguna para el día actual
    
    INSERT INTO tbTransacciones (Imagen, TarifaDiaria, TarifaAhorro, IdVehiculo, FechaTransaccion, FechaTransaccionHasta, FechaCreacion, Confirmada, IdTipoTransaccion, UltimaSuma)
    SELECT NULL, 0, 0, @IdVehiculo, @FechaTransaccion, ISNULL(@FechaTransaccionHasta, @FechaTransaccion), GETDATE(), 1, 1, ISNULL((SELECT TOP 1 UltimaSuma 
                                                                  FROM tbTransacciones t 
                                                                  WHERE t.IdVehiculo = @IdVehiculo
                                                                  AND CAST(t.FechaTransaccionHasta AS DATE) = CAST(DATEADD(day, -1, GETDATE()) AS DATE)
                                                                  ORDER BY FechaTransaccionHasta DESC), 0) + (v.TarifaDiaria + v.TarifaAhorro)
    FROM tbvehiculo v
    WHERE v.Inhabilitado = 0
    AND v.IdVehiculo = @IdVehiculo
    AND NOT EXISTS (
        SELECT 1
        FROM tbTransacciones t
        WHERE t.IdVehiculo = @IdVehiculo
        AND CAST(t.FechaTransaccion AS DATE) = CAST(GETDATE() AS DATE)
    );

END
GO
/****** Object:  StoredProcedure [dbo].[TransaccionTarifaNoPagadaDos-EnRevisionEliminar]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[TransaccionTarifaNoPagadaDos-EnRevisionEliminar]
    @IdVehiculo INT,
	@FechaTransaccion Date,
	@FechaTransaccionHasta Date = NULL
AS
BEGIN

    -- Verificar si hay una transacción para el vehículo habilitado con el ID proporcionado
    -- Insertar una nueva transacción si no hay ninguna para el día actual
    
    INSERT INTO tbTransacciones (Imagen, TarifaDiaria, TarifaAhorro, IdVehiculo, FechaTransaccion, FechaTransaccionHasta, FechaCreacion, Confirmada, IdTipoTransaccion, UltimaSuma)
    SELECT NULL, 0, 0, @IdVehiculo, @FechaTransaccion, ISNULL(@FechaTransaccionHasta, @FechaTransaccion), GETDATE(), 0, 1, ISNULL((SELECT TOP 1 UltimaSuma 
                                                                  FROM tbTransacciones t 
                                                                  WHERE t.IdVehiculo = @IdVehiculo
                                                                  AND CAST(t.FechaTransaccionHasta AS DATE) = CAST(DATEADD(day, -1, GETDATE()) AS DATE)
                                                                  ORDER BY FechaTransaccionHasta DESC), 0) + (v.TarifaDiaria + v.TarifaAhorro)
    FROM tbvehiculo v
    WHERE v.Inhabilitado = 0
    AND v.IdVehiculo = @IdVehiculo
    AND NOT EXISTS (
        SELECT 1
        FROM tbTransacciones t
        WHERE t.IdVehiculo = @IdVehiculo
        AND CAST(t.FechaTransaccion AS DATE) = CAST(GETDATE() AS DATE)
    );

END
GO
/****** Object:  StoredProcedure [dbo].[TransaccionTarifaNoPagadaNoConfirmada]    Script Date: 28/01/2025 23:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[TransaccionTarifaNoPagadaNoConfirmada]
    @IdVehiculo INT,
	@FechaTransaccion Date,
	@FechaTransaccionHasta Date = NULL
AS
BEGIN

    -- Verificar si hay una transacción para el vehículo habilitado con el ID proporcionado
    -- Insertar una nueva transacción si no hay ninguna para el día actual
    
    INSERT INTO tbTransacciones (Imagen, TarifaDiaria, TarifaAhorro, IdVehiculo, FechaTransaccion, FechaTransaccionHasta, FechaCreacion, Confirmada, IdTipoTransaccion, UltimaSuma)
    SELECT NULL, 0, 0, @IdVehiculo, @FechaTransaccion, ISNULL(@FechaTransaccionHasta, @FechaTransaccion), GETDATE(), 0, 1, ISNULL((SELECT TOP 1 UltimaSuma 
                                                                  FROM tbTransacciones t 
                                                                  WHERE t.IdVehiculo = @IdVehiculo
                                                                  AND CAST(t.FechaTransaccionHasta AS DATE) = CAST(DATEADD(day, -1, GETDATE()) AS DATE)
                                                                  ORDER BY FechaTransaccionHasta DESC), 0) + (v.TarifaDiaria + v.TarifaAhorro)
    FROM tbvehiculo v
    WHERE v.Inhabilitado = 0
    AND v.IdVehiculo = @IdVehiculo
    AND NOT EXISTS (
        SELECT 1
        FROM tbTransacciones t
        WHERE t.IdVehiculo = @IdVehiculo
        AND CAST(t.FechaTransaccion AS DATE) = CAST(GETDATE() AS DATE)
    );

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del detalle del mensaje.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbDetail', @level2type=N'COLUMN',@level2name=N'IdDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del remitente del mensaje.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbDetail', @level2type=N'COLUMN',@level2name=N'SenderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del destinatario del mensaje.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbDetail', @level2type=N'COLUMN',@level2name=N'ReceiverId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del grupo (si aplica) al que pertenece el mensaje.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbDetail', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha y hora del mensaje.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbDetail', @level2type=N'COLUMN',@level2name=N'Timestamp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del mensaje al que pertenece este detalle.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbDetail', @level2type=N'COLUMN',@level2name=N'IdMessage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el mensaje ha sido leído (1) o no (0).' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbDetail', @level2type=N'COLUMN',@level2name=N'IsRead'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena los detalles de los mensajes entre usuarios o grupos, incluyendo remitente, destinatario, fecha, mensaje y estado de lectura.

' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del mensaje.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbMessage', @level2type=N'COLUMN',@level2name=N'IdMessage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción o contenido del mensaje.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbMessage', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el mensaje ha sido leído (1) o no (0).
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbMessage', @level2type=N'COLUMN',@level2name=N'IsRead'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha y hora del mensaje.' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbMessage', @level2type=N'COLUMN',@level2name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'almacena los mensajes enviados en el sistema.' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbMessage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único de la etiqueta.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbTagUsuario', @level2type=N'COLUMN',@level2name=N'IdTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del usuario que se le asigna la etiqueta.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbTagUsuario', @level2type=N'COLUMN',@level2name=N'IdUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la etiqueta.
' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbTagUsuario', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la etiqueta ha sido eliminada (1) o no (0).' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbTagUsuario', @level2type=N'COLUMN',@level2name=N'EsEliminado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena las etiquetas que los usuarios asignan a elementos, asociadas a un usuario y con estado de eliminación.

' , @level0type=N'SCHEMA',@level0name=N'chat', @level1type=N'TABLE',@level1name=N'tbTagUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registra el historial de mantenimiento de los vehículos, incluyendo fecha, tipo de mantenimiento, vehículo, kilometraje y costo.

' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbHistorialMantenimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'IdServicios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del tipo de servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'IdTipoServicio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rutas de las imágenes relacionadas con el servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'Imagenes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Título o encabezado del servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'Titulo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción detallada del servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se realizó el servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'FechaServicio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del vehículo al que se le realizó el servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'IdVehiculo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Millaje del vehículo al momento del servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'MillajeVehiculo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Millaje recomendado para el próximo servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'ProximoMillaje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Costo total del servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'CostoTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marca del vehículo al que se le realizó el servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'Marca'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del tipo de mantenimiento.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'IdTipoMantenimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha recomendada para el próximo mantenimiento.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'ProximaFechaMantenimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el servicio es recurrente (1) o no (0).
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'EsRecurrente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la ubicación en el automóvil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'IdUbicacionEnAutomovil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio de la mano de obra para el servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'PrecioManoObra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el servicio ha sido confirmado (1) o no (0).
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'Confirmado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Viáticos relacionados con el servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'Viaticos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad monetaria involucrada en la mano de obra.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios', @level2type=N'COLUMN',@level2name=N'ManoObraPersonal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registra los servicios realizados a los vehículos.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios_tbTransacciones', @level2type=N'COLUMN',@level2name=N'IdServicios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la transacción relacionada con el servicio.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios_tbTransacciones', @level2type=N'COLUMN',@level2name=N'IdTransaccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relaciona los servicios realizados con las transacciones en las que se incluyeron.

' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbServicios_tbTransacciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del tipo de mantenimiento.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoMantenimientos', @level2type=N'COLUMN',@level2name=N'IdTipoMantenimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre o descripción del tipo de mantenimiento.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoMantenimientos', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene los diferentes tipos de mantenimiento vehicular.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoMantenimientos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del tipo de servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoServicios', @level2type=N'COLUMN',@level2name=N'IdTipoServicio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre o descripción del tipo de servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoServicios', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Millaje recomendado para realizar el servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoServicios', @level2type=N'COLUMN',@level2name=N'MillajeCambioRecomendado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kilometraje recomendado para realizar el servicio.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoServicios', @level2type=N'COLUMN',@level2name=N'KilometrajeCambioRecomendado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Intervalo en meses recomendado para realizar el servicio.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoServicios', @level2type=N'COLUMN',@level2name=N'Meses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene los diferentes tipos de servicios vehiculares.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoServicios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del tipo de transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoTransaccion', @level2type=N'COLUMN',@level2name=N'IdTipoTransaccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre o descripción del tipo de transacción.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoTransaccion', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene los diferentes tipos de transacciones registradas en el sistema.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTipoTransaccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único de la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'IdTransaccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ruta de la imagen relacionada con la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'Imagen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tarifa diaria aplicada en la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'TarifaDiaria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tarifa con descuento aplicada en la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'TarifaAhorro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del vehículo relacionado con la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'IdVehiculo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del usuario que realizó la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'IdUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de inicio de la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'FechaTransaccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de fin de la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'FechaTransaccionHasta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la transacción ha sido confirmada (1) o no (0).
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'Confirmada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Última suma o total relacionado con la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'UltimaSuma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Comentario o notas sobre la transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'Comentario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del tipo de transacción.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'IdTipoTransaccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del registro de la transacción.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registra las transacciones realizadas en cuotas diarias y servicios.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbTransacciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único de la ubicación en el automóvil.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbUbicacionEnAutomovil', @level2type=N'COLUMN',@level2name=N'IdUbicacionEnAutomovil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de la ubicación en el automóvil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbUbicacionEnAutomovil', @level2type=N'COLUMN',@level2name=N'Ubicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene las diferentes ubicaciones dentro de un automóvil para identificar donde se encuentran las piezas.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbUbicacionEnAutomovil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'IdVehiculo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marca del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Marca'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modelo del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Modelo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Color del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Año de fabricación del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Anio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de identificación del vehículo (VIN).
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'VIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de placa del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Placa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kilometraje total del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Kilometraje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Millaje total del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Millaje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Millaje actual del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'MillajeActual'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tarifa diaria de alquiler del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'TarifaDiaria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tarifa de alquiler con descuento.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'TarifaAhorro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de aceite recomendado para el vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'TipoAceite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del propietario del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'IdPropietario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del conductor del vehículo.
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'IdConductor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el vehículo está inhabilitado (1) o no (0).
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Inhabilitado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ruta de la imagen del vehículo.

Exportar a Hojas de cálculo
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo', @level2type=N'COLUMN',@level2name=N'Imagen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena la información de los vehículos.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbVehiculo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Define los roles de usuario en el sistema (ej: "Administrador", "Usuario"), cada uno con un identificador y nombre.

' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'tbRol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena la información de los usuarios del sistema, incluyendo datos personales y de acceso.' , @level0type=N'SCHEMA',@level0name=N'seguridad', @level1type=N'TABLE',@level1name=N'tbUsuarios'
GO
USE [master]
GO
ALTER DATABASE [DB_Uber] SET  READ_WRITE 
GO
