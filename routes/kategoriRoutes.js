const express = require("express");
const router = express.Router();
const kategoriController = require("../controller/kategoriController");
const verifyToken = require("../middleware/auth");

router.get("/", verifyToken, kategoriController.getKategoris);
router.get("/:id", verifyToken, kategoriController.getKategoriById);
router.post("/", verifyToken, kategoriController.createKategori);
router.put("/:id", verifyToken, kategoriController.updateKategori);
router.delete("/:id", verifyToken, kategoriController.deleteKategori);

module.exports = router;
