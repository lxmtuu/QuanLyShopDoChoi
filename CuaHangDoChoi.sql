CREATE DATABASE CuaHangDoChoi
GO

USE CuaHangDoChoi
GO

---các bảng
--bảng tài khoản
CREATE TABLE TaiKhoan
(
	tenDangNhap VARCHAR(20) PRIMARY KEY,
	matKhau VARCHAR(20) NOT NULL,
	loaiTaiKhoan INT NOT NULL --1: tài khoản quản lý, 0: tài khoản nhân viên
)
GO

--bảng nhân viên 
CREATE TABLE NhanVien
(
	maNhanVien INT IDENTITY(10,1) PRIMARY KEY,
	hoTen NVARCHAR(50) NOT NULL,
	CMND INT NOT NULL,
	ngaySinh DATETIME,
	gioiTinh VARCHAR(10),
	tenDangNhap VARCHAR(20),
	trangThai BIT,
	FOREIGN KEY (tenDangNhap) REFERENCES dbo.TaiKhoan(tenDangNhap)
)
GO

--bảng khách hàng
CREATE TABLE KhachHang
(
	maKhachHang INT IDENTITY(100,2) PRIMARY KEY ,
	hoTen NVARCHAR(50) NOT NULL,
	CMND INT NOT NULL, 
	soDienThoai INT NOT NULL,
	ngaySinh DATETIME,
	gioiTinh VARCHAR(10),
	trangThai BIT
)
GO

--bảng đồ chơi
CREATE TABLE SanPham
(
	maSanPham INT IDENTITY(1000,1) PRIMARY KEY,
	tenSanPham NVARCHAR(20) NOT NULL,
	xuatXu NVARCHAR(20),
	ngayNhap DATETIME,
	giaBan FLOAT,
	soLuong INT
)
GO


CREATE TABLE HoaDon   
(
	maHoaDon INT PRIMARY KEY,
	maKhachHang INT,
	maNhanVien INT,
	ngayTao DATETIME NOT NULL,
	thanhTien FLOAT,
	FOREIGN KEY (maKhachHang) REFERENCES dbo.KhachHang (maKhachHang),
	FOREIGN KEY (maNhanVien) REFERENCES dbo.NhanVien (maNhanVien)
)
GO

CREATE TABLE ChiTietHoaDon
(
	maHoaDon INT,
	maSanPham INT,
	donGia FLOAT,
	soLuong INT,
	PRIMARY KEY (maHoaDon, maSanPham),
	FOREIGN KEY (maHoaDon) REFERENCES dbo.HoaDon (maHoaDon),
	FOREIGN KEY (maSanPham) REFERENCES dbo.SanPham (maSanPham)
)
GO




--Thêm dữ liệu vào bảng TaiKhoan --

INSERT INTO TaiKhoan( tenDangNhap, matKhau, loaiTaiKhoan) VALUES ('admin', 1, 1),
																 ('quochuy',1,0),
																 ('tienhuy',1,1)
INSERT INTO TaiKhoan( tenDangNhap, matKhau, loaiTaiKhoan) VALUES ('hoangyen',1,0),
																 ('thanhtu',1,0)
INSERT INTO TaiKhoan( tenDangNhap, matKhau, loaiTaiKhoan) VALUES ('thanhtung',1,0)
--Thêm dữ liệu vào bảng NhanVien --
INSERT INTO NhanVien(hoTen,CMND,ngaySinh,gioiTinh,tenDangNhap, trangThai) VALUES (N'Lê Xuân Minh Tú', 321764933,'24/03/2004','Nam', 'admin', 1)
INSERT INTO NhanVien (hoTen,CMND,ngaySinh,gioiTinh,tenDangNhap, trangThai) VALUES ( N'Nghiêm Hà Quốc Huy', 845156151,'10/06/2004','Nam', 'quochuy',1)
INSERT INTO NhanVien (hoTen,CMND,ngaySinh,gioiTinh,tenDangNhap, trangThai) VALUES( N'Trương Tiến Huy', 465151551,'10/22/1999','Nam', 'tienhuy',1)
INSERT INTO NhanVien (hoTen,CMND,ngaySinh,gioiTinh,tenDangNhap, trangThai) VALUES( N'Trịnh Hoàng Yến', 846813565,'11/12/1999','Nu', 'hoangyen',1)
INSERT INTO NhanVien (hoTen,CMND,ngaySinh,gioiTinh,tenDangNhap, trangThai) VALUES( N'Nguyễn Thanh Tú', 123456789,'09/29/1999','Nam', 'thanhtu',1)
INSERT INTO NhanVien (hoTen,CMND,ngaySinh,gioiTinh,tenDangNhap, trangThai) VALUES( N'Nguyễn Thanh Tùng', 415481561,'09/29/1999','Nam', 'thanhtung',1)
--Thêm dữ liệu vào bảng SanPham --
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Xe đẩy', 'China', '10/11/2018',200000,50)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Búp bê', 'China', '01/11/2018',10000,20)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong) VALUES ( N'Nón lá', 'Vietnam', '10/2/2018',50000,100)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Xe điều khiển', 'Campuchia', '06/11/2018',200000,50)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Máy bay', 'Vietnam', '10/2/2018',1000000,10)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Kiếm Nhật', 'China', '10/8/2018',300000,50)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Xẻng nhưạ', 'China', '10/3/2018',150000,50)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Đồ chơi bác sĩ', 'Japan', '10/12/2018',200000,50)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Xe đạp', 'Japan', '7/8/2018',3000000,10)
INSERT INTO SanPham (tenSanPham,xuatXu, ngayNhap,giaBan, soLuong)VALUES ( N'Thuyền', 'Korea', '6/11/2018',1500000,30)

--Thêm dữ liệu vào bảng KhachHang --
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai)VALUES ( N'Dương Trần Tử Minh', 123456789, 0321665499, '1/1/1999','Nam',1)
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai) VALUES ( N'Đỗ Nguyên Thanh Tùng', 321764933, 0321665499, '1/11/1999','Nu',1)
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai) VALUES ( N'Nguyễn Thị Triệu', 198765432, 0321665499, '9/1/1999','Nu',1)
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai)VALUES ( N'Chị Dậu', 326152565, 0321665499, '8/1/1999','Nu',1)
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai)VALUES ( N'Sơn Tùng MTP', 159753468, 0321665499, '3/2/1999','Nam',1)
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai)VALUES ( N'Nguyễn Quốc Huy', 753456789 , 0321665499, '12/8/1999','Nam',1)
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai)VALUES ( N'Nguyễn Trấn Thành', 741852963, 0321665499, '11/6/1999','Nam',1)
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai)VALUES ( N'Noo Phước Thịnh', 451151555, 0321665499, '3/9/1999','Nu',1)
INSERT INTO KhachHang (hoTen,CMND, soDienThoai, ngaySinh, gioiTinh,trangThai)VALUES ( N'Mỹ Tâm', 118877664, 0321665499, '11/4/1999','Nu',1)


go

CREATE PROC suaKH
(
	@makh int, @hoTen NVARCHAR(50), @CMND INT, @soDienThoai INT, @ngaySinh DATETIME, @gioiTinh VARCHAR(10)
)
as 
begin
	UPDATE dbo.KhachHang SET hoTen = @hoTen, CMND= @CMND , soDienThoai = @soDienThoai , ngaySinh = @ngaySinh, gioiTinh = @gioiTinh WHERE maKhachHang = @makh
end
go




