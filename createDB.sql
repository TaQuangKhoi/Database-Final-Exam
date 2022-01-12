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
    NgaySinh DATETIME,
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
    NgaySinh DATETIME,
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
    MaKN VARCHAR(4)
    CONSTRAINT PK_KyNang_MaKN PRIMARY KEY,
    TenKN NVARCHAR(100)
)
GO 
CREATE TABLE HoatDong (
    MaHoatDong CHAR(9) CONSTRAINT PK_HoatDong_MaHoatDong PRIMARY KEY,
    NoiDung NVARCHAR(MAX),
    ThoiGianBatDau DATETIME,
    ThoiGianKetThuc DATETIME,
    MaLV CHAR(4) FOREIGN KEY REFERENCES LinhVuc(MaLV),
    MaKN CHAR(4) FOREIGN KEY REFERENCES KyNang(MaPH)
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
    DinhKem VARCHAR(MAX)
)
GO
CREATE TABLE HoaDon (
    MaHoaDon CHAR(12) CONSTRAINT PK_HoaDon_MaHoaDon PRIMARY KEY,
    NgayDuKien DATETIME,
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