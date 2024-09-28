// backend/db.js

const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',       // Cambiar por tu usuario de PostgreSQL
  host: 'localhost',        // Donde está tu servidor PostgreSQL
  database: 'sistema_gestion_inventario',    // Nombre de tu base de datos
  password: '123',// Contraseña de tu base de datos
  port: 5432,               // Puerto de PostgreSQL
});

module.exports = pool;
