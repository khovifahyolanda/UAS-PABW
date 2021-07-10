-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2021 pada 06.43
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `finance_income`
--

CREATE TABLE `finance_income` (
  `id_finance_income` int(5) NOT NULL,
  `nomor_invoice` varchar(20) NOT NULL,
  `jenis_income` varchar(100) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `tanggal_pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(3) NOT NULL,
  `nomor_kamar` int(3) NOT NULL,
  `id_kamar_tipe` int(3) NOT NULL,
  `max_dewasa` int(11) NOT NULL,
  `max_anak` int(11) NOT NULL,
  `status_kamar` varchar(20) NOT NULL DEFAULT 'TERSEDIA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `id_kamar_tipe`, `max_dewasa`, `max_anak`, `status_kamar`) VALUES
(1, 101, 3, 2, 1, 'TERSEDIA'),
(6, 302, 2, 3, 1, 'TERSEDIA'),
(7, 205, 4, 2, 3, 'TERSEDIA'),
(8, 303, 2, 2, 3, 'TERSEDIA'),
(9, 102, 3, 3, 1, 'TERSEDIA'),
(10, 201, 4, 2, 2, 'TERSEDIA'),
(11, 203, 4, 4, 0, 'TERSEDIA'),
(12, 204, 4, 2, 3, 'TERSEDIA'),
(13, 202, 4, 2, 4, 'KOTOR'),
(14, 301, 2, 1, 2, 'TERSEDIA'),
(16, 111, 3, 1, 3, 'TERSEDIA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar_tipe`
--

CREATE TABLE `kamar_tipe` (
  `id_kamar_tipe` int(3) NOT NULL,
  `nama_kamar_tipe` varchar(50) NOT NULL,
  `harga_malam` int(3) NOT NULL,
  `harga_orang` int(3) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar_tipe`
--

INSERT INTO `kamar_tipe` (`id_kamar_tipe`, `nama_kamar_tipe`, `harga_malam`, `harga_orang`, `keterangan`) VALUES
(2, 'STANDART', 100000, 25000, ''),
(3, 'SUPERIOR', 500000, 75000, ''),
(4, 'SUITE', 750000, 150000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(3) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `id_layanan_kategori` int(3) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga_layanan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `nama_layanan`, `id_layanan_kategori`, `satuan`, `harga_layanan`) VALUES
(1, 'NASI GORENG', 1, 'Porsi', 25000),
(2, 'MIE GORENG', 1, 'Porsi', 15000),
(3, 'KOPI TUBRUK', 2, 'Pitcher', 85000),
(4, 'Mobil', 3, 'unit', 150000),
(5, 'Motor', 3, 'unit', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_kategori`
--

CREATE TABLE `layanan_kategori` (
  `id_layanan_kategori` int(3) NOT NULL,
  `nama_layanan_kategori` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `layanan_kategori`
--

INSERT INTO `layanan_kategori` (`id_layanan_kategori`, `nama_layanan_kategori`, `keterangan`) VALUES
(1, 'FOOD', 'Produk makanan, snack, sarapan dan lain-lain'),
(2, 'DRINK', 'Produk minuman'),
(3, 'TRANSPORTASI', 'Fasilitas transportasi untuk kebutuhan tamu hotel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_perusahaan` int(100) NOT NULL,
  `nama_hotel` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(50) NOT NULL,
  `alamat_provinsi` varchar(50) NOT NULL,
  `nomor_telp` varchar(20) NOT NULL,
  `nomor_fax` varchar(20) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `nama_hotel`, `nama_perusahaan`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `nomor_fax`, `website`, `email`) VALUES
(1, 'PYSIC', 'PT. Perusahaan PYSIC', 'Jalan Alamat Pysic, No. 05', 'Kota Pekanbaru', 'Provinsi Riau', '062 1204 0925', '012 3456 7890', 'http://www.pysic.com', 'info@pysic.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `id_tamu` int(3) NOT NULL,
  `prefix` varchar(5) NOT NULL,
  `nama_depan` varchar(100) NOT NULL,
  `nama_belakang` varchar(100) NOT NULL,
  `tipe_identitas` varchar(20) NOT NULL,
  `nomor_identitas` varchar(20) NOT NULL,
  `warga_negara` varchar(100) NOT NULL DEFAULT 'Indonesia',
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(100) NOT NULL,
  `alamat_provinsi` varchar(100) NOT NULL,
  `nomor_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tamu`
--

INSERT INTO `tamu` (`id_tamu`, `prefix`, `nama_depan`, `nama_belakang`, `tipe_identitas`, `nomor_identitas`, `warga_negara`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `email`) VALUES
(4, 'Ms', 'yolan', '', 'KTP', '0011334567', 'Indonesia', 'Jalan uka', 'Pekanbaru', 'Riau', '081371243837', 'khovifahyolanda19@gmail.com'),
(5, 'Mr', 'Irfan', 'Pradinata', 'KTP', '113580953', 'Indonesia', 'Jalan melati', 'Kota Pekanbaru', 'Provinsi Riau', '006249683', 'irfan@gmail.com'),
(6, 'Mrs', 'Melani', 'Ricardo', 'KTP', '9575321856', 'Indonesia', 'Jalan lurus', 'Kota DKI Jakarta', 'Provinsi Jakarta', '1124678095', 'melani@gmail.com'),
(7, 'Mr', 'Chandra', 'gunawan', 'KTP', '3958068245', 'Indonesia', 'Jalan belok', 'Kota Padang', 'Sumtra Barat', '45859047286', 'chandra@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_kamar`
--

CREATE TABLE `transaksi_kamar` (
  `id_transaksi_kamar` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `nomor_invoice` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `id_tamu` int(3) NOT NULL,
  `id_kamar` int(3) NOT NULL,
  `jumlah_dewasa` int(3) NOT NULL,
  `jumlah_anak` int(3) NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `waktu_checkin` time NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `waktu_checkout` time NOT NULL,
  `total_biaya_kamar` int(20) NOT NULL,
  `deposit` int(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'CHECK IN'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_kamar`
--

INSERT INTO `transaksi_kamar` (`id_transaksi_kamar`, `id_user`, `nomor_invoice`, `tanggal`, `id_tamu`, `id_kamar`, `jumlah_dewasa`, `jumlah_anak`, `tanggal_checkin`, `waktu_checkin`, `tanggal_checkout`, `waktu_checkout`, `total_biaya_kamar`, `deposit`, `status`) VALUES
(20, 1, 'INV-20210705-69', '2021-07-05', 4, 6, 2, 3, '2021-07-05', '14:41:00', '2021-07-15', '12:00:00', 1000000, 2000000, 'CHECK OUT'),
(21, 1, 'INV-20210705-29', '2021-07-05', 4, 1, 1, 1, '2021-07-05', '17:17:00', '2021-07-09', '12:00:00', 400000, 2000000, 'CHECK OUT'),
(22, 1, 'INV-20210706-42', '2021-07-06', 5, 11, 5, 0, '2021-07-06', '23:45:00', '2021-07-12', '13:00:00', 4500000, 3000000, 'CHECK OUT'),
(23, 1, 'INV-20210707-22', '2021-07-07', 7, 13, 2, 2, '2021-07-07', '00:38:00', '2021-07-09', '12:00:00', 1500000, 3000000, 'CHECK OUT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_layanan`
--

CREATE TABLE `transaksi_layanan` (
  `id_transaksi_layanan` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `id_transaksi_kamar` int(3) NOT NULL,
  `id_layanan` int(3) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_layanan`
--

INSERT INTO `transaksi_layanan` (`id_transaksi_layanan`, `id_user`, `tanggal`, `waktu`, `id_transaksi_kamar`, `id_layanan`, `jumlah`, `total`) VALUES
(30, 1, '2021-07-05', '14:44:00', 20, 2, 2, 30000),
(31, 1, '2021-07-05', '14:49:00', 20, 3, 5, 425000),
(32, 1, '2021-07-05', '14:50:00', 20, 1, 4, 100000),
(33, 1, '2021-07-07', '00:51:00', 23, 2, 2, 30000),
(34, 1, '2021-07-07', '00:52:00', 23, 1, 3, 75000),
(35, 1, '2021-07-07', '00:56:00', 23, 3, 4, 340000),
(36, 1, '2021-07-07', '01:02:00', 23, 4, 1, 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(3) NOT NULL,
  `images` varchar(100) NOT NULL DEFAULT 'user.jpg',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_user_role` int(5) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `nomor_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `images`, `username`, `password`, `nama`, `id_user_role`, `jabatan`, `nomor_telp`) VALUES
(1, 'user.jpg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 3, 'Application Developer', '0800 0000 0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id_user_role` int(10) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id_user_role`, `role_name`, `keterangan`) VALUES
(1, 'DEVELOPER', 'Akses khusus untuk pembuat aplikasi'),
(2, 'SUPER ADMINISTRATOR', ''),
(3, 'ADMINISTRATOR', ''),
(4, 'FRONT OFFICE', ''),
(5, 'ROOM SERVICE', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `finance_income`
--
ALTER TABLE `finance_income`
  ADD PRIMARY KEY (`id_finance_income`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `kamar_tipe`
--
ALTER TABLE `kamar_tipe`
  ADD PRIMARY KEY (`id_kamar_tipe`);

--
-- Indeks untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indeks untuk tabel `layanan_kategori`
--
ALTER TABLE `layanan_kategori`
  ADD PRIMARY KEY (`id_layanan_kategori`);

--
-- Indeks untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id_tamu`);

--
-- Indeks untuk tabel `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  ADD PRIMARY KEY (`id_transaksi_kamar`);

--
-- Indeks untuk tabel `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  ADD PRIMARY KEY (`id_transaksi_layanan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_user_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `finance_income`
--
ALTER TABLE `finance_income`
  MODIFY `id_finance_income` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kamar_tipe`
--
ALTER TABLE `kamar_tipe`
  MODIFY `id_kamar_tipe` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `layanan_kategori`
--
ALTER TABLE `layanan_kategori`
  MODIFY `id_layanan_kategori` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id_tamu` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  MODIFY `id_transaksi_kamar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  MODIFY `id_transaksi_layanan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_user_role` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
