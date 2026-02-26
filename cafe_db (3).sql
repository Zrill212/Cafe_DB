-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 26 Feb 2026 pada 03.27
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

--
-- Dumping data untuk tabel `bank_transfer`
--

INSERT INTO `bank_transfer` (`id`, `cafe_id`, `nama_bank`, `nomor_bank`, `nama_pemilik`) VALUES
(1, 17, 'BNI', 2321, 'sadas'),
(2, 17, 'BNI', 2321, 'sadas'),
(3, 17, 'BNI', 2321, 'sadas'),
(4, 17, 'BNI', 232133213, 'dasdasasdas'),
(5, 17, 'BNI', 232133213, 'sadas'),
(6, 17, 'BNI', 2321, 'asd'),
(7, 17, 'BNI', 2321, 'dsa'),
(8, 17, 'BNI', 2321, 'asd');

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

--
-- Dumping data untuk tabel `ewalet`
--

INSERT INTO `ewalet` (`id`, `cafe_id`, `nama_wallet`, `nomor_wallet`, `nama_pemilik`) VALUES
(1, 16, 'Dana', '085722450920', 'Mahesa'),
(2, 17, 'DANA', '23321321', NULL),
(3, 17, 'DANA', '23213', NULL),
(4, 17, 'GOPAY', '321321', NULL),
(5, 17, 'GOPAY', '321321', NULL),
(6, 17, 'GOPAY', '321321', 'sadas'),
(7, 17, 'SHOPEE', '21321', ''),
(8, 17, 'GOPAY', '321321534534', 'sdfsdfsd'),
(9, 17, 'DANA', '23321321', 'hff'),
(10, 17, 'SHOPEE', '21321', 'gjhgh'),
(11, 17, 'GOPAY', '321321', 'sadas');

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
  `nama_menu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `cafe_id`, `id_kategori`, `nama_menu`, `image_url`, `deskripsi`, `harga`, `status`) VALUES
(8, 17, 1, 'dasdas', 'http://192.168.1.13:3000/asset/1771999845905-334400897.jpg', '', 230, 1);

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

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `cafe_id`, `nama_method`, `status_method`) VALUES
(1, 17, 'tunai', 1),
(2, 17, 'qris', 1),
(3, 17, 'transfer_bank', 1),
(4, 17, 'ewalet_manual', 1);

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
  `biaya_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `biaya_transaksi_qris` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `qris`
--

INSERT INTO `qris` (`id`, `cafe_id`, `nama_merchant`, `nomor_merchant`, `qris_image`, `biaya_type`, `biaya_transaksi_qris`) VALUES
(1, 17, 'ASTAKIRA Cafe', 2423432, 'http://192.168.1.13:3000/asset/1772026196314-329318349.png', 'percent', '23'),
(2, 17, 'ASTAKIRA Cafe', 432432, 'http://192.168.1.13:3000/asset/1772028228493-350511145.png', 'none', NULL),
(3, 17, 'ASTAKIRA Cafe', 432432, 'http://192.168.1.13:3000/asset/1772028243371-964802740.png', 'none', NULL),
(4, 17, 'ASTAKIRA Cafe', 432432, 'http://192.168.1.13:3000/asset/1772028266528-537760276.png', 'none', NULL),
(5, 17, 'ASTAKIRA Cafe', 4324, 'http://192.168.1.13:3000/asset/1772029354841-739067883.png', 'none', NULL),
(6, 17, 'ASTAKIRA Cafe', 434343, 'http://192.168.1.13:3000/asset/1772032110470-429203959.png', 'none', NULL),
(7, 17, 'ASTAKIRA Cafe', 321321, 'http://192.168.1.13:3000/asset/1772035795536-251658325.png', 'none', NULL),
(8, 17, 'ASTAKIRA Cafe', 56586, 'http://192.168.1.13:3000/asset/1772036506608-641251032.png', 'none', NULL),
(9, 17, 'ASTAKIRA Cafesdas', 3213, 'http://192.168.1.13:3000/asset/1772036626722-45498602.png', 'none', NULL),
(10, 17, 'ASTAKIRA Cafedsadas', 321321, 'http://192.168.1.13:3000/asset/1772036661598-838478145.png', 'none', NULL),
(11, 17, 'ASTAKIRA Cafedsadas', 321321, 'http://192.168.1.13:3000/asset/1772036666442-737485454.png', 'none', NULL),
(12, 17, 'ASTAKIRA Cafe', 321321321, 'http://192.168.1.13:3000/asset/1772036745006-165584236.png', 'none', NULL),
(13, 17, 'ASTAKIRA Cafe', 321321321, 'http://192.168.1.13:3000/asset/1772036753934-410617113.png', 'none', NULL),
(14, 17, 'ASTAKIRA Cafe', 321321321, 'http://192.168.1.13:3000/asset/1772036792577-781937902.png', 'none', NULL),
(15, 17, 'ASTAKIRA Cafe', 321321321, 'http://192.168.1.13:3000/asset/1772036837233-36455352.png', 'none', NULL),
(16, 17, 'ASTAKIRA Cafe', 432432, 'http://192.168.1.13:3000/asset/1772036951411-898325222.png', 'none', NULL),
(17, 17, 'ASTAKIdsadaRA Cafe', 43324, 'http://192.168.1.13:3000/asset/1772037138092-45690525.png', 'none', NULL),
(18, 17, 'ASTAKIdsadaRA Cafe', 43324, 'http://192.168.1.13:3000/asset/1772037150481-331542221.png', 'none', NULL),
(19, 17, 'ASTAKIRA Cafe21321', 432, 'http://192.168.1.13:3000/asset/1772037190825-307886728.png', 'none', NULL),
(20, 17, 'ASTAKIRA Cafe21321', 432, 'http://192.168.1.13:3000/asset/1772037191945-718046627.png', 'none', NULL),
(21, 17, 'ASTAKIRA Cafe21321', 432, 'http://192.168.1.13:3000/asset/1772037192095-821027895.png', 'none', NULL),
(22, 17, 'ASTAKIRA Cafe21321', 432, 'http://192.168.1.13:3000/asset/1772037192240-190219561.png', 'none', NULL),
(23, 17, 'ASTAKIRA Cafe21321', 432, 'http://192.168.1.13:3000/asset/1772037192508-215211849.png', 'none', NULL),
(24, 17, 'ASTAKIRA Cafe21321', 432, 'http://192.168.1.13:3000/asset/1772037192647-21807195.png', 'none', NULL),
(25, 17, 'ASTAKIRA Cafe21321', 432, 'http://192.168.1.13:3000/asset/1772037192787-696880877.png', 'none', NULL),
(26, 17, 'ASTAKIRA Cafe', 3123, 'http://192.168.1.13:3000/asset/1772037388870-781436861.png', 'none', NULL),
(27, 17, 'ASTAKIRA Cafe', 3123, 'http://192.168.1.13:3000/asset/1772037612408-139718097.png', 'none', NULL),
(28, 17, 'ASTAKIRA Cafe', 3213, 'http://192.168.1.13:3000/asset/1772037697933-21663658.png', 'none', NULL),
(29, 17, 'ASTAKIRA Cafe', 3213, 'http://192.168.1.13:3000/asset/1772037764708-752306450.png', 'none', NULL),
(30, 17, 'ASTAKIRA Cafe21321', 3213, 'http://192.168.1.13:3000/asset/1772037764708-752306450.png', 'none', NULL);

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
  ADD KEY `id_kategori` (`id_kategori`),
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `cafe`
--
ALTER TABLE `cafe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `ewalet`
--
ALTER TABLE `ewalet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `promo`
--
ALTER TABLE `promo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `qris`
--
ALTER TABLE `qris`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
