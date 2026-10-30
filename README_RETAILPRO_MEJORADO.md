# RetailPro | Análisis de ventas con SQL

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-red)
![Proyecto](https://img.shields.io/badge/Proyecto-Data%20Analytics-blue)
![Estado](https://img.shields.io/badge/Estado-Acad%C3%A9mico-lightgrey)

Proyecto de análisis de datos desarrollado sobre la base de datos **Ventas_Tech_DB**, con el objetivo de transformar registros de ventas en información útil para comprender el comportamiento comercial de RetailPro.

El trabajo utiliza consultas SQL para analizar la facturación, identificar productos destacados, reconocer clientes recurrentes y comparar el desempeño mensual con el promedio general.

## Índice

- [Objetivo](#objetivo)
- [Herramientas utilizadas](#herramientas-utilizadas)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Análisis realizados](#análisis-realizados)
- [Resultados de referencia](#resultados-de-referencia)
- [Cómo ejecutar el script](#cómo-ejecutar-el-script)
- [Conocimientos aplicados](#conocimientos-aplicados)
- [Consideraciones](#consideraciones)

## Objetivo

Aplicar SQL para responder preguntas de negocio a partir de los datos de ventas y generar indicadores que permitan:

- Conocer la facturación y el volumen de operaciones.
- Identificar los productos con mejor desempeño.
- Detectar clientes con compras recurrentes.
- Comparar la facturación mensual con el promedio del período analizado.

## Herramientas utilizadas

- **Microsoft SQL Server:** motor de base de datos.
- **SQL Server Management Studio (SSMS):** entorno para conectarse a la base y ejecutar consultas.
- **T-SQL:** lenguaje utilizado para consultar y analizar los datos.
- **GitHub:** almacenamiento y documentación del proyecto.

## Estructura del proyecto

| Archivo | Descripción |
|---|---|
| [m4_consultas_negocio.sql](./m4_consultas_negocio.sql) | Script con las consultas SQL del análisis. |
| [README_RETAILPRO.md](./README_RETAILPRO.md) | Documentación inicial del proyecto. |
| [README_RETAILPRO_MEJORADO.md](./README_RETAILPRO_MEJORADO.md) | Esta versión ampliada de la documentación. |

## Análisis realizados

El script `m4_consultas_negocio.sql` contiene cuatro bloques de análisis:

### 1. Resumen mensual de ventas

Calcula la facturación total, la cantidad de registros de venta y el ticket promedio por mes. Permite obtener una visión general de la actividad comercial.

### 2. Top 5 de productos

Identifica los cinco productos con mayor facturación e incluye las unidades vendidas. Permite comparar el aporte económico de los productos y su volumen de ventas.

### 3. Clientes recurrentes

Identifica clientes que registran más de una operación y calcula la cantidad de registros y el importe total asociado a sus compras.

### 4. Comparación de facturación mensual

Utiliza una expresión de tabla común (CTE) y una función de ventana para calcular el promedio de facturación mensual y comparar cada mes contra ese valor.

## Resultados de referencia

Entre los resultados obtenidos al ejecutar el script se destacan:

| Indicador | Resultado |
|---|---:|
| Facturación del mes 3 | $6.444,00 |
| Registros de venta del mes 3 | 10 |
| Ticket promedio del mes 3 | $644,40 |
| Clientes recurrentes identificados | 5 |

Además, el análisis de productos identifica al producto 1 como el de mayor facturación y al producto 2 como el de mayor cantidad de unidades vendidas.

Estos valores corresponden a los datos disponibles en la base utilizada para el ejercicio. Si la información cambia, los resultados pueden variar al volver a ejecutar las consultas.

## Cómo ejecutar el script

### Requisitos previos

- Tener instalado Microsoft SQL Server.
- Contar con acceso a una instancia de SQL Server.
- Tener disponible la base de datos `Ventas_Tech_DB`.
- Tener SQL Server Management Studio (SSMS) u otra herramienta compatible con T-SQL.

### Pasos

1. Clonar o descargar este repositorio desde GitHub.
2. Abrir SQL Server Management Studio y conectarse a la instancia correspondiente.
3. Seleccionar **File → Open → File** y abrir `m4_consultas_negocio.sql`.
4. Verificar que la base de datos indicada en el script sea `Ventas_Tech_DB`.
5. Ejecutar el script con **Execute** o presionando **F5**.
6. Consultar los resultados en la pestaña **Results**.

También es posible seleccionar y ejecutar cada bloque de consulta por separado.

## Conocimientos aplicados

Durante el desarrollo se utilizaron los siguientes recursos de SQL:

- `SELECT`, `FROM` y `ORDER BY` para consultar y ordenar información.
- `GROUP BY` para agrupar los datos por período o entidad.
- Funciones de agregación: `SUM()`, `COUNT()` y `AVG()`.
- `HAVING` para filtrar grupos según condiciones.
- `TOP` para limitar resultados.
- CTE (`WITH`) para organizar consultas intermedias.
- Funciones de ventana, como `AVG() OVER()`.
- `CASE WHEN` para clasificar resultados mediante condiciones.

Estas herramientas permiten pasar de los registros transaccionales a indicadores que responden preguntas concretas del negocio.

## Consideraciones

- La consulta mensual utiliza `MONTH(fecha_venta)`. Si la base contiene más de un año, los mismos números de mes de distintos años se agrupan entre sí. Para un análisis histórico por año y mes, conviene agrupar también por el año.
- `COUNT(*)` cuenta filas de la tabla. Solo representa la cantidad de pedidos si cada fila equivale a una operación.
- La comparación contra el promedio utiliza una condición estricta de mayor que. Por eso, un mes exactamente igual al promedio no se clasifica como superior.
- Los importes se calculan a partir de `cantidad * precio_unitario`.

---

**Proyecto académico de Data Analytics — RetailPro**  
**Autora:** Viviana Martirena
