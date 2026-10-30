# RetailPro – Data Analytics

Repositorio de prácticas y entregas del proyecto de análisis de datos **RetailPro**. El objetivo es explorar información comercial y de ventas para convertir los datos en indicadores que ayuden a comprender el desempeño del negocio y apoyar la toma de decisiones.

## Objetivo del proyecto

Analizar el comportamiento de las ventas desde distintas perspectivas, por ejemplo:

- Evolución de la facturación a lo largo del tiempo.
- Rendimiento de los productos según unidades vendidas e ingresos generados.
- Comportamiento de compra y recurrencia de los clientes.
- Comparación de los resultados mensuales con el promedio del período.

El análisis SQL documentado en este repositorio corresponde al ejercicio de consultas de negocio del módulo 4.

## Herramientas utilizadas

- **SQL Server:** motor de base de datos utilizado para ejecutar las consultas.
- **Transact-SQL (T-SQL):** lenguaje utilizado para consultar, agrupar y analizar los datos.
- **SQL Server Management Studio (SSMS):** entorno recomendado para conectarse a SQL Server, abrir los archivos `.sql` y ejecutar las consultas.
- **GitHub:** control de versiones y publicación de los scripts y entregas del proyecto.
- **Power BI:** herramienta de visualización considerada para la presentación y exploración de indicadores del proyecto RetailPro.

## Contenido del repositorio

| Archivo | Descripción |
| --- | --- |
| [m4_consultas_negocio.sql](./m4_consultas_negocio.sql) | Consultas SQL para analizar facturación mensual, productos, clientes recurrentes y comparación contra el promedio. |

## Consultas incluidas

El archivo `m4_consultas_negocio.sql` contiene cuatro bloques principales:

1. **Resumen ejecutivo mensual:** calcula el total facturado (`cantidad × precio_unitario`), la cantidad de registros de pedidos y el ticket promedio, agrupados por mes.
2. **Ranking de productos:** obtiene los cinco productos con mayor facturación e informa las unidades vendidas y el total generado.
3. **Clientes recurrentes:** identifica los clientes con más de un pedido y calcula su cantidad de pedidos y gasto acumulado.
4. **Comparación con el promedio mensual:** utiliza una CTE, la función de ventana `AVG() OVER()` y `CASE WHEN` para clasificar cada mes según su facturación frente al promedio mensual.

## Base de datos y requisitos

El script está escrito para **Microsoft SQL Server** y hace referencia a la base de datos:

```sql
Ventas_Tech_DB
```

Antes de ejecutarlo, verificá que:

- SQL Server esté instalado y en funcionamiento, y que tengas acceso a una instancia.
- La base de datos `Ventas_Tech_DB` exista en esa instancia.
- Exista una tabla `ventas` con, al menos, las columnas:
  - `fecha_venta`
  - `cantidad`
  - `precio_unitario`
  - `id_producto`
  - `id_cliente`

> **Importante:** el script consulta una base de datos existente; no crea la base ni carga datos. Si tu instancia utiliza otro nombre de base de datos, ajustá la instrucción `USE Ventas_Tech_DB` antes de ejecutar.

## Cómo ejecutar los scripts SQL

1. Abrí **SQL Server Management Studio (SSMS)** y conectate a la instancia de SQL Server donde se encuentra la base de datos.
2. Descargá o cloná este repositorio, o abrí directamente el archivo `m4_consultas_negocio.sql` desde tu copia local.
3. En SSMS, seleccioná **File → Open → File** y abrí `m4_consultas_negocio.sql`.
4. Verificá que la instrucción `USE Ventas_Tech_DB` apunte a la base de datos correcta.
5. Ejecutá el script con **Execute** o presionando **F5**.
6. Revisá los resultados en la pestaña **Results**. Cada bloque `SELECT` devuelve una grilla independiente.

También podés ejecutar cada consulta por separado: seleccioná el bloque correspondiente y presioná **F5**. Esto permite revisar los resultados de cada análisis de manera individual.

## Consideraciones sobre los resultados

- La facturación se calcula como `cantidad * precio_unitario`.
- La cantidad de pedidos se obtiene con `COUNT(*)`, por lo que cuenta filas de la tabla `ventas`.
- La consulta mensual agrupa por número de mes (`MONTH(fecha_venta)`). Si la tabla contiene más de un año, los mismos meses de distintos años se agruparán juntos; para un análisis interanual conviene incorporar también el año.
- En la consulta de comparación, los meses que no superan el promedio quedan etiquetados como **Por debajo**, incluso si su valor coincide exactamente con el promedio.

## Resultados de referencia del ejercicio

Según las anotaciones incluidas en el script:

- En el mes 3 se registraron 10 pedidos, con una facturación total de $6.444 y un ticket promedio de $644,40.
- El producto 1 encabeza el ranking por facturación, mientras que el producto 2 registra el mayor volumen de unidades vendidas entre los productos mencionados.
- Se identifican cinco clientes recurrentes, cada uno con dos pedidos.

Los resultados pueden variar si se modifica la información de la base de datos.

## Autora

Proyecto de práctica de **Data Analytics** – RetailPro.

