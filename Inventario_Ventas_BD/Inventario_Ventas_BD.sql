-- Base de Datos Inventario Ventas
CREATE DATABASE IF NOT EXISTS `Inventory_Sales`;
USE `Inventory_Sales`;

-- Creando tabla para los roles de los usuarios
CREATE TABLE IF NOT EXISTS `Roles` (
    `id_role` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

-- ** Tabla auditoria Roles **
CREATE TABLE IF NOT EXISTS `Roles_Audit` (
    `id_role_audit` INT AUTO_INCREMENT PRIMARY KEY,
    `id_role` INT NOT NULL,
    `action` VARCHAR(20) NOT NULL,
    `user_action` VARCHAR(20) NOT NULL,
    `action_date` DATE NOT NULL,
    FOREIGN KEY (`id_role`) REFERENCES `Roles` (`id_role`)
);

-- Tabla para los usuarios
CREATE TABLE IF NOT EXISTS `Users` (
    `id_user` INT AUTO_INCREMENT PRIMARY KEY,
    `id_role` INT NOT NULL,
    `username` VARCHAR(80) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `name` VARCHAR(80) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    FOREIGN KEY (`id_role`) REFERENCES `Roles` (`id_role`)
);

-- ** Tabla auditoria usuarios **
CREATE TABLE IF NOT EXISTS `Users_Audit` (
    `id_user_audit` INT AUTO_INCREMENT PRIMARY KEY,
    `id_user` INT NOT NULL,
    `action` VARCHAR(20) NOT NULL,
    `user_action` VARCHAR(20) NOT NULL,
    `action_date` DATE NOT NULL,
    FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`)
);

-- Creando Tabla Menu
CREATE TABLE IF NOT EXISTS `Menu` (
	`id_menu` INT AUTO_INCREMENT PRIMARY KEY,
	`id_menu_parent` INT NOT NULL,
    `nombre` VARCHAR(80) NOT NULL
);

-- ** Tabla auditoria Roles **
CREATE TABLE IF NOT EXISTS `Menu_Audit` (
    `id_menu_audit` INT AUTO_INCREMENT PRIMARY KEY,
    `id_menu` INT NOT NULL,
    `action` VARCHAR(20) NOT NULL,
    `user_action` VARCHAR(20) NOT NULL,
    `action_date` DATE NOT NULL,
    FOREIGN KEY (`id_menu`) REFERENCES `Menu` (`id_menu`)
);

-- Creando Tabla para los Clientes
CREATE TABLE IF NOT EXISTS `Customers` (
    `id_customer` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `address` VARCHAR(255) NOT NULL
);

-- ** Tabla auditoria Clientes **
CREATE TABLE IF NOT EXISTS `Customers_Audit` (
    `id_customer_audit` INT AUTO_INCREMENT PRIMARY KEY,
    `id_customer` INT NOT NULL,
    `action` VARCHAR(20) NOT NULL,
    `user_action` VARCHAR(20) NOT NULL,
    `action_date` DATE NOT NULL,
    FOREIGN KEY (`id_customer`) REFERENCES `Customers` (`id_customer`)
);

-- Creando tabla para el productos
CREATE TABLE IF NOT EXISTS `Products` (
    `id_product` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `description` VARCHAR(200) NOT NULL,
    `quantity` INT NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL
);

-- ** Tabla auditoria Productos **
CREATE TABLE IF NOT EXISTS `Products_Audit` (
    `id_product_audit` INT AUTO_INCREMENT PRIMARY KEY,
    `id_product` INT NOT NULL,
    `action` VARCHAR(20) NOT NULL,
    `user_action` VARCHAR(20) NOT NULL,
    `action_date` DATE NOT NULL,
    FOREIGN KEY (`id_product`) REFERENCES `Products` (`id_product`)
);

-- Creando tabla para el encabezado de las ventas
CREATE TABLE IF NOT EXISTS `Sales_Enc` (
    `id_sale_enc` INT AUTO_INCREMENT PRIMARY KEY,
    `id_customer` INT NOT NULL,
    `sale_date` DATE NOT NULL,
    `total_sale` DECIMAL(10, 2),
    FOREIGN KEY (`id_customer`) REFERENCES `Customers` (`id_customer`)
);

-- ** Tabla auditoria Encabezado Ventas **
CREATE TABLE IF NOT EXISTS `Sales_Enc_Audit` (
    `id_sale_enc_audit` INT AUTO_INCREMENT PRIMARY KEY,
    `id_sale_enc` INT NOT NULL,
    `action` VARCHAR(20) NOT NULL,
    `user_action` VARCHAR(20) NOT NULL,
    `action_date` DATE NOT NULL,
    FOREIGN KEY (`id_sale_enc`) REFERENCES `Sales_Enc` (`id_sale_enc`)
);

-- Creando tabla para el detalle de las ventas
CREATE TABLE IF NOT EXISTS `Sales_Det` (
    `id_sale_det` INT AUTO_INCREMENT PRIMARY KEY,
    `id_sale_enc` INT NOT NULL,
    `id_product` INT NOT NULL,
    `quantity_sold` INT NOT NULL,
    `subtotal` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`id_sale_enc`) REFERENCES `Sales_Enc` (`id_sale_enc`),
    FOREIGN KEY (`id_product`) REFERENCES `Products` (`id_product`)
);

-- ** Tabla auditoria Detalle Ventas **
CREATE TABLE IF NOT EXISTS `Sales_Det_Audit` (
    `id_sale_det_audit` INT AUTO_INCREMENT PRIMARY KEY,
    `id_sale_det` INT NOT NULL,
    `action` VARCHAR(20) NOT NULL,
    `user_action` VARCHAR(20) NOT NULL,
    `action_date` DATE NOT NULL,
    FOREIGN KEY (`id_sale_det`) REFERENCES `Sales_Det` (`id_sale_det`)
);

INSERT INTO `Roles` (name) VALUES ('Admin');
INSERT INTO `Users` (id_role, username, password, name, email, phone) VALUES (1, 'moises123', '123', 'Moisés Castro', 'moises.castro20@gmail.com', '73541466');
SELECT * FROM Users;