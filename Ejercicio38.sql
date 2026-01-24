--a

--d
SELECT * FROM personas 
--e
SELECT * FROM personas WHERE salario > 1500;
--f
SELECT * FROM personas WHERE apellido like %n% and funcion = 'conserje';
--g
SELECT * FROM personas WHERE funcion = 'Medico' and funcion = 'Director';
--h
SELECT * FROM personas WHERE funcion != 'Conserje' and salario > 1500;
--i
SELECT apellido, length(apellido) AS longitud_apellido FROM personas;
--j
SELECT * FROM personas WHERE cod_hospital IN (1,2) AND salario > 1500;
