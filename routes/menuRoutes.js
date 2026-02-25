const express = require('express');
const router = express.Router();
const menuController = require('../controller/menuController');
const db = require('../config/db');
const verifyToken = require("../middleware/auth");


router.get('/', (req, res) => {
  db.query('SELECT * FROM menu', (err, results) => {
    if (err) return res.status(500).json(err);
    res.json(results);
  });
});



router.get('/:id', (req, res) => {
  const id = req.params.id;
  db.query('SELECT * FROM menu WHERE id = ?', [id], (err, results) => {
    if (err) return res.status(500).json(err);
    res.json(results[0]);
  });
});



router.post("/", verifyToken, (req, res) => {
  const { 
    name, 
    description, 
    price, 
    stock, 
    image, 
    kategori_id, 
    sub_kategori_id 
  } = req.body;

  db.query(
    `INSERT INTO menu 
    (name, description, price, stock, image, kategori_id, sub_kategori_id) 
    VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [name, description, price, stock, image, kategori_id, sub_kategori_id],
    (err, result) => {
      if (err) {
        console.log("ERROR INSERT:", err);
        return res.status(500).json(err);
      }
      res.json({ message: 'Menu berhasil ditambahkan', id: result.insertId });
    }
  );
});



router.put("/:id", verifyToken, (req, res) => {
  const id = req.params.id;
  const { 
    name, 
    description, 
    price, 
    stock, 
    image, 
    kategori_id, 
    sub_kategori_id 
  } = req.body;

  db.query(
    `UPDATE menu 
     SET name=?, description=?, price=?, stock=?, image=?, kategori_id=?, sub_kategori_id=? 
     WHERE id=?`,
    [name, description, price, stock, image, kategori_id, sub_kategori_id, id],
    (err) => {
      if (err) return res.status(500).json(err);
      res.json({ message: 'Menu berhasil diupdate' });
    }
  );
});



router.delete("/:id", verifyToken, (req, res) => {
  const id = req.params.id;
  db.query('DELETE FROM menu WHERE id=?', [id], (err) => {
    if (err) return res.status(500).json(err);
    res.json({ message: 'Menu berhasil dihapus' });
  });
});

module.exports = router;