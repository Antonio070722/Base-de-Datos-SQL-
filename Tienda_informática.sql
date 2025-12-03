CREATE DATABASE TiendaInformatica
USE TiendaInformatica
SHOW tables;
CREATE TABLE FABRICANTE(
    codigo_F int PRIMARY KEY,
    nombre VARCHAR (100) not null
)

CREATE TABLE PRODUCTO(
    codigo int PRIMARY KEY,
    nombre VARCHAR (100),
    precio double,
    cod_fab int,
    FOREIGN KEY (cod_fab) REFERENCES FABRICANTE(codigo_F)
);

INSERT INTO FABRICANTE(codigo_F, nombre) 
VALUES
    (1, 'Asus'),
    (2, 'Lenovo'),
    (3, 'HP'),
    (4, 'Samsung'),
    (5, 'Seagate'),
    (6, 'Crucial'),
    (7, 'Gigabyte');

INSERT INTO PRODUCTO(codigo, nombre, precio, cod_fab)
VALUES
	(1, 'Disco Duro', 86.99, 5),
    (2, 'Memoria Ram', 120, 6),
    (3, 'Disco SSD', 150.99, 4),
    (4, 'GeForce', 185, 7),
    (5, 'Monitor', 202, 1),
    (6, 'Portátil', 505, 2),
    (7, 'Impresora', 59.99, 3);

select* from PRODUCTO;

--Elminia los productos que suministra el fabricante de codigo 1
DELETE FROM DEPARTAMENTO WHERE codigo_F = 1;
--Rebaja
UPDATE PRODUCTO SET PRECIO = PRECIO*0.8
--Actualizar codigo de fabricante
UPDATE PRODUCTO SET cod_fab = 4 WHERE NOMBRE='IMPRESORA';