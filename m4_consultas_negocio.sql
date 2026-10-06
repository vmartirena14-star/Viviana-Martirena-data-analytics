--Consulta 1 — Resumen ejecutivo mensual Total facturado, cantidad de pedidos y ticket promedio, 
--agrupados por mes. Calculá el total como cantidad * precio_unitario. 
--Usá alias descriptivos en español y agrupá por mes con EXTRACT(MONTH FROM fecha_venta).--

use Ventas_Tech_DB

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

--Consulta 2 — Ranking de productos Top 5 de id_producto por total facturado, mostrando las unidades vendidas 
--(SUM(cantidad)) y el total generado. Usá GROUP BY id_producto, ORDER BY y limitá el resultado a 5.--


SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;



-- Consulta Clientes recurrentes id_cliente que hayan realizado más de un pedido, mostrando la cantidad de 
--pedidos y el total gastado. Usá GROUP BY id_cliente y HAVING COUNT(*) > 1.--


SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC;

--Consulta 4 — Meses por encima/por debajo del promedio Total facturado por mes, con una columna 
--adicional que etiquete con CASE WHEN si ese mes quedó 'Por encima' o 'Por debajo' del promedio mensual general.


WITH facturacion_mensual AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > AVG(total_facturado) OVER ()
            THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;

--RESULTADOS DE LOS DATOS--

--En el mes 3 se realizaron 10 pedidos, alcanzando una facturación total de $6.444, con un ticket promedio de $644,40 por pedido.--
--El producto 1 tiene la mayor facturación del Top 5, facturando $3.600 con solo 3 unidades vendidas, comparado con la suma del 
--total general ($6084) de los cinco productos. Por otro lado, el producto 2 es el que más unidades vende con tun total de 13 
--unidades,pero es el que menos factura con un monto de $364. 
--Los cinco clientes recurrentes realizaron 2 pedidos cada uno, pero gastan distinto.El cliente 1 registra el mayor gasto, 
--con $2.640, frente al cliente 4 que gastó $510.
--La suma del gasto de los 5 clientes recurrentes es $6.444. Este monto es el mismo que aparece en la facturación total del mes 3, 
--por tanto podríamos conluir que toda la facturación provino de clientes que realizaron más de un pedido.
-- En resumen, el mes 3 quedó en primedio general facturando por debajo de los demás meses, con un total de $6444.00.--
