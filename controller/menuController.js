const db = require('../config/db');

exports.createMenu = (req, res) => {
  const {
    name,
    description,
    price,
    stock,
    image,
    kategori_id,
    sub_kategori_id
  } = req.body;

  const sql = `
    INSERT INTO menu 
    (name, description, price, stock, image, kategori_id, sub_kategori_id) 
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(
    sql,
    [name, description, price, stock, image, kategori_id, sub_kategori_id],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json(err);
      }
      res.json({ message: "Menu berhasil ditambahkan" });
    }
  );
};