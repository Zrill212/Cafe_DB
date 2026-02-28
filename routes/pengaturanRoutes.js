const express = require("express");
const router = express.Router();
const uploadLogo = require("../middleware/uploadLogo");
const pengaturanController = require("../controller/pengaturanController");
const verifyToken = require("../middleware/auth"); // tanpa destructuring

// GET  /api/pengaturan        → ambil pengaturan kafe
// POST /api/pengaturan        → simpan pengaturan kafe
// PUT  /api/pengaturan/password → ganti password admin

router.get("/",           verifyToken, pengaturanController.getPengaturan);
router.post("/",          verifyToken, pengaturanController.savePengaturan);
router.put("/password",   verifyToken, pengaturanController.gantiPassword);
router.put(
  "/save",
  verifyToken,
  uploadLogo.single("logo_cafe"),
  pengaturanController.savePengaturan
);

module.exports = router;