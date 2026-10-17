
-- 1. PAIS
CREATE TABLE Pais (
    Id_pais VARCHAR (120) PRIMARY KEY,
    origen_envio VARCHAR(150),
    origen_entrega VARCHAR(150)
);

-- 2. VENDEDOR
CREATE TABLE Vendedor (
    Id_vendedor INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(150),
    pais_origen VARCHAR(100)
);

-- 3. CATEGORIA
CREATE TABLE Categoria (
    Id_categoria INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha DATE,
    peso DECIMAL(10,2)
);

-- 4. CLIENTE
CREATE TABLE Cliente (
    Id_cliente INT PRIMARY KEY,
    Id_pais VARCHAR (120),
    nombre VARCHAR(100),
    correo VARCHAR(150),
    contraseña VARCHAR(255),
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    FOREIGN KEY (Id_pais) REFERENCES Pais(Id_pais)
);

-- 5. ENVIO
CREATE TABLE ENVIO (
    Id_envio INT PRIMARY KEY,
    Id_pais VARCHAR (120),
    nombre VARCHAR(100),
    transportadora VARCHAR(100),
    codigo_seguimiento VARCHAR(100),
    fecha_estimada DATE,
    estado VARCHAR(50),
    FOREIGN KEY (Id_pais) REFERENCES Pais(Id_pais)
);

-- 6. PRODUCTO
CREATE TABLE Producto (
    Id_producto INT PRIMARY KEY,
    nombre VARCHAR(150),
    descripcion TEXT,
    precio DECIMAL(12,2),
    peso DECIMAL(10,2),
    Id_categoria INT,
    Id_vendedor INT,
    FOREIGN KEY (Id_categoria)
        REFERENCES Categoria(Id_categoria),
    FOREIGN KEY (Id_vendedor)
        REFERENCES Vendedor(Id_vendedor)
);

-- 7. PEDIDO
CREATE TABLE Pedido (
    Id_pedido INT PRIMARY KEY,
    Id_cliente INT,
    Id_envio INT,
    fecha DATE,
    estado VARCHAR(50),
    moneda VARCHAR(50),
    subtotal DECIMAL(12,2),
    porcentaje_iva DECIMAL(5,2),
    total DECIMAL(12,2),
    FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente),
    FOREIGN KEY (Id_envio) REFERENCES ENVIO(Id_envio)
);

-- 8. DETALLE DEL PEDIDO
CREATE TABLE Detalle_Pedido (
    Id_detalle INT PRIMARY KEY,
    Id_producto INT,
    Id_pedido INT,
    cantidad INT,
    precio_unitario DECIMAL(12,2),
    subtotal DECIMAL(12,2),
    FOREIGN KEY (Id_pedido) REFERENCES Pedido(Id_pedido),
    FOREIGN KEY (Id_producto) REFERENCES Producto(Id_producto)
);

-- 9. RESEÑA
CREATE TABLE Reseña (
    Id_reseña INT PRIMARY KEY,
    Id_categoria INT,
    Id_vendedor INT,
    Id_cliente INT,
    calificacion INT,
    comentario TEXT,
    fecha DATE,
    FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente),
    FOREIGN KEY (Id_categoria) REFERENCES Categoria(Id_categoria),
    FOREIGN KEY (Id_vendedor) REFERENCES Vendedor(Id_vendedor)
);

INSERT INTO Pais (Id_pais, origen_envio, origen_entrega)
VALUES ('Origen envio CN, Pais de entrega BR', 'China', 'Brasil');

INSERT INTO Pais (Id_pais, origen_envio, origen_entrega)
VALUES ('Origen envio JP, Pais de entrega CO', 'Japon', 'Colombia');

INSERT INTO Pais (Id_pais, origen_envio, origen_entrega)
VALUES ('Origen envio BR, Pais de entrega MX', 'Brasil', 'Mexico');

INSERT INTO Pais (Id_pais, origen_envio, origen_entrega)
VALUES ('Origen envio JP, Pais de entrega MX', 'Japon', 'Mexico');

INSERT INTO Pais (Id_pais, origen_envio, origen_entrega)
VALUES ('Origen envio GB, Pais de entrega MX', 'Japon', 'Mexico');

INSERT INTO Vendedor (Id_vendedor, nombre, correo, pais_origen)
VALUES (1, 'Alfred Marcos Espinelli', 'Alf32mespi@hotmail.com', 'China');

INSERT INTO Vendedor (Id_vendedor, nombre, correo, pais_origen)
VALUES (2, 'Haru Sato', 'Harusato2026@gmail.com', 'Japon');

INSERT INTO Vendedor (Id_vendedor, nombre, correo, pais_origen)
VALUES (3, 'Pedro Silva', 'Pedrinhocanta@gmail.com', 'Brasil');
INSERT INTO Categoria (Id_categoria, nombre, descripcion, fecha, peso)
VALUES (10, 'Electronica', 'Dispositivos tecnologicos y gadgets', '2026-01-15', 5.50);

INSERT INTO Categoria (Id_categoria, nombre, descripcion, fecha, peso)
VALUES (20, 'Moda y Ropa', 'Prendas de vestir y accesorios', '2026-02-10', 1.20);

INSERT INTO Categoria (Id_categoria, nombre, descripcion, fecha, peso)
VALUES (30, 'Anime y Coleccionables', 'Figuras y articulos de coleccion', '2026-03-01', 2.00);

INSERT INTO Cliente (Id_cliente, Id_pais, nombre, correo, contraseña, telefono, direccion)
VALUES (100, 'Origen envio CN, Pais de entrega BR', 'Lucas Ferreira', 'lucas.br@email.com', 'pass123', '+55119999999', 'Av. Paulista 1000, Sao Paulo');

INSERT INTO Cliente (Id_cliente, Id_pais, nombre, correo, contraseña, telefono, direccion)
VALUES (200, 'Origen envio JP, Pais de entrega CO', 'Valentina Gomez', 'vale.co@email.com', 'secure456', '+573001234567', 'Calle 26 #45-10, Bogota');

INSERT INTO Cliente (Id_cliente, Id_pais, nombre, correo, contraseña, telefono, direccion)
VALUES (300, 'Origen envio JP, Pais de entrega MX', 'Carlos Mendoza', 'carlos.mx@email.com', 'mextop789', '+525512345678', 'Reforma 222, Ciudad de Mexico');

INSERT INTO ENVIO (Id_envio, Id_pais, nombre, transportadora, codigo_seguimiento, fecha_estimada, estado)
VALUES (501, 'Origen envio CN, Pais de entrega BR', 'Envio Express Sao Paulo', 'DHL International', 'TRK-CN-BR-9921', '2026-11-05', 'En Transito');

INSERT INTO ENVIO (Id_envio, Id_pais, nombre, transportadora, codigo_seguimiento, fecha_estimada, estado)
VALUES (502, 'Origen envio JP, Pais de entrega CO', 'Envio Postal Bogota', 'FedEx', 'TRK-JP-CO-4412', '2026-11-12', 'En Aduana');

INSERT INTO ENVIO (Id_envio, Id_pais, nombre, transportadora, codigo_seguimiento, fecha_estimada, estado)
VALUES (503, 'Origen envio JP, Pais de entrega MX', 'Envio Rapido CDMX', 'UPS', 'TRK-JP-MX-8831', '2026-11-02', 'Entregado');



INSERT INTO Producto (Id_producto, nombre, descripcion, precio, peso, Id_categoria, Id_vendedor)
VALUES (1001, 'Smartphone X1', 'Telefono inteligente de alta gama', 450.00, 0.40, 10, 1);

INSERT INTO Producto (Id_producto, nombre, descripcion, precio, peso, Id_categoria, Id_vendedor)
VALUES (1002, 'Figura de Accion Anime', 'Figura coleccionable edicion limitada', 85.00, 0.60, 30, 2);

INSERT INTO Producto (Id_producto, nombre, descripcion, precio, peso, Id_categoria, Id_vendedor)
VALUES (1003, 'Camiseta Oficial Brasil', 'Camiseta deportiva de algodon', 45.00, 0.25, 20, 3); 



INSERT INTO Pedido (Id_pedido, Id_cliente, Id_envio, fecha, estado, moneda, subtotal, porcentaje_iva, total)
VALUES (9001, 100, 501, '2026-10-15', 'Procesando', 'BRL', 450.00, 19.00, 535.50);

INSERT INTO Pedido (Id_pedido, Id_cliente, Id_envio, fecha, estado, moneda, subtotal, porcentaje_iva, total)
VALUES (9002, 200, 502, '2026-10-16', 'Pendiente', 'COP', 85.00, 19.00, 101.15);

INSERT INTO Pedido (Id_pedido, Id_cliente, Id_envio, fecha, estado, moneda, subtotal, porcentaje_iva, total)
VALUES (9003, 300, 503, '2026-10-10', 'Completado', 'MXN', 85.00, 16.00, 98.60); 

INSERT INTO Detalle_Pedido (Id_detalle, Id_producto, Id_pedido, cantidad, precio_unitario, subtotal)
VALUES (1, 1001, 9001, 1, 450.00, 450.00);

INSERT INTO Detalle_Pedido (Id_detalle, Id_producto, Id_pedido, cantidad, precio_unitario, subtotal)
VALUES (2, 1002, 9002, 1, 85.00, 85.00);

INSERT INTO Detalle_Pedido (Id_detalle, Id_producto, Id_pedido, cantidad, precio_unitario, subtotal)
VALUES (3, 1002, 9003, 1, 85.00, 85.00); 

INSERT INTO Reseña (Id_reseña, Id_categoria, Id_vendedor, Id_cliente, calificacion, comentario, fecha)
VALUES (1, 30, 2, 300, 5, 'Excelente calidad de la figura, el vendedor Haru envio todo super rapido.', '2026-10-14');

\dt 




