CREATE DATABASE QuanLyTruongMamNon /* Quản Lý Trường Mầm Non Tạ Quang Khôi */
GO
USE QuanLyTruongMamNon
GO

CREATE TABLE Be (
    MaBe CHAR(7)
    CONSTRAINT PK_Be_MaBe PRIMARY KEY,
    TenBe NVARCHAR(7),
    TenLot NVARCHAR(15),
    HoBe NVARCHAR(7),
    NgaySinh DATE,
    NoiSinh NVARCHAR(15),
    Ap NVARCHAR(15),
    Xa NVARCHAR(15),
    Huyen NVARCHAR(15),
    Tinh NVARCHAR(15),
    CanNang FLOAT,
    ChieuCao FLOAT,
    TinhTrangHoc INT /* 1 là còn học, 0 là đã nhĩ */
)
GO
CREATE TABLE TaiKhoan (
    TenTaiKhoan VARCHAR(20)
    CONSTRAINT PK_TaiKhoan_TenTaiKhoan PRIMARY KEY,
    MatKhau VARCHAR(20),
    /* MaSoHuu CHAR(7) FOREIGN KEY REFERENCES PhuHuynh(MaPH),*/
    LoaiTK INT
)
GO
CREATE TABLE PhuHuynh (
    MaPH CHAR(7)
    CONSTRAINT PK_PhuHuynh_MaPH PRIMARY KEY,
    TenPH NVARCHAR(7),
    TenLot NVARCHAR(15),
    HoPH NVARCHAR(7),
    SoDienThoai VARCHAR(12),
    Ap NVARCHAR(15),
    Xa NVARCHAR(15),
    Huyen NVARCHAR(15),
    Tinh NVARCHAR(15),
    TenTaiKhoan VARCHAR(20) FOREIGN KEY REFERENCES TaiKhoan(TenTaiKhoan)
)
GO
CREATE TABLE GiaoVien (
    MaGV CHAR(7)
    CONSTRAINT PK_GiaoVien_MaGV PRIMARY KEY,
    TenGV NVARCHAR(7),   
    TenLot NVARCHAR(15),   
    HoGV NVARCHAR(7),   
    NgaySinh DATE,
    SoDienThoai NVARCHAR(12),   
    Ap NVARCHAR(15),
    Xa NVARCHAR(15),
    Huyen NVARCHAR(15),
    Tinh NVARCHAR(15),
    TenTaiKhoan VARCHAR(20) FOREIGN KEY REFERENCES TaiKhoan(TenTaiKhoan)
)
GO
CREATE TABLE MoiQuanHe ( /* Bảng giữa PhuHuynh và Be */
    MaBe CHAR(7) FOREIGN KEY REFERENCES Be(MaBe),
    MaPH CHAR(7) FOREIGN KEY REFERENCES PhuHuynh(MaPH),
    QuanHe NVARCHAR(10)
)
GO
CREATE TABLE LinhVuc (
    MaLV CHAR(4) 
    CONSTRAINT PK_LinhVuc_MaLV PRIMARY KEY,
    TenLV NVARCHAR(20)
)
GO
CREATE TABLE KyNang (
    MaKN CHAR(4)
    CONSTRAINT PK_KyNang_MaKN PRIMARY KEY,
    TenKN NVARCHAR(100)
)
GO 
CREATE TABLE HoatDong (
    MaHoatDong CHAR(9) CONSTRAINT PK_HoatDong_MaHoatDong PRIMARY KEY,
    NoiDung NVARCHAR(MAX),
    MaLV CHAR(4) FOREIGN KEY REFERENCES LinhVuc(MaLV),
    MaKN CHAR(4) FOREIGN KEY REFERENCES KyNang(MaKN)
)
GO
CREATE TABLE HoatDongCuaBe ( /* Giữa bảng Bé và Bảng HoatDong */
    MaBe CHAR(7) FOREIGN KEY REFERENCES Be(MaBe),
    MaHoatDong CHAR(9) FOREIGN KEY REFERENCES HoatDong(MaHoatDong),
    ThoiGianBatDau DATETIME,
    ThoiGianKetThuc DATETIME
)
GO
CREATE TABLE Lop (
    MaLop CHAR(3) CONSTRAINT PK_Lop_MaLop PRIMARY KEY,
    TenLop NVARCHAR(15)
)
GO
CREATE TABLE Be_Lop_GiaoVien (
    MaBe CHAR(7) FOREIGN KEY REFERENCES Be(MaBe),
    MaLop CHAR(3) FOREIGN KEY REFERENCES Lop(MaLop),
    MaGV CHAR(7) FOREIGN KEY REFERENCES GiaoVien(MaGV)
)
Go
CREATE TABLE TinNhan (
    MaTN CHAR(11) CONSTRAINT PK_TinNhan_MaTN PRIMARY KEY,
    NguoiNhan VARCHAR(7),
    TieuDe VARCHAR(50),
    NoiDung VARCHAR(MAX),
    DinhKem VARCHAR(MAX),
	MaNguoiGui CHAR(7) FOREIGN KEY REFERENCES GiaoVien(MaGV)
)
GO
CREATE TABLE HoaDon (
    MaHoaDon CHAR(12) CONSTRAINT PK_HoaDon_MaHoaDon PRIMARY KEY,
    NgayDuKien DATE,
    TrangThai INT,
    NgayThanhToan DATETIME,
    MaBe CHAR(7) FOREIGN KEY REFERENCES Be(MaBe)
)
GO
CREATE TABLE TepDaPhuongTien (
    MaAV CHAR(11) CONSTRAINT PK_TepDaPhuongTien_MaAV PRIMARY KEY,
    DuongDan VARCHAR(MAX),
    MoTa VARCHAR(20),
    NgayTaiLen DATETIME,
    MaTN CHAR(11) FOREIGN KEY REFERENCES TinNhan(MaTN)
)
GO
INSERT INTO Be (MaBe, TenBe, TenLot, HoBe, NgaySinh, NoiSinh, Ap, Xa, Huyen, Tinh, CanNang, ChieuCao, TinhTrangHoc)
VALUES
('B220001', 'Huy', 'Văn', 'Nguyễn', '20170122', 'Cần Thơ', '5', 'Thương Hai', 'Cái Bè', 'Hậu Giang', '7', '65.9', '1'),
('B220002', 'Hùng', 'Minh', 'Tạ', '20170221', 'BRVT', '7', 'Mạnh Bá', 'Trương Long', 'Hậu Giang', '6', '65', '1'),
('B220003', 'Ngọc', 'Hồng', 'Nguyễn', '20170412', 'Hải Dương', '8', 'Bờ Mới', 'Cái Răng', 'Hậu Giang', '6.5', '64', '1'),
('B220004', 'Lan', 'Diệu', 'Hứa', '20170723', 'Lâm Đồng', '9', 'Minh Sáng', 'Sông Châu', 'Hậu Giang', '6', '65.5', '1'),
('B220005', 'Mỹ', 'Ngọc', 'Trần', '20170815', 'BRVT', '10', 'Rãnh Năm', 'Cái Bè', 'Hậu Giang', '7', '65', '1')
GO
INSERT INTO TaiKhoan (TenTaiKhoan, MatKhau, LoaiTK)
VALUES
('vannga', 'yE8ZijmY6gE6GL', '1'),
('thithuong', 'GTeWmpj7jgEFWP', '1'),
('thanhthanh', 'AEKdTuTHk294wG', '1'),
('minhhang', 'ZSMbW3KATo3Has', '1'),
('dathu', 'EyfiK86owKKGrv', '1'),
('vantrung', '2YmyTXguZHUw9q', '2'),
('thithuy', 'vGVJP8RJ8ds9Ck', ''),
('thanhnguyen', 'B7nRcY2Tt5eqzK', '2'),
('hoangminh', 'byhhEpGLpn4h9F', '2'),
('dathuy', 'J7rudUc6sisYfs', '2'),
('quangkhoi', 'CrZm9AQ7wyMwDh', '0')
GO
INSERT INTO PhuHuynh (MaPH, TenPH, TenLot, HoPH, SoDienThoai, Ap, Xa, Huyen, Tinh, TenTaiKhoan)
VALUES
('PH22001', 'Trung', 'Văn', 'Nguyễn', '841212569343', '5', 'Thương Hai', 'Cái Bè', 'Hậu Giang','vantrung'),
('PH22002', 'Thúy', 'Thị', 'Trần', '841213705349', '7', 'Mạnh Bá', 'Trương Long', 'Hậu Giang','thithuy'),
('PH22003', 'Thanh', 'Thanh', 'Nguyễn', '841211344285', '8', 'Bờ Mới', 'Cái Răng', 'Hậu Giang','thanhnguyen'),
('PH22004', 'Minh', 'Hoàng', 'Trương', '841214413097', '9', 'Minh Sáng', 'Sông Châu', 'Hậu Giang','hoangminh'),
('PH22005', 'Thuỷ', 'Dạ', 'Lâm', '841211234997', '10', 'Rãnh Năm', 'Cái Bè', 'Hậu Giang','dathuy')
GO
INSERT INTO GiaoVien (MaGV, TenGV, TenLot, HoGV, NgaySinh, Ap, Xa, Huyen, Tinh, SoDienThoai, TenTaiKhoan)
VALUES
('GV22001', 'Nga', 'Văn', 'Nguyễn', '19990204', '841214621082', '5', 'Thương Hai', 'Cái Bè','Hậu Giang','vannga'),
('GV22002', 'Thương', 'Thị', 'Trần', '19980423', '841219224898', '7', 'Mạnh Bá', 'Trương Long','Hậu Giang','thithuong'),
('GV22003', 'Thanh', 'Thanh', 'Phạm', '20000923', '841218352993', '8', 'Bờ Mới', 'Cái Răng','Hậu Giang','thanhthanh'),
('GV22004', 'Hằng', 'Minh', 'Trương', '19990505', '841215352100', '9', 'Minh Sáng', 'Sông Châu','Hậu Giang','minhhang'),
('GV22005', 'Thu', 'Dạ', 'Lâm', '19970506', '841217993910', '10', 'Rãnh Năm', 'Cái Bè','Hậu Giang','dathu')

GO
INSERT INTO MoiQuanHe (MaBe, MaPH, QuanHe)
VALUES
('B220001', 'PH22001', 'Cha'),
('B220002', 'PH22002', 'Mẹ'),
('B220003', 'PH22003', 'Mẹ'),
('B220004', 'PH22004', 'Ông Ngoại'),
('B220005', 'PH22005', 'Bà Nội')
GO
INSERT INTO KyNang (MaKN, TenKN)
VALUES
('KN01', 'Giải quyết vấn đề'),
('KN02', 'Thuyết trình'),
('KN03', 'Đặt câu hỏi'),
('KN04', 'Thu thập thông tin'),
('KN05', 'Tính toán'),
('KN06', 'So sánh'),
('KN07', 'Nhận thức hình học 2 chiều và 3 chiều'),
('KN08', 'Đo lường độ dài cân nặng thể tích nhiệt độ thời gian tiền bạc'),
('KN09', 'Cách sử dụn bản đồ và chỉ dẫn')

GO
INSERT INTO LinhVuc (MaLV, TenLV)
VALUES 
('LV01', 'Xã hội'),
('LV02', 'Cảm Xúc'),
('LV03', 'Ngôn ngữ và văn học'),
('LV04', 'Nhận thức'),
('LV05', 'Thể chất'),
('LV06', 'Giao tiếp')
GO
INSERT INTO HoatDong (MaHoatDong, NoiDung, MaLV, MAKN)
VALUES
('HD2201001', 'Học về tình bạn','LV01','KN01'),
('HD2201002', 'Không khóc khi lạc đường','LV02','KN01'),
('HD2201003', 'Chuyến Tàu Hoàng Hôn','LV03','KN01'),
('HD2202001', 'Bạn là ai','LV04','KN03'),
('HD2202003', 'Bài thể dục buổi sáng','LV05','KN01'),
('HD2202004', 'Nói chuyện với người lớn','LV05','KN02')
Go
INSERT INTO HoatDongCuaBe(MaBe, MaHoatDong, ThoiGianBatDau, ThoiGianKetThuc)
VALUES
('B220001', 'HD2201001','2022-01-11 08:08:00','2022-01-11 10:08:00'),
('B220001', 'HD2201002','2022-01-12 08:08:00','2022-01-12 10:08:00'),
('B220001', 'HD2201003','2022-01-13 08:08:00','2022-01-13 10:08:00'),
('B220001', 'HD2202001','2022-01-14 08:08:00','2022-01-14 10:08:00'),
('B220001', 'HD2202003','2022-01-15 08:08:00','2022-01-15 10:08:00'),
('B220001', 'HD2202004','2022-01-01 08:08:00','2022-01-01 11:00:00')
GO
INSERT INTO Lop (MaLop, TenLop)
VALUES
('L01', 'Chồi 1'),
('L02', 'Chồi 2'),
('L03', 'Chồi 3')
GO
INSERT INTO TinNhan (MaTN, NguoiNhan, TieuDe, NoiDung, DinhKem, MaNguoiGui)
VALUES 
('TN220100001', '1', 'Thong bao 1', 'ND', '', 'GV22001'),
('TN220100002', '1', 'Thong bao 2', 'ND', '', 'GV22002'),
('TN220100003', '1', 'Thong bao 3', 'ND', '', 'GV22003'),
('TN220100004', '1', 'Thong bao 4', 'ND', '', 'GV22004'),
('TN220100005', '1', 'Thong bao 5', 'ND', '', 'GV22005')
Go
INSERT INTO HoaDon (MaHoaDon, NgayDuKien, TrangThai, NgayThanhToan, MaBe)
VALUES 

GO
SELECT * FROM Be
Go 
SELECT * FROM TaiKhoan ORDER BY LoaiTK
GO 
SELECT * FROM PhuHuynh
GO 
SELECT * FROM MoiQuanHe
GO
SELECT * FROM KyNang
GO
SELECT * FROM LinhVuc

/* Câu Lệnh Truy Xuất*/
-- 1. Tìm các hoạt động của bé trong tuần này
SELECT *
FROM HoatDongCuaBe
Where 
-- (SELECT DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 0) MondayOfCurrentWeek)

-- 2. Tìm Những lớp có hai giáo viên trở lên

-- 3. Đếm số lượng bé của lớp cho trước

-- 4. 