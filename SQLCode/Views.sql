
-- VISTA QUE PERMITE VER VENTAS DIARIAS POR TIENDAS
CREATE VIEW vista_ventas_diarias_tiendas AS
SELECT F.fecha, F.idTienda, T.nombre, SUM(DF.precio * DF.cantidad) AS Ventas
FROM 
  DetalleFacturas DF 
  INNER JOIN 
  Facturas F 
    ON DF.numeroFactura = F.numeroFactura
  INNER JOIN 
  Tiendas T
    ON F.idTienda = T.id
GROUP BY F.fecha, F.idTienda, T.nombre
ORDER BY F.fecha DESC;


-- VISTA QUER PERMITE VER LOS PRODUCTOS QUE GENERAN MAYOR VALOR EN VENTAS
CREATE VIEW vista_productos_mas_ventas AS
SELECT DF.upcProducto, P.nombre, SUM(DF.cantidad) as cantidad, SUM(DF.precio*DF.cantidad) AS importe 
FROM 
  DetalleFacturas DF 
  INNER JOIN 
  Productos P
    ON DF.upcProducto = P.upc
GROUP BY DF.upcProducto, P.nombre
ORDER BY importe DESC;


-- VISTA QUE PERMITE VER LOS PRODUCTOS QUE GENERAN MAYOR VALOR EN VENTAS
CREATE VIEW vista_productos_mas_cantidad_vendida AS
SELECT DF.upcProducto, P.nombre, SUM(DF.cantidad) as cantidad, SUM(DF.precio*DF.cantidad) AS importe 
FROM 
  DetalleFacturas DF 
  INNER JOIN 
  Productos P
    ON DF.upcProducto = P.upc
GROUP BY DF.upcProducto, P.nombre
ORDER BY cantidad DESC;


-- VISTA QUE PERMITE VER LAS UBICACIONES
CREATE VIEW vista_ubicaciones
  SELECT id, direccion, ciudad, estado, pais
  FROM Ubicaciones
--  WHERE direccion = p_direccion AND ciudad = p_ciudad AND estado = p_estado AND pais = p_pais;


-- VISTA QUE PERMITE VER EL LAS FACTURAS POR CLIENTE
CREATE VIEW vista_historial_facturas_cliente AS
  SELECT F.fecha, F.numeroFactura, T.nombre, F.total, F.idCLiente
  FROM Facturas F
  INNER JOIN Tiendas T ON F.idTienda = T.id
-- WHERE F.idCliente = p_id;


-- VISTA QUE PERMITE VER EL DETALLE DE PRODUCTOS DE UNA FACTURA
CREATE VIEW vista_detalle_productos_por_factura AS
  SELECT F.fecha, F.numeroFactura, T.nombre, F.total, F.idCliente
  FROM 
    Facturas F INNER JOIN Tiendas T 
    ON F.idTienda = T.id
--  WHERE F.idCliente = p_id;

-- VISTA QUE PERMITE VER LOS MEJORES PRODUCTOS
CREATE VIEW vista_mejores_productos AS
  SELECT DF.upcProducto, P.nombre, COUNT(DF.upcProducto) as Cantidad, F.idTienda
    FROM
      DetalleFacturas DF 
      INNER JOIN Facturas F
        ON DF.numeroFactura = F.numeroFactura 
      INNER JOIN Productos P 
        ON DF.upcProducto = P.upc
-- WHERE F.idTienda = p_id
-- GROUP BY DF.upcProducto, P.nombre
-- ORDER BY Cantidad
-- LIMIT 20;


-- VISTA QUE PERMITE VER LOS MEJORES PRODUCTOS
CREATE OR REPLACE VIEW MejoresProductosPorPais AS
  WITH RECURSIVE VentasDeProductos AS (
    -- Calcular las ventas totales de cada producto por país
    SELECT
      DF.upcProducto,
      U.pais AS pais,
      SUM(DF.precio * DF.cantidad) AS ventas_totales,
      ROW_NUMBER() OVER (PARTITION BY U.pais ORDER BY SUM(DF.precio * DF.cantidad) DESC) AS ranking_ventas
    FROM
      DetalleFacturas DF
      JOIN Facturas F ON DF.numeroFactura = F.numeroFactura
      JOIN Tiendas T ON F.idTienda = T.id
      JOIN Ubicaciones U ON T.idUbicacion = U.id
    GROUP BY
      DF.upcProducto,
      U.pais
  ),
  RankingRecursivo AS (
    -- Utilizar CTE recursivo para clasificar los productos
    SELECT
      vdp.upcProducto,
      vdp.pais,
      vdp.ventas_totales,
      vdp.ranking_ventas
    FROM
      VentasDeProductos vdp
    WHERE
      vdp.ranking_ventas <= 20 -- Seleccionar inicialmente los 20 mejores productos
    UNION ALL
    SELECT
      vdp2.upcProducto,
      vdp2.pais,
      vdp2.ventas_totales,
      vdp2.ranking_ventas
    FROM
      VentasDeProductos vdp2
      JOIN RankingRecursivo rr ON vdp2.pais = rr.pais AND vdp2.ranking_ventas = rr.ranking_ventas + 1
    WHERE
      rr.ranking_ventas < 20 -- Continuar la recursión hasta que se seleccionen 20 productos
  )
  -- Selección final de los 20 mejores productos por país
  SELECT
    rr.upcProducto,
    rr.pais,
    rr.ventas_totales,
    rr.ranking_ventas
  FROM
    RankingRecursivo rr
  ORDER BY
    rr.pais,
    rr.ranking_ventas;

-- VISTA QUE PERMITE VER LOS MEJORES PRODUCTOS POR PAIS
CREATE VIEW vista_mejores_productos_vendido_pais AS
  SELECT upcProducto, ventas_totales, pais
  FROM MejoresProductosPorPais
-- WHERE pais = p_pais;

-- VISTA QUE PERMITE VER EL HISTORIAL DE VENTAS ENTRE UN RANGO DE FECHAS POR TIENDA
CREATE VIEW vista_historial_ventas_diarias_entre_fechas_por_tienda AS
  SELECT fecha, Ventas, idTienda
  FROM ventas_diarias_tiendas
-- WHERE idTienda = p_id 
--   AND fecha BETWEEN fechaInicio AND fechaFinal;


-- VISTA QUE PERMITE VER EL HISTORIAL DE VENTAS POR TODAS LAS TIENDAS
CREATE VIEW vista_historial_ventas_diarias_todas_tiendas AS
  SELECT fecha, SUM(Ventas)
  FROM ventas_diarias_tiendas
  GROUP BY fecha;


-- VISTA QUE PERMITE VER EL HISTORIAL DE VENTAS ENTRE UN RANGO DE FECHAS PARA TODAS LAS TIENDAS
CREATE VIEW vista_historial_ventas_diarias_entre_fechas_todas_tiendas AS
  SELECT fecha, SUM(Ventas)
  FROM ventas_diarias_tiendas
  GROUP BY fecha;
-- WHERE fecha BETWEEN fechaInicio AND fechaFinal

-- VISTA QUE PERMITE VER LAS CINCO MEJORES TIENDAS
CREATE VIEW vista_cinco_mejores_tiendas AS
  SELECT ROW_NUMBER() OVER (ORDER BY SUM(Ventas) DESC) AS Numero, idTienda, SUM(Ventas) as VentasTotales
  FROM ventas_diarias_tiendas
  WHERE fecha BETWEEN  date_trunc('year',CURRENT_DATE) AND CURRENT_DATE
  GROUP BY idTienda
  ORDER BY VentasTotales
  LIMIT 5;


-- VISTA QUE PERMITE VER LAS MEJORES TRES CATEGORÍAS
CREATE VIEW vista_mejores_tres_categorias AS
  SELECT C.id, C.categoria, SUM(importe) as Ventas
  FROM
    Categorias C
    LEFT JOIN
    ProductoCategorizado PC
      ON C.id = PC.idcategoria
    LEFT JOIN
    productos_mas_ventas PM
      ON PC.upcProducto = PM.upcProducto
  GROUP BY C.id, C.categoria
  ORDER BY Ventas DESC
  LIMIT 3;
