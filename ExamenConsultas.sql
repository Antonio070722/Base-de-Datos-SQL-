/* -------------------------------------------------
   Creación de la tabla (solo si todavía no existe)
   ------------------------------------------------- */
DROP TABLE IF EXISTS empleados;   -- elimina la tabla previa para evitar conflictos
CREATE DATABASE EXAMEN;
USE EXAMEN;

CREATE TABLE empleados (
    id            INT PRIMARY KEY,
    nombre        VARCHAR(50) NOT NULL,
    apellido      VARCHAR(50) NOT NULL,
    edad          INT,
    salario       DECIMAL(10,2),
    departamento  VARCHAR(30),
    fecha_ingreso DATE,
    activo        BOOLEAN
);

/* -------------------------------------------------
   Inserción de 10 registros de ejemplo
   ------------------------------------------------- */
INSERT INTO empleados (id, nombre, apellido, edad, salario, departamento, fecha_ingreso, activo) VALUES
(1,  'Ana',      'Pérez',        28, 3500.00, 'Ventas',               '2020-03-15', TRUE ),
(2,  'Luis',     'Gómez',        45, 6200.00, 'IT',                   '2015-07-01', TRUE ),
(3,  'Marta',    'Ruiz',         33, 4800.00, 'Finanzas',             '2018-11-20', FALSE),
(4,  'Jorge',    'García',       39, 5400.00, 'Recursos Humanos',    '2019-02-10', TRUE ),
(5,  'Laura',    'González',     26, 3100.00, 'Ventas',               '2021-06-05', TRUE ),
(6,  'Pedro',    'López',        52, 7200.00, 'IT',                   '2012-09-18', FALSE),
(7,  'Silvia',   'Martínez',     31, 2900.00, 'Marketing',            NULL,         TRUE ),   -- fecha NULL
(8,  'Carlos',   'Giménez',      44, 4100.00, 'Finanzas',             '2016-04-22', TRUE ),
(9,  'Elena',    'Sánchez',      29, 3800.00, 'Ventas',               '2022-01-12', FALSE),
(10, 'Roberto',  'Núñez',        38, 5600.00, 'IT',                   '2017-08-30', TRUE );

--1. Muestra el nombre completo (concatenando nombre y apellido con un espacio) y el salario anual
--(salario × 12). Renombra esas columnas como nombre_completo y salario_anual. (1 punto)
SELECT concat(nombre, ' ', apellido) as 'nombre_completo',
salario*12 as 'salario_anual'
from empleados;
--2. Obtén la edad promedio de los empleados del departamento de “Finanzas”. (1 punto)
SELECT AVG(edad)
from empleados
where departamento = 'Finanzas';
--3. Lista los diferentes departamentos que existen en la tabla, sin repetir ninguno. (1 punto)
SELECT DISTINCT departamento
from empleados;
--4. Ordena a todos los empleados primero por fecha_ingreso de más reciente a más antiguo y luego
--por apellido alfabéticamente. Incluye id, nombre, apellido y fecha_ingreso. (1 punto)
SELECT id, nombre, apellido, fecha_ingreso
from empleados
order by fecha_ingreso DESC, apellido;
--5. Muestra los cinco empleados con mayor salario. Incluye id, nombre, apellido y salario. (1 punto)
SELECT id, nombre, apellido, salario
from empleados
Order by salario DESC
LIMIT 5;
--6. Selecciona los empleados cuyo salario esté entre 3000 y 5000 (inclusive) y cuya edad sea mayor
--que 30. (1 punto)
SELECT *
from empleados
where salario >= 3000 and salario <= 5000
and edad > 30;
--7. Encuentra a los empleados cuyo apellido empiece por “G”. Muestra id, nombre y apellido. (1
--punto)
select id, nombre, apellido
from empleados
where apellido like 'G%';
--8. Obtén los empleados que pertenezcan a los departamentos “IT”, “Finanzas” o “Recursos
--Humanos”. (1 punto)
select *
from empleados
where departamento in ('IT', 'Finanzas', 'Recursos Humanos');
--9. Lista los empleados cuya edad no esté comprendida entre 18 y 30 o cuyo campo fecha_ingreso
--sea NULL. (1 punto)
select *
from empleados
where edad not between 18 and 30
or fecha_ingreso is null;
--10. Calcula el incremento de salario del último año (supón que el salario actual es el nuevo valor).
--Usa un alias llamado incremento. Muestra id, nombre, salario y incremento (del 5 %). Para calcular
--el incremento usa la siguiente fórmula: salario_actual - salario_actual ÷ 1.05 (1 punto)
select id, nombre, salario,
salario - salario / 1.05 as incremento
from empleados;
