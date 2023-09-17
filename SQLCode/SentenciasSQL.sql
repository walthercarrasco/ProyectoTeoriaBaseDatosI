-- TABLA CLIENTES
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


-- TABLA UBICACIONES
-- Creación de las ubicaciones de las tiendas
CREATE TABLE Ubicaciones(
	id SERIAL PRIMARY KEY,
  direccion VARCHAR(255),
  ciudad VARCHAR(225),
  estado VARCHAR(255),
  pais VARCHAR(255)
);

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

CREATE OR REPLACE FUNCTION delete_ubicacion(
  p_id INT
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Ubicaciones
  WHERE id = p_id;
$$;

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

-- Creación de la tabla Tiendas
CREATE TABLE Tiendas(
	id SERIAL PRIMARY KEY,
  idUbicacion INT DEFAULT -1,
	nombre VARCHAR(255),
	horario VARCHAR(255),
	FOREIGN KEY(idUbicacion) REFERENCES Ubicaciones(id) ON DELETE SET NULL
);

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

CREATE OR REPLACE FUNCTION delete_tienda(
  p_id INT
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Tiendas
  WHERE Tiendas.id = p_id;
$$;

CREATE OR REPLACE FUNCTION update_tienda(
  p_id INT,
  p_nombre VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  UPDATE Tiendas
  SET nombre = p_nombre
  WHERE Tiendas.nombre = p_nombre;
$$;

-- Creación de la tabla Productos
CREATE TABLE Productos(
	ucp VARCHAR(255) PRIMARY KEY,
	tamaño INT,
	embalaje VARCHAR(255),
	marca VARCHAR(255)
);

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

CREATE OR REPLACE FUNCTION delete_producto(
  p_ucp VARCHAR(255)
)
RETURNS VOID
LANGUAGE SQL AS $$
  DELETE FROM Productos
  WHERE Productos.ucp = p_ucp;
$$;

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

-- Creación de la tabla Categorías
CREATE TABLE Categorias(
	id INT PRIMARY KEY,
	categoria VARCHAR(255)
);

CREATE TABLE ProductoCategorizado(
	ucpProducto VARCHAR(255),
	idcategoria INT,
	FOREIGN KEY(ucpProducto) REFERENCES Productos(ucp) ON DELETE CASCADE,
	FOREIGN KEY(idcategoria) REFERENCES Categorias(id) ON DELETE CASCADE
);

-- Creación de la tabla Proveedor
CREATE TABLE Proveedores(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255)
);

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

