-- Creando la Base de Datos
CREATE DATABASE IF NOT EXISTS 'Inventario-Ventas';

USE 'Inventario-Ventas';

-- Creando tabla para el inventario
CREATE TABLE IF NOT EXISTS 'Inventario' (
    'id_inventario' INT AUTO_INCREMENT PRIMARY KEY,
    'nombre_producto' VARCHAR(255) NOT NULL,
    'cantidad' INT NOT NULL,
    'precio_unitario' DECIMAL(10, 2) NOT NULL
);

-- Creando tabla para las ventas
CREATE TABLE IF NOT EXISTS 'Ventas' (
    'id_ventas' INT AUTO_INCREMENT PRIMARY KEY,
    'id_producto' INT NOT NULL,
    'cantidad_vendida' INT NOT NULL,
    'fecha_venta' DATE NOT NULL,
    FOREIGN KEY ('id_producto') REFERENCES 'Inventario' ('id')
);