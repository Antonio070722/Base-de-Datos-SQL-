CREATE DATABASE GESTION;
USE GESTION;

CREATE TABLE comercial (
    id INT(10) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    ciudad VARCHAR(100),
    comisión FLOAT
);

CREATE TABLE cliente (
    id INT(10) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    ciudad VARCHAR(100),
    categoría INT(10)
);

CREATE TABLE pedido (
    id INT(10) PRIMARY KEY,
    cantidad DOUBLE,
    fecha DATE,
    id_cliente INT(10),
    id_comercial INT(10),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

-- Inserción de clientes
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoría) VALUES
(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100),
(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200),
(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL),
(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300),
(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200),
(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100),
(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300),
(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200),
(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225),
(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

-- Inserción de comerciales (se asigna NULL a ciudad porque no se proporcionó)
INSERT INTO comercial (id, nombre, apellido1, apellido2, ciudad, comisión) VALUES
(1, 'Daniel', 'Sáez', 'Vega', NULL, 0.15),
(2, 'Juan', 'Gómez', 'López', NULL, 0.13),
(3, 'Diego', 'Flores', 'Salas', NULL, 0.11),
(4, 'Marta', 'Herrera', 'Gil', NULL, 0.14),
(5, 'Antonio', 'Carretero', 'Ortega', NULL, 0.12),
(6, 'Manuel', 'Domínguez', 'Hernández', NULL, 0.13),
(7, 'Antonio', 'Vega', 'Hernández', NULL, 0.11),
(8, 'Alfredo', 'Ruiz', 'Flores', NULL, 0.05);

-- Inserción de pedidos
INSERT INTO pedido (id, cantidad, fecha, id_cliente, id_comercial) VALUES
(1, 150.5, '2017-10-05', 5, 2),
(2, 270.65, '2016-09-10', 1, 5),
(3, 65.26, '2017-10-05', 2, 1),
(4, 110.5, '2016-08-17', 8, 3),
(5, 948.5, '2017-09-10', 5, 2),
(6, 2400.6, '2016-07-27', 7, 1),
(7, 5760, '2015-09-10', 2, 1),
(8, 1983.43, '2017-10-10', 4, 6),
(9, 2480.4, '2016-10-10', 8, 3),
(10, 250.45, '2015-06-27', 8, 2),
(11, 75.29, '2016-08-17', 3, 7),
(12, 3045.6, '2017-04-25', 2, 1),
(13, 545.75, '2019-01-25', 6, 1),
(14, 145.82, '2017-02-02', 6, 1),
(15, 370.85, '2019-03-11', 1, 5),
(16, 2389.23, '2019-03-11', 1, 5);

--1.3.2 Consultas multitabla pdf unidad 5
-- 4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los
--    datos de los comerciales asociados a cada pedido.
SELECT *
FROM cliente
LEFT JOIN pedido ON cliente.id = pedido.id_cliente
LEFT JOIN comercial ON pedido.id_comercial = comercial.id;

-- 5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad
--    esté entre 300 € y 1000 €.
SELECT DISTINCT c.*
FROM cliente c, pedido p
WHERE c.id = p.id_cliente
    AND p.fecha like '2017%';

-- 6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado
--    por María Santana Moreno.
-- 6. Nombre y apellidos de los comerciales que participaron en pedidos de María Santana Moreno
-- Versión básica (sin JOIN explícito)
SELECT DISTINCT comercial.nombre, comercial.apellido1, comercial.apellido2
FROM comercial, pedido, cliente
WHERE comercial.id = pedido.id_comercial
  AND pedido.id_cliente = cliente.id
  AND cliente.nombre = 'María'
  AND cliente.apellido1 = 'Santana'
  AND cliente.apellido2 = 'Moreno';

-- 7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez
--    Vega.
SELECT DISTINCT cliente.nombre, cliente.apellido1, cliente.apellido2
FROM cliente, pedido, comercial
WHERE cliente.id = pedido.id_cliente
  AND pedido.id_comercial = comercial.id
  AND comercial.nombre = 'Daniel'
  AND comercial.apellido1 = 'Sáez'
  AND comercial.apellido2 = 'Vega';

-- 1.3.3 Consultas multitabla (Composición externa)
--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
--1. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado
--alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
SELECT * FROM cliente c
LEFT JOIN pedido p
    ON c.id = p.id_cliente
ORDER BY c.apellido1, c.apellido2, c.nombre;

-- 2. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este
--listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar
--ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
SELECT *
FROM comercial
LEFT JOIN pedido 
    ON comercial.id = pedido.id_comercial
ORDER BY comercial.apellido1, comercial.apellido2, comercial.nombre;


-- 1.3.4 
-- 1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(cantidad) AS total_pedidos 
FROM pedido;
-- 2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(cantidad) AS media_pedidos 
FROM pedido;
-- 3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(DISTINCT id_comercial) 
as comerciales
from pedido;
-- 4. Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(*) 
AS total_clientes 
FROM cliente;
-- 5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(cantidad)
as maximo
from pedido;
-- 6. Calcula cuál es la menor cantidad que aparece en la tabla pedido
SELECT MIN(cantidad)
as minimo
from pedido;
-- 7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla
-- cliente.
SELECT ciudad, MAX(categoría) as categoria_maxima
from cliente
group by ciudad;
-- 9
SELECT id_cliente, fecha, MAX(total) as max_cantidad
from cliente
GROUP BY id_cliente_ fecha
HAVING MAX(cantidad) > 2000;

--10
select max(total), id, nombre, apellidos
from comercial join pedido on comercial.id = pedido.id_comercial
where pedido fecha = '2016-08-17'
group by comercial.id, fecha;

