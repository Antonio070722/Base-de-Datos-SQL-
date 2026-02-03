CREATE DATABASE tienda;
USE tienda;

CREATE TABLE fabricante (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
codigo_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

--1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre, p.precio, f.nombre
FROM PRODUCTO P, FABRICANTE F
WHERE p.codigo_fabricante = f.codigo;
--2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de
--la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, f.nombre
FROM PRODUCTO P, FABRICANTE F
WHERE p.codigo_fabricante = f.codigo
ORDER BY f.nombre;
--3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del
--fabricante, de todos los productos de la base de datos.
SELECT p.codigo, p.nombre, f.codigo, f.nombre
FROM PRODUCTO p, FABRICANTE f
WHERE p.codigo_fabricante = f.codigo;
--4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre, p.precio, f.nombre
FROM PRODUCTO p, FABRICANTE f
WHERE 
--5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre, p.precio, f.nombre
FROM PRODUCTO p, FABRICANTE f
WHERE p.codigo_fabricante = f.codigo AND p.precio = (SELECT MAX(precio) FROM PRODUCTO);
--6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT p.nombre, p.precio, f.nombre
FROM producto p, fabricante f
WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo';
--7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT p.*
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus'
OR f.nombre = 'Hewlett-Packard'
OR f.nombre = 'Seagate';
--8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin
--utilizar el operador IN.




--1.1.3
--Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que
----tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos
--asociados.
SELECT f.codigo, f.nombre as fabricante,
p.codigo, p.nombre as producto, p.precio
from fabricante f
left join producto p
on f.codigo = p.codigo_fabricante;

--2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.codigo, f.nombre from fabricante f 
left join producto p
on f.codigo = p.codigo_fabricante
where p.codigo is null;



--9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) as suma_precios FROM producto;

--10. Calcula el número de productos que tiene el fabricante Asus.

--11. Calcula la media del precio de todos los productos del fabricante Asus.

--12. Calcula el precio más barato de todos los productos del fabricante Asus.

--13. Calcula el precio más caro de todos los productos del fabricante Asus.

