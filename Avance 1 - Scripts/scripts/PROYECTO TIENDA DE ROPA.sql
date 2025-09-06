CREATE DATABASE IF NOT EXISTS Tienda_ropa
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_spanish_ci;

USE Tienda_ropa; 

CREATE TABLE clientes (
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(50) NOT NULL, 
    apellido1 VARCHAR(50) NOT NULL, 
    apellido2 VARCHAR(50),
    telefono VARCHAR(12) NOT NULL,
    email VARCHAR (50),
    registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE inventario (
    id int AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
    descripcion VARCHAR(255) NOT NULL,
    MARCA VARCHAR (50) NOT NULL,  
    Modelo VARCHAR(50) NOT NULL,  --mayusculas
    precio decimal(10,2) NOT NULL,
    in_stock int NOT NULL  --cantidad
) ENGINE=InnoDB;

CREATE TABLE ventas ( 
    id int AUTO_INCREMENT PRIMARY KEY,
    id_cliente int NOT NULL,
    id_articulo int NOT NULL, 
    Unidades INT NOT NULL           --mayuscula
    total decimal (10,2) NOT NULL,  
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_articulo) REFERENCES inventario (id)
) ENGINE=InnoDB;  

/* INSERCION DE DATOS */   

/* CLIENTES */

INSERT INTO clientes (nombre, apellido, numero_telefono, correo_electronico) VALUES
('Juan', 'Pérez', 123456789, 'juan.perez@example.com'),
('María', 'Gómez', 987654321, 'maria.gomez@example.com'),
('Carlos', 'López', 555555555, 'carlos.lopez@example.com'),
('Ana', 'Martínez', 111111111, 'ana.martinez@example.com'),
('Luis', 'Rodríguez', 222222222, 'luis.rodriguez@example.com'),
('Sofía', 'Hernández', 333333333, 'sofia.hernandez@example.com'),
('Pedro', 'Díaz', 444444444, 'pedro.diaz@example.com'),
('Laura', 'Fernández', 555555555, 'laura.fernandez@example.com'),
('Jorge', 'García', 666666666, 'jorge.garcia@example.com'),
('Mónica', 'Sánchez', 777777777, 'monica.sanchez@example.com'),
('Ricardo', 'Ramírez', 888888888, 'ricardo.ramirez@example.com'),
('Patricia', 'Torres', 999999999, 'patricia.torres@example.com'),
('Fernando', 'Flores', 101010101, 'fernando.flores@example.com'),
('Gabriela', 'Vargas', 121212121, 'gabriela.vargas@example.com'),
('Roberto', 'Castro', 131313131, 'roberto.castro@example.com'),
('Carmen', 'Ortega', 141414141, 'carmen.ortega@example.com'),
('Daniel', 'Morales', 151515151, 'daniel.morales@example.com'),
('Alejandra', 'Reyes', 161616161, 'alejandra.reyes@example.com'),
('Oscar', 'Jiménez', 171717171, 'oscar.jimenez@example.com'),
('Lucía', 'Mendoza', 181818181, 'lucia.mendoza@example.com'),
('Miguel', 'Guerrero', 191919191, 'miguel.guerrero@example.com'),
('Elena', 'Ruiz', 202020202, 'elena.ruiz@example.com'),
('Raúl', 'Álvarez', 212121212, 'raul.alvarez@example.com'),
('Isabel', 'Moreno', 222222222, 'isabel.moreno@example.com'),
('Javier', 'Romero', 232323232, 'javier.romero@example.com'),
('Adriana', 'Navarro', 242424242, 'adriana.navarro@example.com'),
('Arturo', 'Silva', 252525252, 'arturo.silva@example.com'),
('Claudia', 'Rivas', 262626262, 'claudia.rivas@example.com'),
('Francisco', 'Cruz', 272727272, 'francisco.cruz@example.com'),
('Verónica', 'Ortiz', 282828282, 'veronica.ortiz@example.com'),
('Héctor', 'Delgado', 292929292, 'hector.delgado@example.com'),
('Mariana', 'Pacheco', 303030303, 'mariana.pacheco@example.com'),
('Alberto', 'Campos', 313131313, 'alberto.campos@example.com'),
('Diana', 'Vega', 323232323, 'diana.vega@example.com'),
('Manuel', 'Fuentes', 333333333, 'manuel.fuentes@example.com'),
('Silvia', 'Valdez', 343434343, 'silvia.valdez@example.com'),
('José', 'Aguilar', 353535353, 'jose.aguilar@example.com'),
('Teresa', 'Ríos', 363636363, 'teresa.rios@example.com'),
('Antonio', 'Medina', 373737373, 'antonio.medina@example.com'),
('Beatriz', 'Cortés', 383838383, 'beatriz.cortes@example.com'),
('Rafael', 'Miranda', 393939393, 'rafael.miranda@example.com'),
('Lourdes', 'Santos', 404040404, 'lourdes.santos@example.com'),
('Guillermo', 'Cervantes', 414141414, 'guillermo.cervantes@example.com'),
('Alicia', 'León', 424242424, 'alicia.leon@example.com'),
('Enrique', 'Márquez', 434343434, 'enrique.marquez@example.com'),
('Rosa', 'Gallegos', 444444444, 'rosa.gallegos@example.com'),
('Gerardo', 'Vázquez', 454545454, 'gerardo.vazquez@example.com'),
('Natalia', 'Iglesias', 464646464, 'natalia.iglesias@example.com'),
('Felipe', 'Castañeda', 474747474, 'felipe.castaneda@example.com'),
('Liliana', 'Juárez', 484848484, 'liliana.juarez@example.com'); 

/* INVERNTARIO*/ 

INSERT INTO inventario (descripcion_prenda, marca, precio, unidades_vendias, unidades_stok) VALUES
('Camiseta básica blanca', 'Marca A', 15.99, 10, 50),
('Pantalón vaquero azul', 'Marca B', 29.99, 5, 30),
('Chaqueta de cuero negro', 'Marca C', 99.99, 2, 10),
('Vestido floral', 'Marca D', 49.99, 8, 20),
('Zapatillas deportivas', 'Marca E', 59.99, 15, 40),
('Gorra de béisbol', 'Marca F', 19.99, 12, 25),
('Bufanda de lana', 'Marca G', 9.99, 20, 60),
('Sudadera con capucha', 'Marca H', 39.99, 7, 35),
('Jeans ajustados', 'Marca I', 34.99, 9, 45),
('Camisa formal', 'Marca J', 44.99, 6, 15),
('Chaleco acolchado', 'Marca K', 79.99, 3, 12),
('Falda plisada', 'Marca L', 24.99, 11, 30),
('Zapatos de tacón', 'Marca M', 69.99, 4, 18),
('Cinturón de cuero', 'Marca N', 14.99, 18, 50),
('Polo de manga corta', 'Marca O', 22.99, 14, 40),
('Shorts deportivos', 'Marca P', 19.99, 10, 25),
('Abrigo de lana', 'Marca Q', 89.99, 1, 8),
('Blusa de seda', 'Marca R', 54.99, 5, 20),
('Botas de invierno', 'Marca S', 79.99, 6, 15),
('Pijama de algodón', 'Marca T', 29.99, 8, 30),
('Chaqueta de plumas', 'Marca U', 129.99, 2, 10),
('Camiseta de rayas', 'Marca V', 17.99, 13, 35),
('Pantalón de chándal', 'Marca W', 24.99, 9, 40),
('Zapatillas de running', 'Marca X', 64.99, 7, 20),
('Gafas de sol', 'Marca Y', 34.99, 15, 50),
('Bolso de mano', 'Marca Z', 49.99, 4, 12),
('Cazadora de cuero', 'Marca AA', 109.99, 3, 10),
('Vestido de noche', 'Marca AB', 89.99, 2, 8),
('Zapatos de vestir', 'Marca AC', 74.99, 5, 15),
('Camiseta sin mangas', 'Marca AD', 12.99, 20, 60),
('Pantalón de vestir', 'Marca AE', 49.99, 6, 25),
('Chaqueta de mezclilla', 'Marca AF', 59.99, 4, 18),
('Falda de cuero', 'Marca AG', 39.99, 7, 20),
('Zapatos de cuero', 'Marca AH', 84.99, 3, 12),
('Camiseta de algodón', 'Marca AI', 14.99, 18, 50),
('Pantalón de lino', 'Marca AJ', 34.99, 9, 30),
('Chaqueta de viento', 'Marca AK', 44.99, 5, 20),
('Vestido de verano', 'Marca AL', 29.99, 10, 40),
('Zapatillas de lona', 'Marca AM', 19.99, 12, 25),
('Gorra de invierno', 'Marca AN', 24.99, 8, 30),
('Bufanda de seda', 'Marca AO', 14.99, 15, 50),
('Sudadera sin capucha', 'Marca AP', 29.99, 7, 35),
('Jeans rectos', 'Marca AQ', 39.99, 9, 45),
('Camisa de lino', 'Marca AR', 49.99, 6, 15),
('Chaleco de punto', 'Marca AS', 29.99, 3, 12),
('Falda de tul', 'Marca AT', 34.99, 11, 30),
('Zapatos de gamuza', 'Marca AU', 59.99, 4, 18),
('Cinturón de tela', 'Marca AV', 9.99, 18, 50),
('Polo de manga larga', 'Marca AW', 24.99, 14, 40),
('Shorts de playa', 'Marca AX', 14.99, 10, 25),
('Abrigo de piel sintética', 'Marca AY', 99.99, 1, 8),
('Blusa de encaje', 'Marca AZ', 44.99, 5, 20); 

/*VENTAS*/ 
INSERT INTO ventas (id_cliente, id_prenda, cantidad, monto, fecha) VALUES
(1, 1, 2, 31.98, '2023-01-15'),
(2, 3, 1, 99.99, '2023-01-16'),
(3, 5, 1, 59.99, '2023-01-17'),
(4, 7, 3, 29.97, '2023-01-18'),
(5, 9, 2, 69.98, '2023-01-19'),
(6, 11, 1, 79.99, '2023-01-20'),
(7, 13, 1, 69.99, '2023-01-21'),
(8, 15, 2, 45.98, '2023-01-22'),
(9, 17, 1, 89.99, '2023-01-23'),
(10, 19, 1, 79.99, '2023-01-24'),
(11, 21, 1, 129.99, '2023-01-25'),
(12, 23, 2, 49.98, '2023-01-26'),
(13, 25, 1, 34.99, '2023-01-27'),
(14, 27, 1, 109.99, '2023-01-28'),
(15, 29, 1, 74.99, '2023-01-29'),
(16, 31, 2, 99.98, '2023-01-30'),
(17, 33, 1, 84.99, '2023-01-31'),
(18, 35, 1, 14.99, '2023-02-01'),
(19, 37, 1, 44.99, '2023-02-02'),
(20, 39, 1, 29.99, '2023-02-03'),
(21, 41, 1, 24.99, '2023-02-04'),
(22, 43, 1, 49.99, '2023-02-05'),
(23, 45, 1, 59.99, '2023-02-06'),
(24, 47, 1, 9.99, '2023-02-07'),
(25, 49, 1, 24.99, '2023-02-08'),
(26, 2, 1, 29.99, '2023-02-09'),
(27, 4, 1, 49.99, '2023-02-10'),
(28, 6, 1, 19.99, '2023-02-11'),
(29, 8, 1, 39.99, '2023-02-12'),
(30, 10, 1, 44.99, '2023-02-13'),
(31, 12, 1, 24.99, '2023-02-14'),
(32, 14, 1, 14.99, '2023-02-15'),
(33, 16, 1, 19.99, '2023-02-16'),
(34, 18, 1, 54.99, '2023-02-17'),
(35, 20, 1, 29.99, '2023-02-18'),
(36, 22, 1, 17.99, '2023-02-19'),
(37, 24, 1, 64.99, '2023-02-20'),
(38, 26, 1, 49.99, '2023-02-21'),
(39, 28, 1, 89.99, '2023-02-22'),
(40, 30, 1, 12.99, '2023-02-23'),
(41, 32, 1, 49.99, '2023-02-24'),
(42, 34, 1, 39.99, '2023-02-25'),
(43, 36, 1, 14.99, '2023-02-26'),
(44, 38, 1, 19.99, '2023-02-27'),
(45, 40, 1, 24.99, '2023-02-28'),
(46, 42, 1, 34.99, '2023-03-01'),
(47, 44, 1, 9.99, '2023-03-02'),
(48, 46, 1, 24.99, '2023-03-03'),
(49, 48, 1, 14.99, '2023-03-04'),
(50, 50, 1, 44.99, '2023-03-05');

/*VISTAS*/  

/*#1*/ 

CREATE VIEW marcas_con_ventas AS
SELECT DISTINCT i.marca
FROM inventario i
JOIN ventas v ON i.id_prenda = v.id_prenda;  

/*#2*/ 
CREATE VIEW prendas_vendidas_con_stock AS
SELECT 
    i.descripcion_prenda,
    i.marca,
    SUM(v.cantidad) AS unidades_vendidas,
    i.unidades_stok AS unidades_restantes
FROM inventario i
JOIN ventas v ON i.id_prenda = v.id_prenda
GROUP BY i.id_prenda; 

/*#3*/ 
CREATE VIEW top_5_marcas_mas_vendidas AS
SELECT 
    i.marca,
    SUM(v.cantidad) AS cantidad_ventas
FROM inventario i
JOIN ventas v ON i.id_prenda = v.id_prenda
GROUP BY i.marca
ORDER BY cantidad_ventas DESC
LIMIT 5;

/*LLAMADO A LAS VISTAS*/ 

-- Consultar la lista de marcas con al menos una venta
SELECT * FROM marcas_con_ventas;

-- Consultar las prendas vendidas y su cantidad restante en stock
SELECT * FROM prendas_vendidas_con_stock;

-- Consultar las 5 marcas más vendidas
SELECT * FROM top_5_marcas_mas_vendidas;  


-- Eliminar datos     
DELETE FROM ventas
WHERE consecutivo = 1; 
-- actualizacion  
UPDATE inventario
SET precio = precio * 1.05  -- Aumentar el precio en un 5%
WHERE marca = 'Marca B'; 
-- consultas 
SELECT * FROM ventas
WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31';
