const db = require("../config/db");

const sendResponse = (res, httpStatus, message, data) => {
  return res.status(httpStatus).json({
    status: httpStatus,
    message,
    data,
  });
};

exports.getKategoris = (req, res) => {
  const cafeId = req.user?.cafe_id;

  db.query(
    "SELECT * FROM kategoris WHERE cafe_id = ?",
    [cafeId],
    (err, results) => {
      if (err) {
        return sendResponse(
          res,
          500,
          err?.sqlMessage || err?.message || "Gagal mengambil data kategori",
          [],
        );
      }
      return sendResponse(res, 200, "Berhasil mengambil data kategori", results || []);
    },
  );
};

exports.getKategoriById = (req, res) => {
  const cafeId = req.user?.cafe_id;
  const id = req.params.id;

  db.query(
    "SELECT * FROM kategoris WHERE id = ? AND cafe_id = ?",
    [id, cafeId],
    (err, results) => {
      if (err) {
        return sendResponse(
          res,
          500,
          err?.sqlMessage || err?.message || "Gagal mengambil detail kategori",
          [],
        );
      }
      if (!results || results.length === 0) {
        return sendResponse(res, 404, "Kategori tidak ditemukan", []);
      }
      return sendResponse(res, 200, "Berhasil mengambil detail kategori", results[0]);
    },
  );
};

exports.createKategori = (req, res) => {
  const cafeId = req.user?.cafe_id;
  const { nama_kategori } = req.body;

  if (!nama_kategori) {
    return sendResponse(res, 400, "nama_kategori wajib diisi", []);
  }

  db.query(
    "INSERT INTO kategoris (cafe_id, nama_kategori) VALUES (?, ?)",
    [cafeId, nama_kategori],
    (err, result) => {
      if (err) {
        return sendResponse(
          res,
          500,
          err?.sqlMessage || err?.message || "Gagal menambahkan kategori",
          [],
        );
      }
      return sendResponse(res, 201, "Kategori berhasil ditambahkan", {
        id: result.insertId,
      });
    },
  );
};

exports.updateKategori = (req, res) => {
  const cafeId = req.user?.cafe_id;
  const id = req.params.id;
  const { nama_kategori } = req.body;

  db.query(
    "UPDATE kategoris SET nama_kategori = ? WHERE id = ? AND cafe_id = ?",
    [nama_kategori, id, cafeId],
    (err, result) => {
      if (err) {
        return sendResponse(
          res,
          500,
          err?.sqlMessage || err?.message || "Gagal update kategori",
          [],
        );
      }
      if (!result || result.affectedRows === 0) {
        return sendResponse(res, 404, "Kategori tidak ditemukan", []);
      }
      return sendResponse(res, 200, "Kategori berhasil diupdate", {});
    },
  );
};

exports.deleteKategori = (req, res) => {
  const cafeId = req.user?.cafe_id;
  const id = req.params.id;

  db.query(
    "DELETE FROM kategoris WHERE id = ? AND cafe_id = ?",
    [id, cafeId],
    (err, result) => {
      if (err) {
        return sendResponse(
          res,
          500,
          err?.sqlMessage || err?.message || "Gagal hapus kategori",
          [],
        );
      }
      if (!result || result.affectedRows === 0) {
        return sendResponse(res, 404, "Kategori tidak ditemukan", []);
      }
      return sendResponse(res, 200, "Kategori berhasil dihapus", {});
    },
  );
};
