-- Datos iniciales para la tabla 'categorias'
INSERT INTO categorias (nombre) VALUES
('Electrónica'),
('Muebles'),
('Ropa'),
('Alimentos');

-- Datos iniciales para la tabla 'proveedores'
INSERT INTO proveedores (nombre, telefono, email, direccion) VALUES
('Proveedor 1', '123456789', 'proveedor1@example.com', 'Calle 123, Ciudad 1'),
('Proveedor 2', '987654321', 'proveedor2@example.com', 'Calle 456, Ciudad 2');

-- Datos iniciales para la tabla 'productos'
INSERT INTO productos (nombre, descripcion, precio, cantidad_stock, id_categoria) VALUES
('Televisor', 'Televisor 40 pulgadas', 300.00, 20, 1),
('Sofá', 'Sofá de 3 plazas', 500.00, 15, 2),
('Camisa', 'Camisa de algodón', 25.00, 50, 3),
('Leche', 'Leche entera 1 litro', 1.50, 200, 4);

-- Relación de productos y proveedores (tabla 'productos_proveedores')
INSERT INTO productos_proveedores (id_producto, id_proveedor, precio) VALUES
(1, 1, 290.00),
(2, 2, 480.00),
(3, 1, 23.00),
(4, 2, 1.30);

-- Datos iniciales para la tabla 'clientes'
INSERT INTO clientes (nombre, email, telefono, direccion) VALUES
('Cliente 1', 'cliente1@example.com', '123123123', 'Calle A, Ciudad A'),
('Cliente 2', 'cliente2@example.com', '321321321', 'Calle B, Ciudad B');

-- Datos iniciales para la tabla 'ventas'
INSERT INTO ventas (fecha_venta, id_cliente, monto_total) VALUES
('2024-09-01', 1, 350.00),
('2024-09-02', 2, 150.00);

-- Datos iniciales para la tabla 'detalle_ventas'
INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 300.00),
(1, 3, 2, 25.00),
(2, 4, 100, 1.50);

-- Datos iniciales para la tabla 'pedidos'
INSERT INTO pedidos (fecha_pedido, id_proveedor, monto_total) VALUES
('2024-09-05', 1, 500.00),
('2024-09-06', 2, 750.00);

-- Datos iniciales para la tabla 'detalle_pedidos'
INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 10, 290.00),
(1, 3, 20, 23.00),
(2, 2, 5, 480.00),
(2, 4, 50, 1.30);

-- Datos iniciales para la tabla 'predicciones'
INSERT INTO predicciones (fecha_prediccion, id_producto, cantidad_predicha) VALUES
('2024-10-01', 1, 50),
('2024-10-02', 2, 30),
('2024-10-03', 3, 70),
('2024-10-04', 4, 200);
