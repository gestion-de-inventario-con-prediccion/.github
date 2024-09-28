-- Esquema para la base de datos 'sistema_gestion_inventario'
CREATE DATABASE sistema_gestion_inventario;
\c sistema_gestion_inventario;

-- Tabla de categorías
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Tabla de proveedores
CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(255),
    direccion TEXT
);

-- Tabla de productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL NOT NULL,
    cantidad_stock INT NOT NULL,
    id_categoria INT REFERENCES categorias(id_categoria)
);

-- Tabla intermedia para relación de productos y proveedores
CREATE TABLE productos_proveedores (
    id_producto INT REFERENCES productos(id_producto),
    id_proveedor INT REFERENCES proveedores(id_proveedor),
    precio DECIMAL NOT NULL, 
    PRIMARY KEY (id_producto, id_proveedor)
);

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    telefono VARCHAR(15),
    direccion TEXT
);

-- Tabla de ventas
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT REFERENCES clientes(id_cliente),
    monto_total DECIMAL NOT NULL
);

-- Detalles de ventas
CREATE TABLE detalle_ventas (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT REFERENCES ventas(id_venta),
    id_producto INT REFERENCES productos(id_producto),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL NOT NULL
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    id_proveedor INT REFERENCES proveedores(id_proveedor),
    monto_total DECIMAL NOT NULL
);

-- Detalles de pedidos
CREATE TABLE detalle_pedidos (
    id_detalle_pedido SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido),
    id_producto INT REFERENCES productos(id_producto),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL NOT NULL
);

-- Tabla de predicciones
CREATE TABLE predicciones (
    id_prediccion SERIAL PRIMARY KEY,
    fecha_prediccion DATE NOT NULL,
    id_producto INT REFERENCES productos(id_producto),
    cantidad_predicha INT NOT NULL
);
