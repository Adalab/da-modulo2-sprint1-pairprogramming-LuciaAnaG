CREATE SCHEMA `northwind`;
USE `northwind`;

-- Conociendo empleados

SELECT employee_id, last_name, first_name
FROM employees;

-- Conociendo los productos más baratos

SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price BETWEEN 0 AND 5;

-- Conociendo los productos que no tienen precio

SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price = NULL;

-- Comparando productos

SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price < 15
AND product_id <10;

-- Cambiando operadores

SELECT product_id, product_name, unit_price
FROM products
WHERE NOT unit_price <= 15
AND NOT product_id <= 10;

-- Conociendo los paises que vendemos

SELECT DISTINCT ship_country
FROM orders;

-- Conociendo el tipo de productos que vendemos en Northwind

SELECT product_id, product_name, unit_price
FROM products
WHERE product_id <=10
LIMIT 10;

-- Ordenando los resultados

SELECT product_id, product_name, unit_price
FROM products
WHERE product_id 
ORDER BY product_id DESC 
LIMIT 10;

-- Que pedidos tenemos en nuestra BBDD

SELECT DISTINCT order_id
FROM order_details;

-- Qué pedidos han gastado más

SELECT order_id, product_id, unit_price, quantity, unit_price*quantity AS ImporteTotal
FROM order_details
ORDER BY ImporteTotal DESC
LIMIT 3;

-- Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking
SELECT order_id, unit_price*quantity AS ImporteTotal
FROM order_details
ORDER BY ImporteTotal DESC
LIMIT 5
OFFSET 4;

-- Qué categorías tenemos en nuestra BBDD

SELECT categories_name AS NombreDeCategoria
FROM categories;

-- Selecciona envios con retraso



-- Selecciona los productos más rentables

SELECT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 15 AND 50;


-- Selecciona los productos con unos precios dados
SELECT product_name, unit_price
FROM products
WHERE unit_price IN (18, 19, 20);
