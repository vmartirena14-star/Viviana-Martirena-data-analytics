--SECCION 1) DROP TABLES--

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;


--SECCION 2) CREATE TABLE- CREAR DATABASE--

CREATE DATABASE Ventas_Tech_DB


-- 1. TABLA CATEGORIAS--

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

-- 2. TABLA CLIENTES--

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Ciudad VARCHAR(50),
	Fecha_Registro Date NOT NULL
);

-- 3. TABLA PRODUCTOS--

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo BIT DEFAULT 1,

    CONSTRAINT FK_Productos_Categorias
        FOREIGN KEY (id_categoria)
        REFERENCES Categorias(id_categoria)
);

-- 4. TABLA VENTAS--

CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    Fecha_Venta DATE NOT NULL,
    ID_Cliente INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
	Precio_unitario DECIMAL (10,2) NOT NULL,

    CONSTRAINT FK_Ventas_Clientes
        FOREIGN KEY (ID_Cliente)
        REFERENCES Clientes(ID_Cliente),

    CONSTRAINT FK_Ventas_Productos
        FOREIGN KEY (ID_Producto)
        REFERENCES Productos(ID_Producto)
);


--SECCION 3 INSERT DATA--


--CATEGORIAS-4 REGISTROS--

INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');

  --CLIENTES — 5 REGISTROS--

  INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
  (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');

  --PRODUCTOS — 6 REGISTROS--

  INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
  (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, 'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, 'Teclado Mecánico',   2,   95.00, 40, 1);


  --VENTAS-10 REGISTROS--

  INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');


  --VALIDACION--

  SELECT*FROM Categorias;

  SELECT*FROM Clientes;

  SELECT*FROM Productos;

  SELECT*FROM Ventas;