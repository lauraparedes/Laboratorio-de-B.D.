CREATE DATABASE [Biblioteca]
USE [Biblioteca]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 10/11/2017 11:48:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[Id_ibro] [int] NOT NULL,
	[Nom_libro] [varchar](50) NULL,
	[Nom_autor][varchar](40) NULL,
	[ISBN] [varchar](40) NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[Id_Libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Autor]    Script Date: 10/11/2017 11:48:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[Id_autor] [int] NOT NULL,
	[Nom_autor] [varchar](40)NULL,
	[Nac_autor] [varchar](20) NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[Id_Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 10/11/2017 11:48:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[Id_editorial] [int] NOT NULL,
	[Nom_editorial] [varchar](25) NULL,
 CONSTRAINT [PK_Editorial] PRIMARY KEY CLUSTERED 
(
	[Editorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 10/11/2017 11:48:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[Id_libro] [int] NOT NULL,
	[Id_autor] [int] NOT NULL,
	[Id_editorial] [int] NOT NULL,
	[ISBN] [varchar](40) NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_libro] FOREIGN KEY([Id_libro])
REFERENCES [dbo].[Libro] ([Id_libro])
GO
ALTER TABLE [dbo].[Detalle_libro] CHECK CONSTRAINT [FK_Detalle_libro]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Autor] FOREIGN KEY([Id_autor])
REFERENCES [dbo].[Autor] ([Id_autor])
GO
ALTER TABLE [dbo].[Detalle_Autor] CHECK CONSTRAINT [FK_Detalle_Autor]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Editorial] FOREIGN KEY([Id_Editorial])
REFERENCES [dbo].[Editorial] ([Id_Editorial])
GO
ALTER TABLE [dbo].[Detalle_Editorial] CHECK CONSTRAINT [FK_Detalle_Editorial]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Autor] FOREIGN KEY([Nom_autor])
REFERENCES [dbo].[Autor] ([Nom_autor])
GO
ALTER TABLE [dbo].[Detalle_Autor] CHECK CONSTRAINT [FK_Detalle_Autor]


INSERT INTO Libro(Id_libro, Nom_libro, Nom_autor, ISBN)
VALUES (122345, 'Carrie', 'Stephen King', '1452D-23125-FD15');

INSERT INTO Libro(Id_libro, Nom_libro, Nom_autor, ISBN)
VALUES (1226347, '1984', 'George Orwell', '5452D-231SK-FD22');

INSERT INTO Libro(Id_libro, Nom_libro, Nom_autor, ISBN)
VALUES (1232132, 'El principito', 'Anthony de Saint Exupery', '845IT-231SK-FD25');

INSERT INTO Autor(Id_autor, Nom_autor, Nac_autor)
VALUES (12345, 'Stephen King', 'EEUU');

INSERT INTO Autor(Id_autor, Nom_autor, Nac_autor)
VALUES (12563, 'George Orwell', 'UK');

INSERT INTO Autor(Id_autor, Nom_autor, Nac_autor)
VALUES (12896, 'Anthony de Saint Exupery', 'Francia');

INSERT INTO Editorial(Id_editorial, Nom_editorial)
VALUES (25546, 'Plaza n Janes');

INSERT INTO Editorial(Id_editorial, Nom_editorial)
VALUES (56897, 'Debolsillo');

--subconsultas
UPDATE Autor
SET Nom_autor = 'Lewis Caroll', Nac_autor = 'UK'
WHERE Id_autor = 12563

UPDATE Autor
SET Nom_autor = 'JK Rowling', Nac_autor = 'UK'
WHERE Id_autor = 12896

DELETE FROM Editorial
WHERE Nom_editorial = 'Plaza n Janes';

--view y select view

GO
Create View D_Detalle AS Select Id_libro, Id_autor, Id_editorial From Detalle
GO

Select * From D_Detalle

GO
Create View L_Libro AS Select Id_libro, Id_autor, Id_editorial, ISBN From Libro
GO

Select * From L_Libro

Create procedure selectlibro @id_libro int,
as
begin
select l.Id_libro, l.Nom_libro, a.Nom_autor, l.ISBN
from Detalle d
left join Libro l on l.Id_libro = d.Id_libro
where l.Id_libro= @id_libro
end

Execute selectlibro @id_libro=1226347

create trigger updatelibro
on Libro
after update, delete
as
begin
select* from inserted
select* from deleted
end

Update Libro set Id_libro='1000' from Libro Where Id_libro='122345'
Delete from Libro where Id_libro = '1232132'
