CREATE DATABASE FlightManager

CREATE TABLE KhachHang
(
	MaKH		CHAR(8) PRIMARY KEY,
	GioiTinh	NVARCHAR(3),
	TenKH		NVARCHAR(30),
	NgaySinh	SMALLDATETIME,
	LoaiKH		NVARCHAR(20),
	SDT			CHAR(10),
	DiaChi		NVARCHAR(50),
	Email		NVARCHAR(20),
	CCCD		NVARCHAR(20)
)

CREATE TABLE NhanVien
(
	MaNV		CHAR(5) PRIMARY KEY,
	TenNV		NVARCHAR(30),
	SDT			CHAR(10),
	DiaChi		NVARCHAR(50),
	ChucVu		NVARCHAR(30),
	CCCD		NVARCHAR(20),
	
)

CREATE TABLE MayBay
(
	MaMB		CHAR(5) PRIMARY KEY,
	TenMB		NVARCHAR(20),
	Hang		NVARCHAR(20),
	KichThuoc	NVARCHAR(10),
	SoCho		INT
)

CREATE TABLE DuongBay
(
	MaDB		CHAR(3) PRIMARY KEY,
	ViTri		NVARCHAR(30),
	ChieuDai	float,
	ChieuRong	float,
	TinhTrang	NVARCHAR(20)
)

CREATE TABLE ChuyenBay
(
	MaCB		CHAR(8) PRIMARY KEY,
	MaMB		CHAR(5) FOREIGN KEY REFERENCES MayBay (MaMB),
	MaDB		CHAR(3) FOREIGN KEY REFERENCES DuongBay (MaDB),
	NoiKH		NVARCHAR(50),
	NoiDen		NVARCHAR(50),
	SL			INT,
	TinhTrang	NVARCHAR(20),
)

CREATE TABLE Ve
(
	MaVe		CHAR(8) PRIMARY KEY,
	MaCB		CHAR(8) FOREIGN KEY REFERENCES ChuyenBay (MaCB),
	TGKhoiHanh	SMALLDATETIME,
	TGDen		SMALLDATETIME,
	Gia			MONEY
)

CREATE TABLE HoaDon
(
	MaHD		CHAR(8) PRIMARY KEY,
	MaNV		CHAR(5) FOREIGN KEY REFERENCES NhanVien (MaNV),
	MaKH		CHAR(8) FOREIGN KEY REFERENCES KhachHang (MaKH),
	NgHD		SMALLDATETIME,
	TriGia		MONEY
)

CREATE TABLE CTHD
(
	MaHD		CHAR(8) FOREIGN KEY REFERENCES HoaDon (MaHD),
	MaVe		CHAR(8) FOREIGN KEY REFERENCES Ve (MaVe),
	CONSTRAINT PK_CTHD PRIMARY KEY (MaHD,MaVe)
)
/*INSERT TABLE KHACHHANG**/

INSERT INTO KhachHang VALUES('10002001',N'Nam',N'Lê Văn Kim','10/12/1988',N'Thường','0184267382',N'Kiên Giang','Kim7846@gmail.com','357869463726')
INSERT INTO KhachHang VALUES('10002002',N'Nữ',N'Đăng Ngọc Minh','2/5/1997',N'Thân Thiết','0632891649',N'Trà Vinh','Maie46@gmail.com','167281074926')
INSERT INTO KhachHang VALUES('10002003',N'Nam',N'Nguyễn Thành Đạt','1/1/2000','Vip','0974521565',N'Nam Định','NTD026@gmail.com','167282047926')
INSERT INTO KhachHang VALUES('10002004',N'Nam',N'Gia Tấn Kim','8/8/1999','Vip','0856463733',N'Hải Phòng','KTG6@gmail.com','167229501926')
INSERT INTO KhachHang VALUES('10002005',N'Nữ',N'Lữ Minh Anh','6/9/2001',N'Thường','0756372819',N'Đà Nẵng','Ahdks16@gmail.com','167281071205')
INSERT INTO KhachHang VALUES('10002006',N'Nam',N'Trần Quang Minh','4/5/1992',N'Thân Thiết','0956372819',N'Bắc Giang','Minh246@gmail.com','167281104832')
/*INSERT TABLE NHANVIEN*/


INSERT INTO NhanVien VALUES('10001',N'Hà Kim Ngọc','0849362118','TP HCM',N'Thu Ngân','674827564821')
INSERT INTO NhanVien VALUES('10002',N'Trịnh Đình Quang','0647735218','TP HCM',N'Thu Ngân','674864900982')
INSERT INTO NhanVien VALUES('10003',N'Đinh Gia Huy','0658893220','TP HCM',N'Thu Ngân','671520564821')
INSERT INTO NhanVien VALUES('10004',N'Huỳnh Nữ','0748392758','TP HCM',N'Thu Ngân','162842756482')
INSERT INTO NhanVien VALUES('10005',N'Nguyễn Duy Linh','0645537778','TP HCM',N'Thu Ngân','674827500643')
/*INSERT TABLE MayBay*/

INSERT INTO MayBay  VALUES('ABA01','Airbus A321','Airbus S.A.S',N'Lớn',305)
INSERT INTO MayBay  VALUES('ABA02','Airbus A321','Airbus S.A.S',N'Lớn',305)
INSERT INTO MayBay  VALUES('ABA03','Airbus A321','Airbus S.A.S',N'Lớn',305)
INSERT INTO MayBay  VALUES('BE001','Boeing 787','Boeing Airplane',N'Lớn',274)
INSERT INTO MayBay  VALUES('BE002','Boeing 787','Boeing Airplane',N'Lớn',274)
INSERT INTO MayBay  VALUES('BE003','Boeing 787','Boeing Airplane',N'Lớn',274)
INSERT INTO MayBay  VALUES('ATR01','ATR 72-500','Airbus S.A.S',N'Nhỏ',68)
INSERT INTO MayBay  VALUES('ATR02','ATR 72-500','Airbus S.A.S',N'Nhỏ',68)
INSERT INTO MayBay  VALUES('ATR03','ATR 72-500','Airbus S.A.S',N'Nhỏ',68)
INSERT INTO MayBay  VALUES('ATR04','ATR 72-500','Airbus S.A.S',N'Nhỏ',68)

--INSERT TABLE DuongBay

INSERT INTO DuongBay VALUES('TN1','07R/25L','12.468','3.8',N'Đang hoạt động')
INSERT INTO DuongBay VALUES('TN2','07L/25R','10','3.048',N'Đang hoạt động')
INSERT INTO DuongBay VALUES('NB1','11L/29R','10.497','3.2',N'Đang hoạt động')
INSERT INTO DuongBay VALUES('NB2','11R/29L','12.466','3.8',N'Đang hoạt động')

--INSERT TABLE CHUYENBAY

INSERT INTO ChuyenBay VALUES('11110001','ABA01','TN1',N'TP HCM',N'Hà Nội','290',N'Còn')
INSERT INTO ChuyenBay VALUES('11110002','BE002','TN2',N'TP HCM',N'Hà Nội','290',N'Còn')
INSERT INTO ChuyenBay VALUES('11110003','BE003','NB1',N'Hà Nội',N'TP HCM','200',N'Còn')
INSERT INTO ChuyenBay VALUES('11110004','BE001','NB2',N'Hà Nội',N'TP HCM','20',N'Hết')
INSERT INTO ChuyenBay VALUES('11110005','ATR03','NB2',N'Hà Nội',N'TP HCM','90',N'Còn')


--INSERT TABLE VE'
INSERT INTO Ve VALUES('VNAL0001','11110001','7/22/2021 6:00','7/23/2021 8:00','2000000')
INSERT INTO Ve VALUES('VNAL0002','11110001','7/23/2021 6:00','7/24/2021 8:00','2000000')
INSERT INTO Ve VALUES('VNAL0003','11110001','7/24/2021 6:00','7/25/2021 8:00','2000000')
INSERT INTO Ve VALUES('VNAL0004','11110003','8/1/2021 9:00','8/2/2021 11:00','2500000')
INSERT INTO Ve VALUES('VNAL0005','11110003','8/2/2021 9:00','8/3/2021 11:00','2500000')
INSERT INTO Ve VALUES('VNAL0006','11110005','7/10/2021 5:00','7/11/2021 7:00','700000')
INSERT INTO Ve VALUES('VNAL0007','11110005','7/11/2021 5:00','7/12/2021 7:00','700000')
--INSERT TABLE QLVe
--INSERT INTO QLVe VALUES('11110001','1','290',N'Còn')
--INSERT INTO QLVe VALUES('11110002','1','250',N'Còn')
--INSERT INTO QLVe VALUES('11110003','2','255',N'Còn')
--INSERT INTO QLVe VALUES('11110004','2','255',N'Còn')
--INSERT INTO QLVe VALUES('11110005','2','60',N'Còn')
--INSERT INTO QLVe VALUES('11110005','1','60',N'Hết')
--INSERT TABLE HoaDon
INSERT INTO HoaDon VALUES('HD001001','10001','10002001','6/6/2021','4400000')
INSERT INTO HoaDon VALUES('HD001002','10001','10002002','6/7/2021','6000000')
INSERT INTO HoaDon VALUES('HD001003','10002','10002003','6/5/2021','8000000')
INSERT INTO HoaDon VALUES('HD001004','10002','10002004','6/5/2021','3000000')
INSERT INTO HoaDon VALUES('HD001005','10002','10002005','6/5/2021','700000')
INSERT INTO HoaDon VALUES('HD001006','10002','10002006','6/5/2021','700000')
--INSERT TABLE CTHD
INSERT INTO CTHD VALUES('HD001001','VNAL0005')
INSERT INTO CTHD VALUES('HD001001','VNAL0006')
INSERT INTO CTHD VALUES('HD001001','VNAL0007')
INSERT INTO CTHD VALUES('HD001002','VNAL0001')
INSERT INTO CTHD VALUES('HD001003','VNAL0002')
INSERT INTO CTHD VALUES('HD001004','VNAL0005')
INSERT INTO CTHD VALUES('HD001005','VNAL0006')
INSERT INTO CTHD VALUES('HD001006','VNAL0007')

--INSERT Ngay hoa don phai lon hon ngay sinh HOADON
CREATE TRIGGER NgHD_NgaySinh_on_HoaDon_FOR_INSERT
ON HoaDon
FOR INSERT
AS
	DECLARE @NgHD SMALLDATETIME,@NgaySinh SMALLDATETIME
	SELECT @NgHD=NgHD FROM inserted
	SELECT @NgaySinh=NgaySinh FROM KhachHang,INSERTED WHERE KhachHang.MaKH=inserted.MaKH
	IF(@NgaySinh>@NgHD)
	BEGIN
		ROLLBACK TRAN
		RAISERROR ('Ngay hoa don phai lon hon ngay sinh',16,1)
		RETURN
	END
INSERT INTO HoaDon VALUES('HD001007','10001','10002001','6/6/1921','4400000')


--UPDATE Ngay hoa don phai lon hon ngay sinh HOADON
CREATE TRIGGER NgHD_NgaySinh_on_HoaDon_FOR_UPDATE
ON HoaDon
FOR UPDATE
AS
	DECLARE @NgHD SMALLDATETIME,@NgaySinh SMALLDATETIME
	SELECT @NgHD=NgHD FROM inserted
	SELECT @NgaySinh=NgaySinh FROM KhachHang,INSERTED WHERE KhachHang.MaKH=inserted.MaKH
	IF(@NgaySinh>@NgHD)
	BEGIN
		ROLLBACK TRAN
		RAISERROR ('Ngay hoa don phai lon hon ngay sinh',16,1)
		RETURN
	END


--UPDATE Ngay hoa don phai lon hon ngay sinH KHACHHANG
CREATE TRIGGER NgHD_NgaySinh_on_KhachHang_FOR_UPDATE
ON KhachHang
FOR UPDATE
AS
	DECLARE @NgHD SMALLDATETIME,@NgaySinh SMALLDATETIME
	SELECT @NgHD=min(NgHD) FROM inserted,HoaDon WHERE HoaDon.MaKH=inserted.MaKH
	SELECT @NgaySinh=NgaySinh FROM INSERTED 
	IF(@NgaySinh>@NgHD)
	BEGIN
		ROLLBACK TRAN
		RAISERROR ('Ngay hoa don phai lon hon ngay sinh',16,1)
		RETURN
	END


--INSERT HoaDon Tinh tri gia HD
CREATE TRIGGER TriGia_HD_INSERT
ON HoaDon
FOR INSERT
AS
	DECLARE @MaHD CHAR(8)
	SELECT @MaHD=MaHD FROM INSERTED
	UPDATE HoaDon SET TriGia=0 WHERE MaHD=@MaHD
	PRINT('DA CAP NHAT TRI GIA HD')

--INSERT CTHD Tinh tri gia HD
CREATE TRIGGER TriGia_HD_INSERTCTHD
ON CTHD
FOR INSERT
AS
	DECLARE @MaHD CHAR(8), @TRIGIA MONEY,@MAVE CHAR(8)
	SELECT @MaHD=MaHD FROM INSERTED
	SELECT @TRIGIA= Gia FROM INSERTED,Ve WHERE inserted.MaVe=Ve.MaVe
	SELECT @MAVE=MaVe FROM INSERTED
	IF((SELECT COUNT(*) FROM CTHD WHERE @MAVE=CTHD.MaVe)>1)
	BEGIN
		ROLLBACK TRAN
		RAISERROR('Ve da duoc mua va co tren hoa don khac',16,1)
		RETURN
	END
	UPDATE HoaDon SET TriGia+=@TRIGIA WHERE MaHD=@MaHD
	PRINT('DA CAP NHAT TRI GIA HD')

--INSERT CTHD INSTINCT VE
CREATE TRIGGER INSTINCTVE_INSERTCTHD
ON CTHD
FOR INSERT
AS
	

SELECT DISTINCT HoaDon.MaHD,Ve.MaVe,Ve.Gia
FROM HoaDon,CTHD,ChuyenBay,Ve
WHERE HoaDon.MaHD=CTHD.MaHD
AND CTHD.MaVe=Ve.MaVe
