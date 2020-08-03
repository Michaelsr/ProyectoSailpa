CREATE TABLE `dcliente` (
 `DCliente_id` int(11) NOT NULL AUTO_INCREMENT,
 `Nom_cli` varchar(100) NULL,
 `Dir_cli` varchar(100) NULL,
 `Tel_cli` varchar(100) NULL,
 `Ema_cli` varchar(100) NULL,
 PRIMARY KEY (`DCliente_id`)
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `dproducto` (
 `DProducto_id` int(11) NOT NULL AUTO_INCREMENT,
 `Cod_prod` varchar(100) NULL,
 `Nom_prod` varchar(100) NULL,
 `Cat_prod` varchar(100) NULL,
 `PreCom_prod` decimal(9,2) NULL,
 `PreVent_prod` decimal(9,2) NOT NULL,
 PRIMARY KEY (`DProducto_id`)
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `dtiempo` (
 `DTiempo_id` int(11) NOT NULL AUTO_INCREMENT,
 `Fecha` date NULL,
 `Dia_sem` varchar(12) NULL,
 `Mes_cod` varchar(2) NULL,
 `Mes_des` varchar(12) NULL,
 `Trim_cod` varchar(1) NULL,
 `Trim_des` varchar(20) NULL,
 `Anio` varchar(4) NULL,
 PRIMARY KEY (`DTiempo_id`)
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `dvendedor` (
 `DVendedor_id` int(11) NOT NULL AUTO_INCREMENT,
 `Nom_ven` varchar(100) NOT NULL,
 `Dir_ven` varchar(100) NULL,
 `Tel_ven` varchar(100) NULL,
 `Ema_ven` varchar(100) NULL, 
 PRIMARY KEY (`DVendedor_id`)
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `hventa` (
 `DProducto_id` int(11) NOT NULL,
 `DTiempo_id` int(11) NOT NULL,
 `DVendedor_id` int(11) NOT NULL,
 `DCliente_id` int(11) NOT NULL,
 `Ventas` decimal(9,2) NULL,
 `costos` decimal(9,2) NULL,
 `Vent_Cant_Prod` int(11) NULL,
 `Descuento` decimal(9,2) NULL,
 `Can_clientes` int(11) NULL,
 PRIMARY KEY (`DProducto_id`,`DTiempo_id`,`DVendedor_id`,`DCliente_id`),
 KEY `DTiempo_id` (`DTiempo_id`),
 KEY `DVendedor_id` (`DVendedor_id`),
 KEY `DCliente_id` (`DCliente_id`),
 CONSTRAINT `hventa_ibfk_1` FOREIGN KEY (`DProducto_id`) REFERENCES `dproducto` (`DProducto_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `hventa_ibfk_2` FOREIGN KEY (`DTiempo_id`) REFERENCES `dtiempo` (`DTiempo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `hventa_ibfk_3` FOREIGN KEY (`DVendedor_id`) REFERENCES `dvendedor` (`DVendedor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `hventa_ibfk_4` FOREIGN KEY (`DCliente_id`) REFERENCES `dcliente` (`DCliente_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;