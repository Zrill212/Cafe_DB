const db = require("../config/db");

const sendResponse = (res, httpStatus, message, data) => {
  return res.status(httpStatus).json({
    status: httpStatus,
    message,
    data,
  });
};

const normalizeTipeDiskon = (value) => {
  if (value === undefined || value === null) return null;

  if (typeof value === "boolean") return value ? 1 : 0;

  if (typeof value === "number") {
    if (value === 1) return 1;
    if (value === 0) return 0;
    return null;
  }

  if (typeof value === "string") {
    const v = value.trim().toLowerCase();
    if (v === "1" || v === "true" || v === "persen" || v === "percent" || v === "percentage") return 1;
    if (v === "0" || v === "false" || v === "nominal" || v === "rupiah" || v === "fixed") return 0;
    return null;
  }

  return null;
};

exports.getPromos = (req, res) => {
  const cafeId = req.user?.cafe_id;

  db.query("SELECT * FROM promo WHERE cafe_id = ? ORDER BY id DESC", [cafeId], (err, results) => {
    if (err) {
      return sendResponse(
        res,
        500,
        err?.sqlMessage || err?.message || "Gagal mengambil data promo",
        [],
      );
    }
    return sendResponse(res, 200, "Berhasil mengambil data promo", results || []);
  });
};

exports.getPromoById = (req, res) => {
  const cafeId = req.user?.cafe_id;
  const id = req.params.id;

  db.query("SELECT * FROM promo WHERE id = ? AND cafe_id = ?", [id, cafeId], (err, results) => {
    if (err) {
      return sendResponse(
        res,
        500,
        err?.sqlMessage || err?.message || "Gagal mengambil detail promo",
        [],
      );
    }
    if (!results || results.length === 0) {
      return sendResponse(res, 404, "Promo tidak ditemukan", []);
    }
    return sendResponse(res, 200, "Berhasil mengambil detail promo", results[0]);
  });
};

exports.createPromo = (req, res) => {
  const cafeId = req.user?.cafe_id;
  const {
    kode_promo,
    tipe_diskon,
    nilai,
    minimum_order,
    mulai_date,
    berakhir_date,
  } = req.body;

  if (!kode_promo) return sendResponse(res, 400, "kode_promo wajib diisi", []);
  if (nilai === undefined || nilai === null || nilai === "") return sendResponse(res, 400, "nilai wajib diisi", []);
  if (minimum_order === undefined || minimum_order === null || minimum_order === "") return sendResponse(res, 400, "minimum_order wajib diisi", []);
  if (!mulai_date) return sendResponse(res, 400, "mulai_date wajib diisi", []);
  if (!berakhir_date) return sendResponse(res, 400, "berakhir_date wajib diisi", []);

  const tipeNormalized = normalizeTipeDiskon(tipe_diskon);
  if (tipeNormalized === null) {
    return sendResponse(res, 400, "tipe_diskon harus boolean/0-1 atau 'persen'/'nominal'", []);
  }

  db.query(
    "INSERT INTO promo (cafe_id, kode_promo, tipe_diskon, nilai, minimum_order, mulai_date, berakhir_date) VALUES (?, ?, ?, ?, ?, ?, ?)",
    [
      cafeId,
      kode_promo,
      tipeNormalized,
      nilai,
      minimum_order,
      mulai_date,
      berakhir_date,
    ],
    (err, result) => {
      if (err) {
        return sendResponse(
          res,
          500,
          err?.sqlMessage || err?.message || "Gagal menambahkan promo",
          [],
        );
      }
      return sendResponse(res, 201, "Promo berhasil ditambahkan", {
        id: result.insertId,
      });
    },
  );
};

exports.updatePromo = (req, res) => {
  const cafeId = req.user?.cafe_id;
  const id = req.params.id;

  const {
    kode_promo,
    tipe_diskon,
    nilai,
    minimum_order,
    mulai_date,
    berakhir_date,
  } = req.body;

  const tipeNormalized = tipe_diskon !== undefined ? normalizeTipeDiskon(tipe_diskon) : undefined;
  if (tipe_diskon !== undefined && tipeNormalized === null) {
    return sendResponse(res, 400, "tipe_diskon harus boolean/0-1 atau 'persen'/'nominal'", []);
  }

  // If tipe_diskon is omitted, keep existing by using COALESCE on the placeholder
  db.query(
    "UPDATE promo SET kode_promo = COALESCE(?, kode_promo), tipe_diskon = COALESCE(?, tipe_diskon), nilai = COALESCE(?, nilai), minimum_order = COALESCE(?, minimum_order), mulai_date = COALESCE(?, mulai_date), berakhir_date = COALESCE(?, berakhir_date) WHERE id = ? AND cafe_id = ?",
    [
      kode_promo ?? null,
      tipeNormalized ?? null,
      nilai ?? null,
      minimum_order ?? null,
      mulai_date ?? null,
      berakhir_date ?? null,
      id,
      cafeId,
    ],
    (err, result) => {
      if (err) {
        return sendResponse(res, 500, err?.sqlMessage || err?.message || "Gagal update promo", []);
      }
      if (!result || result.affectedRows === 0) {
        return sendResponse(res, 404, "Promo tidak ditemukan", []);
      }
      return sendResponse(res, 200, "Promo berhasil diupdate", {});
    },
  );
};

exports.deletePromo = (req, res) => {
  const cafeId = req.user?.cafe_id;
  const id = req.params.id;

  db.query("DELETE FROM promo WHERE id = ? AND cafe_id = ?", [id, cafeId], (err, result) => {
    if (err) {
      return sendResponse(res, 500, err?.sqlMessage || err?.message || "Gagal hapus promo", []);
    }
    if (!result || result.affectedRows === 0) {
      return sendResponse(res, 404, "Promo tidak ditemukan", []);
    }
    return sendResponse(res, 200, "Promo berhasil dihapus", []);
  });
};
