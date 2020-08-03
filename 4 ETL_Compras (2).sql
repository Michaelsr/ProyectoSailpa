-- DPRODUCTO--
INSERT INTO DPRODUCTO ( 
	Cod_prod,
    Nom_prod,
    Cat_prod,
    PreCom_prod,
    Prevent_prod
)SELECT
	p.codigo AS Cod_Producto,
    p.nombre AS Nom_Producto,
    c.nombre AS Nom_Categoria,
    dc.precio AS Prec_Compra,
    p.precio_venta 	AS Prec_Venta
FROM alexeerd_proyectolaravel.productos AS p
	INNER JOIN alexeerd_proyectolaravel.detalle_compras AS dc ON p.id = dc.idproducto
    INNER JOIN alexeerd_proyectolaravel.categorias AS c ON p.idcategoria = c.id
GROUP BY Cod_Producto, Nom_Producto, Nom_Categoria;


-- DTIEMPO----------->
INSERT INTO DTIEMPO (
	Fecha,
    Dia_sem,
    Mes_cod,
    Mes_des,
    Trim_cod,
    Trim_des,
    Anio
)SELECT
	DATE_FORMAT(c.fecha_compra, '%Y-%m-%d') AS Fecha,
    DAYNAME(c.fecha_compra) AS Dia_Semana,
    MONTH(c.fecha_compra) AS Cod_Mes,
    MONTHNAME(c.fecha_compra) AS Des_Mes,
    QUARTER(c.fecha_compra) AS Cod_Trimestre,
    CONCAT('Trimestre ', QUARTER(c.fecha_compra)) AS Des_Trimestre,
    YEAR(c.fecha_compra) AS Cod_Año
FROM alexeerd_proyectolaravel.compras as c WHERE c.created_at IS NOT NULL;

-- DPROVEEDOR----------->
INSERT INTO DPROVEEDOR(-- L = CARGA----------->
	Nom_prov,
    Dir_prov,
    Tel_prov,
    Ema_prov
)SELECT
	pv.nombre AS Nom_prov,
    pv.direccion AS Dirección,
    pv.telefono AS Teléfono,
    pv.email AS Email
FROM alexeerd_proyectolaravel.proveedores AS pv;


-- HCOMPRA----------->
INSERT  INTO HCOMPRA(
	DProducto_id,
    DTiempo_id,
    DProveedor_id,
    Compras,
    Com_Cant_Prod,
    Can_proveedor
)
SELECT 
	DP.DProducto_id,
    DT.DTIempo_id,
    DPV.DProveedor_id,
    SUM(G.Compras) AS Compras,
    SUM(G.Com_Cant_Prod) AS CANT_UNID,
    COUNT(DISTINCT G.Nom_prov) as Can_proveedor
FROM (
	SELECT
		DATE_FORMAT(co.fecha_compra, '%Y-%m-%d') AS Fecha,
        p.codigo AS Cod_Prod,
        p.nombre AS Nom_Prod,
        c.nombre AS Cat_Producto,
        dc.cantidad * dc.precio AS Compras,
        dc.cantidad AS Com_Cant_Prod,
        pv.nombre AS Nom_prov
	FROM alexeerd_proyectolaravel.compras AS co
		INNER JOIN alexeerd_proyectolaravel.detalle_compras AS dc ON co.id = dc.idcompra
        INNER JOIN alexeerd_proyectolaravel.productos AS p ON dc.idproducto = p.id
        INNER JOIN alexeerd_proyectolaravel.categorias AS c ON p.idcategoria = c.id
        INNER JOIN alexeerd_proyectolaravel.proveedores AS pv ON co.idproveedor = pv.id
) AS G
	INNER JOIN DPRODUCTO AS DP ON G.Cod_Prod = DP.Cod_Prod
    INNER JOIN DTIEMPO AS DT ON G.Fecha = DT.Fecha
    INNER JOIN DPROVEEDOR AS DPV ON G.Nom_prov = DPV.Nom_prov
    GROUP BY DProducto_id, DTIempo_id, DProveedor_id;