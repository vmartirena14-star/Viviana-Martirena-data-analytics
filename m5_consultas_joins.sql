--Consulta 1 —  (INNER JOIN)
--Combiná con INNER JOIN tu tabla de ventas con las tablas descriptivas que hayas modelado 
--Sumá además las columnas descriptivas que existan en tu propio esquema (por ejemplo segmento de cliente, categoría de 
--producto o región, si las modelaste). 
--Si tu esquema no tiene ninguna dimensión geográfica ni de segmentación, agregala ahora al script del Módulo 3 
--con dos o tres registros de ejemplo. (Tiene la columna Ciudad)


SELECT
    v.Fecha_Venta AS Fecha,
    c.ID_Cliente AS Id_Cliente,
    c.Nombre AS Cliente,
    c.Ciudad,
    p.nombre_producto AS Producto,
    cat.nombre_categoria AS Categoria,
    v.Cantidad,
    v.Precio_unitario AS Precio_Unitario,
    v.Cantidad * v.Precio_unitario AS Total_Venta
FROM ventas v
INNER JOIN clientes c
    ON v.ID_Cliente = c.ID_Cliente
INNER JOIN productos p
    ON v.ID_Producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.Fecha_Venta;


--Consulta 2 — Clientes sin ventas (LEFT JOIN) Identificá clientes registrados que aún no han realizado ninguna compra. 
--Mostrá su nombre, email y fecha de registro. Usá WHERE ... IS NULL para aislar los casos.--


SELECT
    c.ID_CLIENTE,
    c.Nombre,
    c.Email,
    c.Fecha_Registro
FROM clientes c
LEFT JOIN ventas v
    ON c.ID_CLIENTE = v.id_cliente
WHERE v.id_venta IS NULL;


--Verificación Consulta 2--Respuesta: No me aparecen registros de clientes que no tengan ventas; 
--validé con Tabla Ventas y no hay clientes en esas condiciones.Si agregué nombre, email y fecha de 
--registro en la verificación--

SELECT
    c.ID_CLIENTE,
    c.Nombre,
    c.Email,
    c.Fecha_Registro,
    COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c
LEFT JOIN ventas v
    ON c.ID_CLIENTE = v.id_cliente
GROUP BY
    c.ID_CLIENTE,
    c.Nombre,
    c.Email,
    c.Fecha_Registro
ORDER BY c.ID_CLIENTE;

--Consulta 3: Productos sin ventas (LEFT JOIN) Identificá productos del catálogo que no 
--tienen ninguna venta registrada. Mostrá nombre del producto, categoría y precio. Usá WHERE ... IS NULL.

SELECT
    p.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;


--Verificación Consulta 3--

SELECT
    p.id_producto,
    p.nombre_producto,
    COUNT(v.id_venta) AS cantidad_ventas
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
GROUP BY
    p.id_producto,
    p.nombre_producto
ORDER BY p.id_producto;


--Consulta 4.Consolidado por canal (UNION ALL)--


SELECT
    canal,
    SUM(total) AS total_por_origen
FROM (SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Primer semestre' AS canal
    FROM ventas
    WHERE MONTH(fecha_venta) BETWEEN 1 AND 6

    UNION ALL

    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Segundo semestre' AS canal
    FROM ventas
    WHERE MONTH(fecha_venta) BETWEEN 7 AND 12)
	AS consolidado
GROUP BY canal;

