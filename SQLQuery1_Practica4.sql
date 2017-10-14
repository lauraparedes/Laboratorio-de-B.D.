create database BDSabado

create table Libro(Id_libro int not null,
Nom_libro varchar (50),
Nombre_genero varchar (25),
Nom_autor varchar (25),
Nom_editorial varchar (25),
Fecha_lanz datetime)

insert into Libro values (11519, 'Carrie', 'Terror', 'Stephen King', 'Debolsillo', '1973')
insert into Libro values (11318, 'El Resplandor', 'Terror', 'Stephen King', 'Plaza n Janes', '1978')
insert into Libro values (11420, 'La Naranja Mecanica', 'Ciencia Ficcion', 'Anthony Burges', 'Planeta', '1963')
insert into Libro values (12521, '1984', 'Ciencia Ficcion', 'George Orwell', 'Oceano', '1961')
insert into Libro values (12524, 'Joyland', 'Thriller', 'Stephen King', 'Debolsillo', '2014')

create table Autor(Id_autor int not null,
Nom_autor varchar (50),
Nac_autor varchar (20))

insert into Autor values (1152517, 'Stephen King', 'EEUU')
insert into Autor values (1152618, 'George Orwell', 'UK')
insert into Autor values (1152719, 'Anthony Burges', 'UK')

create table Genero (Id_genero int not null,
Nom_genero varchar (50))

insert into Genero values (100, 'Terror')
insert into Genero values (200, 'Ciencia Ficcion')
insert into Genero values (300, 'Thriller')

create table Editorial (Id_editorial int not null,
Nom_editorial varchar (50))

insert into Editorial values (3043, 'Debolsillo')
insert into Editorial values (3044, 'Plaza n Janes')
insert into Editorial values (3045, 'Oceano')
insert into Editorial values (3046, 'Planeta')

UPDATE Autor
SET Nom_autor = 'Lewis Caroll', Nac_autor = 'UK'
WHERE Id_autor = 1152719

UPDATE Autor
SET Nom_autor = 'JK Rowling', Nac_autor = 'UK'
WHERE Id_autor = 1152618

UPDATE Libro
SET Nom_libro = 'Alicia en el pais de las maravillas', Nombre_genero = 'Fantasia'
WHERE Id_libro = 11420

UPDATE Libro
SET Nom_libro = 'Fantastic Beasts', Nombre_genero = 'Ciencia Ficcion'
WHERE Id_libro = 12521

UPDATE Editorial
SET Nom_editorial = 'Proceso'
WHERE Id_editorial = 3044

DELETE FROM Editorial
WHERE Nom_editorial = 'Proceso';

DELETE FROM Editorial
WHERE Nom_editorial = 'Planeta';

DELETE FROM Editorial
WHERE Nom_editorial = 'Oceano';

DELETE FROM Libro
WHERE Nom_libro = 'Alicia en el pais de las maravillas';

DELETE FROM Autor
WHERE Nom_autor = 'JK Rowling';
