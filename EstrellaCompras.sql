CREATE TABLE `dproducto` (
 `DProducto_id` int(11) NOT NULL AUTO_INCREMENT,
 `Cod_prod` varchar(100) DEFAULT NULL,
 `Nom_prod` varchar(100) DEFAULT NULL,
 `Cat_prod` varchar(100) DEFAULT NULL,
 `PreCom_prod` decimal(9,2) DEFAULT NULL,
 `PreVent_prod` decimal(9,2) DEFAULT NULL,
 PRIMARY KEY (`DProducto_id`)
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `dproveedor` (
 `DProveedor_id` int(11) NOT NULL AUTO_INCREMENT,
 `Nom_prov` varchar(100) DEFAULT NULL,
 `Dir_prov` varchar(100) NOT NULL,
 `Tel_prov` varchar(20) DEFAULT NULL,
 `Ema_prov` varchar(100) DEFAULT NULL,
 PRIMARY KEY (`DProveedor_id`)
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `dtiempo` (
 `DTIempo_id` int(11) NOT NULL AUTO_INCREMENT,
 `Fecha` date DEFAULT NULL,
 `Dia_sem` varchar(12) DEFAULT NULL,
 `Mes_cod` varchar(2) DEFAULT NULL,
 `Mes_des` varchar(12) DEFAULT NULL,
 `Trim_cod` varchar(1) DEFAULT NULL,
 `Trim_des` varchar(20) DEFAULT NULL,
 `Anio` varchar(4) DEFAULT NULL,
 PRIMARY KEY (`DTIempo_id`)
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `hcompra` (
 `DProducto_id` int(11) NOT NULL,
 `DTiempo_id` int(11) NOT NULL,
 `DProveedor_id` int(11) NOT NULL,
 `Compras` decimal(9,2) DEFAULT NULL,
 `Com_Cant_Prod` INT(11) NULL,
 `Can_proveedor` int(11) DEFAULT NULL,
 PRIMARY KEY (`DProducto_id`,`DTiempo_id`,`DProveedor_id`),
 KEY `DTiempo_id` (`DTiempo_id`),
 KEY `DProveedor_id` (`DProveedor_id`),
 CONSTRAINT `hcompra_ibfk_1` FOREIGN KEY (`DProducto_id`) REFERENCES `dproducto` (`DProducto_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `hcompra_ibfk_2` FOREIGN KEY (`DTiempo_id`) REFERENCES `dtiempo` (`DTIempo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `hcompra_ibfk_3` FOREIGN KEY (`DProveedor_id`) REFERENCES `dproveedor` (`DProveedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;