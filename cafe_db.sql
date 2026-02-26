-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 25 Feb 2026 pada 12.14
-- Versi server: 8.0.45-0ubuntu0.24.04.1
-- Versi PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `cafe_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `cafe_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `cafe_id`, `username`, `email`, `password`, `created_at`) VALUES
(2, 16, 'Mahesaa', 'mahesa@gamil.com', '$2b$10$Z.LSqPX6QUoY8nh/nvURN.xqvxi19fBbRnoOnFhqhXq/jG917tp.y', '2026-02-25 03:26:39'),
(3, 17, 'adyaahmadp@gmail.com', 'adyaahmadp@gmail.com', '$2b$10$Chte1I4x0BNJJfSbHyMl5eWND82pGfNl/fvriBoIdFgfkH8guXcwy', '2026-02-25 03:43:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_transfer`
--

CREATE TABLE `bank_transfer` (
  `id` int NOT NULL,
  `cafe_id` int NOT NULL,
  `nama_bank` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_bank` int NOT NULL,
  `nama_pemilik` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cafe`
--

CREATE TABLE `cafe` (
  `id` int NOT NULL,
  `nama_cafe` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `logo_cafe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cafe`
--

INSERT INTO `cafe` (`id`, `nama_cafe`, `logo_cafe`, `alamat`) VALUES
(12, 'AzrielMartt', NULL, NULL),
(13, 'AzrielMart', NULL, NULL),
(14, 'SaMart', NULL, NULL),
(16, 'SaaMart', NULL, NULL),
(17, 'dsadsa', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ewalet`
--

CREATE TABLE `ewalet` (
  `id` int NOT NULL,
  `cafe_id` int NOT NULL,
  `nama_wallet` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_wallet` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pemilik` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoris`
--

CREATE TABLE `kategoris` (
  `id` int NOT NULL,
  `cafe_id` int DEFAULT NULL,
  `nama_kategori` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategoris`
--

INSERT INTO `kategoris` (`id`, `cafe_id`, `nama_kategori`) VALUES
(1, 17, 'makanan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int NOT NULL,
  `cafe_id` int NOT NULL,
  `id_kategori` int NOT NULL,
  `id_badge` int DEFAULT NULL,
  `nama_menu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `cafe_id`, `id_kategori`, `id_badge`, `nama_menu`, `image_url`, `deskripsi`, `harga`, `status`) VALUES
(8, 17, 1, NULL, 'dasdas', 'http://192.168.1.13:3000/asset/1771999845905-334400897.jpg', '', 230, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int NOT NULL,
  `cafe_id` int NOT NULL,
  `nama_method` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status_method` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo`
--

CREATE TABLE `promo` (
  `id` int NOT NULL,
  `cafe_id` int NOT NULL,
  `kode_promo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_diskon` tinyint(1) NOT NULL,
  `nilai` int NOT NULL,
  `minimum_order` int NOT NULL,
  `mulai_date` date NOT NULL,
  `berakhir_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `promo`
--

INSERT INTO `promo` (`id`, `cafe_id`, `kode_promo`, `tipe_diskon`, `nilai`, `minimum_order`, `mulai_date`, `berakhir_date`) VALUES
(2, 17, 'FSAFAS', 0, 21313, 232422, '2026-02-24', '2026-03-10'),
(3, 17, 'FDSADSA', 0, 2321312, 213213, '2026-02-25', '2026-02-26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `qris`
--

CREATE TABLE `qris` (
  `id` int NOT NULL,
  `cafe_id` int NOT NULL,
  `nama_merchant` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_merchant` int NOT NULL,
  `qris_image` text COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_transaksi_qris` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `table_cafe`
--

CREATE TABLE `table_cafe` (
  `id` int NOT NULL,
  `cafe_id` int NOT NULL,
  `nomor_meja` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `qr_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `variats`
--

CREATE TABLE `variats` (
  `id` int NOT NULL,
  `cafe_id` int DEFAULT NULL,
  `id_menu` int DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `harga` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `bank_transfer`
--
ALTER TABLE `bank_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `cafe`
--
ALTER TABLE `cafe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_cafe` (`nama_cafe`);

--
-- Indeks untuk tabel `ewalet`
--
ALTER TABLE `ewalet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`,`id_badge`),
  ADD KEY `Menu Badge` (`id_badge`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `qris`
--
ALTER TABLE `qris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `table_cafe`
--
ALTER TABLE `table_cafe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- Indeks untuk tabel `variats`
--
ALTER TABLE `variats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `cafe_id` (`cafe_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `bank_transfer`
--
ALTER TABLE `bank_transfer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cafe`
--
ALTER TABLE `cafe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `ewalet`
--
ALTER TABLE `ewalet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `promo`
--
ALTER TABLE `promo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `qris`
--
ALTER TABLE `qris`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `table_cafe`
--
ALTER TABLE `table_cafe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `variats`
--
ALTER TABLE `variats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `Relasi Admin` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bank_transfer`
--
ALTER TABLE `bank_transfer`
  ADD CONSTRAINT `bank cafe` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `ewalet`
--
ALTER TABLE `ewalet`
  ADD CONSTRAINT `ewalet_ibfk_1` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  ADD CONSTRAINT `Kategori Cafe` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `Menu Badge` FOREIGN KEY (`id_badge`) REFERENCES `badges` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Menu Cafe` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Menu Kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategoris` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran cafe` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `promo`
--
ALTER TABLE `promo`
  ADD CONSTRAINT `promo cafe` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `qris`
--
ALTER TABLE `qris`
  ADD CONSTRAINT `qris cafe` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `table_cafe`
--
ALTER TABLE `table_cafe`
  ADD CONSTRAINT `table cafe` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `variats`
--
ALTER TABLE `variats`
  ADD CONSTRAINT `varian cafe` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `varian menu` FOREIGN KEY (`id_menu`) REFERENCES `menus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
