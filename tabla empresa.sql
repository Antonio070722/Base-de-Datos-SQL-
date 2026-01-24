DROP DATABASE IF EXISTS EMPRESA;
CREATE DATABASE EMPRESA;
USE EMPRESA;

CREATE TABLE DEPARTAMENTO(
    codDpto decimal(4,0) PRIMARY KEY, 
    nombreDpto varchar(20) not null,
    ciudad varchar(30),
    director varchar(30)
);

CREATE TABLE EMPLEADO(
    codEmp decimal(8,0) PRIMARY KEY,
    nomEmp varchar(20) not null,
    sexEmpl varchar(1) CHECK (sexEmpl IN ('M','F')),
    fecNac date,
    fecIncorporacion date,
    salEmp int CHECK (salEmp>0),
    comis float,
    cargo varchar(30),
    NroDpto decimal(4,0),
    FOREIGN KEY (NroDpto) REFERENCES DEPARTAMENTO(codDpto)
);

show tables;
describe EMPLEADO;

INSERT INTO DEPARTAMENTO (codDpto, nombreDpto, ciudad, director)
VALUES 
    (1000, 'Gerencia', 'Madrid', '32.526.220'),
    (2000, 'Produccion', 'Madrid', '16.215.250'),
    (2500, 'Ventas', 'Barcelona', '20.648.351'),
    (3000, 'Investigacion', 'Barcelona', '75.745.745'),
    (4000, 'Ventas', 'Sevilla', '14.142.142'),
    (4500, 'Investigacion', 'Sevilla', '36.361.361');

INSERT INTO EMPLEADO  (codEmp, nomEmp, sexEmpl, fecNac, fecIncorporacion, salEmp, comis, cargo, NroDpto)
VALUES
    (31840269, 'Maria Rojas', 'F', '1985-01-15', '2000-05-16', 1500, 200, 'Gerente', 1000),
    (74758963, 'Juan Martin', 'M', '1980-04-23', '2019-04-29', 1000, 50, 'Comercial', 2500),
    (96963963, 'Pepe Viciana', 'M', '2000-05-25', '2019-01-04', 2500, 0, 'Cientifico', 3000),
    (58582582, 'Maria Jose Sanchez', 'F', '1990-10-10', '2005-01-15', 5000, 400, 'Gerente', 1000),
    (74741741, 'Laura Pastor', 'F', '1986-05-25', '2009-04-20', 3000, 350, 'At. Cliente', 2500);

UPDATE EMPLEADO
SET fecIncorporacion = '2001-05-15'
WHERE codEmp = 31840269;

select * from EMPLEADO;

UPDATE EMPLEADO
SET salEmp = salEmp+(salEmp*0.10)
WHERE cargo = Gerente;

UPDATE EMPLEADO
SET comis = comis+50
WHERE sexEmpl='F';