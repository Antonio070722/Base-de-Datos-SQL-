--a
SELECT * FROM empleados ORDER BY Apellido ASC;
--b
SELECT * FROM empleados ORDER BY no_DPTO DESC;
--c
SELECT * FROM empleados WHERE salario > 2000;
--d
SELECT * FROM empleados WHERE oficio = 'Vendedor' ORDER BY apelido ASC;
--e
SELECT * FROM empleados WHERE no_DPTO=20 AND oficio='Empleado' ORDER BY apellido ASC;
--f
SELECT * FROM empleados WHERE apellido LIKE 'A%';
--g
SELECT apellido FROM empleados WHERE COMISION IS NULL AND apellido LIKE 'J%';
--h
SELECT apellidos FROM empleados WHERE oficio='VENDEDOR' OR oficio='ANALISTA' OR oficio='EMPLEADO';
--i
SELECT apellido n_empleado FROM empleados WHERE salario NOT BETWEEN 1000 AND 2000;
--j
SELECT LOWER(apellido) AS  apellido_minusculas FROM empleados;