-- TABLA CLIENTES =================================================================================
-- Creación de la tabla Clientes
CREATE TABLE Clientes(
	id	SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	correoElectronico varchar(255)
);

-- Esta función inserta un nuevo Cliente en la tabla "Clientes".
-- Toma un nombre y un correo electrónico como parámetros y agrega un nuevo registro con esos valores.
CREATE OR REPLACE FUNCTION insert_cliente(
    p_nombre VARCHAR(255),
    p_correoElectronico VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
    INSERT INTO Clientes (nombre, correoElectronico) VALUES (p_nombre, p_correoElectronico);
$$;

-- Esta función elimina un Cliente de la tabla "Clientes" basado en su ID.
-- Toma un ID como parámetro y elimina el registro correspondiente de la tabla.
CREATE OR REPLACE FUNCTION delete_cliente(
  p_id INT
)
RETURNS VOID
LANGUAGE SQL AS $$
    DELETE FROM Clientes
    WHERE Clientes.id = p_id;
$$;

-- Esta función actualiza el nombre de un Cliente en la tabla "Clientes".
-- Toma un ID y un nuevo nombre como parámetros y actualiza el nombre del registro correspondiente.
CREATE OR REPLACE FUNCTION update_cliente_nombre(
  p_id INT,
  p_nombreCliente VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Clientes
  SET nombre = p_nombreCliente
  WHERE Clientes.id = p_id;
$$;

-- Esta función actualiza la dirección de correo electrónico de un Cliente en la tabla "Clientes".
-- Toma un ID y una nueva dirección de correo electrónico como parámetros y actualiza el correo electrónico del registro correspondiente.
CREATE OR REPLACE FUNCTION update_cliente_correoElectronico(
  p_id INT,
  p_correoElectronico VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Clientes
  SET correoElectronico = p_correoElectronico
  WHERE Clientes.id = p_id;
$$;


-- TABLA UBICACIONES ==============================================================================
-- Creación de las ubicaciones de las tiendas
CREATE TABLE Ubicaciones(
	id SERIAL PRIMARY KEY,
  direccion VARCHAR(255),
  ciudad VARCHAR(225),
  estado VARCHAR(255),
  pais VARCHAR(255)
);

-- Funciones para la tabla "Ubicaciones"

-- Esta función inserta una nueva ubicación en la tabla "Ubicaciones".
CREATE OR REPLACE FUNCTION insert_ubicacion(
  p_direccion VARCHAR(255),
  p_ciudad VARCHAR(225),
  p_estado VARCHAR(255),
  p_pais VARCHAR(255)
) 
RETURNS VOID
LANGUAGE SQL AS $$
  INSERT INTO Ubicaciones(direccion, ciudad, estado, pais) 
  VALUES
    (p_direccion, p_ciudad, p_estado, p_pais);
$$;

-- Esta función elimina una ubicación de la tabla "Ubicaciones" basada en su ID.
CREATE OR REPLACE FUNCTION delete_ubicacion(
  p_id INT
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Ubicaciones
  WHERE id = p_id;
$$;

-- Esta función actualiza la dirección de una ubicación en la tabla "Ubicaciones" basada en su ID.
CREATE OR REPLACE FUNCTION update_ubicacion_direccion(
  p_id INT,
  p_direccion VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Ubicaciones
  SET direccion = p_direccion
  WHERE Ubicaciones.id = p_id;
$$;

-- Esta función actualiza la ciudad de una ubicación en la tabla "Ubicaciones" basada en su ID.
CREATE OR REPLACE FUNCTION update_ubicacion_ciudad(
  p_id INT,
  p_ciudad VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Ubicaciones
  SET ciudad = p_ciudad
  WHERE Ubicaciones.id = p_id;
$$;

-- Esta función actualiza el estado de una ubicación en la tabla "Ubicaciones" basada en su ID.
CREATE OR REPLACE FUNCTION update_ubicacion_estado(
  p_id INT,
  p_estado VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Ubicaciones
  SET estado = p_estado
  WHERE Ubicaciones.id = p_id;
$$;

-- Esta función actualiza el país de una ubicación en la tabla "Ubicaciones" basada en su ID.
CREATE OR REPLACE FUNCTION update_ubicacion_pais(
  p_id INT,
  p_pais VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Ubicaciones
  SET pais = p_pais
  WHERE Ubicaciones.id = p_id;
$$;

-- Esta función actualiza múltiples campos de una ubicación en la tabla "Ubicaciones" basada en su ID.
CREATE OR REPLACE FUNCTION update_ubicacion(
  p_id INT,
  p_direccion VARCHAR(255),
  p_ciudad VARCHAR(225),
  p_estado VARCHAR(255),
  p_pais VARCHAR(255)
) 
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Ubicaciones
  SET direccion = p_direccion,
      ciudad = p_ciudad,
      estado = p_estado,
      pais = p_pais
  WHERE id = p_id;
$$;


-- TABLA TIENDAS ==================================================================================
-- Creación de la tabla "Tiendas"
CREATE TABLE Tiendas(
	id SERIAL PRIMARY KEY,
  idUbicacion INT DEFAULT -1,
	nombre VARCHAR(255),
	horario VARCHAR(255),
	FOREIGN KEY(idUbicacion) REFERENCES Ubicaciones(id) ON DELETE SET NULL
);

-- Esta función inserta una nueva tienda en la tabla "Tiendas".
CREATE OR REPLACE FUNCTION insert_tienda(
  p_idUbicacion INT,
	p_nombre VARCHAR(255),
	p_horario VARCHAR(255)
)
RETURNS VOID 
LANGUAGE SQL AS $$
  INSERT INTO Tiendas(idUbicacion, nombre, horario)
  VALUES 
    (p_idUbicacion,p_nombre,p_horario);
$$;

-- Esta función elimina una tienda de la tabla "Tiendas" basada en su ID.
CREATE OR REPLACE FUNCTION delete_tienda(
  p_id INT
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Tiendas
  WHERE Tiendas.id = p_id;
$$;

-- Esta función actualiza el nombre de una tienda en la tabla "Tiendas" basada en su ID.
CREATE OR REPLACE FUNCTION update_tienda_nombre(
  p_id INT,
  p_nombre VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Tiendas
  SET nombre = p_nombre
  WHERE Tiendas.id = p_id;
$$;

-- Esta función actualiza el horario de una tienda en la tabla "Tiendas" basada en su ID.
CREATE OR REPLACE FUNCTION update_tienda_horario(
  p_id INT,
  p_horario VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Tiendas
  SET horario = p_horario
  WHERE Tiendas.id = p_id;
$$;


-- Esta función actualiza el nombre y horario de una tienda en la tabla "Tiendas" basada en su ID.
CREATE OR REPLACE FUNCTION update_tienda(
  p_id INT,
  p_nombre VARCHAR(255),
  p_horario VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Tiendas
  SET nombre = p_nombre,
      horario = p_horario
  WHERE Tiendas.id = p_id;
$$;


-- TABLA PRODUCTOS ================================================================================
-- Creación de la tabla "Productos"
CREATE TABLE Productos(
	upc VARCHAR(255) PRIMARY KEY,
  nombre VARCHAR(255),
	tamaño VARCHAR(255),
	embalaje VARCHAR(255),
	marca VARCHAR(255)
);

-- Esta función inserta un nuevo producto en la tabla "Productos".
CREATE OR REPLACE FUNCTION insert_producto(
  p_upc VARCHAR(255),
  nombre VARCHAR(255),
  p_tamaño VARCHAR(255),
  p_embalaje VARCHAR(255),
  p_marca VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$ 
  INSERT INTO Productos(upc, nombre, tamaño, embalaje, marca)
  VALUES
    (p_upc, nombre, p_tamaño, p_embalaje, p_marca);
$$;

-- Esta función elimina un producto de la tabla "Productos" basado en su upc (Código de Producto Único).
CREATE OR REPLACE FUNCTION delete_producto(
  p_upc VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Productos
  WHERE Productos.upc = p_upc;
$$;

-- Esta función actualiza el nombre de un producto en la tabla "Productos" basado en su upc.
CREATE OR REPLACE FUNCTION update_producto_nombre(
  p_upc VARCHAR(255),
  p_nombre VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET nombre = p_nombre 
  WHERE Productos.upc = p_upc;
$$;


-- Esta función actualiza el tamaño de un producto en la tabla "Productos" basado en su upc.
CREATE OR REPLACE FUNCTION update_producto_tamano(
  p_upc VARCHAR(255),
  p_tamaño VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET tamaño = p_tamaño 
  WHERE Productos.upc = p_upc;
$$;

-- Esta función actualiza el embalaje de un producto en la tabla "Productos" basado en su upc.
CREATE OR REPLACE FUNCTION update_producto_embalaje(
  p_upc VARCHAR(255),
  p_embalaje VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET embalaje = p_embalaje 
  WHERE Productos.upc = p_upc;
$$;

-- Esta función actualiza la marca de un producto en la tabla "Productos" basado en su upc.
CREATE OR REPLACE FUNCTION update_producto_marca(
  p_upc VARCHAR(255),
  p_marca VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET marca = p_marca 
  WHERE Productos.upc = p_upc;
$$;

CREATE OR REPLACE FUNCTION update_producto(
  p_upc VARCHAR(255),
  p_nombre VARCHAR(255),
  p_tamaño VARCHAR(255),
  p_embalaje VARCHAR(255),
  p_marca VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET nombre = p_nombre,
      tamaño = p_tamaño,
      embalaje = p_embalaje,
      marca = p_marca
  WHERE Productos.upc = p_upc;
$$;


-- TABLA CATEGORIAS ===============================================================================
-- Creación de la tabla Categorías
CREATE TABLE Categorias(
	id INT PRIMARY KEY,
	categoria VARCHAR(255)
);

-- Esta función se utiliza para insertar una nueva categoría en la tabla "Categoria".
CREATE OR REPLACE FUNCTION insert_categoria(
  p_categoria VARCHAR(255)  -- El nombre de la categoría que se va a insertar.
)
RETURNS VOID
LANGUAGE SQL AS $$
  INSERT INTO Categorias(categoria)
  VALUES
    (p_categoria);
$$;

-- Esta función se utiliza para eliminar una categoría de la tabla "Categorias" basada en su ID.
CREATE OR REPLACE FUNCTION delete_categoria(
  p_id INT  -- El ID de la categoría que se va a eliminar.
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Categorias
  WHERE Categorias.id = p_id;
$$;

-- Esta función se utiliza para actualizar el nombre de una categoría en la tabla "Categorias" basada en su ID.
CREATE OR REPLACE FUNCTION update_categoria(
  p_id INT,  -- El ID de la categoría que se va a actualizar.
  p_categoria VARCHAR(255)  -- El nuevo nombre de la categoría.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Categorias
  SET categoria = p_categoria
  WHERE Categorias.id = p_id;
$$;

CREATE TABLE ProductoCategorizado(
	upcProducto VARCHAR(255),
	idcategoria INT,
	FOREIGN KEY(upcProducto) REFERENCES Productos(upc) ON DELETE CASCADE,
	FOREIGN KEY(idcategoria) REFERENCES Categorias(id) ON DELETE CASCADE
);

-- TODO: Pendientes CRUD con Funciones

-- TABLA PROVEEDORES ==============================================================================
-- Creación de la tabla Proveedor
CREATE TABLE Proveedores(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255)
);

-- Esta función se utiliza para insertar un nuevo proveedor en la tabla "Proveedores".
CREATE OR REPLACE FUNCTION insert_proveedor(
	p_nombre VARCHAR(255)  -- El nombre del proveedor que se va a insertar.
)
RETURNS VOID
LANGUAGE SQL AS $$
  INSERT INTO Proveedores(nombre)
  VALUES
    (p_nombre);  -- Inserta el nombre del proveedor en la tabla "Proveedores".
$$;

-- Esta función se utiliza para eliminar un proveedor de la tabla "Proveedores" basado en su ID.
CREATE OR REPLACE FUNCTION delete_proveedor(
  p_id INT  -- El ID del proveedor que se va a eliminar.
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Proveedores
  WHERE Proveedores.id = p_id;  -- Elimina el proveedor con el ID proporcionado.
$$;

-- Esta función se utiliza para actualizar el nombre de un proveedor en la tabla "Proveedores" basado en su ID.
CREATE OR REPLACE FUNCTION update_proveedor(
  p_id INT,  -- El ID del proveedor que se va a actualizar.
  p_nombre VARCHAR(255)  -- El nuevo nombre del proveedor.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Proveedores
  SET nombre = p_nombre
  WHERE Proveedores.id = p_id;  -- Actualiza el nombre del proveedor con el ID proporcionado.
$$;

-- TABLA FACTURAS =================================================================================
-- Creación de la tabla de facturas
CREATE TABLE Facturas(
	numeroFactura SERIAL PRIMARY KEY,
	idCliente INT,
	idTienda INT,
	fecha date,
	isv numeric(10,2),
	subtotal numeric(10,2),
	total numeric(13,2),
	FOREIGN KEY(idCliente) REFERENCES Clientes(id),
	FOREIGN KEY(idTienda) REFERENCES Tiendas(id) ON DELETE CASCADE
);

-- Esta función se utiliza para insertar una nueva factura en la tabla "Facturas".
CREATE OR REPLACE FUNCTION insert_factura(
  p_idCliente INT,  -- El ID del cliente asociado a la factura.
  p_idTienda INT,   -- El ID de la tienda donde se generó la factura.
  p_fecha date      -- La fecha de la factura.
)
RETURNS VOID
LANGUAGE SQL AS $$
  INSERT INTO Facturas(idCliente, idTienda, fecha)
  VALUES
    (p_idCliente, p_idTienda, p_fecha);  -- Inserta una nueva factura con los datos proporcionados.
$$;

-- Esta función se utiliza para eliminar una factura de la tabla "Facturas" basada en su número de factura.
CREATE OR REPLACE FUNCTION delete_factura(
  p_numeroFactura INT  -- El número de factura que se va a eliminar.
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Facturas
  WHERE Facturas.numeroFactura = p_numeroFactura;  -- Elimina la factura con el número de factura proporcionado.
$$;

-- Esta función se utiliza para actualizar la fecha de una factura en la tabla "Facturas" basada en su número de factura.
CREATE OR REPLACE FUNCTION update_factura_fecha(
  p_numeroFactura INT,  -- El número de factura de la factura que se va a actualizar.
  p_fecha date         -- La nueva fecha de la factura.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Facturas
  SET fecha = p_fecha
  WHERE Facturas.numeroFactura = p_numeroFactura;  -- Actualiza la fecha de la factura con el número de factura proporcionado.
$$;

-- TABLA INVENTARIO_POR_TIENDA ====================================================================
-- Creación de la tabla de InventarioPorTienda
CREATE TABLE InventarioPorTienda(
	idTienda INT,
	upcProducto VARCHAR(255),
	precio numeric(9,2),
	cantidad INT,
	reorden INT,
	PRIMARY KEY (idTienda,upcProducto),
	FOREIGN KEY(idTienda) REFERENCES Tiendas(id) ON DELETE CASCADE,
	FOREIGN KEY(upcProducto) REFERENCES Productos(upc) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Esta función se utiliza para insertar un nuevo registro en la tabla "InventarioPorTienda" que representa el inventario de un producto en una tienda específica.
CREATE OR REPLACE FUNCTION insert_inventario_por_tienda(
  p_idTienda INT,            -- El ID de la tienda.
  p_upcProducto VARCHAR(255),  -- El Código de Producto Único (upc) del producto.
  p_precio numeric(9,2),     -- El precio del producto en la tienda.
  p_cantidad INT,            -- La cantidad de unidades disponibles en el inventario.
  p_reorden INT              -- El nivel de reorden del producto en el inventario.
)
RETURNS VOID
LANGUAGE SQL AS $$
  INSERT INTO InventarioPorTienda(idTienda, upcProducto, precio, cantidad, reorden)
  VALUES
    (p_idTienda, p_upcProducto, p_precio, p_cantidad, p_reorden);  -- Inserta un nuevo registro en el inventario de la tienda.
$$;

-- Esta función se utiliza para eliminar un registro de la tabla "InventarioPorTienda" basado en el ID de la tienda y el upc del producto.
CREATE OR REPLACE FUNCTION delete_inventario_por_tienda(
  p_idTienda INT,            -- El ID de la tienda.
  p_upcProducto VARCHAR(255)  -- El Código de Producto Único (upc) del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM InventarioPorTienda
  WHERE 
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.upcProducto = p_upcProducto;  -- Elimina un registro del inventario de la tienda.
$$;

-- Esta función se utiliza para actualizar el precio de un producto en el inventario de una tienda específica.
CREATE OR REPLACE FUNCTION update_inventario_por_tienda_precio(
  p_idTienda INT,            -- El ID de la tienda.
  p_upcProducto VARCHAR(255),  -- El Código de Producto Único (upc) del producto.
  p_precio numeric(9,2)      -- El nuevo precio del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE InventarioPorTienda
  SET precio = p_precio
  WHERE
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.upcProducto = p_upcProducto;  -- Actualiza el precio del producto en el inventario de la tienda.
$$;

-- Esta función se utiliza para actualizar la cantidad de unidades disponibles de un producto en el inventario de una tienda específica.
CREATE OR REPLACE FUNCTION update_inventario_por_tienda_cantidad(
  p_idTienda INT,            -- El ID de la tienda.
  p_upcProducto VARCHAR(255),  -- El Código de Producto Único (upc) del producto.
  p_cantidad INT             -- La nueva cantidad de unidades disponibles.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE InventarioPorTienda
  SET cantidad = p_cantidad
  WHERE
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.upcProducto = p_upcProducto;  -- Actualiza la cantidad de unidades disponibles del producto en el inventario de la tienda.
$$;

-- Esta función se utiliza para actualizar el nivel de reorden de un producto en el inventario de una tienda específica.
CREATE OR REPLACE FUNCTION update_inventario_por_tienda_reorden(
  p_idTienda INT,            -- El ID de la tienda.
  p_upcProducto VARCHAR(255),  -- El Código de Producto Único (upc) del producto.
  p_reorden INT              -- El nuevo nivel de reorden del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE InventarioPorTienda
  SET reorden = p_reorden
  WHERE
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.upcProducto = p_upcProducto;  -- Actualiza el nivel de reorden del producto en el inventario de la tienda.
$$;

-- Esta función se utiliza para actualizar el precio, la cantidad y el nivel de reorden de un producto en el inventario de una tienda específica.
CREATE OR REPLACE FUNCTION update_inventario_por_tienda_precio_cantidad_reorden(
  p_idTienda INT,            -- El ID de la tienda.
  p_upcProducto VARCHAR(255),  -- El Código de Producto Único (upc) del producto.
  p_precio numeric(9,2),     -- El nuevo precio del producto.
  p_cantidad INT,            -- La nueva cantidad de unidades disponibles.
  p_reorden INT              -- El nuevo nivel de reorden del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE InventarioPorTienda
  SET precio = p_precio,
      cantidad = p_cantidad,
      reorden = p_reorden
  WHERE
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.upcProducto = p_upcProducto;  -- Actualiza el precio, cantidad y nivel de reorden del producto en el inventario de la tienda.
$$;



-- TABLA DETALLE_FACTURA ==========================================================================
-- Creación de tabla DetalleFacturas
CREATE TABLE DetalleFacturas(
	numeroFactura INT,
	upcProducto VARCHAR(255),
	precio numeric(9,2),
	cantidad INT,
	FOREIGN KEY (numeroFactura) REFERENCES Facturas(numeroFactura) ON DELETE CASCADE,
	FOREIGN KEY (upcProducto) REFERENCES Productos(upc) ON DELETE CASCADE
);


-- Definición del tipo de datos "type_DetalleFactura" que representa los detalles de una factura.
CREATE TYPE type_DetalleFactura AS (
	numeroFactura INT,            -- El número de la factura.
	upcProducto VARCHAR(255),     -- El Código de Producto Único (upc) del producto.
	precio numeric(9,2),          -- El precio del producto.
	cantidad INT                  -- La cantidad de unidades del producto.
);

-- Esta función se utiliza para insertar un nuevo detalle de factura en la tabla "DetalleFacturas".
CREATE OR REPLACE FUNCTION insert_detalleFactura(
	p_numeroFactura INT,         -- El número de factura.
	p_upcProducto VARCHAR(255),  -- El Código de Producto Único (upc) del producto.
	p_precio numeric(9,2),      -- El precio del producto.
	p_cantidad INT              -- La cantidad de unidades del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  INSERT INTO DetalleFacturas(numeroFactura, upcProducto, precio, cantidad)
  VALUES
    (p_numeroFactura, p_upcProducto, p_precio, p_cantidad);  -- Inserta un nuevo detalle de factura.
$$;

-- Esta función se utiliza para insertar múltiples detalles de factura en la tabla "DetalleFacturas" utilizando el tipo de datos personalizado.
CREATE OR REPLACE FUNCTION insert_multiple_detalleFactura(
  detalles type_DetalleFactura[]  -- Un arreglo de detalles de factura.
)
RETURNS BOOLEAN
LANGUAGE PLPGSQL AS $$
DECLARE
  resultado BOOLEAN;
  detalle type_DetalleFactura;
BEGIN
  resultado := FALSE;
  FOREACH detalle IN ARRAY detalles
  LOOP
    CALL insert_detalleFactura(detalle.numeroFactura, detalle.upcProducto, detalle.precio, detalle.cantidad);  -- Llama a la función para insertar un detalle de factura.
  END LOOP;
  resultado := TRUE;
  RETURN resultado;
END;
$$;

-- Esta función se utiliza para eliminar un detalle de factura específico basado en el número de factura y el Código de Producto Único (upc) del producto.
CREATE OR REPLACE FUNCTION delete_detalleFactura_productoIndividual(
  p_numeroFactura INT,        -- El número de factura.
  p_upcProducto VARCHAR(255)  -- El Código de Producto Único (upc) del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM DetalleFacturas as F
  WHERE F.numeroFactura = p_numeroFactura AND F.upcProducto = p_upcProducto;  -- Elimina un detalle de factura específico.
$$;
-- Esta función se utiliza para eliminar todos los detalles de factura asociados a un número de factura específico.
CREATE OR REPLACE FUNCTION delete_detalleFactura_completo(
  p_numeroFactura INT  -- El número de factura.
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM DetalleFacturas as DF
  WHERE DF.numeroFactura = p_numeroFactura;  -- Elimina todos los detalles de factura asociados a un número de factura.
$$;


-- TABLA VENDE ====================================================================================
-- Creación de la tabla Vende (Productos que vende cada Proveedor)
CREATE TABLE Vende(
	idProveedor INT,
  upcProducto VARCHAR(225),
  FOREIGN KEY (idProveedor) REFERENCES Proveedores(id) ON DELETE CASCADE,
  FOREIGN KEY (upcProducto) REFERENCES Productos(upc) ON DELETE CASCADE
);

-- Esta función se utiliza para registrar que un proveedor vende un producto específico.
CREATE OR REPLACE FUNCTION insert_vende(
  p_idProveedor INT,          -- El ID del proveedor.
  p_upcProducto VARCHAR(225)  -- El Código de Producto Único (upc) del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  INSERT INTO Vende(idProveedor, upcProducto)
  VALUES (p_idProveedor, p_upcProducto);  -- Registra la relación entre el proveedor y el producto que vende.
$$;

-- Esta función se utiliza para eliminar la relación entre un proveedor y un producto que vendía.
CREATE OR REPLACE FUNCTION delete_vende(
  p_idProveedor INT,          -- El ID del proveedor.
  p_upcProducto VARCHAR(225)  -- El Código de Producto Único (upc) del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Vende
  WHERE 
    idProveedor = p_idProveedor AND
    upcProducto = p_upcProducto;  -- Elimina la relación de venta entre el proveedor y el producto.
$$;

-- Esta función se utiliza para actualizar el producto que un proveedor vende.
CREATE OR REPLACE FUNCTION update_vende_producto(
  p_idProveedor INT,                  -- El ID del proveedor.
  p_upcProductoAnterior VARCHAR(255),  -- El Código de Producto Único (upc) anterior.
  p_upcProductoNuevo VARCHAR(225)     -- El nuevo Código de Producto Único (upc) del producto que se vende.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Vende
  SET upcProducto = p_upcProductoNuevo
  WHERE 
    Vende.idProveedor = p_idProveedor AND
    upcProducto = p_upcProductoAnterior;  -- Actualiza el producto que el proveedor vende.
$$;


-- FUNCION QUE RETORNA EL HISTORIAL DE COMPRA DE UN CLIENTE ========================================
CREATE OR REPLACE FUNCTION historial_facturas_cliente(
  p_id INT
)
RETURNS TABLE(
    fecha DATE,
    numeroFactura INT,
    nombreTienda VARCHAR(255),
    total numeric(13,2)
)
LANGUAGE plpgsql  AS $$
BEGIN
  RETURN QUERY
    SELECT F.fecha, F.numeroFactura, T.nombre, F.total
    FROM Facturas F
    INNER JOIN Tiendas T ON F.idTienda = T.id
    WHERE F.idCliente = p_id;
END;
$$;

-- FUNCION QUE PERMITE VISUALIZAR LOS MEJORES 20 PRODUCTOS VENDIDOS POR UNA TIENDA ================
CREATE OR REPLACE FUNCTION historial_facturas_cliente(
  p_id INT
)
RETURNS TABLE(
    fecha DATE,
    numeroFactura INT,
    nombreTienda VARCHAR(255),
    total numeric(13,2)
)
LANGUAGE PLPGSQL  AS $$
BEGIN
  RETURN QUERY
    SELECT F.fecha, F.numeroFactura, T.nombre, F.total
    FROM 
      Facturas F INNER JOIN Tiendas T 
      ON F.idTienda = T.id
    WHERE F.idCliente = p_id;
END;
$$;

CREATE OR REPLACE FUNCTION detalle_productos_por_factura(
  p_numeroFactura INT
)
RETURNS TABLE(
  upc VARCHAR(255),
  nombre VARCHAR(255),
  cantidad INT,
  precioUnitario numeric(10,2),
  importe numeric(10,2)
)
LANGUAGE SQL AS $$
  SELECT DF.upcProducto, P.nombre, DF.cantidad, DF.precio as precioUnitario, DF.precio*DF.cantidad as importe
  FROM DetalleFacturas DF INNER JOIN Productos P
    ON DF.upcProducto = P.upc
  WHERE DF.numeroFactura = p_numeroFactura;
$$;



-- FUNCION QUE PERMITE OBTENER LOS 20 PRODUCTOS MAS VENDIDOS POR UNA TIENDA ========================
CREATE OR REPLACE FUNCTION mejore_viente_productos_tienda(
  p_id INT
)
RETURNS TABLE(
  upc VARCHAR(255),
  nombre VARCHAR(255),
  cantidadVendida INT
)
LANGUAGE PLPGSQL AS $$
BEGIN
  RETURN QUERY
  SELECT DF.upcProducto, P.nombre, COUNT(DF.upcProducto)
  FROM
    DetalleFacturas DF 
    INNER JOIN Facturas F
      ON DF.numeroFactura = F.numeroFactura 
    INNER JOIN Productos P 
      ON DF.upcProducto = P.upc
  WHERE F.idTienda = p_id
  GROUP BY DF.upcProducto
  LIMIT 20;
END;
$$;


-- VISTA DE MEJORES PRODUCTOS POR PAIS ============================================================
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

-- FUNCION QUE RETORNA LOS MEJORES 20 PRODUCTOS POR PAIS SELECCIONADO
CREATE OR REPLACE FUNCTION mejores_veinte_producto_vendidos_pais(
  p_pais VARCHAR(255)
)
RETURNS TABLE (
    upcProducto VARCHAR(255),
    ventas_totales numeric(10,2)
)
LANGUAGE PLPGSQL AS $$
	BEGIN
		RETURN QUERY 
		SELECT upcProducto, ventas_totales
		FROM MejoresProductosPorPais
		WHERE pais = p_pais;
	END;
$$;

CREATE VIEW ventas_diarias_tiendas AS
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

-- FUNCION QUE RETORNA EL HISTORIAL DE VENTAS DIARIAS =============================================
CREATE OR REPLACE FUNCTION historial_ventas_diarias_por_tienda(
  p_id INT
)
RETURNS TABLE(
  fecha DATE,
  Ventas numeric(13,2)
)
LANGUAGE PLPGSQL AS $$
BEGIN
  SELECT fecha, Ventas
  FROM ventas_diarias_tiendas
  WHERE idTienda = p_id;
END;
$$;

-- FUNCION QUE RETORNA EL HISTORIAL DE VENTAS ENTRE UN RANGO DE FECHAS POR TIENDA =================
CREATE OR REPLACE FUNCTION historial_ventas_diarias_entre_fechas_por_tienda(
  fechaInicio DATE,
  fechaFinal DATE,
  p_id INT
)
RETURNS TABLE(
  fecha DATE,
  Ventas numeric(13,2)
)
LANGUAGE PLPGSQL AS $$
BEGIN
  RETURN QUERY
    SELECT fecha, Ventas
    FROM ventas_diarias_tiendas
    WHERE idTienda = p_id 
      AND fecha BETWEEN fechaInicio AND fechaFinal;
END;
$$;

-- FUNCION QUE RETORNA EL HISTORIAL DE VENTAS ENTRE UN RANGO DE FECHAS POR TIENDA =================
CREATE OR REPLACE FUNCTION historial_ventas_diarias_todas_tienda(
  fechaInicio DATE,
  fechaFinal DATE
)
RETURNS TABLE(
  fecha DATE,
  Ventas numeric(13,2)
)
LANGUAGE PLPGSQL AS $$
BEGIN
  RETURN QUERY
    SELECT fecha, SUM(Ventas)
    FROM ventas_diarias_tiendas
    GROUP BY fecha;
END;
$$;

-- FUNCION QUE RETORNA EL HISTORIAL DE VENTAS ENTRE UN RANGO DE FECHAS DE TODAS LAS TIENDA ========
CREATE OR REPLACE FUNCTION historial_ventas_diarias_entre_fechas_todas_tiendas(
  fechaInicio DATE,
  fechaFinal DATE
)
RETURNS TABLE(
  fecha DATE,
  Ventas numeric(13,2)
)
LANGUAGE PLPGSQL AS $$
BEGIN
  RETURN QUERY
    SELECT fecha, SUM(Ventas)
    FROM ventas_diarias_tiendas
    WHERE fecha BETWEEN fechaInicio AND fechaFinal
    GROUP BY fecha;
END;
$$;

-- FUNCION QUE RETORNA LAS CINCO MEJORES TIENDAS EN LO QUE VA DEL AÑO =============================
CREATE OR REPLACE FUNCTION cinco_mejores_tiendas()
RETURNS TABLE(
  Numero INT,
  idTienda INT,
  VentasTotales numeric(13,2)
)
LANGUAGE PLPGSQL AS $$
BEGIN
  RETURN QUERY
  SELECT ROW_NUMBER() OVER (ORDER BY VentasTotales DESC) AS Numero, idTienda, SUM(Ventas) as VentasTotales
  FROM ventas_diarias_tiendas
  WHERE fecha BETWEEN  date_trunc('year',CURRENT_DATE) AND CURRENT_DATE
  GROUP BY idTienda
  LIMIT 5;
END;
$$;


-- VISTA QUE PERMITE VER VERLOS PRODUCTOS ORDENADOS POR EL QUE MAS VALOR TIENE ====================
CREATE VIEW productos_mas_ventas AS
SELECT DF.upcProducto, P.nombre, SUM(DF.cantidad) as cantidad, SUM(DF.precio*DF.cantidad) AS importe 
FROM 
  DetalleFacturas DF 
  INNER JOIN 
  Productos P
    ON DF.upcProducto = P.upc
GROUP BY DF.upcProducto, P.nombre
ORDER BY importe DESC;

CREATE OR REPLACE FUNCTION tres_categorias_con_mas_ventas()
RETURNS TABLE(
  idcategoria INT,
  nombreCategoria VARCHAR(255),
  ventas numeric(13,2)
)
LANGUAGE PLPGSQL AS $$
BEGIN
  RETURN QUERY
  SELECT C.id, C.nombreCategoria, SUM(importe) as Ventas
  FROM
    Categorias C
    LEFT JOIN
    ProductoCategorizado PC
      ON C.id = PC.idcategoria
    LEFT JOIN
    productos_mas_ventas PM
      ON PC.upcProducto = PM.upcProducto
  GROUP BY C.idcategoria, C.nombreCategoria
  ORDER BY Ventas DESC
  LIMIT 3;
END;
$$;