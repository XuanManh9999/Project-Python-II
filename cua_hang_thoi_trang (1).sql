-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 12:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cua_hang_thoi_trang`
--

-- --------------------------------------------------------

--
-- Table structure for table `dich_vu`
--

CREATE TABLE `dich_vu` (
  `ID` int(11) NOT NULL,
  `ten_dich_vu` varchar(100) NOT NULL,
  `gia` decimal(10,2) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dich_vu`
--

INSERT INTO `dich_vu` (`ID`, `ten_dich_vu`, `gia`, `mo_ta`, `createAt`, `updateAt`) VALUES
(1, 'Chăm sóc khách hàng', 40000.00, 'Tư vấn, giải đáp thắc mắc', '2024-06-24 09:27:26', '2024-06-24 09:34:40'),
(4, 'May mặc', 12.00, 'Khâu quần áo', '2024-06-24 09:35:21', '2024-06-26 09:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

CREATE TABLE `don_hang` (
  `ID` int(11) NOT NULL,
  `trang_thai_don_hang` varchar(50) DEFAULT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `don_hang`
--

INSERT INTO `don_hang` (`ID`, `trang_thai_don_hang`, `ID_user`, `createAt`, `updateAt`) VALUES
(1, 'Hoàn tất', 3, '2024-06-26 03:49:24', '2024-06-26 03:49:24'),
(2, 'Hoàn tất', 3, '2024-06-26 03:49:29', '2024-06-26 03:49:29'),
(4, 'Chưa hoàn tất', 9, '2024-06-26 04:33:05', '2024-06-26 09:20:05'),
(5, 'Hoàn tất', 1, '2024-06-26 06:59:11', '2024-06-26 06:59:11'),
(6, 'Hoàn tất', 3, '2024-06-26 07:04:16', '2024-06-26 07:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `ten` varchar(100) NOT NULL,
  `loai` varchar(50) DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `so_luong_san_pham` int(11) DEFAULT NULL,
  `chat_lieu` varchar(50) DEFAULT NULL,
  `da_ban` int(11) DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `ten`, `loai`, `gia`, `mo_ta`, `so_luong_san_pham`, `chat_lieu`, `da_ban`, `createAt`, `updateAt`) VALUES
(1, 'Áo Cánh Nam', 'vip 2', 32532534.00, 'Co dãn 4 chiều', 324, 'Thun Lạnh', 43, '2024-06-24 08:39:10', '2024-06-24 09:02:15'),
(3, 'Quần Jean', 'Vip 1', 400000.00, 'Quần form rộng, mặc thỏa mái, trẻ trung năng động', 100, 'Cottong co dãn', 43, '2024-06-24 08:59:30', '2024-06-24 08:59:30'),
(4, 'Quần Bò', 'Vip 2', 400000.00, 'Quần form rộng, mặc thỏa mái, trẻ trung năng động', 100, 'Cottong co dãn', 43, '2024-06-24 08:59:40', '2024-06-24 14:09:23'),
(5, 'Áo balo', 'Vip 1', 400000.00, 'Quần form rộng, mặc thỏa mái, trẻ trung năng động', 100, 'Cottong co dãn', 43, '2024-06-24 08:59:52', '2024-06-24 08:59:52');

-- --------------------------------------------------------

--
-- Table structure for table `product_don_hang`
--

CREATE TABLE `product_don_hang` (
  `ID_product` int(11) NOT NULL,
  `ID_don_hang` int(11) NOT NULL,
  `soluong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_don_hang`
--

INSERT INTO `product_don_hang` (`ID_product`, `ID_don_hang`, `soluong`) VALUES
(1, 4, 2),
(1, 6, 2),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `ten` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dia_chi` text DEFAULT NULL,
  `luong` decimal(10,2) DEFAULT NULL,
  `vi_tri` varchar(50) DEFAULT NULL,
  `quyen` varchar(50) DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ngay_sinh` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `ten`, `so_dien_thoai`, `email`, `dia_chi`, `luong`, `vi_tri`, `quyen`, `createAt`, `updateAt`, `ngay_sinh`) VALUES
(1, 'Duy', '0123456789', 'duy@gmail.com', 'Hà Nội', 500000.00, 'nhân viên', 'khách hàng', '2024-06-24 07:23:49', '2024-06-24 08:23:22', '2000-01-01'),
(3, 'Mạnh Muler', '0123456789', 'duy@gmail.com', 'Hà Nội', 500000.00, 'nhân viên', 'khách hàng', '2024-06-24 08:01:00', '2024-06-24 08:32:05', '2000-01-01'),
(4, 'Minh Tít', '0123456789', 'duy@gmail.com', 'Hà Nội', 500000.00, 'nhân viên', 'khách hàng', '2024-06-24 08:02:08', '2024-06-24 08:02:08', '2000-01-01'),
(7, 'Thanh Devis', '0123456789', 'duy@gmail.com', 'Hà Nội', 500000.00, 'nhân viên', 'khách hàng', '2024-06-24 08:29:55', '2024-06-24 08:29:55', '2000-01-01'),
(9, 'Duy Degea', '0123456789', 'duy@gmail.com', 'Hà Nội', 500000.00, 'nhân viên', 'khách hàng', '2024-06-24 08:31:12', '2024-06-24 08:31:12', '2000-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `user_dich_vu`
--

CREATE TABLE `user_dich_vu` (
  `ID_user` int(11) NOT NULL,
  `ID_dich_vu` int(11) NOT NULL,
  `so_luong` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_dich_vu`
--

INSERT INTO `user_dich_vu` (`ID_user`, `ID_dich_vu`, `so_luong`) VALUES
(3, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dich_vu`
--
ALTER TABLE `dich_vu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_user` (`ID_user`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product_don_hang`
--
ALTER TABLE `product_don_hang`
  ADD PRIMARY KEY (`ID_product`,`ID_don_hang`),
  ADD KEY `ID_don_hang` (`ID_don_hang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_dich_vu`
--
ALTER TABLE `user_dich_vu`
  ADD PRIMARY KEY (`ID_user`,`ID_dich_vu`),
  ADD KEY `ID_dich_vu` (`ID_dich_vu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dich_vu`
--
ALTER TABLE `dich_vu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `don_hang_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `user` (`ID`);

--
-- Constraints for table `product_don_hang`
--
ALTER TABLE `product_don_hang`
  ADD CONSTRAINT `product_don_hang_ibfk_1` FOREIGN KEY (`ID_product`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `product_don_hang_ibfk_2` FOREIGN KEY (`ID_don_hang`) REFERENCES `don_hang` (`ID`);

--
-- Constraints for table `user_dich_vu`
--
ALTER TABLE `user_dich_vu`
  ADD CONSTRAINT `user_dich_vu_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `user_dich_vu_ibfk_2` FOREIGN KEY (`ID_dich_vu`) REFERENCES `dich_vu` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
