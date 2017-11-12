create database BibliotecaLAI
use BibliotecaLAI

--INTEGRANTES
--LAURA ADRIANA PAREDES SAUCEDA
--ISIS FLORES RUIZ
--ALEXIS LEAL MATA

create table Autores
(Id_Autor int not null identity primary key,
Aut_Nom varchar (50) ,
Aut_Ap varchar (30),
Aut_Nacion varchar (50))

create table Editoriales
(Id_edit int not null identity primary key,
Edit_Nom varchar (50) ,
Edit_Nacion varchar (50))

create table Renovaciones
(Id_Renova int not null identity primary key,
Renova_Fech datetime,
Renova_Newfech datetime)

create table Alumnos 
(Id_Alum int not null identity primary key,
Alum_nom varchar (50) ,
Alum_ApPat varchar (50),
Alum_ApMat varchar (50),
Alum_FechNa datetime,
Alum_Dom varchar (70),
Alum_Tel int not null)

create table Puestos
(Id_Puesto int not null identity primary key,
Nom_Puesto varchar (50))

create table Estatus
(Id_Estatus int not null identity primary key,
Estatus varchar (50))

create table Estado_Fisico
(Id_EF int not null identity primary key,
EFisico varchar (50))

create table Clasificacion(
Id_Clasificacion int NOT NULL identity primary key,
Clasificacion nvarchar(50) NULL)

create table Area(
Id_Area int NOT NULL identity primary key,
Area nvarchar(50) NULL)

create table Tema(
Id_Tema int NOT NULL identity primary key,
Tema nvarchar(50) NULL)

create table Pais
(Id_Pais int not null identity primary key,
Pais_Nom varchar (30))

create table Libro 
(Id_Libro int not null identity primary key,
Lib_Nom varchar (50),
Id_Autor int not null foreign key references Autores(Id_Autor) on delete cascade,
Id_Edit int not null foreign key references Editoriales(Id_Edit) on delete cascade,
Lib_Edic varchar (50),
Id_Clasificacion int not null foreign key references Clasificacion(Id_Clasificacion) on delete cascade,
Id_Tema int not null foreign key references Tema(Id_Tema) on delete cascade,
Fech_Lanz datetime)

create table Pasillo(
Id_Pasillo int NOT NULL identity primary key,
Pasillo nvarchar(50) NULL,
Id_Area int NULL foreign key references Area(Id_Area) on delete cascade,
Id_Clasificacion int NULL foreign key references Clasificacion(Id_Clasificacion) on delete cascade)

create table Estante(
Id_Estante int NOT NULL identity primary key,
Estante nvarchar(50) NULL,
Id_Pasillo int NULL foreign key references Pasillo(Id_Pasillo) on delete cascade,
Id_Tema int NULL foreign key references Tema(Id_Tema) on delete cascade)

create table Repisa(
Id_Repisa int NOT NULL identity primary key,
Repisa varchar(50) NULL,
Id_estante int NOT NULL foreign key references Estante(Id_Estante) on delete cascade,
Id_pasillo int NULL)


create table Ubicacion_Lib(
Id_Ubi int NOT NULL,
Id_Libro int NULL foreign key references Libro(Id_Libro) on delete cascade,
Id_Area int NULL foreign key references Area(Id_Area) on delete cascade,
Id_Pasillo int NULL,
Id_Estante int NULL,
Id_Repisa int NULL)

create table Ejemplares
(Id_Ejem int not null identity primary key,
Id_Libro int not null foreign key references Libro(Id_Libro) on delete cascade,
Id_Estatus int not null foreign key references Estatus(Id_Estatus) on delete cascade,
Id_EF int not null foreign key references Estado_Fisico(Id_EF) on delete cascade,
Id_Ubi int not null)

create table Prestamos
(Id_Pres int not null identity primary key,
Id_Alum int not null foreign key references Alumnos(Id_Alum) on delete cascade,
Id_Lib int not null foreign key references Libro(Id_Libro) on delete cascade,
Id_Ejem int not null,
Pres_FechNa datetime,
Entrega_FechNa datetime,
Id_Renova int not null foreign key references Renovaciones(Id_Renova) on delete cascade)

create table Empleados 
(Id_Emp int not null identity primary key,
Id_Puesto int not null foreign key references Puestos(Id_Puesto) on delete cascade,
Nom_emp varchar (50) ,
Em_ApPat varchar (50),
Em_ApMat varchar (50),
Em_FechNa datetime,
Em_Dom varchar (70),
Em_Tel int not null)

create table Estado
(Id_Estado int not null identity primary key,
Estado_Nom varchar (30),
Id_Pais int not null foreign key references Pais(Id_Pais) on delete cascade)

create table Municipio
(Id_Mun int not null identity primary key,
Mun_Nom varchar (30),
Id_Pais int not null foreign key references Pais(Id_Pais) on delete cascade,
Id_Estado int not null)

SET IDENTITY_INSERT Libro ON
insert into Libro (Id_libro, Lib_nom, Id_autor, id_edit, Lib_Edic, id_clasificacion, id_tema, Fech_lanz )
values (10,'Carrie',101,2055,1,2599,125,'07-26-2001');
insert into Libro (Id_libro, Lib_nom,Id_autor, id_edit, Lib_Edic, id_clasificacion, id_tema, Fech_lanz )
values (200,'Hamlet',408,4963,2,2599, 263,'07-26-2001');
insert into Libro (Id_libro, Lib_nom,Id_autor, id_edit, Lib_Edic, id_clasificacion, id_tema, Fech_lanz )
values (300,'Necronomicon',058,5248,5,5698,125,'07-26-2001');
SET IDENTITY_INSERT Libro OFF


SET IDENTITY_INSERT Autores ON
insert into Autores (id_autor, aut_nom, aut_ap, aut_nacion)
values (101, 'Stephen', 'King', 'EEUU');
insert into Autores (id_autor, aut_nom, aut_ap, aut_nacion)
values (408, 'William', 'Shakespeare', 'UK');
insert into Autores (id_autor, aut_nom, aut_ap, aut_nacion)
values (058, 'HP', 'Lovecraft', 'EEUU');
SET IDENTITY_INSERT Autores OFF

SET IDENTITY_INSERT Editoriales ON
insert into Editoriales (id_edit, edit_nom, edit_nacion)
values(2055,'Debolsillo','Mexico');
insert into Editoriales (id_edit, edit_nom, edit_nacion)
values(4963,'Planeta','Mexico');
insert into Editoriales (id_edit, edit_nom, edit_nacion)
values(5248,'Plana n Janes','España');
SET IDENTITY_INSERT Editoriales OFF

SET IDENTITY_INSERT Alumnos ON
insert into Alumnos (id_alum, alum_nom, alum_ApPat, Alum_apMat, alum_fechNa, Alum_dom, Alum_Tel) 
values (1670989,'Tania','Guerrero','Flores','07-04-1989',101,19483784);
insert into Alumnos (id_alum, alum_nom, alum_ApPat, Alum_apMat, alum_fechNa, Alum_dom, Alum_Tel) 
values(1549160,'Alejandro','Lopez','Gonzales','08-04-1989',102,928374395);
insert into Alumnos (id_alum, alum_nom, alum_ApPat, Alum_apMat, alum_fechNa, Alum_dom, Alum_Tel) 
values(1892364,'Tania','Guerrero','Flores','07-04-1989',103,937562734);
SET IDENTITY_INSERT Alumnos OFF

SET IDENTITY_INSERT Prestamos ON
insert into Prestamos (id_pres, id_alum, id_lib, id_ejem, pres_fechNa, entrega_fechNa, id_renova) values
(16,1670989,100, 25665,'09-15-2017','09-20-2017', 011);
insert into Prestamos (id_pres, id_alum, id_lib, id_ejem, pres_fechNa, entrega_fechNa, id_renova) values
(25,1892364,200,45886, '09-15-2017','09-20-2017',0212);
SET IDENTITY_INSERT Prestamos OFF

SET IDENTITY_INSERT Renovaciones ON
insert into Renovaciones (id_renova, renova_fech, renova_newfech)
values (25668, '05-25-2017', '05-30-2017');
SET IDENTITY_INSERT Renovaciones OFF

SET IDENTITY_INSERT Empleados ON
insert into Empleados (id_emp, id_puesto, nom_emp, em_appat, em_apmat, em_fechna, Em_dom, em_tel)
values (22566,1,'Maria','Lopez','Flores','04-07-1989','Pino 205 Col. Valles',19263784); 
insert into Empleados (id_emp, id_puesto, nom_emp, em_appat, em_apmat, em_fechna, Em_dom, em_tel)
values (36566,3,'Mariana','Sanchez','Cortes','09-07-1982','Astros 2055 Col. Costelacion',8598684); 
insert into Empleados (id_emp, id_puesto, nom_emp, em_appat, em_apmat, em_fechna, Em_dom, em_tel)
values (29586,2,'Juan','Lopez','Aviles','12-08-1990','Soles 1228 Col. San Francisco',86659584); 
SET IDENTITY_INSERT Empleados OFF

SET IDENTITY_INSERT Puestos ON
insert into Puestos (id_puesto, nom_puesto)
values(1,'Gerente de Biblioteca');
insert into Puestos (id_puesto, nom_puesto) 
values(2,'Cajera');
insert into Puestos (id_puesto, nom_puesto) 
values(3,'Bibliotecaria');
insert into Puestos (id_puesto, nom_puesto) 
values(4,'Conserje');
insert into Puestos (id_puesto, nom_puesto) 
values(5,'Almacenista');
insert into Puestos (id_puesto, nom_puesto) 
values(6,'Guardia');
SET IDENTITY_INSERT Puestos OFF

SET IDENTITY_INSERT Estatus ON
insert into Estatus (id_estatus, estatus) 
values(1,'Permanencia-Resguardo');
insert into Estatus (id_estatus, estatus)
values(2,'Prestamo');
insert into Estatus (id_estatus, estatus) 
values(3,'Permanencia-Lectura');
SET IDENTITY_INSERT Estatus OFF

SET IDENTITY_INSERT Estado_Fisico ON
insert into Estado_Fisico (id_EF, EFisico)
values(1,'Excelente');
insert into Estado_Fisico (id_EF, EFisico) 
values(2,'Dañado');
insert into Estado_Fisico (id_EF, EFisico)
values(3,'Inservible');
SET IDENTITY_INSERT Estado_Fisico OFF

SET IDENTITY_INSERT Ejemplares ON
insert into Ejemplares (id_ejem, id_libro, id_estatus, id_ef, id_ubi)
values(1,2,3,1,50);
insert into Ejemplares (id_ejem, id_libro, id_estatus, id_ef, id_ubi) 
values(4,12,2,2,70);
insert into Ejemplares (id_ejem, id_libro, id_estatus, id_ef, id_ubi)
values(8,6,2,1,72);
insert into Ejemplares(id_ejem, id_libro, id_estatus, id_ef, id_ubi) 
values(16,6,2,1,73);
SET IDENTITY_INSERT Ejemplares OFF

SET IDENTITY_INSERT Area ON
insert into Area(id_area, Area) 
values(1,'Niños');
insert into Area(id_area, Area) 
values(2,'Adultos');
insert into Area(id_area, Area) 
values(3,'Estudiantes');
insert into Area (id_area, Area)
values(4,'Area Mixta');
SET IDENTITY_INSERT Area OFF

SET IDENTITY_INSERT Clasificacion ON
insert into Clasificacion (id_clasificacion, Clasificacion)
values(1,'Cuentos');
insert into Clasificacion(id_clasificacion, Clasificacion) 
values(2,'Investigacion');
insert into Clasificacion (id_clasificacion, Clasificacion)
values(3,'Poesia');
insert into Clasificacion(id_clasificacion, Clasificacion) 
values(4,'Ciencia');
SET IDENTITY_INSERT Clasificacion OFF

SET IDENTITY_INSERT Estante ON
insert into Estante(id_Estante, estante, Id_Pasillo, Id_Tema) 
values(1,'Cuentos',1,3)
insert into Estante(id_Estante, estante, Id_Pasillo, Id_Tema)
values(2,'Investigacion',10,6);
insert into Estante(id_Estante, estante, Id_Pasillo, Id_Tema) 
values(3,'Poesia',12,30);
insert into Estante(id_Estante, estante, Id_Pasillo, Id_Tema) 
values(4,'Ciencia',15,4);
SET IDENTITY_INSERT Estante OFF

SET IDENTITY_INSERT Pasillo ON
insert into Pasillo (Id_Pasillo, Pasillo, Id_Area, Id_Clasificacion)
values(1,'A',1,3);
insert into Pasillo(Id_Pasillo, Pasillo, Id_Area, Id_Clasificacion) 
values(2,'F',1,30);
insert into Pasillo(Id_Pasillo, Pasillo, Id_Area, Id_Clasificacion) 
values(3,'G',21,7);
SET IDENTITY_INSERT Pasillo OFF

SET IDENTITY_INSERT Repisa ON
insert into Repisa(Id_Repisa, Repisa, Id_estante, Id_pasillo) 
values(1,'a',1,3);
insert into Repisa(Id_Repisa, Repisa, Id_estante, Id_pasillo) 
values(1,'g',11,23);
insert into Repisa(Id_Repisa, Repisa, Id_estante, Id_pasillo) 
values(1,'x',10,8);
SET IDENTITY_INSERT Repisa OFF

SET IDENTITY_INSERT Tema ON
insert into Tema (Id_Tema, Tema) 
values(1,'Biologia');
insert into Tema(Id_Tema, Tema) 
values(1,'Teatro');
insert into Tema (Id_Tema, Tema)
values(1,'Matematicas');
SET IDENTITY_INSERT Tema OFF

SET IDENTITY_INSERT Ubicacion_Lib ON
insert into Ubicacion_Lib (Id_Ubi, Id_Libro, Id_Area, Id_Pasillo, Id_Estante, Id_Repisa) 
values(1,2,5,78,5);
insert into Ubicacion_Lib (Id_Ubi, Id_Libro, Id_Area, Id_Pasillo, Id_Estante, Id_Repisa)
values(5,4,9,27,9);
insert into Ubicacion_Lib (Id_Ubi, Id_Libro, Id_Area, Id_Pasillo, Id_Estante, Id_Repisa)
values(90,7,2,38,4);
SET IDENTITY_INSERT Ubicacion_lib OFF

SET IDENTITY_INSERT Pais ON
insert into Pais (id_pais, pais_nom)
values (25668, 'Mexico');
insert into Pais (id_pais, pais_nom)
values (12568, 'Chile');
insert into Pais (id_pais, pais_nom)
values (96558, 'EEUU');
SET IDENTITY_INSERT Pais OFF

SET IDENTITY_INSERT Estado ON
insert into Estado (id_estado, estado_nom, id_pais)
values(252689, 'Nuevo Leon', 25668);
insert into Estado (id_estado, estado_nom, id_pais)
values(02568, 'Jalisco', 25668);
SET IDENTITY_INSERT Estado OFF

SET IDENTITY_INSERT Municipio ON
insert into Municipio (id_mun, mun_nom, id_pais, id_estado)
values (2563, 'General Escobedo', 25668,252689  );
insert into Municipio (id_mun, mun_nom, id_pais, id_estado)
values (2563, 'Guadalajara', 25668,02568 );
SET IDENTITY_INSERT Municipio OFF

select * from Empleados
select * from Puestos
select * from Estatus
select * from Estado_Fisico
select * from Ejemplares

ALTER TABLE [Ejemplares] ADD FOREIGN KEY([Id_Libro])
REFERENCES [Libro] ([Id_Libro])
GO

ALTER TABLE [Empleados] ADD  FOREIGN KEY([ID_Puesto])
REFERENCES [Puestos] ([ID_Puesto])
GO

ALTER TABLE [Estante] ADD  FOREIGN KEY([ID_Pasillo])
REFERENCES [Pasillo] ([ID_Pasillo])
GO

ALTER TABLE [Estante]  ADD  FOREIGN KEY([ID_Tema])
REFERENCES [Tema] ([ID_Tema])
GO

ALTER TABLE [Pasillo]  ADD  FOREIGN KEY([ID_Area])
REFERENCES [Area] ([ID_Area])
GO

ALTER TABLE [Pasillo]  ADD  FOREIGN KEY([ID_Clasificacion])
REFERENCES [Clasificacion] ([ID_Clasificacion])
GO

ALTER TABLE [Ubicacion_Lib] ADD FOREIGN KEY([ID_Area])
REFERENCES [Area] ([ID_Area])
GO

ALTER TABLE [Ubicacion_Lib] ADD  FOREIGN KEY([ID_Libro])
REFERENCES [Libro] ([ID_Libro])
GO

ALTER TABLE [Ubicacion_Lib] ADD  FOREIGN KEY([ID_Estante])
REFERENCES [Estante] ([ID_Estante])
GO

ALTER TABLE [Ubicacion_Lib] ADD  FOREIGN KEY([ID_Pasillo])
REFERENCES [Pasillo] ([ID_Pasillo])
GO

ALTER TABLE [Ubicacion_Lib] ADD  FOREIGN KEY([ID_Repisa])
REFERENCES [Repisa] ([ID_Repisa])
GO

ALTER TABLE [Estado] ADD  FOREIGN KEY([ID_Pais])
REFERENCES [Pais] ([ID_Pais])
GO

ALTER TABLE [Municipio] ADD FOREIGN KEY([ID_Pais])
REFERENCES [Pais] ([ID_Pais])
GO

ALTER TABLE [Municipio] ADD  FOREIGN KEY([ID_Estado])
REFERENCES [Estado] ([ID_Estado])
GO

delete from Puestos 
where Id_Puesto= 6

update Puestos
set Id_Puesto=6
where
Id_Puesto=4

delete from Ejemplares 
where Id_Ejem= 16

update Ejemplares
set Id_Ubi=73
where
Id_Ejem=8

delete from Empleados
where Id_Emp= 1

update Empleados
set Id_Puesto=2
where
Id_Emp=4

delete from Alumnos 
where Id_Alum= 1670989

update Alumnos
set Id_Alum=1892364
where
Alum_Tel= 811234256


select Id_Libro,
count(*) as Suma
from Libro 
group by Id_Libro

select Id_Puesto,
count(*) as Suma
from Empleados 
group by Id_Puesto

select Id_Emp,
count(*) as Suma
from Empleados 
group by Id_Emp


 select sum(Ejemplares.Id_Ejem) as Inventario
 from Ejemplares 
 select  max(Ejemplares.Id_Ejem) as 
 Maximo from Ejemplares
 select min(Ejemplares.Id_Ejem) as 
 Minimo from Ejemplares 

 select sum(Empleados.Id_Emp) as Conteo
 from Empleados
 select  max(Empleados.Em_FechNa) as 
 Maximo from Empleados
 select min(Empleados.Em_FechNa) as 
 Minimo from Empleados

select sum(Libro.Id_Libro) as Existencias
 from Libro 
 select  max(Libro.Id_Libro) as 
 Maximo from Libro
 select min(Libro.Id_Libro) as 
 Minimo from Libro

 select sum(Alumnos.Id_Alum) as Revision
 from Alumnos
 select  max(Alumnos.Alum_FechNa) as 
 Maximo from Alumnos
 select min(Alumnos.Alum_FechNa) as 
 Minimo from Alumnos

select sum(Prestamos.Id_Pres) as Control
 from Prestamos
 select  max(Prestamos.Pres_FechNa) as 
 Maximo from Prestamos
 select min(Prestamos.Pres_FechNa) as 
 Minimo from Prestamos

 select sum(Renovaciones.Id_Renova) as Control_Renovaciones
 from Renovaciones
 select  max(Renovaciones.Renova_Fech) as 
 Maximo from Renovaciones
 select min(Renovaciones.Renova_Fech) as 
 Minimo from Renovaciones

 select sum(Ejemplares.Id_Ejem) as Inventario
 from Ejemplares where Id_Libro=1
 select  max(Ejemplares.Id_Ejem) as 
 Maximo from Ejemplares where Id_Estatus=2
 select min(Ejemplares.Id_Ejem) as 
 Minimo from Ejemplares where Id_Estatus=1

 select sum(Empleados.Id_Emp) as Conteo
 from Empleados where Id_Puesto=2
 select  max(Empleados.Em_FechNa) as 
 Maximo from Empleados where Id_Emp=2
 select min(Empleados.Em_FechNa) as 
 Minimo from Empleados where Id_Emp=1

select sum(Libro.Id_Libro) as Existencias
 from Libro where Fech_Lanz='07-26-2001'
 select  max(Libro.Id_Libro) as 
 Maximo from Libro where Fech_Lanz='07-26-2001'
 select min(Libro.Id_Libro) as 
 Minimo from Libro where Fech_Lanz='07-26-2001'

 select sum(Alumnos.Id_Alum) as Revision
 from Alumnos where Alum_ApPat='Gonzales'
 select  max(Alumnos.Alum_FechNa) as 
 Maximo from Alumnos where Alum_ApPat='Gonzales'
 select min(Alumnos.Alum_FechNa) as 
 Minimo from Alumnos where Alum_ApPat='Gonzales'

select sum(Prestamos.Id_Pres) as Control
 from Prestamos where Entrega_FechNa='09-15-2017'
 select  max(Prestamos.Pres_FechNa) as 
 Maximo from Prestamos where Entrega_FechNa='09-15-2017'
 select min(Prestamos.Pres_FechNa) as 
 Minimo from Prestamos where Entrega_FechNa='09-15-2017'

 select sum(Renovaciones.Id_Renova) as Control_Renovaciones
 from Renovaciones where Renova_Fech='09-19-2017'
 select  max(Renovaciones.Renova_Fech) as 
 Maximo from Renovaciones where Renova_Fech='09-19-2017'
 select min(Renovaciones.Renova_Fech) as 
 Minimo from Renovaciones where Renova_Fech='09-19-2017'


 select SUM(Ejemplares.Id_Ejem) as Ejemplares
 from Ejemplares having sum(Ejemplares.Id_Ejem) > 8
select  max(Ejemplares.Id_Ejem) as 
 Maximo from Ejemplares having max(Ejemplares.Id_Ejem) > 2
 select min(Ejemplares.Id_Ejem) as 
 Minimo from Ejemplares having min(Ejemplares.Id_Ejem) > 4

  select sum(Empleados.Id_Emp) as Conteo
 from Empleados having sum(Empleados.Id_Puesto) > 1
 select  max(Empleados.Em_FechNa) as 
 Maximo from Empleados having max(Empleados.Id_Puesto) > 2
 select min(Empleados.Em_FechNa) as 
 Minimo from Empleados having min(Empleados.Id_Puesto) > 4

select sum(Libro.Id_Libro) as Existencias
 from Libro having sum(Libro.Id_Autor) > 1
 select  max(Libro.Id_Libro) as 
 Maximo from Libro having max(Libro.Id_Autor) > 1
 select min(Libro.Id_Libro) as 
 Minimo from Libro having min(Libro.Id_Autor) > 1

 select sum(Alumnos.Id_Alum) as Revision
 from Alumnos having sum(Alumnos.Alum_FechNa) > 1990
 select  max(Alumnos.Alum_FechNa) as 
 Maximo from Alumnos having max(Alumnos.Alum_FechNa) > 1990
 select min(Alumnos.Alum_FechNa) as 
 Minimo from Alumnos having min(Alumnos.Alum_FechNa) > 1990

select sum(Prestamos.Id_Pres) as Control
 from Prestamos having sum(Prestamos.Id_Libro) > 5
 select  max(Prestamos.Pres_FechNa) as 
 Maximo from Prestamos having max(Prestamos.Id_Libro) > 5
 select min(Prestamos.Pres_FechNa) as 
 Minimo from Prestamos having min(Prestamos.Id_Libro) > 5

 select sum(Renovaciones.Id_Renova) as Control_Renovaciones
 from Renovaciones having sum(Renovaciones.Renova_Fech) > '09-15-2017'
 select  max(Renovaciones.Renova_Fech) as 
 Maximo from Renovaciones having max(Renovaciones.Renova_Fech) > '09-15-2017'
 select min(Renovaciones.Renova_Fech) as 
 Minimo from Renovaciones having min(Renovaciones.Renova_Fech) > '09-15-2017'


 select top(10) percent
 Id_Emp, Nom_Emp, Em_ApPat from Empleados 
 order by Id_Emp;

 select top(10) percent
 Id_Alum, Alum_Nom, Alum_ApPat from Alumnos 
 order by Id_Alum;

 select top(10) percent
 Id_Libro, Lib_Nom, Id_Autor from Libro
 order by Id_Emp;

Go
Create View Empleados AS Select Id_Emp, Id_Puesto, Nom_emp,Em_ApPat  From Empleados
Go

Select * From Empleados

Go
Create View Libro AS Select Id_Libro, Lib_Nom, Id_Autor  From Libro
Go

Select * From Libro

Go
Create View Ejemplares AS Select Id_Libro, Id_Ejem, Id_Ubi  From Ejemplares
Go

Select * From Ejemplares

Go
Create View Autores AS Select Id_Autor, Aut_Nom, Aut_Ap  From Autores
Go

Select * From Autores

Go
Create View Prestamos AS Select Id_Pres, Id_Libro, Id_Alum  From Prestamos
Go

Select * From Prestamos

Go
Create View Renovacion AS Select Id_Renova, Id_Pres  From Renovacion
Go

Select * From Renovacion

Create procedure 
select Libro @Id_Libro int,
as begin
select a.Id_Libro from Ejemplares f
left join Libro a on a.Id_Libro = f.Id_Libro
where a.Id_Libro= @id_Libro
end

create trigger update Libro
on Libro
after update, delete
as
begin
select* from inserted
end

Create procedure 
select Ejemplares @Id_Ejem int,
as begin
select a.Id_Ejem from Prestamo f
left join Ejemplares a on a.Id_Ejem = f.Id_Ejem
where a.Id_Libro= @id_Libro
end

create trigger update Ejemplares
on Ejemplares
after update, delete
as
begin
select* from inserted
end