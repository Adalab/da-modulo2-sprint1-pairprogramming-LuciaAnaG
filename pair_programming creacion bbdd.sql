CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;

CREATE TABLE zapatillas (
	id_zapatilla INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    modelo VARCHAR(45) NOT NULL, 
    color VARCHAR(45) NOT NULL);
    
CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    nombre VARCHAR(45) NOT NULL,
    num_tlf INT(9) NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL, 
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    cp VARCHAR(45) NOT NULL);

CREATE TABLE empleados (
	id_empleado INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_inco DATE NOT NULL);   
    
CREATE TABLE facturas (
	id_factura INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    num_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla2 INT NOT NULL,
    CONSTRAINT fk_zapatilla_id_zapatilla2
		FOREIGN KEY (id_zapatilla2)
        REFERENCES zapatillas (id_zapatilla)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	id_empleado2 INT NOT NULL,
    CONSTRAINT fk_empleado_id_empleado2
		FOREIGN KEY (id_empleado2)
        REFERENCES empleados(id_empleado)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	id_cliente2 INT NOT NULL,
    CONSTRAINT fk_cliente_id_cliente2
		FOREIGN KEY (id_cliente2)
        REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE);
USE tienda_zapatillas;
ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL, 
ADD COLUMN talla INT NOT NULL;

ALTER TABLE empleados
MODIFY COLUMN salario FLOAT; 

ALTER TABLE clientes
DROP COLUMN pais;

ALTER TABLE facturas
ADD COLUMN total FLOAT;

INSERT INTO zapatillas (id_zapatilla, modelo, color, marca, talla)
VALUES (1, "XQYUN", "negro", "nike", 42), (2, "UOPMN", "rosa", "nike", 39), (3, "OPNYT","verdes", "adidas", 35);

INSERT INTO empleados (id_empleado, nombre, tienda, salario, fecha_inco)
VALUES (1, "Laura", "Alcobendas", 25987, '2010-09-03'), 
(2, "Maria", "Sevilla", NULL, '2011-04-11'),
(3, "Ester", "Oviedo", 30165.98, '2000-11-29');

INSERT INTO clientes (id_cliente, nombre, num_tlf, email, direccion,ciudad, provincia, cp)
VALUES (1, "Monica", 1234567289, "monica@email.com", "Calle Felicidad", "Móstoles", "Madrid", 28176),
(2, "Lorena", 289345678, "lorena@email.com", "Calle Alegria", "Barcelona", "Barcelona","12346"), 
(3, "Carmen", 298463759, "carmen@email.com", "Calle del Color", "Vigo", "Pontevedra", 23456);

INSERT INTO facturas (id_factura, num_factura, fecha, id_zapatilla2, id_empleado2, id_cliente2, total)
VALUES (1, 123, '2001-12-11',	1,	2,	1,	54.98), 
(2, 1234, '2005-05-23', 1, 1, 3, 89.91),
 (3, 12345, '2015-09-18', 2, 3, 3,	76.23);
 
UPDATE zapatillas
SET color = "amarillas"
WHERE color = "rosa";

UPDATE empleados
SET tienda = "A Coruña"
WHERE tienda = "Alcobendas";

UPDATE clientes
SET num_tlf = 123456728
WHERE num_tlf = 1234567289;

UPDATE facturas
SET total = 89.91
WHERE total = 76.23;



    
    
    
    