-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 30, 2022 at 03:29 PM
-- Server version: 8.0.29
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trasuadtb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cthoadon`
--

DROP TABLE IF EXISTS `cthoadon`;
CREATE TABLE IF NOT EXISTS `cthoadon` (
  `MaHD` int NOT NULL,
  `MaSP` int NOT NULL,
  `SoLuong` int NOT NULL,
  `DonGia` int NOT NULL,
  `ThanhTien` int NOT NULL,
  PRIMARY KEY (`MaHD`,`MaSP`),
  KEY `cthoadon_ibfk_1` (`MaHD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cthoadon`
--

INSERT INTO `cthoadon` (`MaHD`, `MaSP`, `SoLuong`, `DonGia`, `ThanhTien`) VALUES
(18, 114, 2, 159000, 318000),
(18, 122, 3, 249000, 747000),
(18, 124, 6, 19000, 114000),
(18, 130, 2, 19000, 38000),
(18, 132, 2, 25000, 50000),
(19, 115, 2, 119000, 238000),
(19, 120, 1, 239000, 239000),
(19, 128, 4, 19000, 76000),
(19, 131, 5, 10000, 50000),
(20, 118, 1, 129000, 129000),
(20, 120, 2, 239000, 478000),
(20, 129, 5, 19000, 38000),
(20, 130, 5, 19000, 95000),
(20, 131, 10, 10000, 100000),
(21, 112, 3, 129000, 387000),
(21, 117, 2, 149000, 298000),
(21, 126, 10, 19000, 190000),
(21, 127, 3, 29000, 87000),
(21, 128, 15, 19000, 285000),
(21, 131, 6, 10000, 60000),
(22, 114, 5, 159000, 795000),
(22, 127, 10, 29000, 290000),
(22, 129, 6, 19000, 95000),
(22, 132, 3, 25000, 75000),
(23, 112, 3, 129000, 387000),
(40, 156, 1, 55000, 55000),
(40, 159, 1, 45000, 45000),
(41, 152, 1, 42000, 42000),
(41, 153, 1, 45000, 45000),
(42, 157, 1, 45000, 45000),
(43, 156, 3, 55000, 110000),
(43, 159, 3, 45000, 135000),
(44, 153, 1, 45000, 45000),
(44, 156, 1, 55000, 55000),
(45, 146, 100, 56000, 5600000),
(45, 147, 100, 45000, 4500000),
(46, 153, 1, 45000, 45000);

-- --------------------------------------------------------

--
-- Table structure for table `giamgia`
--

DROP TABLE IF EXISTS `giamgia`;
CREATE TABLE IF NOT EXISTS `giamgia` (
  `MaGiam` int NOT NULL AUTO_INCREMENT,
  `TenGiamGia` text NOT NULL,
  `PhanTramGiam` int NOT NULL,
  `DieuKien` int NOT NULL,
  `NgayBD` date NOT NULL,
  `NgayKT` date NOT NULL,
  PRIMARY KEY (`MaGiam`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `giamgia`
--

INSERT INTO `giamgia` (`MaGiam`, `TenGiamGia`, `PhanTramGiam`, `DieuKien`, `NgayBD`, `NgayKT`) VALUES
(1, 'Không giảm giá', 0, 0, '2022-01-01', '2042-12-31'),
(2, 'Giảm 20% đơn hàng từ 150.000đ', 20, 150000, '2022-01-01', '2021-05-13'),
(4, 'Giảm 10% đơn hàng từ 70.000đ', 10, 70000, '2022-03-01', '2022-05-31'),
(6, 'Giảm 30% đơn hàng từ 300.000đ', 30, 300000, '2022-04-01', '2022-06-23'),
(7, 'Giảm 20% đơn hàng từ 150.000đ', 20, 150000, '2022-01-01', '2022-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE IF NOT EXISTS `hoadon` (
  `MaHD` int NOT NULL AUTO_INCREMENT,
  `MaKH` int NOT NULL,
  `MaNV` int NOT NULL,
  `NgayLap` date NOT NULL,
  `TongTien` int NOT NULL,
  `GhiChu` text NOT NULL,
  PRIMARY KEY (`MaHD`),
  KEY `hoadon_ibfk_1` (`MaNV`),
  KEY `hoadon_ibfk_2` (`MaKH`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `MaKH`, `MaNV`, `NgayLap`, `TongTien`, `GhiChu`) VALUES
(39, 2, 0, '2022-05-27', 55000, 'Đã thanh toán'),
(40, 7, 0, '2022-05-27', 100000, 'Đã thanh toán'),
(41, 11, 0, '2022-05-27', 87000, 'Đã thanh toán'),
(42, 9, 0, '2022-05-27', 45000, 'Đã thanh toán'),
(43, 10, 0, '2022-05-27', 245000, 'Đã thanh toán'),
(44, 9, 3, '2022-05-30', 90000, 'Đã thanh toán'),
(45, 11, 0, '2022-05-30', 7070000, 'Đã thanh toán'),
(46, 3, 0, '2022-05-30', 45000, 'Đã thanh toán');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKH` int NOT NULL AUTO_INCREMENT,
  `Ho` varchar(255) NOT NULL,
  `Ten` varchar(255) NOT NULL,
  `GioiTinh` varchar(3) NOT NULL,
  `TongChiTieu` int NOT NULL DEFAULT '0',
  `TinhTrang` int NOT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `Ho`, `Ten`, `GioiTinh`, `TongChiTieu`, `TinhTrang`) VALUES
(1, 'Nguyễn Duy', 'Đông', 'Nam', 1596400, 1),
(2, 'Dương Thị', 'Thắm', 'Nữ', 1552300, 1),
(3, 'Ngô Thị Bảo', 'Trâm', 'Nữ', 1513800, 1),
(4, 'Đăng Thị Kiều', 'Thiên', 'Nữ', 1013600, 0),
(7, 'Đinh Thị Bích', 'Ngân', 'Nữ', 3319700, 1),
(8, 'Dương Diệu', 'Hương', 'Nữ', 1877000, 1),
(9, 'Nguyễn Thị Quỳnh', 'Thư', 'Nữ', 5878500, 1),
(10, 'Nguyễn Kiều Lê', 'Minh', 'Nam', 3381800, 1),
(11, 'Lý Thanh ', 'Thư', 'Nữ', 9417300, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loai`
--

DROP TABLE IF EXISTS `loai`;
CREATE TABLE IF NOT EXISTS `loai` (
  `MaLoai` int NOT NULL AUTO_INCREMENT,
  `TenLoai` text NOT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loai`
--

INSERT INTO `loai` (`MaLoai`, `TenLoai`) VALUES
(1, 'Trà, trà sữa'),
(2, 'Đá xay'),
(3, 'Bánh');

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

DROP TABLE IF EXISTS `nhacungcap`;
CREATE TABLE IF NOT EXISTS `nhacungcap` (
  `MaNCC` int NOT NULL AUTO_INCREMENT,
  `TenNCC` varchar(255) NOT NULL,
  `DiaChi` varchar(255) NOT NULL,
  `DienThoai` text NOT NULL,
  PRIMARY KEY (`MaNCC`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`MaNCC`, `TenNCC`, `DiaChi`, `DienThoai`) VALUES
(1, 'Trân châu đen', '273 An Dương Vương, phường 3, quận 5, TP.HCM', '0356829817'),
(2, 'Bột trà sữa', '50/10/14K Nguyễn Đình Chiểu, phường 3 quận Phú Nhuận', '0903949102'),
(5, 'Bánh mì đặt ruột', '629/10H Cách Mạng Tháng 8 phường 13 quận 10', '02774638174');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNV` int NOT NULL AUTO_INCREMENT,
  `Ho` varchar(255) NOT NULL,
  `Ten` varchar(255) NOT NULL,
  `GioiTinh` varchar(3) NOT NULL,
  `ChucVu` varchar(255) NOT NULL,
  PRIMARY KEY (`MaNV`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `Ho`, `Ten`, `GioiTinh`, `ChucVu`) VALUES
(0, 'Admin', '', '', 'Admin'),
(1, 'Bùi Lương Bích', 'Hạnh', 'Nữ', 'Quản Lý'),
(2, 'Nguyễn Đức', 'Sinh', 'Nam', 'Quản Lý'),
(3, 'Phạm Thị Kim', 'Anh', 'Nữ', 'Nhân Viên'),
(4, 'Nguyễn Minh', 'Trung', 'Nam', 'Nhân Viên');

-- --------------------------------------------------------

--
-- Table structure for table `phanquyen`
--

DROP TABLE IF EXISTS `phanquyen`;
CREATE TABLE IF NOT EXISTS `phanquyen` (
  `Quyen` varchar(255) NOT NULL,
  `NhapHang` int NOT NULL,
  `QLSanPham` int NOT NULL,
  `QLNhanVien` int NOT NULL,
  `QLKhachHang` int NOT NULL,
  `ThongKe` int NOT NULL,
  PRIMARY KEY (`Quyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phanquyen`
--

INSERT INTO `phanquyen` (`Quyen`, `NhapHang`, `QLSanPham`, `QLNhanVien`, `QLKhachHang`, `ThongKe`) VALUES
('Default', 0, 0, 0, 0, 0),
('Nhân viên', 0, 0, 0, 1, 0),
('Quản lý', 0, 0, 1, 1, 1),
('Quản trị', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSP` int NOT NULL AUTO_INCREMENT,
  `TenSP` varchar(255) NOT NULL,
  `MaLoai` int NOT NULL,
  `SoLuong` int NOT NULL,
  `DonViTinh` varchar(255) NOT NULL,
  `HinhAnh` varchar(255) NOT NULL,
  `DonGia` int NOT NULL,
  PRIMARY KEY (`MaSP`),
  KEY `sanpham_ibfk_1` (`MaLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bang San Pham';

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `MaLoai`, `SoLuong`, `DonViTinh`, `HinhAnh`, `DonGia`) VALUES
(146, 'Trà sữa truyền thống', 1, 100, 'ml', 'trasua1.png', 56000),
(147, 'Trà đào', 1, 0, 'ml', 'tradao.png', 45000),
(148, 'Trà vải', 1, 100, 'ml', 'travai.png', 45000),
(150, 'Hồng trà chanh', 1, 99, 'ml', 'hongtrachanh.png', 42000),
(152, 'Dâu ép', 2, 99, 'ml', 'dauep.png', 42000),
(153, 'Hồng trà đác cam', 1, 97, 'ml', 'hongtradaccam.png', 45000),
(154, 'Trà xanh đá xay', 2, 99, 'ml', 'traxanhdaxay.png', 65000),
(155, 'Trà thảo mộc', 1, 99, 'ml', 'trathaomoc.png', 45000),
(156, 'Trà ô lông sữa', 1, 94, 'ml', 'trasuc2.png', 55000),
(157, 'Trà hoa hồng', 1, 99, 'ml', 'trahoahong.png', 45000),
(158, 'Latte trà xanh', 1, 100, 'ml', 'lattetraxanh.png', 60000),
(159, 'Sinh tố chanh', 2, 95, 'ml', 'sinhtochanh.png', 45000),
(160, 'Sinh tố dâu', 2, 100, 'ml', 'sinhtodau.png', 45000),
(161, 'Táo ép', 2, 100, 'ml', 'taoep.png', 45000),
(162, 'Latte', 1, 100, 'ml', 'latte.png', 35000),
(163, 'Caramen chảy', 1, 100, 'ml', 'Caramen chảy.png', 56000),
(164, 'Bánh mì', 3, 100, 'Cái', 'banhmi.png', 25000),
(165, 'Green Tea Choco Cake', 3, 100, 'Cái', 'Green Tea Choco Cake.png', 25000),
(166, 'Passion Panna Cotta', 3, 100, 'Cái', 'Passion Panna Cotta.png', 25000),
(167, 'Tiramisu Mini', 3, 99, 'Cái', 'Tiramisu Mini.png', 25000),
(168, 'Butter Chocolate Croissant ', 3, 100, 'Cái', 'Butter Chocolate Croissant.jpg', 25000),
(169, 'Pure Butter Croissant ', 3, 100, 'Cái', 'Pure Butter Croissant.jpg', 25000),
(170, 'Trà ô lông dâu', 2, 100, 'ml', 'traolongdau.png', 45000);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `MaNV` int NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(255) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `Quyen` varchar(255) NOT NULL,
  `TrangThai` int NOT NULL,
  PRIMARY KEY (`MaNV`),
  KEY `taikhoan_ibfk_2` (`Quyen`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaNV`, `TenDangNhap`, `MatKhau`, `Quyen`, `TrangThai`) VALUES
(0, 'admin', 'admin', 'Quản trị', 1),
(1, 'ql01', 'ql01', 'Quản lý', 1),
(2, 'ql02', 'ql02', 'Quản lý', 0),
(3, 'ql03', 'ql03', 'Quản lý', 1),
(4, 'nv01', 'nv01', 'Nhân viên', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `taikhoan_ibfk_2` FOREIGN KEY (`Quyen`) REFERENCES `phanquyen` (`Quyen`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
