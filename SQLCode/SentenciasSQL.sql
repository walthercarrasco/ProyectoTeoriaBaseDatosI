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
CREATE OR REPLACE FUNCTION update_tienda_nombre(
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
	ucp VARCHAR(255) PRIMARY KEY,
	tamaño INT,
	embalaje VARCHAR(255),
	marca VARCHAR(255)
);

-- Esta función inserta un nuevo producto en la tabla "Productos".
CREATE OR REPLACE FUNCTION insert_producto(
  p_ucp VARCHAR(255),
  p_tamaño INT,
  p_embalaje VARCHAR(255),
  p_marca VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$ 
  INSERT INTO Productos(ucp, tamaño, embalaje, marca)
  VALUES
    (p_ucp, p_tamaño, p_embalaje, p_marca);
$$;

-- Esta función elimina un producto de la tabla "Productos" basado en su UCP (Código de Producto Único).
CREATE OR REPLACE FUNCTION delete_producto(
  p_ucp VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Productos
  WHERE Productos.ucp = p_ucp;
$$;

-- Esta función actualiza el tamaño de un producto en la tabla "Productos" basado en su UCP.
CREATE OR REPLACE FUNCTION update_producto_tamano(
  p_ucp VARCHAR(255),
  p_tamaño INT
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET tamaño = p_tamaño 
  WHERE Productos.ucp = p_ucp;
$$;

-- Esta función actualiza el embalaje de un producto en la tabla "Productos" basado en su UCP.
CREATE OR REPLACE FUNCTION update_producto_embalaje(
  p_ucp VARCHAR(255),
  p_embalaje VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET embalaje = p_embalaje 
  WHERE Productos.ucp = p_ucp;
$$;

-- Esta función actualiza la marca de un producto en la tabla "Productos" basado en su UCP.
CREATE OR REPLACE FUNCTION update_producto_marca(
  p_ucp VARCHAR(255),
  p_marca VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET marca = p_marca 
  WHERE Productos.ucp = p_ucp;
$$;

CREATE OR REPLACE FUNCTION update_producto(
  p_ucp VARCHAR(255),
  p_tamaño INT,
  p_embalaje VARCHAR(255),
  p_marca VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Productos
  SET tamaño = p_tamaño,
      embalaje = p_embalaje,
      marca = p_marca
  WHERE Productos.ucp = p_ucp;
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
	ucpProducto VARCHAR(255),
	idcategoria INT,
	FOREIGN KEY(ucpProducto) REFERENCES Productos(ucp) ON DELETE CASCADE,
	FOREIGN KEY(idcategoria) REFERENCES Categorias(id) ON DELETE CASCADE
);

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
	ucpProducto VARCHAR(255),
	precio numeric(9,2),
	cantidad INT,
	reorden INT,
	PRIMARY KEY (idTienda,ucpProducto),
	FOREIGN KEY(idTienda) REFERENCES Tiendas(id) ON DELETE CASCADE,
	FOREIGN KEY(ucpProducto) REFERENCES Productos(ucp) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Esta función se utiliza para insertar un nuevo registro en la tabla "InventarioPorTienda" que representa el inventario de un producto en una tienda específica.
CREATE OR REPLACE FUNCTION insert_inventario_por_tienda(
  p_idTienda INT,            -- El ID de la tienda.
  p_ucpProducto VARCHAR(255),  -- El Código de Producto Único (UCP) del producto.
  p_precio numeric(9,2),     -- El precio del producto en la tienda.
  p_cantidad INT,            -- La cantidad de unidades disponibles en el inventario.
  p_reorden INT              -- El nivel de reorden del producto en el inventario.
)
RETURNS VOID
LANGUAGE SQL AS $$
  INSERT INTO InventarioPorTienda(idTienda, ucpProducto, precio, cantidad, reorden)
  VALUES
    (p_idTienda, p_ucpProducto, p_precio, p_cantidad, p_reorden);  -- Inserta un nuevo registro en el inventario de la tienda.
$$;

-- Esta función se utiliza para eliminar un registro de la tabla "InventarioPorTienda" basado en el ID de la tienda y el UCP del producto.
CREATE OR REPLACE FUNCTION delete_inventario_por_tienda(
  p_idTienda INT,            -- El ID de la tienda.
  p_ucpProducto VARCHAR(255)  -- El Código de Producto Único (UCP) del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM InventarioPorTienda
  WHERE 
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.ucpProducto = p_ucpProducto;  -- Elimina un registro del inventario de la tienda.
$$;

-- Esta función se utiliza para actualizar el precio de un producto en el inventario de una tienda específica.
CREATE OR REPLACE FUNCTION update_inventario_por_tienda_precio(
  p_idTienda INT,            -- El ID de la tienda.
  p_ucpProducto VARCHAR(255),  -- El Código de Producto Único (UCP) del producto.
  p_precio numeric(9,2)      -- El nuevo precio del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE InventarioPorTienda
  SET precio = p_precio
  WHERE
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.ucpProducto = p_ucpProducto;  -- Actualiza el precio del producto en el inventario de la tienda.
$$;

-- Esta función se utiliza para actualizar la cantidad de unidades disponibles de un producto en el inventario de una tienda específica.
CREATE OR REPLACE FUNCTION update_inventario_por_tienda_cantidad(
  p_idTienda INT,            -- El ID de la tienda.
  p_ucpProducto VARCHAR(255),  -- El Código de Producto Único (UCP) del producto.
  p_cantidad INT             -- La nueva cantidad de unidades disponibles.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE InventarioPorTienda
  SET cantidad = p_cantidad
  WHERE
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.ucpProducto = p_ucpProducto;  -- Actualiza la cantidad de unidades disponibles del producto en el inventario de la tienda.
$$;

-- Esta función se utiliza para actualizar el nivel de reorden de un producto en el inventario de una tienda específica.
CREATE OR REPLACE FUNCTION update_inventario_por_tienda_reorden(
  p_idTienda INT,            -- El ID de la tienda.
  p_ucpProducto VARCHAR(255),  -- El Código de Producto Único (UCP) del producto.
  p_reorden INT              -- El nuevo nivel de reorden del producto.
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE InventarioPorTienda
  SET reorden = p_reorden
  WHERE
    InventarioPorTienda.idTienda = p_idTienda AND 
    InventarioPorTienda.ucpProducto = p_ucpProducto;  -- Actualiza el nivel de reorden del producto en el inventario de la tienda.
$$;

-- Esta función se utiliza para actualizar el precio, la cantidad y el nivel de reorden de un producto en el inventario de una tienda específica.
CREATE OR REPLACE FUNCTION update_inventario_por_tienda_precio_cantidad_reorden(
  p_idTienda INT,            -- El ID de la tienda.
  p_ucpProducto VARCHAR(255),  -- El Código de Producto Único (UCP) del producto.
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
    InventarioPorTienda.ucpProducto = p_ucpProducto;  -- Actualiza el precio, cantidad y nivel de reorden del producto en el inventario de la tienda.
$$;




-- Creación de tabla DetalleFactura
CREATE TABLE DetalleFactura(
	numeroFactura INT,
	ucpProducto VARCHAR(255),
	precio numeric(9,2),
	cantidad INT,
	FOREIGN KEY (numeroFactura) REFERENCES Facturas(numeroFactura),
	FOREIGN KEY (ucpProducto) REFERENCES Productos(ucp)
);

-- Creación de la tabla Vende (Productos que vende cada Proveedor)
CREATE TABLE Vende(
	idProveedor INT,
  ucpProducto VARCHAR(225),
  FOREIGN KEY (idProveedor) REFERENCES Proveedores(id) ON DELETE CASCADE,
  FOREIGN KEY (ucpProducto) REFERENCES Productos(ucp) ON DELETE CASCADE
);

INSERT INTO Clientes (nombre, correoElectronico) VALUES
  ('John Doe', 'john.doe@example.com'),
  ('Alice Smith', 'alice.smith@example.com'),
  ('Bob Johnson', 'bob.johnson@example.com'),
  ('Eva Williams', 'eva.williams@example.com'),
  ('Michael Brown', 'michael.brown@example.com'),
  ('Olivia Jones', 'olivia.jones@example.com'),
  ('William Davis', 'william.davis@example.com'),
  ('Sophia Wilson', 'sophia.wilson@example.com'),
  ('James Miller', 'james.miller@example.com'),
  ('Lily Anderson', 'lily.anderson@example.com');

INSERT INTO Tiendas (nombre, ubicacion, horario) VALUES
  ('Tienda A', 'Tegucigalpa, Francisco Morazán', '9:00 AM - 7:00 PM'),
  ('Tienda B', 'San Pedro Sula, Cortés', '8:30 AM - 6:30 PM'),
  ('Tienda C', 'La Ceiba, Atlántida', '10:00 AM - 8:00 PM'),
  ('Tienda D', 'Comayagua, Comayagua', '8:00 AM - 6:00 PM'),
  ('Tienda E', 'Santa Rosa de Copán, Copán', '9:30 AM - 7:30 PM'),
  ('Tienda F', 'Choluteca, Choluteca', '8:30 AM - 6:30 PM'),
  ('Tienda G', 'La Lima, Cortés', '10:00 AM - 8:00 PM'),
  ('Tienda H', 'Puerto Cortés, Cortés', '9:00 AM - 7:00 PM'),
  ('Tienda I', 'Danlí, El Paraíso', '8:30 AM - 6:30 PM'),
  ('Tienda J', 'Juticalpa, Olancho', '9:30 AM - 7:30 PM');

INSERT INTO Productos (ucp, tamaño, embalaje, marca) VALUES
  ('DESKTOP001', 1000, 'Caja', 'TechCo'),
  ('MONITOR001', 27, 'Caja', 'DisplayTech'),
  ('LAPTOP001', 15, 'Caja', 'TechZone'),
  ('KEYBOARD001', NULL, 'Paquete', 'InputTech'),
  ('MOUSE001', NULL, 'Paquete', 'InputTech'),
  ('PRINTER001', NULL, 'Caja', 'PrintMasters'),
  ('SCANNER001', NULL, 'Caja', 'ScanTech'),
  ('ROUTER001', NULL, 'Caja', 'NetConnect'),
  ('SPEAKERS001', NULL, 'Paquete', 'SoundTech'),
  ('HEADPHONES001', NULL, 'Paquete', 'SoundTech'),
  ('TABLET001', 10, 'Caja', 'TechGadgets'),
  ('SMARTPHONE001', NULL, 'Caja', 'TechGadgets'),
  ('CAMERA001', NULL, 'Caja', 'PhotoTech'),
  ('EXTERNALHD001', NULL, 'Caja', 'StorageTech'),
  ('GRAPHICSCARD001', NULL, 'Caja', 'TechBoost'),
  ('POWERBANK001', NULL, 'Caja', 'MobilePower'),
  ('SSD001', 500, 'Caja', 'StorageTech'),
  ('HEADSET001', NULL, 'Paquete', 'SoundTech'),
  ('WEBCAM001', NULL, 'Caja', 'VideoTech'),
  ('PROJECTOR001', NULL, 'Caja', 'ProjectorPro'),
  ('DESKTOP002', 800, 'Caja', 'TechCo'),
  ('MONITOR002', 32, 'Caja', 'DisplayTech'),
  ('LAPTOP002', 14, 'Caja', 'TechZone'),
  ('KEYBOARD002', NULL, 'Paquete', 'InputTech'),
  ('MOUSE002', NULL, 'Paquete', 'InputTech'),
  ('PRINTER002', NULL, 'Caja', 'PrintMasters'),
  ('SCANNER002', NULL, 'Caja', 'ScanTech'),
  ('ROUTER002', NULL, 'Caja', 'NetConnect'),
  ('SPEAKERS002', NULL, 'Paquete', 'SoundTech'),
  ('HEADPHONES002', NULL, 'Paquete', 'SoundTech'),
  ('TABLET002', 11, 'Caja', 'TechGadgets'),
  ('SMARTPHONE002', NULL, 'Caja', 'TechGadgets'),
  ('CAMERA002', NULL, 'Caja', 'PhotoTech'),
  ('EXTERNALHD002', NULL, 'Caja', 'StorageTech'),
  ('GRAPHICSCARD002', NULL, 'Caja', 'TechBoost'),
  ('POWERBANK002', NULL, 'Caja', 'MobilePower'),
  ('SSD002', 512, 'Caja', 'StorageTech'),
  ('HEADSET002', NULL, 'Paquete', 'SoundTech'),
  ('WEBCAM002', NULL, 'Caja', 'VideoTech'),
  ('PROJECTOR002', NULL, 'Caja', 'ProjectorPro'),
  ('DESKTOP003', 1200, 'Caja', 'TechCo'),
  ('MONITOR003', 28, 'Caja', 'DisplayTech'),
  ('LAPTOP003', 13, 'Caja', 'TechZone'),
  ('KEYBOARD003', NULL, 'Paquete', 'InputTech'),
  ('MOUSE003', NULL, 'Paquete', 'InputTech'),
  ('PRINTER003', NULL, 'Caja', 'PrintMasters'),
  ('SCANNER003', NULL, 'Caja', 'ScanTech'),
  ('ROUTER003', NULL, 'Caja', 'NetConnect'),
  ('SPEAKERS003', NULL, 'Paquete', 'SoundTech'),
  ('HEADPHONES003', NULL, 'Paquete', 'SoundTech'),
  ('TABLET003', 9, 'Caja', 'TechGadgets'),
  ('SMARTPHONE003', NULL, 'Caja', 'TechGadgets'),
  ('CAMERA003', NULL, 'Caja', 'PhotoTech'),
  ('EXTERNALHD003', NULL, 'Caja', 'StorageTech'),
  ('GRAPHICSCARD003', NULL, 'Caja', 'TechBoost'),
  ('POWERBANK003', NULL, 'Caja', 'MobilePower'),
  ('SSD003', 256, 'Caja', 'StorageTech'),
  ('HEADSET003', NULL, 'Paquete', 'SoundTech'),
  ('WEBCAM003', NULL, 'Caja', 'VideoTech'),
  ('PROJECTOR003', NULL, 'Caja', 'ProjectorPro');

INSERT INTO Proveedores (nombre) VALUES
    ('Tecnología Latina S.A.'),
    ('Electrónica Innovadora LATAM'),
    ('Soluciones TecnoLatinas'),
    ('LatinoTech Solutions'),
    ('Suministros Electrónicos Hispanos'),
    ('LatinIT Servicios Tecnológicos'),
    ('Innovación Digital Latinoamericana'),
    ('TechLatino Hardware y Software'),
    ('DesarrolloTech Solutions'),
    ('Ciberseguridad Latina');

