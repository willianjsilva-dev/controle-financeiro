const express = require('express');
const cors = require('cors');
const pool = require('./db');

const app = express();

app.use(cors());
app.use(express.json());

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.get('/api/health/db', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT COUNT(*) AS total FROM categories');
    res.json({ status: 'ok', categorias: rows[0].total });
  } catch (err) {
    console.error(err);
    res.status(500).json({ status: 'erro', message: 'Falha ao conectar no banco' });
  }
});

module.exports = app;