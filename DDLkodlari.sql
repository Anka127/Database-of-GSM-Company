USE [master]
GO
/****** Object:  Database [come]    Script Date: 17.10.2019 16:04:09 ******/
CREATE DATABASE [come]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'come', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\come.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'come_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\come_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [come] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [come].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [come] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [come] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [come] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [come] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [come] SET ARITHABORT OFF 
GO
ALTER DATABASE [come] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [come] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [come] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [come] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [come] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [come] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [come] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [come] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [come] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [come] SET  DISABLE_BROKER 
GO
ALTER DATABASE [come] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [come] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [come] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [come] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [come] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [come] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [come] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [come] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [come] SET  MULTI_USER 
GO
ALTER DATABASE [come] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [come] SET DB_CHAINING OFF 
GO
ALTER DATABASE [come] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [come] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [come] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [come] SET QUERY_STORE = OFF
GO
USE [come]
GO
/****** Object:  Table [dbo].[aboneler]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aboneler](
	[id] [int] NOT NULL,
	[aboneadi] [nvarchar](50) NULL,
	[abonesoyadi] [nvarchar](50) NULL,
	[aboneevadresi] [text] NULL,
	[aboneisadresi] [text] NULL,
	[aboneili] [nvarchar](50) NOT NULL,
	[abonenfusseri] [nvarchar](9) NOT NULL,
	[abonetarife_id] [int] NOT NULL,
	[abonebayilik_id] [int] NOT NULL,
	[aboneuyeliktarihi] [date] NOT NULL,
	[abonenumara] [nvarchar](50) NOT NULL,
	[yurtdisibilgisi] [nvarchar](50) NULL,
 CONSTRAINT [PK_aboneler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aboneweb]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aboneweb](
	[id] [int] NOT NULL,
	[kulaniciadi] [char](25) NOT NULL,
	[sifre] [nchar](20) NOT NULL,
	[songiris] [date] NULL,
	[girissayisi] [int] NULL,
	[abone_id] [int] NOT NULL,
 CONSTRAINT [PK_aboneweb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[altbayilikler]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[altbayilikler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[altbolgeadi] [char](20) NULL,
	[altbolgeadres] [text] NOT NULL,
	[bolgebayilik_id] [int] NOT NULL,
	[calisantablo] [int] NULL,
 CONSTRAINT [PK_altbayilikler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bolgebayilikleri]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bolgebayilikleri](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bolgeadi] [char](20) NOT NULL,
	[bolgesehir] [char](20) NULL,
	[bolgeadres] [text] NULL,
 CONSTRAINT [PK_bolgebayilikleri] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faturalar]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faturalar](
	[ld] [int] NOT NULL,
	[dakikamiktar] [int] NOT NULL,
	[smsmiktar] [int] NOT NULL,
	[sonodeme] [date] NOT NULL,
	[musteri_id] [int] NOT NULL,
 CONSTRAINT [PK_faturalar] PRIMARY KEY CLUSTERED 
(
	[ld] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[firmacalisanlari]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[firmacalisanlari](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[calisanadi] [nchar](20) NOT NULL,
	[calisansoyadi] [nchar](20) NOT NULL,
	[calisanil] [nchar](20) NULL,
	[calisanadres] [text] NULL,
	[calisantel] [int] NULL,
	[calisanfax] [char](25) NULL,
	[calisanfirma] [char](25) NOT NULL,
	[calisananabayilik_id] [int] NOT NULL,
	[calisanaltbayilik_id] [int] NULL,
	[calisanstatu] [char](30) NULL,
 CONSTRAINT [PK_firmacalisanlari] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[odeme]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[odeme](
	[id] [nchar](10) NOT NULL,
	[odemetarihi] [date] NOT NULL,
	[fatura_id] [int] NOT NULL,
	[toplamborc] [float] NULL,
	[ödememiktari] [float] NOT NULL,
	[gecikmefaiziyuzde] [float] NULL,
 CONSTRAINT [PK_odeme] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarifeler]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarifeler](
	[id] [int] NOT NULL,
	[tarifeismi] [char](40) NULL,
	[tarifedakikaucretikrs] [float] NULL,
	[tarifesmsucretikrs] [float] NULL,
 CONSTRAINT [PK_tarifeler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_aboneler]    Script Date: 17.10.2019 16:04:09 ******/
CREATE NONCLUSTERED INDEX [IX_aboneler] ON [dbo].[aboneler]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_altbayilikler]    Script Date: 17.10.2019 16:04:09 ******/
CREATE NONCLUSTERED INDEX [IX_altbayilikler] ON [dbo].[altbayilikler]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aboneler]  WITH CHECK ADD  CONSTRAINT [FK_aboneler_altbayilikler] FOREIGN KEY([abonebayilik_id])
REFERENCES [dbo].[altbayilikler] ([id])
GO
ALTER TABLE [dbo].[aboneler] CHECK CONSTRAINT [FK_aboneler_altbayilikler]
GO
ALTER TABLE [dbo].[aboneler]  WITH CHECK ADD  CONSTRAINT [FK_aboneler_tarifeler] FOREIGN KEY([abonetarife_id])
REFERENCES [dbo].[tarifeler] ([id])
GO
ALTER TABLE [dbo].[aboneler] CHECK CONSTRAINT [FK_aboneler_tarifeler]
GO
ALTER TABLE [dbo].[aboneweb]  WITH CHECK ADD  CONSTRAINT [FK_aboneweb_aboneler] FOREIGN KEY([abone_id])
REFERENCES [dbo].[aboneler] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[aboneweb] CHECK CONSTRAINT [FK_aboneweb_aboneler]
GO
ALTER TABLE [dbo].[altbayilikler]  WITH CHECK ADD  CONSTRAINT [FK_altbayilikler_bolgebayilikleri] FOREIGN KEY([bolgebayilik_id])
REFERENCES [dbo].[bolgebayilikleri] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[altbayilikler] CHECK CONSTRAINT [FK_altbayilikler_bolgebayilikleri]
GO
ALTER TABLE [dbo].[altbayilikler]  WITH CHECK ADD  CONSTRAINT [FK_altbayilikler_firmacalisanlari] FOREIGN KEY([calisantablo])
REFERENCES [dbo].[firmacalisanlari] ([id])
GO
ALTER TABLE [dbo].[altbayilikler] CHECK CONSTRAINT [FK_altbayilikler_firmacalisanlari]
GO
ALTER TABLE [dbo].[faturalar]  WITH CHECK ADD  CONSTRAINT [FK_faturalar_aboneler] FOREIGN KEY([musteri_id])
REFERENCES [dbo].[aboneler] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[faturalar] CHECK CONSTRAINT [FK_faturalar_aboneler]
GO
ALTER TABLE [dbo].[firmacalisanlari]  WITH CHECK ADD  CONSTRAINT [FK_firmacalisanlari_bolgebayilikleri] FOREIGN KEY([calisananabayilik_id])
REFERENCES [dbo].[bolgebayilikleri] ([id])
GO
ALTER TABLE [dbo].[firmacalisanlari] CHECK CONSTRAINT [FK_firmacalisanlari_bolgebayilikleri]
GO
ALTER TABLE [dbo].[odeme]  WITH CHECK ADD  CONSTRAINT [FK_odeme_faturalar] FOREIGN KEY([fatura_id])
REFERENCES [dbo].[faturalar] ([ld])
GO
ALTER TABLE [dbo].[odeme] CHECK CONSTRAINT [FK_odeme_faturalar]
GO
/****** Object:  StoredProcedure [dbo].[seçilitümaboneler]    Script Date: 17.10.2019 16:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[seçilitümaboneler]
AS
SELECT * FROM aboneler
GO;
GO
USE [master]
GO
ALTER DATABASE [come] SET  READ_WRITE 
GO
