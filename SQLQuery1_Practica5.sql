USE [master]
GO
/****** Object:  Database [Biblioteca]    Script Date: 28/10/2017 01:50:25 a. m. ******/
CREATE DATABASE [Biblioteca]
GO
ALTER DATABASE [Biblioteca] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Biblioteca]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 28/10/2017 01:50:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[Id_libro] [int] NULL,
	[Id_autor] [int] NULL,
	[Id_editorial] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Libro]    Script Date: 28/10/2017 01:50:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[id_libro] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Info_libro]    Script Date: 28/10/2017 01:50:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info_libro](
	[id] [int] NULL,
	[id_libro] [int] NULL,
	[id_autor] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Autor]    Script Date: 28/10/2017 01:50:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[id_autor] [int] NULL,
	[id_libro] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Libro] ([Id_libro]) VALUES (7414)
GO
INSERT [dbo].[Libro] ([Id_libro]) VALUES (8484)
GO
INSERT [dbo].[Libro] ([Id_libro]) VALUES (7475)
GO
INSERT [dbo].[Autor] ([Id_autor], [Nombre_autor], [Nac_autor]) VALUES (1564, 'Stephen King', 'EEUU')
GO
INSERT [dbo].[Autor] ([Id_autor], [Nombre_autor], [Nac_autor]) VALUES (1456, 'Arthur Donan Coyle', 'UK')
GO
INSERT [dbo].[Autor] ([Id_autor], [Nombre_autor], [Nac_autor]) VALUES (1445, 'HP Lovecraft', 'EEUU')
GO
INSERT [dbo].[Info_libro] ([Id_libro], [Id_autor]) VALUES (7414, 1564)
GO
INSERT [dbo].[Info_libro] ([Id_libro], [Id_autor]) VALUES (8484, 1456)
GO
INSERT [dbo].[Info_libro] ([Id_libro], [Id_autor]) VALUES (7475, 1445)
GO
USE [master]
GO
ALTER DATABASE [Biblioteca] SET  READ_WRITE 
GO
