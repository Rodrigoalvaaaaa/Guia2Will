DROP DATABASE coffeeshop;
CREATE DATABASE coffeeshop;
USE coffeeshop;

SELECT c.nombre_cliente
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente;

SELECT *
FROM pedido
WHERE fecha_registro BETWEEN '2024-01-01' AND '2024-09-12';

SELECT nombre_cliente, nacimiento_cliente
FROM cliente
ORDER BY nacimiento_cliente DESC;

SELECT p.nombre_producto
FROM producto p
INNER JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
WHERE dp.id_pedido = 2;

SELECT nombre_producto, precio_producto
FROM producto
WHERE precio_producto = (SELECT MAX(precio_producto) FROM producto);

SELECT AVG(precio_producto) AS promedio_precios
FROM producto;

SELECT estado_pedido, COUNT(*) AS cantidad_pedidos
FROM pedido
GROUP BY estado_pedido;

SELECT nombre_cliente
FROM cliente
WHERE nombre_cliente LIKE 'D%';

SELECT c.nombre_cliente, COUNT(*) AS cantidad_ordenes
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE p.fecha_registro BETWEEN '2024-01-01' AND '2024-09-12'
GROUP BY c.id_cliente
ORDER BY cantidad_ordenes DESC;

SELECT p.nombre_producto, SUM(dp.cantidad_producto) AS total_vendido
FROM producto p
INNER JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
GROUP BY p.id_producto
ORDER BY total_vendido DESC
LIMIT 3;

SELECT c.nombre_cliente, COUNT(*) AS cantidad_pedidos
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente
ORDER BY cantidad_pedidos DESC
LIMIT 1;

SELECT c.nombre_cliente, pr.nombre_producto, dp.cantidad_producto, pr.precio_producto, p.direccion_pedido, p.estado_pedido
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
INNER JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
INNER JOIN producto pr ON dp.id_producto = pr.id_producto;