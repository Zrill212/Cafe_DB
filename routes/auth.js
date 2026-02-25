const express = require("express");
const router = express.Router();
const db = require("../config/db");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");


router.post("/login", (req, res) => {
  const { username, password } = req.body;

  db.query("SELECT * FROM admins WHERE username = ?", [username], async (err, result) => {
    if (err) return res.status(500).json(err);
    if (result.length === 0) {
      return res.status(404).json({ message: "Admin tidak ditemukan" });
    }

    const admin = result[0];

    if (password !== "123456") {
      return res.status(401).json({ message: "Password salah" });
    }

    const token = jwt.sign(
      { id: admin.id, role: "admin" },
      "SECRET_CAFE_KEY",
      { expiresIn: "8h" }
    );

    res.json({
      message: "Login berhasil",
      token: token
    });
  });
});

module.exports = router;