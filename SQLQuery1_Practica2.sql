USE [master]
GO

/****** Object:  Database [Cine+]    Script Date: 09/09/2017 01:44:17 p.m. ******/
CREATE DATABASE [Cine+]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cine+', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Cine+.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cine+_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Cine+_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Cine+] SET COMPATIBILITY_LEVEL = 110
GO

Create Table Pelicula
(Id_pelicula UniqueIdentifier NOT NULL,
Nom_pelicula varchar(50),
Codigo tinyint)
GO

Create Table Funcion
(Id_funcion int NOT NULL,
Id_pelicula UniqueIdentifier NOT NULL,
fecha_funcion datetime,
Id_sucursal int, Id_sala tinyint)
GO

Create Table Cliente
(Id_cliente int NOT NULL,
Id_membresia tinyint,
Nom_cliente varchar(50), Correo_cliente varchar(25))
GO

Create Table Membresia
(Id_membresia int NOT NULL,
Folio_m tinyint,
Vencimiento_m datetime)
GO

Create Table Sucursal
(Id_sucursal int NOT NULL,
Nom_sucursal varchar(25),
Direccion_sucursal varchar(50))
GO

Create Table Sala
(Id_sala int NOT NULL,
Asientos int,
Tipo_sala varchar(10))
GO

Create Table Boleto
(Id_pelicula UniqueIdentifier NOT NULL,
Id_boleto int, Id_cliente int, fecha_funcion datetime, Id_sucursal int, 
Nom_sucursal varchar (25))
GO

 IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cine+].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Cine+] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Cine+] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Cine+] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Cine+] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Cine+] SET ARITHABORT OFF 
GO

ALTER DATABASE [Cine+] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Cine+] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Cine+] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Cine+] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Cine+] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Cine+] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Cine+] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Cine+] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Cine+] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Cine+] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Cine+] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Cine+] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Cine+] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Cine+] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Cine+] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Cine+] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Cine+] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Cine+] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Cine+] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Cine+] SET  MULTI_USER 
GO

ALTER DATABASE [Cine+] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Cine+] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Cine+] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Cine+] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Cine+] SET  READ_WRITE 
GO


