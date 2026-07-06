SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS tienda_comida CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tienda_comida;

CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO productos (nombre, descripcion, precio, stock) VALUES 
('Pizza Familiar Pepperoni', 'Masa tradicional con extra queso y pepperoni', 14990, 20),
('Hamburguesa Doble Queso', 'Doble carne, cheddar, tocino y salsa de la casa', 8990, 35),
('Papas Fritas Grandes', 'Porción familiar de papas rústicas', 3990, 50),
('Pizza Vegetariana', 'Champiñones, pimientos, cebolla y aceitunas', 13990, 15),
('Aros de Cebolla', 'Porción de 12 aros crujientes', 4500, 30);