// auth.js - Backend (Node.js, Express, bcrypt para hashear contraseñas)

const express = require('express');
const router = express.Router();
const pool = require('../db');  // Conexión a PostgreSQL
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// Registrar usuario
router.post('/register', async (req, res) => {
    const { nombre, email, password } = req.body;
    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        const result = await pool.query(
            'INSERT INTO users (nombre, email, password) VALUES ($1, $2, $3) RETURNING *',
            [nombre, email, hashedPassword]
        );
        res.status(201).json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).json('Error al registrar usuario');
    }
});

// Iniciar sesión
router.post('/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const result = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
        if (result.rows.length === 0) {
            return res.status(400).json('Usuario no encontrado');
        }
        const user = result.rows[0];
        const validPassword = await bcrypt.compare(password, user.password);
        if (!validPassword) {
            return res.status(400).json('Contraseña incorrecta');
        }
        const token = jwt.sign({ id_user: user.id_user }, 'secret_key');  // Clave secreta JWT
        res.json({ token });
    } catch (err) {
        console.error(err.message);
        res.status(500).json('Error al iniciar sesión');
    }
});

module.exports = router;
