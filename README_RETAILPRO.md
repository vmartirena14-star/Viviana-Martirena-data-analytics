# RetailPro – Proyecto de Data Analytics

Documentación del análisis de negocio desarrollado para el proyecto **RetailPro**, como parte de las prácticas y entregas del curso de Data Analytics.

## 1. Objetivo del proyecto

Analizar información comercial y de ventas para transformar los datos en indicadores que permitan comprender el desempeño del negocio y apoyar la toma de decisiones.

El análisis contempla:

- Evolución de la facturación a lo largo del tiempo.
- Rendimiento de los productos según unidades vendidas e ingresos generados.
- Comportamiento de compra y recurrencia de los clientes.
- Comparación de los resultados mensuales con el promedio del período.

Este documento describe específicamente el ejercicio de consultas de negocio del módulo 4.

## 2. Herramientas utilizadas

- **Microsoft SQL Server:** motor de base de datos utilizado para ejecutar las consultas.
- **Transact-SQL (T-SQL):** lenguaje utilizado para consultar, agrupar y analizar los datos.
- **SQL Server Management Studio (SSMS):** entorno para conectarse a SQL Server, abrir los archivos `.sql` y ejecutar las consultas.
- **GitHub:** plataforma de almacenamiento y control de versiones del proyecto.
- **Power BI:** herramienta de visualización para explorar y presentar indicadores del proyecto RetailPro.

## 3. Archivo SQL

| Archivo | Descripción |
| --- | --- |
| [m4_consultas_negocio.sql](./m4_consultas_negocio.sql) | Consultas SQL para analizar facturación mensual, productos, clientes recurrentes y comparación contra el promedio. |

## 4. Consultas desarrolladas

El script contiene cuatro consultas principales:

### Consulta 1. Resumen ejecutivo mensual

Calcula, para cada mes:

- Total facturado: suma de `cantidad * precio_unitario`.
- Cantidad de pedidos: conteo de registros.
- Ticket promedio: promedio del importe calculado por registro.

Se utilizan funciones de agregación como `SUM()`, `COUNT()` y `AVG()`, junto con `GROUP BY` y `ORDER BY`.

### Consulta 2. Ranking de los cinco productos con mayor facturación

Identifica los cinco productos que generan mayores ingresos y muestra:

- Identificador del producto.
- Unidades vendidas.
- Total facturado.

Se utilizan `SUM()`, `GROUP BY`, `ORDER BY` y `TOP 5`.

### Consulta 3. Clientes recurrentes

Identifica los clientes que realizaron más de un pedido e informa:

- Identificador del cliente.
- Cantidad de pedidos.
- Total gastado.

Se utilizan `COUNT()`, `SUM()`, `GROUP BY` y `HAVING COUNT(*) > 1`.

### Consulta 4. Comparación de facturación mensual con el promedio

Compara el total facturado por mes con el promedio general de facturación mensual. Clasifica cada mes mediante las etiquetas **Por encima** o **Por debajo**.

Se utilizan una expresión de tabla común (CTE), la función de ventana `AVG() OVER()` y la estructura condicional `CASE WHEN`.

## 5. Base de datos y requisitos

El script está preparado para **Microsoft SQL Server** y utiliza la base de datos:

```sql
Ventas_Tech_DB
```

La tabla `ventas` debe existir y contener, al menos, las siguientes columnas:

- `fecha_venta`
- `cantidad`
- `precio_unitario`
- `id_producto`
- `id_cliente`

**Importante:** el archivo contiene consultas sobre una base de datos existente. No crea la base de datos ni importa o carga registros. Si la base tiene otro nombre, modificá la instrucción `USE Ventas_Tech_DB` antes de ejecutar el script.

## 6. Cómo ejecutar el script SQL

1. Abrí **SQL Server Management Studio (SSMS)**.
2. Conectate a la instancia de SQL Server donde se encuentra la base de datos.
3. Descargá o cloná el repositorio en tu equipo.
4. En SSMS, seleccioná **File → Open → File** y abrí `m4_consultas_negocio.sql`.
5. Verificá que la instrucción `USE Ventas_Tech_DB` corresponda a la base de datos que querés consultar.
6. Presioná **F5** o seleccioná **Execute** para ejecutar el script.
7. Consultá los resultados en la pestaña **Results**.

También podés seleccionar y ejecutar cada bloque `SELECT` por separado para revisar individualmente los resultados de cada análisis.

## 7. Resultados de referencia

De acuerdo con las anotaciones del ejercicio incluidas en el script:

- En el mes 3 se registraron 10 pedidos, con una facturación total de $6.444 y un ticket promedio de $644,40.
- El producto 1 encabeza el ranking por facturación.
- El producto 2 registra el mayor volumen de unidades vendidas entre los productos destacados.
- Se identifican cinco clientes recurrentes, cada uno con dos pedidos.

Los resultados corresponden a los datos utilizados durante el ejercicio y pueden variar si se modifica la información de la base de datos.

## 8. Consideraciones técnicas

- El importe de cada registro se calcula como `cantidad * precio_unitario`.
- `COUNT(*)` cuenta filas de la tabla `ventas`; no necesariamente pedidos únicos si un pedido puede ocupar varias filas.
- La consulta mensual agrupa por `MONTH(fecha_venta)`. Si existen registros de más de un año, los mismos meses de distintos años se agrupan juntos. Para un análisis interanual, se debería incluir también el año.
- En la clasificación de la consulta 4, los meses cuyo total sea igual al promedio quedan etiquetados como **Por debajo**, porque la condición evalúa si el total es estrictamente mayor que el promedio.

## 9. Autora

Proyecto de práctica de **Data Analytics – RetailPro**.
