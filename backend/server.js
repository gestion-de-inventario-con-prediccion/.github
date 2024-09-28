// backend/server.js

const express = require('express');
const app = express();
const pool = require('./db');  // Importar conexión a PostgreSQL

// Middlewares
app.use(express.json());  // Para que Express pueda leer y parsear JSON

// Rutas
const productosRoutes = require('./routes/productos');
const ventasRoutes = require('./routes/ventas');
const proveedoresRoutes = require('./routes/proveedores');
const clientesRoutes = require('./routes/clientes');
const detalleVentasRoutes = require('./routes/detalle_ventas');
const pedidosRoutes = require('./routes/pedidos');
const detallePedidosRoutes = require('./routes/detalle_pedidos');
const prediccionesRoutes = require('./routes/predicciones');

// Conectar las rutas a sus respectivos endpoints
app.use('/api/productos', productosRoutes);  // Rutas para productos
app.use('/api/ventas', ventasRoutes);        // Rutas para ventas
app.use('/api/proveedores', proveedoresRoutes);  // Rutas para proveedores
app.use('/api/clientes', clientesRoutes);    // Rutas para clientes
app.use('/api/detalle_ventas', detalleVentasRoutes);  // Rutas para detalle de ventas
app.use('/api/pedidos', pedidosRoutes);      // Rutas para pedidos
app.use('/api/detalle_pedidos', detallePedidosRoutes);  // Rutas para detalle de pedidos
app.use('/api/predicciones', prediccionesRoutes);  // Rutas para predicciones de demanda

// Iniciar servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});
