--a
SELECT AVG(precio) FROM productos;
--b
SELECT COUNT(*) FROM productos WHERE precio >= 180;
--c
SELECT nombre, precio FROM productos WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;
--d
SELECT nombre FROM fabricantes WHERE id IN (SELECT fabricante_id FROM productos GROUP BY fabricante_id HAVING AVG(precio) >= 150);
--e
INSERT INTO productos (nombre, precio, fabricante_id) VALUES ('Altavoces', 70, 2);
--f
UPDATE productos SET nombre = 'Impresora Láser' WHERE id = 8;
--g
UPDATE productos SET precio = precio * 0.9;
