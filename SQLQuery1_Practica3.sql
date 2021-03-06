USE [master]
GO
/****** Object:  Database [BDSabado1]    Script Date: 07/10/2017 12:18:00 p.m. ******/
CREATE DATABASE [BDSabado1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDSabado1', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BDSabado1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDSabado1_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BDSabado1_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDSabado1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDSabado1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDSabado1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDSabado1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDSabado1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDSabado1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDSabado1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDSabado1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDSabado1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BDSabado1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDSabado1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDSabado1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDSabado1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDSabado1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDSabado1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDSabado1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDSabado1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDSabado1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDSabado1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDSabado1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDSabado1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDSabado1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDSabado1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDSabado1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDSabado1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDSabado1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDSabado1] SET  MULTI_USER 
GO
ALTER DATABASE [BDSabado1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDSabado1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDSabado1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDSabado1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BDSabado1]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 07/10/2017 12:18:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[Id_matricula] [int] NOT NULL,
	[Nom_Alumno] [varchar](50) NULL,
	[Fecha_nac] [datetime] NULL,
	[Edad_alumno] [tinyint] NULL,
	[Id_tutor] [int] NOT NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[Id_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 07/10/2017 12:18:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carrera](
	[Id_Carrera] [int] NOT NULL,
	[Nom_Carrera] [varchar](25) NULL,
	[semestre_Carrera] [tinyint] NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[Id_Carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle_alumno]    Script Date: 07/10/2017 12:18:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_alumno](
	[Id_matricula] [int] NOT NULL,
	[Id_carrera] [int] NOT NULL,
	[no_semestre] [tinyint] NULL,
	[Generacion_alumno] [tinyint] NULL,
	[Id_tutor] [int] NOT NULL,
	[Id_materia] [int] NOT NULL,
 CONSTRAINT [PK_Detalle_alumno] PRIMARY KEY CLUSTERED 
(
	[Id_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Materia]    Script Date: 07/10/2017 12:18:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Materia](
	[Id_materia] [int] NOT NULL,
	[Nom_materia] [varchar](50) NULL,
	[creditos_mat] [tinyint] NULL,
	[Id_profesor] [int] NOT NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[Id_materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 07/10/2017 12:18:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profesor](
	[Id_profesor] [int] NOT NULL,
	[Nom_alumno] [varchar](50) NULL,
	[Fecha_nac] [datetime] NULL,
	[Edad_alumno] [tinyint] NULL,
	[Id_materia] [int] NOT NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[Id_profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 07/10/2017 12:18:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tutor](
	[Id_tutor] [int] NOT NULL,
	[Nom_tutor] [int] NOT NULL,
	[Titulo_tutor] [varchar](50) NULL,
	[Grupo_tutor] [varchar](3) NULL,
 CONSTRAINT [PK_Tutor] PRIMARY KEY CLUSTERED 
(
	[Id_tutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Detalle_alumno] FOREIGN KEY([Id_matricula])
REFERENCES [dbo].[Detalle_alumno] ([Id_matricula])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Detalle_alumno]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Tutor] FOREIGN KEY([Id_tutor])
REFERENCES [dbo].[Tutor] ([Id_tutor])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Tutor]
GO
ALTER TABLE [dbo].[Detalle_alumno]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_alumno_Carrera] FOREIGN KEY([Id_carrera])
REFERENCES [dbo].[Carrera] ([Id_Carrera])
GO
ALTER TABLE [dbo].[Detalle_alumno] CHECK CONSTRAINT [FK_Detalle_alumno_Carrera]
GO
ALTER TABLE [dbo].[Detalle_alumno]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_alumno_Materia] FOREIGN KEY([Id_materia])
REFERENCES [dbo].[Materia] ([Id_materia])
GO
ALTER TABLE [dbo].[Detalle_alumno] CHECK CONSTRAINT [FK_Detalle_alumno_Materia]
GO
ALTER TABLE [dbo].[Detalle_alumno]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_alumno_Tutor] FOREIGN KEY([Id_tutor])
REFERENCES [dbo].[Tutor] ([Id_tutor])
GO
ALTER TABLE [dbo].[Detalle_alumno] CHECK CONSTRAINT [FK_Detalle_alumno_Tutor]
GO
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Profesor] FOREIGN KEY([Id_profesor])
REFERENCES [dbo].[Profesor] ([Id_profesor])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Profesor]
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD  CONSTRAINT [FK_Profesor_Materia] FOREIGN KEY([Id_materia])
REFERENCES [dbo].[Materia] ([Id_materia])
GO
ALTER TABLE [dbo].[Profesor] CHECK CONSTRAINT [FK_Profesor_Materia]
GO
USE [master]
GO
ALTER DATABASE [BDSabado1] SET  READ_WRITE 
GO
