--QUAN LY BAN HANG
--CREATE QuanLyBanHang
USE QuanLyBanHang
--I - Ngôn ngữ định nghĩa dữ liệu 
--1. Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của hệ.
--CREATE TABLE KHACHHANG
--(
  --MAKH char(4) NOT NULL,
  --HOTEN varchar(40),
  --DCHI varchar(50),
  --SODT varchar(20),
  --NGSINH smalldatetime,
  --NGDK smalldatetime,
  --DOANHSO money
 --)

 --CREATE TABLE NHANVIEN
--(
 --MANV char(4) NOT NULL,
 --HOTEN varchar(40),
 --SODT varchar(20),
 --NGVL smalldatetime
 --)

 --CREATE TABLE SANPHAM
 --(
 --MASP char(4) NOT NULL,
 --TENSP varchar(40),
 --DVT varchar(20),
 --NUOCSX varchar(40),
 --GIA money
 --)

 --CREATE TABLE HOADON
 --(
 --SOHD int NOT NULL,
 --NGHD smalldatetime,
 --MAKH char(4),
 --MANV char(4),
 --TRIGIA money
 --)

 --CREATE TABLE CTHD 
 --(
 --SOHD int NOT NULL,
 --MASP char(4) NOT NULL,
 --SL int
 --)
-- Tạo Khóa Chính --
--ALTER TABLE KHACHHANG ADD
--CONSTRAINT char PRIMARY KEY(MAKH)

--ALTER TABLE NHANVIEN ADD
--CONSTRAINT char PRIMARY KEY (MANV)

--ALTER TABLE SANPHAM ADD
--CONSTRAINT PK_SP PRIMARY KEY (MASP)

--ALTER TABLE HOADON ADD
--CONSTRAINT int PRIMARY KEY (SOHD)

--ALTER TABLE CTHD ADD PRIMARY KEY (SOHD, MASP) 
 
 --Tạo khóa ngoại
 --ALTER TABLE HOADON ADD 
 --CONSTRAINT FK_HD_KH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
 --CONSTRAINT FK_HD_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
 --ALTER TABLE CTHD ADD 
 --CONSTRAINT FK_CT_SP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
 --CONSTRAINT FK_CT_HD FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD)
 
--2) Thêm thuộc tính GHICHU vào kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM 
ADD GHICHU varchar(20)
--3) Thêm thuộc tính LOAIKH có kiểu dữ liệu tinyint vào cho quan hệ KHACHHANG
ALTER TABLE KHACHHANG
ADD LOAIKH tinyint
--4) Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM 
ALTER COLUMN GHICHU varchar(100)
--5 Xóa thuộc tính GHICHU trong quan hệ SANPHAM
ALTER TABLE SANPHAM
DROP COLUMN GHICHU
--6 Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG nó có thể lưu các giá trị là "Vang lai", "Thuong xuyen", "Vip",...
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH varchar(50)
--7 Đơn vị tính của sản phẩm chỉ có thể là ("cay", "hop", "cai", "quyen", "chuc")
ALTER TABLE SANPHAM ADD CONSTRAINT CK_DVT CHECK( DVT IN('CAY', 'HOP', 'CAI', 'QUYEN', 'CHUC'));
--8 Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM 
ADD CONSTRAINT CK_GIA CHECK (GIA>=500)
--9 Mỗi lần mua hàng khách hàng mua ít nhất 1 sản phẩm
ALTER TABLE CTHD
ADD CONSTRAINT CK_SL CHECK (SL>=1)
--10 Ngày đăng ký là khách hàng thường xuyên phải lớn hơn ngày sinh của người đó. 
ALTER TABLE KHACHHANG 
ADD CONSTRAINT CK_NGAYDK CHECK (NGDK > NGSINH)



---------INSERT INTO tên_bảng VALUES (giá_trị_1, giá_trị_2,…, giá_trị_n) ----------
---------INSERT INTO tên_bảng (cột1,…,cộtn) VALUES (giá_trị_1,…., giá_trị_n)-------
-- Bài 1: Nhập dữ liệu cho QuanLyBanHang 
INSERT INTO NHANVIEN VALUES ('NV01', 'Nguyen Nhu Nhut', '0927345678', '2006-04-13')
INSERT INTO NHANVIEN VALUES ('NV02', 'Le Thi Phi Yen', '0987567390', '2006-4-21')
INSERT INTO NHANVIEN VALUES ('NV03', 'Nguyen Van B', '0997047382', '2006-4-27')
INSERT INTO NHANVIEN VALUES ('NV04', 'Ngo Thanh Tuan', '0913758498', '2006-6-24')
INSERT INTO NHANVIEN VALUES ('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '2006-7-20')

INSERT INTO KHACHHANG VALUES ('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TPHCM', '08823451', '1960-10-22','2006-07-22', '13,060,000', NULL)
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-4-3', '280,000', '2006-07-30')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980-6-12', '3,860,000', '2006-08-05')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965-3-9', '250,000', '2006-10-02')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '1950-3-10', '21,000', '2006-10-28')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1981-12-31', '915,000', '2006-11-24')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971-4-6', '12,500', '2006-12-1')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971-1-10', '365,000', '2006-12-13')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979-9-3', '70,000', '2007-01-14')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH10', 'Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM', '0876890', '1983-5-2', '67,500', '2007-01-16')
select* from KHACHHANG

INSERT INTO SANPHAM VALUES ('BC01', 'But chi', 'cay', 'Singapore', '3000')
INSERT INTO SANPHAM VALUES ('BC02', 'But chi', 'cay', 'Singapore', '5,000')
INSERT INTO SANPHAM VALUES ('BC03', 'But chi', 'cay', 'Viet Nam', '3,500')
INSERT INTO SANPHAM VALUES ('BC04', 'But chi', 'hop', 'Viet Nam', '30,000')
INSERT INTO SANPHAM VALUES ('BB01', 'But bi', 'cay', 'Viet Nam', '5,000')
INSERT INTO SANPHAM VALUES ('BB02', 'But bi', 'cay', 'Trung Quoc', '7,000')
INSERT INTO SANPHAM VALUES ('BB03', 'But bi', 'hop' , 'Thai Lan', '100,000')
INSERT INTO SANPHAM VALUES ('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', '2,500')
INSERT INTO SANPHAM VALUES ('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', '4,500')
INSERT INTO SANPHAM VALUES ('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', '3,000')
INSERT INTO SANPHAM VALUES ('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', '5,500')
INSERT INTO SANPHAM VALUES ('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', '23,000')
INSERT INTO SANPHAM VALUES ('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', '53,000')
INSERT INTO SANPHAM VALUES ('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', '34,000')
INSERT INTO SANPHAM VALUES ('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', '40,000')
INSERT INTO SANPHAM VALUES ('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', '55,000')
INSERT INTO SANPHAM VALUES ('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', '51,000')
INSERT INTO SANPHAM VALUES ('ST04', 'So tay', 'quyen', 'Thai Lan', '55,000')
INSERT INTO SANPHAM VALUES ('ST05', 'So tay mong', 'quyen', 'Thai Lan', '20,000')
INSERT INTO SANPHAM VALUES ('ST06', 'Phan viet bang', 'hop', 'Viet Nam', '5,000')
INSERT INTO SANPHAM VALUES ('ST07', 'Phan khong bui', 'hop', 'Viet Nam', '7,000')
INSERT INTO SANPHAM VALUES ('ST08', 'Bong bang', 'cai', 'Viet Nam', '1,000')
INSERT INTO SANPHAM VALUES ('ST09', 'But long', 'cay', 'Viet Nam', '5,000')
INSERT INTO SANPHAM VALUES ('ST10', 'But long', 'cay', 'Trung Quoc', '7,700')
select* from SANPHAM

INSERT INTO HOADON VALUES ('1001', '2006-07-23', 'KH01', 'NV01', '320,000')
INSERT INTO HOADON VALUES ('1002', '2006-08-12', 'KH01', 'NV02', '840,000')
INSERT INTO HOADON VALUES ('1003', '2006-08-23', 'KH02', 'NV01', '100,000')
INSERT INTO HOADON VALUES ('1004', '2006-09-01', 'KH02', 'NV01', '180,000')
INSERT INTO HOADON VALUES ('1005', '2006-10-20', 'KH01', 'NV02', '3,800,000')
INSERT INTO HOADON VALUES ('1006', '2006-10-16', 'KH01', 'NV03', '2,430,000')
INSERT INTO HOADON VALUES ('1007', '2006-10-28', 'KH03', 'NV03', '510,000')
INSERT INTO HOADON VALUES ('1008', '2006-10-28', 'KH01', 'NV03', '440,000')
INSERT INTO HOADON VALUES ('1009', '2006-10-28', 'KH03', 'NV04', '200,000')
INSERT INTO HOADON VALUES ('1010', '2006-11-01', 'KH01', 'NV01', '5,200,000')
INSERT INTO HOADON VALUES ('1011', '2006-11-04', 'KH04', 'NV03', '250,000')
INSERT INTO HOADON VALUES ('1012', '2006-11-30', 'KH05', 'NV03', '21,000')
INSERT INTO HOADON VALUES ('1013', '2006-12-12', 'KH06', 'NV01', '5,000') 
INSERT INTO HOADON VALUES ('1014', '2006-12-31', 'KH03', 'NV02', '3,150,000')
INSERT INTO HOADON VALUES ('1015', '2007-01-01', 'KH06', 'NV01', '910,000')
INSERT INTO HOADON VALUES ('1016', '2007-01-01', 'KH07', 'NV02', '12,500')
INSERT INTO HOADON VALUES ('1017', '2007-01-02', 'KH08', 'NV03', '35,000')
INSERT INTO HOADON VALUES ('1018', '2007-01-13', 'KH08', 'NV03', '330,000')
INSERT INTO HOADON VALUES ('1019', '2007-01-13', 'KH01', 'NV03', '30,000')
INSERT INTO HOADON VALUES ('1020', '2007-01-13', 'KH09', 'NV04', '70,000')
INSERT INTO HOADON VALUES ('1021', '2007-01-16', 'KH10', 'NV03', '67,500')
INSERT INTO HOADON VALUES ('1022', '2007-01-16', NULL, 'NV03', '7,000')
INSERT INTO HOADON VALUES ('1023', '2007-01-17', NULL, 'NV01', '330,000')
select* from HOADON

INSERT INTO CTHD VALUES ('1001', 'TV02', '10')
INSERT INTO CTHD VALUES ('1001', 'ST01', '5')
INSERT INTO CTHD VALUES ('1001', 'BC01', '5')
INSERT INTO CTHD VALUES ('1001', 'BC02', '10')
INSERT INTO CTHD VALUES ('1001', 'ST08', '10')
INSERT INTO CTHD VALUES ('1002', 'BC04', '20') 
INSERT INTO CTHD VALUES ('1002', 'BB01', '20')
INSERT INTO CTHD VALUES ('1002', 'BB02', '20')
INSERT INTO CTHD VALUES ('1003', 'BB03', '10')
INSERT INTO CTHD VALUES ('1004', 'TV01', '20')
INSERT INTO CTHD VALUES ('1004', 'TV02', '10')
INSERT INTO CTHD VALUES ('1004', 'TV03', '10')
INSERT INTO CTHD VALUES ('1004', 'TV04', '10')
INSERT INTO CTHD VALUES ('1005', 'TV05', '50')
INSERT INTO CTHD VALUES ('1005', 'TV06', '50')
INSERT INTO CTHD VALUES ('1006', 'TV07', '20')
INSERT INTO CTHD VALUES ('1006', 'ST01', '30')
INSERT INTO CTHD VALUES ('1006', 'ST02', '10')
INSERT INTO CTHD VALUES ('1007', 'ST03', '10')
INSERT INTO CTHD VALUES ('1008', 'ST04', '8')
INSERT INTO CTHD VALUES ('1009', 'ST05', '10')
INSERT INTO CTHD VALUES ('1010', 'TV07', '50')
INSERT INTO CTHD VALUES ('1010', 'ST07', '50')
INSERT INTO CTHD VALUES ('1010', 'ST08', '100')
INSERT INTO CTHD VALUES ('1010', 'ST04', '50')
INSERT INTO CTHD VALUES ('1010', 'TV03', '100')
INSERT INTO CTHD VALUES ('1011', 'ST06', '50')
INSERT INTO CTHD VALUES ('1012', 'ST07', '3')
INSERT INTO CTHD VALUES ('1013', 'ST08', '5')
INSERT INTO CTHD VALUES ('1014', 'BC02', '80')
INSERT INTO CTHD VALUES ('1014', 'BB02', '100')
INSERT INTO CTHD VALUES ('1014', 'BC04', '60')
INSERT INTO CTHD VALUES ('1014', 'BB01', '50')
INSERT INTO CTHD VALUES ('1015', 'BB02', '30')
INSERT INTO CTHD VALUES ('1015', 'BB03', '7')
INSERT INTO CTHD VALUES ('1016', 'TV01', '5')
INSERT INTO CTHD VALUES ('1017', 'TV02', '1')
INSERT INTO CTHD VALUES ('1017', 'TV03', '1')
INSERT INTO CTHD VALUES ('1017', 'TV04', '5')
INSERT INTO CTHD VALUES ('1018', 'ST04', '6')
INSERT INTO CTHD VALUES ('1019', 'ST05', '1')
INSERT INTO CTHD VALUES ('1019', 'ST06', '2')
INSERT INTO CTHD VALUES ('1020', 'ST07', '10')
INSERT INTO CTHD VALUES ('1021', 'ST08', '5')
INSERT INTO CTHD VALUES ('1021', 'ST01', '7')
INSERT INTO CTHD VALUES ('1021', 'ST02', '10')
INSERT INTO CTHD VALUES ('1022', 'ST07', '1')
INSERT INTO CTHD VALUES ('1023', 'ST04', '6')
select* from CTHD

/* 
	2 a) Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của SANPHAM
   	  b) Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu KHACHHANG
*/
--a) Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của SANPHAM
--CREATE TABLE SANPHAM1
--( 
--MASP char(4), 
--TENSP varchar(40),
--DVT varchar(20),
--NUOCSX varchar(40),
--GIA money
--CONSTRAINT PK_SANPHAM1 PRIMARY KEY (MASP)
--)
INSERT INTO SANPHAM1
SELECT* FROM SANPHAM
--b) Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu KHACHHANG
--CREATE TABLE KHACHHANG1
--(
--MAKH char(4),
--HOTEN varchar(40),
--DCHI varchar(50),
--SODT varchar(20),
--NGSINH smalldatetime,
--NGDK smalldatetime,
--DOANHSO money,
--LOAIKH tinyint
--CONSTRAINT PK_KHACHHANG1 PRIMARY KEY (MAKH)
--)

INSERT INTO KHACHHANG1
SELECT* FROM KHACHHANG

/*
	3) Cập nhật giá tăng 5% đối với những sản phẩm do Thái Lan sản xuất quan hệ SANPHAM1
*/
UPDATE SANPHAM1
SET GIA = GIA + GIA*0.05 
WHERE NUOCSX = 'Thai Lan'

/*
	4) Cập nhật giảm 5% đối với những sản phẩm do TRUNGQUOC sản xuất có giá từ 10k trở xuống cho quan hệ SANPHAM1 
*/ 
UPDATE SANPHAM1
SET GIA = GIA - GIA*0.05
WHERE NUOCSX = 'Trung Quoc' AND (GIA<=10000)

/* 
	5) Cập nhật loại KH là "Vip" đối với những khách hàng 
			+	đăng ký thành viên trước ngày 1/1/2007 và có doanh số từ 10tr trở lên 
			+	hoặc khách hàng đăng ký thành viên sau ngày 1/1/2007 có doanh số từ 2tr trở lên
			Cho QH KHACHHANG1
*/
ALTER TABLE KHACHHANG1 
ALTER COLUMN LOAIKH varchar(50)

UPDATE KHACHHANG1
SET LOAIKH = 'Vip'
WHERE ((NGDK<='2007-1-1') AND (DOANHSO>='10,000,000')) OR ((NGDK>='2007-1-1') AND (DOANHSO>='2,000,000'))
SELECT *FROM KHACHHANG1

---------------------------------------PHẦN 3 TỪ 1->11-----------------------------------------------------
/*
	1. In ra danh sách các sản phẩm (MASP, TENSP) do Trung Quoc san xuat.
*/
SELECT  SANPHAM.MASP, SANPHAM.TENSP 
FROM SANPHAM
WHERE NUOCSX =  'Trung Quoc'

/*
	2. In ra danh sách các sản phẩm (MASP, TENSP) co đơn vị tính là 'cay', 'quyen'
*/
SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM
WHERE DVT='cay' OR DVT ='quyen'

/*
	3. In ra các sản phẩm (MASP, TENSP) là mã sản phẩm bắt đầu là 'B' và kết thúc là '01'
*/
SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM
WHERE MASP LIKE 'B_01'

/*
	4. In ra các sản phẩm (MASP, TENSP) do 'Trung Quoc' sản xuất có giá từ 30k đến 40k 
*/
SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM
WHERE (NUOCSX = 'Trung Quoc') AND (GIA BETWEEN 30000 AND 40000)

/*
	5. In ra các sản phẩm (MASP, TENSP) do Trung Quoc hoac Thai Lan san xuat
	có giá từ 30k đến 40k 
*/

SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM
WHERE (NUOCSX='Thai Lan' OR NUOCSX='Trung Quoc') AND (GIA BETWEEN 30000 AND 40000)

/*
	6. In ra các số hóa đơn, trị giá hóa đơn bán tra trong ngày 1/1/2007 và ngày 2/1/2007
*/

SELECT HOADON.SOHD, HOADON.TRIGIA
FROM HOADON
WHERE (NGHD='2007-1-1'OR NGHD='2007-1-2')

/*
	7. In ra các số hóa đơn, trị giá hóa đơn trong thán 1-2007, sắp xếp theo ngày (tăng dần)
	và trị giá của hóa đơn (giảm dần)
*/

SELECT SOHD, TRIGIA
FROM HOADON
WHERE (NGHD BETWEEN ('2007-1-1') AND ('2007-1-31'))
ORDER BY NGHD ASC,TRIGIA DESC

/*
	8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007 
*/
SELECT KHACHHANG.MAKH, HOTEN
FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH = HOADON.MAKH AND (NGHD='2007-1-1')

/*
	9. In ra số hóa đơn, trị giá hóa đơn do nhân viên có tên 'Nguyen Van B'
	lập trong ngày '2006-10-28'
*/
SELECT SOHD, TRIGIA
FROM HOADON, NHANVIEN
WHERE (HOADON.MANV=NHANVIEN.MANV) AND (HOTEN ='Nguyen Van B' AND NGHD ='2006-10-28')

/*
	10. In ra các sản phẩm (MASP, TENSP) được khách hàng có tên 'Nguyen Van A'
	mua trong tháng 10/2006
*/

SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM, CTHD, HOADON, KHACHHANG
WHERE (SANPHAM.MASP=CTHD.MASP) AND (HOADON.SOHD = CTHD.SOHD) AND (HOADON.MAKH=KHACHHANG.MAKH) AND (HOTEN = 'Nguyen Van A')  AND (NGHD BETWEEN '2006-10-1' AND '2006-10-31')

SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
WHERE EXISTS(SELECT *
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006 AND MAKH IN(SELECT H.MAKH
FROM HOADON H INNER JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE HOTEN = 'NGUYEN VAN A') AND S.MASP = C.MASP)
/* 
	11. Tìm số hóa đơn đã mua sản phẩm có mã số 'BB01' hoặc 'BB02'
*/
SELECT SOHD
FROM CTHD
WHERE MASP='BB01' OR MASP = 'BB02'

-------------------------------------------------------------------------------LAB 3 ---------------------------------------------------------------------------------------

---------------------------------------------------------------------------PHẦN 3 từ 12-13 ---------------------------------------------------------------------------------
/*
	12. Tìm các số hóa đơn đã mua sản phẩm có mã số 'BB01' hoặc 'BB02' mỗi sản phẩm với số lượng từ 10 -> 20

*/
SELECT DISTINCT SOHD
FROM CTHD
WHERE (MASP='BB01' OR MASP='BB02') AND (SL BETWEEN 10 AND 20)

/*
	13. Tìm các số hóa đơn đã mua sản phẩm có mã sô 'BB01' và 'BB02' mỗi sản phẩm với số lượng từ 10 -> 20
*/

SELECT SOHD
FROM CTHD
WHERE (MASP='BB01') AND (SL BETWEEN 10 AND 20)
INTERSECT
SELECT SOHD
FROM CTHD
WHERE (MASP='BB02') AND (SL BETWEEN 10 AND 20)

SELECT SOHD
FROM CTHD A
WHERE A.MASP = 'BB01'
AND SL BETWEEN 10 AND 20
AND EXISTS(SELECT *
FROM CTHD B
WHERE B.MASP = 'BB02'
AND SL BETWEEN 10 AND 20
AND A.SOHD = B.SOHD)
---------------------------------------------------------------------------PHẦN 3 từ 14-19 ---------------------------------------------------------------------------------
/*
	14. In ra danh sách các sản phẩm (MASP, TENSP) do 'Trung Quoc' sản xuất hoặc các sản phẩm được bán ra trong ngày 2007-1-1
*/
SELECT DISTINCT SANPHAM.TENSP, SANPHAM.MASP
FROM SANPHAM, CTHD, HOADON
WHERE(SANPHAM.MASP=CTHD.MASP) AND (CTHD.SOHD=HOADON.SOHD) AND (NUOCSX='Trung Quoc') OR (NGHD='2007-1-1')


SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
WHERE NUOCSX = 'TRUNG QUOC'
OR C.SOHD IN(SELECT DISTINCT C2.SOHD
FROM CTHD C2 INNER JOIN HOADON H
ON C2.SOHD = H.SOHD
WHERE NGHD ='1/1/2007')
/*
	15. In ra danh sách sản phẩm (MASP, TENSP) không bán được
*/
SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM  
WHERE NOT EXISTS (SELECT* FROM HOADON, CTHD WHERE (HOADON.SOHD=CTHD.SOHD) AND (CTHD.MASP=SANPHAM.MASP))

/*
	16. In ra danh sách các sản phẩm (MASP, TENSP) không bán được trong năm 2006
*/
SELECT S.MASP, S.TENSP
FROM SANPHAM S
WHERE NOT EXISTS (SELECT *FROM CTHD C, HOADON H WHERE (C.SOHD=H.SOHD) AND (C.MASP=S.MASP) AND YEAR(H.NGHD)=2006)

/*
	17. In ra danh sách các sản phẩm (MASP, TENSP) do "Trung Quốc" sản xuất, không bán được trong năm 2006 
*/
SELECT*
FROM SANPHAM SP2
WHERE SP2.NUOCSX='Trung Quoc' AND SP2.MASP IN (SELECT SP.MASP
FROM SANPHAM SP, CTHD CT, HOADON HD
WHERE (SP.MASP=CT.MASP) AND (HD.SOHD=CT.SOHD) AND (YEAR(NGHD)=2006) AND SP.NUOCSX ='Trung Quoc')
--BB02

/*
	18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore Sản Xuất
*/

SELECT H.SOHD
FROM HOADON H
WHERE NOT EXISTS (SELECT* FROM SANPHAM S WHERE S.NUOCSX='Singapore' AND NOT EXISTS(SELECT C.MASP FROM CTHD C WHERE C.SOHD=H.SOHD AND S.MASP=C.MASP))

/* 
	19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất 
*/
SELECT SOHD
FROM HOADON H
WHERE  (YEAR(NGHD)=2006) AND NOT EXISTS(SELECT *FROM SANPHAM S WHERE (S.NUOCSX ='Singapore')  --Sản phẩm không được mua và sản phẩm của nước Singapore
AND NOT EXISTS (SELECT* FROM CTHD C WHERE C.MASP=S.MASP AND C.SOHD=H.SOHD)) --số sản phẩm được hóa đơn mua

-------------------------------------------------------------------------------LAB 4 ---------------------------------------------------------------------------------------

---------------------------------------------------------------------------PHẦN 3 từ 20-30 ---------------------------------------------------------------------------------
/*
	20. Có bao nhiêu hóa đơn không phải là thành viên đăng ký khách hàng mua?
*/
SELECT count(HD.SOHD) not_TVien
FROM HOADON HD
WHERE NOT EXISTS(SELECT * FROM KHACHHANG KH WHERE KH.MAKH=HD.MAKH)

/*
	21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006 
*/

SELECT COUNT(DISTINCT SP.MASP) SP2006
FROM SANPHAM SP
INNER JOIN CTHD CT ON SP.MASP = CT.MASP
INNER JOIN HOADON HD ON HD.SOHD=CT.SOHD
WHERE YEAR(HD.NGHD)='2006'

/*
	22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu? 
*/
SELECT MAX(HD.TRIGIA) HD_CAONHAT, MIN(HD.TRIGIA) HD_THAPNHAT
FROM HOADON HD 

/*
	23. Tính giá trị trung bình tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
*/
SELECT AVG(HD.TRIGIA) Average
FROM HOADON HD
WHERE YEAR(HD.NGHD)=2006

/*
	24. Tính doanh thu bán hàng trong năm 2006
*/
SELECT SUM(HD.TRIGIA) Doanhthu
FROM HOADON HD
WHERE YEAR(HD.NGHD)=2006

/*
	25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006
*/
SELECT MAX(HD.TRIGIA) HD_CAONHAT2006
FROM HOADON HD
WHERE YEAR (HD.NGHD)=2006

/*
	26. Tìm họ tên khách hàng đã mua hóa đơn cao nhất trong 2006
*/
SELECT KH.HOTEN
FROM KHACHHANG KH INNER JOIN HOADON HD ON KH.MAKH=HD.MAKH
WHERE YEAR(HD.NGHD)=2006 AND HD.TRIGIA=(
SELECT MAX(HD2.TRIGIA)
FROM HOADON HD2
WHERE YEAR(HD2.NGHD)=2006
)

/*
	27. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh thu cao nhất
*/
SELECT TOP 3 KH.MAKH, KH.HOTEN
FROM KHACHHANG KH
ORDER BY KH.DOANHSO DESC

/*
	28. In ra các danh sách sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức cao nhất. 
*/
SELECT SP2.MASP, SP2.TENSP
FROM SANPHAM SP2
WHERE SP2.GIA IN ( SELECT  DISTINCT TOP 3 SP.GIA
FROM SANPHAM SP
ORDER BY SP.GIA DESC)

/* 
	29. In ra danh sách các sản phẩm (MASP, TENSP) do "Thai Lan" sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm)
*/ 
SELECT SP2.MASP, SP2.TENSP
FROM SANPHAM SP2
WHERE SP2.NUOCSX ='Thai Lan' AND SP2.GIA IN (
SELECT DISTINCT TOP 3 SP.GIA
FROM SANPHAM SP
ORDER BY GIA DESC)

/*
	30. In ra danh sách các sản phẩm (MASP, TENSP) do 'Trung Quoc' sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm 
	do 'Trung Quoc' san xuat).
*/
SELECT SP2.MASP, SP2.TENSP
FROM SANPHAM SP2
WHERE NUOCSX = 'Trung Quoc' AND SP2.GIA IN (
SELECT TOP 3 SP.GIA
FROM SANPHAM SP
WHERE SP.NUOCSX='Trung Quoc'
ORDER BY SP.GIA DESC)

---------------------------------------------------------------------------PHẦN 3 từ 31-40 ---------------------------------------------------------------------------------
/*
	31. * In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo xếp hạng)
*/ 
SELECT TOP 3 KH.MAKH, KH.HOTEN
FROM KHACHHANG KH 
ORDER BY KH.DOANHSO DESC

/*
	32. Tính tổng số sản phẩm do 'Trung Quoc' sản xuất.
*/
SELECT COUNT(SP.MASP) SP_TQ
FROM SANPHAM SP
WHERE SP.NUOCSX='Trung Quoc'

/* 
	33. Tính tổng số sản phẩm của từng nước sản xuất
*/
SELECT SP.NUOCSX, COUNT(SP.MASP) TONGSP
FROM SANPHAM SP
GROUP BY SP.NUOCSX

/*
	34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm
*/ 
SELECT SP.NUOCSX, MAX(SP.GIA) GIA_CAONHAT, MIN(SP.GIA) GIA_THAPNHAT, AVG(SP.GIA) GIA_TRUNGBINH
FROM SANPHAM SP
GROUP BY SP.NUOCSX

/*
	35. Tính doanh thu bán hàng mỗi ngày
*/ 
SELECT HD.NGHD, SUM(HD.TRIGIA) TONG_TIEN
FROM HOADON HD
GROUP BY HD.NGHD

/* 
	36. Tính tổng số lượng sản phẩm bán ra trong tháng '10/2006'
*/ 
SELECT  COUNT(DISTINCT (SP.MASP)) TONG_SP_10_2006
FROM HOADON HD, SANPHAM SP
WHERE (NGHD BETWEEN '2006-10-1' AND '2006-10-31')

/* 
	37. Tính doanh thu bán hàng của từng tháng trong năm 2006
*/
SELECT MONTH(HD.NGHD) THANG_2006, SUM(HD.TRIGIA) DOANHTHU
FROM HOADON HD
WHERE YEAR(NGHD)=2006
GROUP BY MONTH(HD.NGHD)

/* 
	38. Tìm hóa đơn mua ít nhất là 4 sản phẩm khác nhau
*/
SELECT DISTINCT HD.SOHD, COUNT(CT.MASP)
FROM HOADON HD, CTHD CT 
GROUP BY HD.SOHD
HAVING COUNT(CT.MASP)>3

/* 
	39. Tìm hóa đơn có mua 3 sản phẩm do 'Viet Nam' sản xuất (3 sản phẩm khác nhau)
*/
SELECT CT.SOHD
FROM CTHD CT, SANPHAM SP
WHERE (CT.MASP=SP.MASP) AND (SP.NUOCSX='Viet Nam')
GROUP BY CT.SOHD
HAVING COUNT(SP.MASP)=3

/*
	40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
*/
SELECT KH.MAKH, KH.HOTEN
FROM KHACHHANG KH 
WHERE KH.MAKH =(SELECT TOP 1 HD.MAKH
FROM HOADON HD
GROUP BY HD.MAKH
ORDER BY COUNT(HD.SOHD) DESC
)
-------------------------------------------------------------------------------LAB 5 ---------------------------------------------------------------------------------------
/*
	11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK)
*/
CREATE TRIGGER nghd_ngdk_hoadon_insert
ON HOADON
AFTER INSERT
AS
	DECLARE @ng_muahang smalldatetime 
	DECLARE @ng_dangky smalldatetime
	SELECT @ng_muahang=nghd, @ng_dangky=ngdk
	FROM KHACHHANG, inserted
	WHERE KHACHHANG.MAKH=inserted.MAKH
	IF @ng_muahang<@ng_dangky
	BEGIN 
	rollback transaction 
	print 'Ngay mua hang phai lon hon ngay dang ky'
	END;

CREATE TRIGGER nghd_ngdk_hoadon_update 
ON HOADON
AFTER UPDATE
AS
IF (UPDATE (MAKH) OR UPDATE(NGHD))
BEGIN 
	DECLARE @ng_muahang smalldatetime
	DECLARE @ng_dangky smalldatetime
	SELECT @ng_muahang=NGHD, @ng_dangky=NGDK
	FROM KHACHHANG, inserted
	WHERE KHACHHANG.MAKH=inserted.MAKH
	IF @ng_muahang<@ng_dangky
	BEGIN
		rollback transaction 
		print 'ngay mua hang phai lon ngay dang ky'
	END
END;

CREATE TRIGGER nghd_ngdk_khachang_update
ON KHACHHANG
AFTER UPDATE
AS 
	DECLARE @ng_dangky smalldatetime, @makhhang char(4) 
	SELECT @ng_dangky=NGDK, @makhhang=MAKH
	FROM inserted
	IF(UPDATE(NGDK))
	BEGIN 
	IF(EXISTS (SELECT* 
	FROM HOADON
	WHERE MAKH=@makhhang AND @ng_dangky>NGHD))
	BEGIN 
	rollback transaction 
	print 'thao tac sua ngay dang ky phai nho hon ngay hoa don'
	END
END;

/* 
	12. Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm
*/
CREATE TRIGGER nghd_ngvl_hoadon_insert
ON HOADON
AFTER INSERT
AS	
	DECLARE @ngay_banhang smalldatetime 
	DECLARE @ngay_lamviec smalldatetime
	SELECT @ngay_banhang=NGHD, @ngay_lamviec=NGVL 
	FROM NHANVIEN, inserted
	WHERE NHANVIEN.MANV=inserted.MANV
	IF @ngay_banhang<@ngay_lamviec
	BEGIN 
	rollback transaction 
	print 'ngay ban hang phai lon hon ngay lam viec' 
	END;

CREATE TRIGGER nghd_ngvl_hoadon_update
ON HOADON
AFTER UPDATE 
AS
IF(UPDATE(NGHD) OR UPDATE(MANV))
BEGIN
	DECLARE @ngay_banhang smalldatetime
	DECLARE @ngay_lamviec smalldatetime
	SELECT @ngay_banhang=NGHD, @ngay_lamviec=NGVL
	FROM NHANVIEN, inserted
	WHERE NHANVIEN.MANV=inserted.MANV
	IF @ngay_banhang<@ngay_lamviec
	BEGIN 
	rollback transaction 
	print 'ngay ban hang phai lon hon hoac bang ngay lam viec'
	END
END;

CREATE TRIGGER nghd_ngvl_nhanvien
ON NHANVIEN
AFTER UPDATE
AS 
	DECLARE @ng_lamviec smalldatetime, @ma_nhanvien char(4) 
	SELECT @ng_lamviec=NGVL, @ma_nhanvien=MANV
	FROM inserted
	IF(UPDATE(NGVL))
	BEGIN 
		IF(EXISTS (SELECT* 
		FROM HOADON
		WHERE HOADON.MANV=@ma_nhanvien AND @ng_lamviec>HOADON.NGHD
		))
		BEGIN 
			rollback transaction 
			print 'thao tac ngay lam viec phai nho hon ngay hoa don'
		END
END;

/* 
	13. Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn
*/
-- bối cảnh: HOADON, CTHD
-- nội dung: COUNT(CTHD)>=1
/*
	bảng thuộc tính: HOADON: 
					 CTHD: xóa chi tiết hóa đơn.
*/
DROP TRIGGER cthd_hoadon_dieukiensoluongcthd

CREATE TRIGGER cthd_hoadon_dieukiensoluongcthd 
ON CTHD
FOR DELETE
AS
BEGIN
	DECLARE @so_hoa_don int , @so_luong int
	SELECT @so_hoa_don=SOHD
	FROM deleted

	SELECT @so_luong=COUNT(SOHD)
	FROM CTHD
	WHERE SOHD=@so_hoa_don

	IF(@so_luong<1)
	BEGIN 
	ROLLBACK TRAN
	PRINT 'Khong xoa duoc vi so luong chi tiet hoa don phai lon hon 1 (CTHD, DELETE)'
	END
END


/* 
	14. Trị giá của một đơn hàng là tổng thành tiền (số lượng* đơn giá) của các chi tiết thuộc hóa đơn đó
*/ 
-- bối cảnh: CTHD, HOADON 
-- NỘI DUNG: SOHD.TRIGIA= TỔNG
DROP TRIGGER Trigia_bang_tongtien_soluong_gia_UPDATE

CREATE TRIGGER Trigia_bang_tongtien_soluong_gia_UPDATE
ON HOADON
FOR UPDATE
AS 
BEGIN 
DECLARE @So_hoa_don int, @Tri_gia money, @tong_tien money, @soluong int, @lan_lap int
SELECT @So_hoa_don=SOHD, @Tri_gia=TRIGIA
FROM inserted
SELECT @lan_lap = COUNT(*) FROM CTHD WHERE SOHD=@So_hoa_don
DECLARE @dem int = 0
DECLARE @TONG money = 0
	WHILE @dem<@lan_lap
	BEGIN
	SELECT @tong_tien=GIA, @soluong=SL
	FROM SANPHAM SP JOIN CTHD CT ON SP.MASP=CT.MASP
	WHERE SOHD=@So_hoa_don
	SET @TONG=@TONG+@tong_tien*@soluong
	SET @dem=@dem+1
	END
		if(@Tri_gia!=@TONG)
		BEGIN
		ROLLBACK TRAN
		PRINT 'tong gia tri don hang bang tong thanh tien cua chi tiet hoa don'
		END
END

/*
	15. Doanh số của một khách hàng là tổng trị giá các hóa đơn mà khách đó đã mua. 
*/

-- tổng trị giá các đơn hàng trong năm. 
SELECT YEAR(NGHD) DONHANG, SUM(TRIGIA) TRIGIA
FROM HOADON
GROUP BY YEAR(NGHD)

SELECT* FROM CTHD