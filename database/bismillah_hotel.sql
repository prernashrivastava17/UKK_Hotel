-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Bulan Mei 2023 pada 16.24
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bismillah_hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pemesanans`
--

CREATE TABLE `detail_pemesanans` (
  `id` int(11) NOT NULL,
  `pemesananId` int(11) DEFAULT NULL,
  `kamarId` int(11) DEFAULT NULL,
  `tgl_akses` datetime DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_pemesanans`
--

INSERT INTO `detail_pemesanans` (`id`, `pemesananId`, `kamarId`, `tgl_akses`, `harga`, `createdAt`, `updatedAt`) VALUES
(63, 25, 8, '2023-05-13 00:00:00', 800000, '2023-05-13 00:42:48', '2023-05-13 00:42:48'),
(64, 25, 8, '2023-05-14 00:00:00', 800000, '2023-05-13 00:42:48', '2023-05-13 00:42:48'),
(65, 25, 8, '2023-05-15 00:00:00', 800000, '2023-05-13 00:42:48', '2023-05-13 00:42:48'),
(66, 25, 8, '2023-05-16 00:00:00', 800000, '2023-05-13 00:42:48', '2023-05-13 00:42:48'),
(71, 31, 7, '2023-05-15 00:00:00', 400000, '2023-05-14 07:48:47', '2023-05-14 07:48:47'),
(72, 31, 7, '2023-05-16 00:00:00', 400000, '2023-05-14 07:48:47', '2023-05-14 07:48:47'),
(73, 31, 7, '2023-05-17 00:00:00', 400000, '2023-05-14 07:48:47', '2023-05-14 07:48:47'),
(74, 32, 9, '2023-05-18 00:00:00', 300000, '2023-05-14 23:25:36', '2023-05-14 23:25:36'),
(75, 32, 9, '2023-05-19 00:00:00', 300000, '2023-05-14 23:25:36', '2023-05-14 23:25:36'),
(76, 32, 9, '2023-05-20 00:00:00', 300000, '2023-05-14 23:25:36', '2023-05-14 23:25:36'),
(77, 32, 9, '2023-05-21 00:00:00', 300000, '2023-05-14 23:25:36', '2023-05-14 23:25:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamars`
--

CREATE TABLE `kamars` (
  `id` int(11) NOT NULL,
  `nomor_kamar` int(11) DEFAULT NULL,
  `tipeKamarId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kamars`
--

INSERT INTO `kamars` (`id`, `nomor_kamar`, `tipeKamarId`, `createdAt`, `updatedAt`) VALUES
(5, 101, 1, '2023-01-18 05:58:37', '2023-05-13 09:45:58'),
(6, 102, 2, '2023-01-18 06:45:03', '2023-05-13 09:46:03'),
(7, 103, 5, '2023-02-01 06:44:09', '2023-05-13 09:46:07'),
(8, 104, 2, '2023-04-06 04:09:49', '2023-05-13 09:46:12'),
(10, 106, 1, '2023-05-17 04:03:51', '2023-05-17 04:03:51'),
(11, 105, 8, '2023-05-17 12:14:48', '2023-05-17 12:14:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanans`
--

CREATE TABLE `pemesanans` (
  `id` int(11) NOT NULL,
  `nomor_pemesanan` varchar(11) DEFAULT NULL,
  `nama_pemesan` varchar(255) DEFAULT NULL,
  `email_pemesan` varchar(255) DEFAULT NULL,
  `tgl_pemesanan` datetime DEFAULT NULL,
  `tgl_check_in` datetime DEFAULT NULL,
  `tgl_check_out` datetime DEFAULT NULL,
  `nama_tamu` varchar(255) DEFAULT NULL,
  `jumlah_kamar` int(11) DEFAULT NULL,
  `tipeKamarId` int(11) DEFAULT NULL,
  `status_pemesanan` enum('baru','check_in','check_out') DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemesanans`
--

INSERT INTO `pemesanans` (`id`, `nomor_pemesanan`, `nama_pemesan`, `email_pemesan`, `tgl_pemesanan`, `tgl_check_in`, `tgl_check_out`, `nama_tamu`, `jumlah_kamar`, `tipeKamarId`, `status_pemesanan`, `userId`, `createdAt`, `updatedAt`) VALUES
(25, 'P002', 'Rasyid', 'rasyid@gmail.com', '2023-05-13 00:42:48', '2023-05-13 00:00:00', '2023-05-17 00:00:00', 'Guest 3', 1, 4, 'check_out', 7, '2023-05-13 00:42:48', '2023-05-17 06:28:15'),
(31, 'P002', 'Risha', 'risha@gmail.com', '2023-05-14 07:48:47', '2023-05-15 00:00:00', '2023-05-17 00:00:00', 'Guest 3', 1, 5, 'baru', 7, '2023-05-14 07:48:47', '2023-05-17 06:19:22'),
(32, 'P003', 'Arum', 'hihi@gmail.com', '2023-05-14 23:25:36', '2023-05-18 00:00:00', '2023-05-21 00:00:00', 'Guest 1', 1, 1, 'check_out', 7, '2023-05-14 23:25:36', '2023-05-15 06:09:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230116070009-create-user.js'),
('20230116070502-create-tipe-kamar.js'),
('20230116070628-create-kamar.js'),
('20230116071303-create-pemesanan.js'),
('20230116071504-create-detail-pemesanan.js');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tipe_kamars`
--

CREATE TABLE `tipe_kamars` (
  `id` int(11) NOT NULL,
  `nama_tipe_kamar` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tipe_kamars`
--

INSERT INTO `tipe_kamars` (`id`, `nama_tipe_kamar`, `harga`, `deskripsi`, `foto`, `createdAt`, `updatedAt`) VALUES
(1, 'Deluxe', 275000, 'Kamar sultan nan nyaman', 'image-1684232255323.jpeg', '2023-01-18 05:18:08', '2023-05-16 10:17:35'),
(2, 'Superior', 400000, 'Double bed', 'image-1684234824054.jpg', '2023-01-24 07:26:49', '2023-05-16 11:00:24'),
(4, 'Elite', 800000, 'oke', 'image-1684234832715.jpg', '2023-05-04 03:17:55', '2023-05-16 23:01:57'),
(5, 'Suite', 450000, 'Double bed', 'image-1684234848611.jpg', '2023-05-05 02:00:36', '2023-05-17 04:53:45'),
(7, 'VIP', 800000, 'kamar paling anjayy', 'image-1684234815243.jpg', '2023-05-15 05:34:22', '2023-05-16 11:00:15'),
(8, 'pinky', 345000, 'Kamar lucu dan juga nyaman', 'image-1684232245319.jpg', '2023-05-16 10:17:25', '2023-05-16 10:17:25'),
(9, 'Premium', 700000, 'Premium lucu', 'image-1684237678384.jpg', '2023-05-16 11:47:58', '2023-05-16 11:47:58'),
(10, 'Special', 54500, 'Kamar lucu dan juga nyaman', 'image-1684295824719.jpg', '2023-05-17 03:57:04', '2023-05-17 03:57:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','resepsionis') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama_user`, `foto`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'Rani', 'image-1684332869538.jpg', 'rain@gmail.com', '58b1216b06850385d9a4eadbedc806c4', 'resepsionis', '2023-01-18 05:16:30', '2023-05-17 14:14:29'),
(2, 'aisya ', 'image-1684233765531.png', 'aisya@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin', '2023-01-18 05:17:30', '2023-05-17 04:34:47'),
(6, 'Alya Rusyda', 'image-1684234440560.jpg', 'alya@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin', '2023-05-04 03:36:33', '2023-05-16 10:54:00'),
(7, 'griselda cute', 'image-1684234398213.jpg', 'grisel@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin', '2023-05-05 03:42:49', '2023-05-16 10:54:51'),
(8, 'jihan anjay', 'image-1684234413717.jpg', 'jihan@gmail.com', '58b1216b06850385d9a4eadbedc806c4', 'resepsionis', '2023-05-13 03:50:59', '2023-05-16 10:54:57'),
(10, 'dilaaw', 'image-1684237577431.jpg', 'dila@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin', '2023-05-16 11:46:17', '2023-05-16 11:46:17'),
(11, 'atsumu', 'image-1684276833369.jpg', 'cumu@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'resepsionis', '2023-05-16 22:40:33', '2023-05-16 22:40:33'),
(12, 'ratu', 'image-1684295761851.jpg', 'ratu@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'resepsionis', '2023-05-17 03:56:01', '2023-05-17 03:56:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pemesanans`
--
ALTER TABLE `detail_pemesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemesananId` (`pemesananId`),
  ADD KEY `kamarId` (`kamarId`);

--
-- Indeks untuk tabel `kamars`
--
ALTER TABLE `kamars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipeKamarId` (`tipeKamarId`);

--
-- Indeks untuk tabel `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipeKamarId` (`tipeKamarId`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `tipe_kamars`
--
ALTER TABLE `tipe_kamars`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pemesanans`
--
ALTER TABLE `detail_pemesanans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT untuk tabel `kamars`
--
ALTER TABLE `kamars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pemesanans`
--
ALTER TABLE `pemesanans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `tipe_kamars`
--
ALTER TABLE `tipe_kamars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD CONSTRAINT `pemesanans_ibfk_1` FOREIGN KEY (`tipeKamarId`) REFERENCES `tipe_kamars` (`id`),
  ADD CONSTRAINT `pemesanans_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
