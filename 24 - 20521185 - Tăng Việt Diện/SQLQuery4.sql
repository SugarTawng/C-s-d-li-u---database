--I) Ngôn ngữ định nghĩa dữ liệu
--1. Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của hệ.

--CREATE TABLE KHOA
--(
--MAKHOA varchar(4) NOT NULL PRIMARY KEY,
--TENKHOA varchar(40),
--NGTLAP smalldatetime,
--TRGKHOA char(4)
--)

--CREATE TABLE MONHOC
--(
--MAMH varchar(10) NOT NULL PRIMARY KEY,
--TENMH varchar(40),
--TCLT tinyint,
--TCTH tinyint,
--MAKHOA varchar(4) FOREIGN KEY REFERENCES KHOA(MAKHOA)
--)

--CREATE TABLE DIEUKIEN
--(
--MAMH varchar(10) NOT NULL,
--MAMH_TRUOC varchar(10) NOT NULL,
--CONSTRAINT PK_DIEUKIEN PRIMARY KEY (MAMH, MAMH_TRUOC)
--)
--ALTER TABLE DIEUKIEN 
--ADD FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

--CREATE TABLE GIAOVIEN
--(
--MAGV char(4) NOT NULL PRIMARY KEY,
--HOTEN varchar(40),
--HOCVI varchar(10),
--HOCHAM varchar(10),
--GIOITINH varchar(3),
--NGSINH smalldatetime, 
--NGVL smalldatetime,
--HESO numeric(4,2),
--MUCLUONG money,
--MAKHOA varchar(4) FOREIGN KEY REFERENCES KHOA(MAKHOA)
--)

--CREATE TABLE LOP
--(
--MALOP char(3) NOT NULL PRIMARY KEY,
--TENLOP varchar(40),
--TRGLOP char(5),
--SISO tinyint,
--MAGVCN char(4) FOREIGN KEY REFERENCES GIAOVIEN(MAGV)
--)

--CREATE TABLE HOCVIEN
--(
--MAHV char(5) NOT NULL PRIMARY KEY,
--HO varchar(40),
--TEN varchar(10),
--NGSINH smalldatetime,
--GIOITINH varchar(3),
--NOISINH varchar(40),
--MALOP char(3) FOREIGN KEY REFERENCES LOP(MALOP)
--)

--CREATE TABLE GIANGDAY
--(
--MALOP char(3) NOT NULL FOREIGN KEY REFERENCES LOP(MALOP),
--MAMH varchar(10) NOT NULL FOREIGN KEY REFERENCES MONHOC(MAMH),
--MAGV char(4) FOREIGN KEY REFERENCES GIAOVIEN(MAGV),
--HOCKY tinyint,
--NAM smallint,
--TUNGAY smalldatetime, 
--DENNGAY smalldatetime,
--CONSTRAINT PK_GIANGDAY PRIMARY KEY(MALOP, MAMH)
--)

--CREATE TABLE KETQUATHI 
--(
--MAHV char(5) NOT NULL FOREIGN KEY REFERENCES HOCVIEN(MAHV),
--MAMH varchar(10) NOT NULL FOREIGN KEY REFERENCES MONHOC(MAMH),
--LANTHI tinyint NOT NULL,
--NGTHI smalldatetime,
--DIEM numeric(4,2),
--KQUA varchar(10),
--CONSTRAINT PK_KETQUATHI PRIMARY KEY(MAHV, MAMH, LANTHI) 
--)
--2 Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp.
 ALTER TABLE HOCVIEN
 ADD CONSTRAINT CHK_MAHV CHECK ( MAHV LIKE 'K[0-9][0-9][0-9][0-9]' )
--3 Thuộc tính GIOITINH chỉ có giá trị là "Nam" hoặc "Nữ"
ALTER TABLE HOCVIEN
ADD CONSTRAINT CHK_GIOITINH CHECK (GIOITINH IN('NAM', 'NU') )
--4 
ALTER TABLE KETQUATHI ADD CONSTRAINT CK_DIEM CHECK((DIEM >= 0) AND (DIEM <= 10))
--5 Kết quả thi là đạt nếu điểm từ 5 đến 10 và 'Khong dat' neu diem nho hon 5
ALTER TABLE KETQUATHI ADD CONSTRAINT CK_KQUA CHECK(KQUA IN('Dat', 'Khong Dat'))
--6 Học viên chỉ thi 1 môn tối đa 3 lần
ALTER TABLE KETQUATHI
ADD CONSTRAINT CK_LANTHI CHECK (LANTHI<=3)	
--7 Học kỳ chỉ có giá trị từ 1 đến 3
ALTER TABLE GIANGDAY 
ADD CONSTRAINT CK_HOCKY CHECK(HOCKY>=1 AND HOCKY <=3)
--8 Học vị của giáo viên chỉ có thể là "CN", "KS", "Ths", "TS", "PTS" 
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CHK_HOCVI CHECK (HOCVI IN('CN', 'KS', 'Ths', 'TS', 'PTS') )

----------- Nhập dữ liệu cho CSDL QuanLyGiaoVu--------------------------
INSERT INTO KHOA VALUES ('KHMT', 'Khoa hoc may tinh', '2005-6-7', 'GV01')
INSERT INTO KHOA VALUES ('HTTT', 'He thong thong tin', '2005-6-7', 'GV02')
INSERT INTO KHOA VALUES ('CNPM', 'Cong nghe phan mem', '2005-6-7', 'GV04')
INSERT INTO KHOA VALUES ('MMT', 'Mang va truyen thong', '2005-10-20', 'GV03')
INSERT INTO KHOA VALUES ('KTMT', 'Ky thuat may tinh', '2005-12-20', NULL)
select* from KHOA

INSERT INTO MONHOC VALUES ('THDC', 'Tin hoc dai cuong', '4', '1', 'KHMT') 
INSERT INTO MONHOC VALUES ('CTRR', 'Cau truc roi rac', '5', '0', 'KHMT')
INSERT INTO MONHOC VALUES ('CSDL', 'Co so du lieu', '3', '1', 'HTTT')
INSERT INTO MONHOC VALUES ('CTDLGT', 'Cau truc du lieu va giai thuat', '3', '1', 'KHMT')
INSERT INTO MONHOC VALUES ('PTTKTT', 'Phan tich thiet ke thuat toan', '3', '0', 'KHMT')
INSERT INTO MONHOC VALUES ('DHMT', 'Do hoa may tinh', '3', '0', 'KHMT')
INSERT INTO MONHOC VALUES ('KTMT', 'Kien truc may tinh', '3', '0', 'KTMT')
INSERT INTO MONHOC VALUES ('TKCSDL', 'Thiet ke co so du lieu', '3', '1', 'HTTT')
INSERT INTO MONHOC VALUES ('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', '4', '1', 'HTTT')
INSERT INTO MONHOC VALUES ('HDH', 'He dieu hanh', '4', '0', 'KTMT') 
INSERT INTO MONHOC VALUES ('NMCNPM', 'Nhap mon cong nghe phan mem', '3', '0', 'CNPM')
INSERT INTO MONHOC VALUES ('LTCFW', 'Lap trinh C for win', '3', '1', 'CNPM')
INSERT INTO MONHOC VALUES ('LTHDT', 'Lap trinh huong doi tuong', '3', '1', 'CNPM')
select* from MONHOC
UPDATE MONHOC 
SET TCTH ='1'
WHERE MAMH = 'DHMT'

INSERT INTO GIAOVIEN VALUES ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-5-2', '2004-1-11', '5.00', '2,250,000', 'KHMT')
INSERT INTO GIAOVIEN VALUES ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '1965-12-17', '2004-4-20', '4.50', '2,025,000', 'HTTT')
INSERT INTO GIAOVIEN VALUES ('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1950-8-1', '2004-9-23', '4.0', '1,800,000', 'CNPM')
INSERT INTO GIAOVIEN VALUES ('GV04', 'Tran Nam Son', 'TS', 'GS', 'Nam', '1961-2-22', '2005-1-12', '4.05', '2,025,000', 'KTMT')
INSERT INTO GIAOVIEN VALUES ('GV05', 'Mai Thanh Danh', 'Ths', 'GV', 'Nam', '1958-3-12', '2005-1-12', '3.00', '1,350,000', 'HTTT')
INSERT INTO GIAOVIEN VALUES ('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '1953-3-11', '2005-1-12', '4.05', '2,025,000', 'KHMT')
INSERT INTO GIAOVIEN VALUES ('GV07', 'Nguyen Minh Tien', 'Ths', 'GV', 'Nam', '1971-11-23', '2005-3-1', '4.00', '1,800,000', 'KHMT') 
INSERT INTO GIAOVIEN VALUES ('GV08', 'Le Thi Tran', 'KS', NULL, 'Nu', '1974-3-26', '2005-3-1', '1.69', '760,500', 'KHMT') 
INSERT INTO GIAOVIEN VALUES ('GV09', 'Nguyen To Lan', 'Ths', 'GV', 'Nu', '1996-12-31', '2005-3-1', '4.0', '1,800,000', 'HTTT')
INSERT INTO GIAOVIEN VALUES ('GV10', 'Le Tran Anh Loan', 'KS', NULL, 'Nu', '1972-7-17', '2005-3-1', '1.86', '837,000', 'CNPM')
INSERT INTO GIAOVIEN VALUES ('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '1980-1-12', '2005-5-15', '2.67', '1,201,500', 'MMT')
INSERT INTO GIAOVIEN VALUES ('GV12', 'Tran Van Anh', 'CN', NULL, 'Nu', '1981-3-29', '2005-5-15', '1.69', '760,500', 'CNPM')
INSERT INTO GIAOVIEN VALUES ('GV13', 'Nguyen Linh Dan', 'CN', NULL, 'Nu', '1980-5-23', '2005-5-15', '1.69', '760,500', 'KTMT')
INSERT INTO GIAOVIEN VALUES ('GV14', 'Truong Minh Chau', 'Ths', 'GV', 'Nu', '1976-11-30', '2005-5-15', '3.00', '1,350,000', 'MMT')
INSERT INTO GIAOVIEN VALUES ('GV15', 'Le Thanh Ha', 'ThS', 'GV', 'Nam', '1978-5-4', '2005-5-15', '3.00', '1,350,000', 'KHMT')

select* from GIAOVIEN
UPDATE GIAOVIEN
SET HOCVI = 'ThS'
WHERE MAGV = 'GV05'

UPDATE GIAOVIEN
SET HOCVI = 'ThS'
WHERE MAGV = 'GV07'

UPDATE GIAOVIEN
SET HOCVI = 'ThS'
WHERE MAGV = 'GV09'

UPDATE GIAOVIEN
SET HOCVI = 'ThS'
WHERE MAGV = 'GV14'

select* from GIAOVIEN

INSERT INTO DIEUKIEN VALUES ('CSDL' , 'CTRR')
INSERT INTO DIEUKIEN VALUES ('CSDL', 'CTDLGT')
INSERT INTO DIEUKIEN VALUES ('CTDLGT', 'THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKTT', 'THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKTT', 'CTDLGT')
INSERT INTO DIEUKIEN VALUES ('DHMT', 'THDC')
INSERT INTO DIEUKIEN VALUES ('LTHDT', 'THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKHTTT', 'CSDL')
select* from DIEUKIEN

INSERT INTO LOP VALUES ('K11', 'Lop 1 khoa 1', 'K1108', '11', 'GV07')
INSERT INTO LOP VALUES ('K12', 'Lop 2 khoa 1', 'K1205', '12', 'GV09')
INSERT INTO LOP VALUES ('K13', 'Lop 3 khoa 1', 'K1305', '12', 'GV14')
select* from LOP

INSERT INTO GIANGDAY VALUES ('K11', 'THDC', 'GV07', '1', '2006', '2006-1-2', '2006-5-12')
INSERT INTO GIANGDAY VALUES ('K12', 'THDC', 'GV06', '1', '2006', '2006-1-2', '2006-5-12')
INSERT INTO GIANGDAY VALUES ('K13', 'THDC', 'GV15', '1', '2006', '2006-1-2', '2006-5-12')
INSERT INTO GIANGDAY VALUES ('K11', 'CTRR', 'GV02', '1', '2006', '2006-1-9', '2006-5-17')
INSERT INTO GIANGDAY VALUES ('K12', 'CTRR', 'GV02', '1', '2006', '2006-1-9', '2006-5-17')
INSERT INTO GIANGDAY VALUES ('K13', 'CTRR', 'GV08', '1', '2006', '2006-1-9', '2006-5-17')
INSERT INTO GIANGDAY VALUES ('K11', 'CSDL', 'GV05', '2', '2006', '2006-6-1', '2006-7-15')
INSERT INTO GIANGDAY VALUES ('K12', 'CSDL', 'GV09', '2', '2006', '2006-6-1', '2006-7-15')
INSERT INTO GIANGDAY VALUES ('K13', 'CTDLGT', 'GV15', '2', '2006', '2006-6-1', '2006-7-15')
INSERT INTO GIANGDAY VALUES ('K13', 'CSDL', 'GV05', '3', '2006', '2006-8-1', '2006-12-15')
INSERT INTO GIANGDAY VALUES ('K13', 'DHMT', 'GV07', '3', '2006', '2006-8-1', '2006-12-15')
INSERT INTO GIANGDAY VALUES ('K13', 'CTDLGT', 'GV15', '3', '2006', '2006-8-1', '2006-12-15')
INSERT INTO GIANGDAY VALUES ('K12', 'CTDLGT', 'GV15', '3', '2006', '2006-8-1', '2006-12-15')
INSERT INTO GIANGDAY VALUES ('K12', 'HDH', 'GV04', '1', '2007', '2007-1-2', '2007-2-18')
INSERT INTO GIANGDAY VALUES ('K11', 'HDH', 'GV04', '1', '2007', '2007-1-2', '2007-3-20')
INSERT INTO GIANGDAY VALUES ('K11', 'DHMT', 'GV07', '1', '2007', '2007-2-18', '2007-3-20')

select* from GIANGDAY

INSERT INTO HOCVIEN VALUES ('K1101', 'Nguyen Van A', 'A', '1986-1-27', 'Nam', 'TpHCM', 'K11')
INSERT INTO HOCVIEN VALUES ('K1102', 'Tran Ngoc', 'Han', '1986-3-14', 'Nu', 'Kien Giang', 'K11')
INSERT INTO HOCVIEN VALUES ('K1103', 'Ha Duy', 'Lap', '1986-4-18', 'Nam', 'Nghe An', 'K11')
INSERT INTO HOCVIEN VALUES ('K1104', 'Tran Ngoc', 'Linh', '1986-3-30', 'Nu', 'Tay Ninh', 'K11')
INSERT INTO HOCVIEN VALUES ('K1105', 'Tran Minh', 'Long', '1986-2-27', 'Nam', 'TpHCM', 'K11')
INSERT INTO HOCVIEN VALUES ('K1106', 'Le Nhat', 'Minh', '1986-1-24', 'Nam', 'TpHCM', 'K11')
INSERT INTO HOCVIEN VALUES ('K1107', 'Nguyen Nhu', 'Nhut', '1986-1-27', 'Nam', 'Ha Noi', 'K11')
INSERT INTO HOCVIEN VALUES ('K1108', 'Nguyen Manh', 'Tam', '1986-2-27', 'Nam', 'Kien Giang', 'K11')
INSERT INTO HOCVIEN VALUES ('K1109', 'Phan Thi Thanh', 'Tam', '1986-1-27', 'Nu', 'Vinh Long', 'K11')
INSERT INTO HOCVIEN VALUES ('K1110', 'Le Hoai', 'Thuong', '1986-2-5', 'Nu', 'Can Tho', 'K11')
INSERT INTO HOCVIEN VALUES ('K1111', 'Le Ha', 'Vinh', '1986-12-25', 'Nam', 'Vinh Long', 'K11')

INSERT INTO HOCVIEN VALUES ('K1201', 'Nguyen Van', 'B', '1986-2-11', 'Nam', 'TpHCM', 'K12')
INSERT INTO HOCVIEN VALUES ('K1202', 'Nguyen Thi Kim', 'Duyen', '1986-1-18', 'Nu', 'TpHCM', 'K12')
INSERT INTO HOCVIEN VALUES ('K1203', 'Tran Thi Kim', 'Duyen', '1986-9-17', 'Nu', 'TpHCM', 'K12')
INSERT INTO HOCVIEN VALUES ('K1204', 'Truong My', 'Hanh', '1986-5-19', 'Nu', 'Dong Nai', 'K12')
INSERT INTO HOCVIEN VALUES ('K1205', 'Nguyen Thanh', 'Nam', '1986-4-17', 'Nam', 'TpHCM', 'K12')
INSERT INTO HOCVIEN VALUES ('K1206', 'Nguyen Thi Truc', 'Thanh', '1986-3-4', 'Nu', 'Kien Giang', 'K12')
INSERT INTO HOCVIEN VALUES ('K1207', 'Tran Thi Bich', 'Thuy', '1986-2-8', 'Nu', 'Nghe An', 'K12')
INSERT INTO HOCVIEN VALUES ('K1208', 'Huynh Thi Kim', 'Trieu', '1986-4-8', 'Nu', 'Tay Ninh', 'K12')
INSERT INTO HOCVIEN VALUES ('K1209', 'Pham Thanh', 'Trieu', '1986-2-23', 'Nam', 'TpHCM', 'K12')
INSERT INTO HOCVIEN VALUES ('K1210', 'Ngo Thanh', 'Tuan', '1986-2-14', 'Nam', 'TpHCM', 'K12')
INSERT INTO HOCVIEN VALUES ('K1211', 'Do Thi', 'Xuan', '1986-3-9', 'Nu', 'Ha Noi', 'K12')
INSERT INTO HOCVIEN VALUES ('K1212', 'Le Thi Phi', 'Yen', '1986-3-12', 'Nu', 'TpHCM', 'K12')

INSERT INTO HOCVIEN VALUES ('K1301', 'Nguyen Thi Kim', 'Cuc', '1986-6-9', 'Nu', 'Kien Giang', 'K13')
INSERT INTO HOCVIEN VALUES ('K1302', 'Truong Thi My', 'Hien', '1986-3-18', 'Nu', 'Nghe An', 'K13')
INSERT INTO HOCVIEN VALUES ('K1303', 'Le Duc', 'Hien', '1986-3-21', 'Nam', 'Tay Ninh', 'K13')
INSERT INTO HOCVIEN VALUES ('K1304', 'Le Quang', 'Hien', '1986-4-18', 'Nam', 'TpHCM', 'K13')
INSERT INTO HOCVIEN VALUES ('K1305', 'Le Thi', 'Huong', '1986-3-27', 'Nu', 'TpHCM', 'K13')
INSERT INTO HOCVIEN VALUES ('K1306', 'Nguyen Thai', 'Huu', '1986-3-30', 'Nam', 'Ha Noi', 'K13')
INSERT INTO HOCVIEN VALUES ('K1307', 'Tran Minh', 'Man', '1986-5-28', 'Nam', 'TpHCM', 'K13')
INSERT INTO HOCVIEN VALUES ('K1308', 'Nguyen Hieu', 'Nghia', '1986-4-8', 'Nam', 'Kien Giang', 'K13')
INSERT INTO HOCVIEN VALUES ('K1309', 'Nguyen Trung', 'Nghia', '1986-1-18', 'Nam', 'Nghe An', 'K13')
INSERT INTO HOCVIEN VALUES ('K1310', 'Tran Thi Hong', 'Tham', '1986-4-22', 'Nu', 'Tay Ninh', 'K13')
INSERT INTO HOCVIEN VALUES ('K1311', 'Tran Minh', 'Thuc', '1986-4-4', 'Nam', 'TpHCM', 'K13')
INSERT INTO HOCVIEN VALUES ('K1312', 'Nguyen Thi Kim', 'Yen', '1986-9-7', 'Nu', 'TpHCM', 'K13')

select* from HOCVIEN

INSERT INTO KETQUATHI VALUES ('K1101', 'CSDL', '1', '2006-7-20', '10.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1101', 'CTDLGT', '1', '2006-12-28', '9.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1101', 'THDC', '1', '2006-5-20', '9.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1101', 'CTRR', '1', '2006-5-13', '9.5', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1102', 'CSDL', '1', '2006-7-20', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102', 'CSDL', '2', '2006-7-27', '4.25', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102', 'CSDL', '3', '2006-8-10', '4.50', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102', 'CTDLGT', '1', '2006-12-28', '4.50', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102', 'CTDLGT', '2', '2007-1-5', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102', 'CTDLGT', '3', '2007-1-15', '6.00', 'Dat')

UPDATE KETQUATHI 
SET NGTHI = '2007-1-5'
WHERE MAHV = 'K1102' AND MAMH = 'CTDLGT' AND LANTHI = '2' 

UPDATE KETQUATHI 
SET NGTHI = '2007-1-15'
WHERE MAHV = 'K1102' AND MAMH = 'CTDLGT' AND LANTHI = '3' 

select* from KETQUATHI 

INSERT INTO KETQUATHI VALUES ('K1102', 'THDC', '1', '2006-5-20', '5.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1102', 'CTRR', '1', '2006-5-13', '7.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1103', 'CSDL', '1', '2006-7-20', '3.50', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1103', 'CSDL', '2', '2006-7-27', '8.25', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1103', 'CTDLGT', '1', '2006-12-28', '7.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1103', 'THDC', '1', '2006-5-20', '8.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1103', 'CTRR', '1', '2006-5-13', '6.50', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1104', 'CSDL', '1', '2006-7-20', '3.75', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104', 'CTDLGT', '1', '2006-12-28', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104', 'THDC', '1', '2006-5-20', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104', 'CTRR', '1', '2006-5-13', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104', 'CTRR', '2', '2006-5-20', '3.50', 'Khong Dat')

INSERT INTO KETQUATHI VALUES ('K1104', 'CTRR', '3', '2006-6-30', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1201', 'CSDL', '1', '2006-7-20', '6.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1201', 'CTDLGT', '1', '2006-12-28', '5.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1201', 'THDC', '1', '2006-5-20', '8.50', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1201', 'CTRR', '1', '2006-5-13', '9.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1202', 'CSDL', '1', '2006-7-20', '8.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1202', 'CTDLGT', '1', '2006-12-28', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202', 'CTDLGT', '2', '2007-1-5', '5.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1202', 'THDC', '1', '2006-5-20', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202', 'THDC', '2', '2006-5-27', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202', 'CTRR', '1', '2006-5-13', '3.00', 'Khong Dat')

UPDATE KETQUATHI 
SET NGTHI = '2007-1-5'
WHERE MAHV = 'K1202' AND MAMH = 'CTDLGT' AND LANTHI = '2'

INSERT INTO KETQUATHI VALUES ('K1202', 'CTRR', '2', '2006-5-20', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202', 'CTRR', '3', '2006-6-30', '6.25', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1203', 'CSDL', '1', '2006-7-20','9.25', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1203', 'CTDLGT', '1', '2006-12-28','9.50', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1203', 'THDC', '1', '2006-5-20', '10.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1203', 'CTRR', '1', '2006-5-13', '10.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1204', 'CSDL', '1', '2006-7-20', '8.50', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1204', 'CTDLGT', '1', '2006-12-28', '6.75', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1204', 'THDC', '1', '2006-5-20', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1204', 'CTRR', '1', '2006-5-13', '6.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1301', 'CSDL', '1', '2006-12-20', '4.25', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1301', 'CTDLGT', '1', '2006-7-25', '8.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1301', 'THDC', '1', '2006-5-20', '7.75', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1301', 'CTRR', '1', '2006-5-13', '8.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1302', 'CSDL', '1', '2006-12-20', '6.75', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1302', 'CTDLGT', '1', '2006-7-25', '5.00', 'Dat')


INSERT INTO KETQUATHI VALUES ('K1302', 'THDC', '1', '2006-5-20', '8.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1302', 'CTRR', '1', '2006-5-13', '8.50', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1303', 'CSDL', '1', '2006-12-20', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303', 'CTDLGT', '1', '2006-7-25', '4.50', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303', 'CTDLGT', '2', '2006-8-7', '4.00', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303', 'CTDLGT', '3', '2006-8-15', '4.25', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303', 'THDC', '1', '2006-5-20', '4.50', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303', 'CTRR', '1', '2006-5-13', '3.25', 'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303', 'CTRR', '2', '2006-5-20', '5.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1304', 'CSDL', '1', '2006-12-20', '7.75', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1304', 'CTDLGT', '1', '2006-7-25', '9.75', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1304', 'THDC', '1', '2006-5-20', '5.50', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1304', 'CTRR', '1', '2006-5-13', '5.0', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1305', 'CSDL', '1', '2006-12-20', '9.25', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1305', 'CTDLGT', '1', '2006-7-25', '10.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1305', 'THDC', '1', '2006-5-20', '8.00', 'Dat')
INSERT INTO KETQUATHI VALUES ('K1305', 'CTRR', '1', '2006-5-13', '10.00', 'Dat')

select* from KETQUATHI
select* from KETQUATHi
--------------------------------------- PHẦN 1 TỪ 11 -> 14-----------------------------------
/* 
	11. Học viên ít nhất là 18 tuổi
*/

ALTER TABLE HOCVIEN
ADD CONSTRAINT CHECK_DKTUOI CHECK(YEAR(GETDATE())-YEAR(NGSINH)>=18)

SELECT *FROM HOCVIEN WHERE(YEAR(GETDATE())-YEAR(NGSINH)>=18)
/*
	12. Giảng dạy một môn học ngày bắt đầu (TU NGAY) 
	phải nhỏ hơn ngày kết thúc (DENNGAY)
*/
ALTER TABLE GIANGDAY
ADD CONSTRAINT CHECK_DKNGAY CHECK (DAY(TUNGAY)<DAY(DENNGAY))
/*
	13. Giáo viên khi vào làm ít nhất là 22 tuổi
*/

ALTER TABLE GIAOVIEN
ADD CONSTRAINT CHECK_TUOIGV CHECK ((YEAR(NGSINH)-YEAR(NGVL))>=22)

SELECT* FROM GIAOVIEN WHERE((YEAR(NGSINH)-YEAR(NGVL))<22) --BỊ SUNG ĐỘT
/* 
	14. Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 5
*/
ALTER TABLE MONHOC
ADD CONSTRAINT CHECK_chenhlechTINCHI CHECK(ABS(TCLT-TCTH)<=5)

ALTER TABLE MONHOC
DROP CONSTRAINT CHECK_chenhlechTINCHI

SELECT* FROM MONHOC WHERE ((TCLT-TCTH)>3) --BỊ SUNG ĐỘT 

-------------------------------------------------PHẦN 3 1->5----------------------------------------------
/*
	1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp
*/

SELECT TRGLOP, HO, TEN, NGSINH, HOCVIEN.MALOP 
FROM LOP, HOCVIEN
WHERE TRGLOP = MAHV

/*
	2. In ra bảng điểm khi thi (mã học viên, họ tên, lần thì, điểm số) môn CRRR của lớp "K12" sắp xếp theo 
	tên, họ học viên
*/
SELECT DISTINCT HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN, KETQUATHI.LANTHI, KETQUATHI.DIEM
FROM HOCVIEN, KETQUATHI, LOP
WHERE (HOCVIEN.MAHV = KETQUATHI.MAHV) AND (MAMH='CTRR') AND (HOCVIEN.MALOP='K12') 

/*
	3. In ra danh sách những học viên (mã học viên, họ tên) và những mà học viên đó thì lần thứ nhất đã đạt
*/
SELECT DISTINCT HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN
FROM HOCVIEN, KETQUATHI
WHERE (HOCVIEN.MAHV=KETQUATHI.MAHV) AND (DIEM>=5) AND (LANTHI=1)

/*
	4. In ra danh sách học viên (Mã học viên, họ tên) của lớp 'K11' thi môn CTRR không đạt (ở lần thi 1) 
*/
SELECT HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN 
FROM HOCVIEN, KETQUATHI
WHERE (HOCVIEN.MAHV=KETQUATHI.MAHV) AND (MALOP='K11') AND (MAMH='CTRR') AND (DIEM<5) AND (LANTHI=1)

/*
	5. Danh sách học viên (mã học viên, họ tên học viên) của lớp 'K' thi môn CTRR không đạt ở tất cả các lần thi
*/
SELECT DISTINCT HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN 
FROM HOCVIEN, KETQUATHI
WHERE (HOCVIEN.MAHV=KETQUATHI.MAHV) AND (MALOP='K11' OR MALOP='K12' OR MALOP='K13') AND (MAMH='CTRR') AND (DIEM<5) AND (LANTHI=1 OR LANTHI=2 OR LANTHI=3)

------------------------------------------------------------------------LAB 3-----------------------------------------------------------------------

---------------------------------------------------------------------PHẦN 2 từ 1->4-----------------------------------------------------------------

/* 
	1. Tăng hệ số lương 0.2 cho những giáo viên là trưởng khoa
*/
UPDATE GIAOVIEN
SET MUCLUONG=MUCLUONG*1.2
WHERE MAGV IN (SELECT TRGKHOA FROM KHOA)

-- Hiển thị ra các trưởng Khoa

SELECT MUCLUONG FROM GIAOVIEN WHERE MAGV IN (SELECT TRGKHOA FROM KHOA) -- HIỂN THỊ RA MỨC LƯƠNG CỦA TRƯỞNG KHOA
-- 2250000.00;  2025000.00;  1800000.00;  2025000.00

/*
	2. Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần chỉ lấy điểm của)
	lần thi sau cùng).
*/

SELECT * FROM KETQUATHI WHERE MAHV='K1102'

ALTER TABLE KETQUATHI ADD DIEMTB numeric(4,2)
ALTER TABLE HOCVIEN ADD DIEMTB numeric(4,2)

UPDATE HOCVIEN
SET DIEMTB = (SELECT AVG(DIEM)
                FROM KETQUATHI K1
                WHERE LANTHI = (SELECT MAX(LANTHI)
                                FROM KETQUATHI K2
                                WHERE (K1.MAHV = K2.MAHV AND K1.MAMH = K2.MAMH)
                                GROUP BY MAHV,MAMH)
                GROUP BY MAHV
                HAVING MAHV = HOCVIEN.MAHV) 

/*
	3. Cập nhật giá trị cho cột GHICHU là 'Cam thi' đối với trường hợp: học viên có một môn bất kỳ lần thi thứ 3 dưới 5 điểm
*/
SELECT* FROM KETQUATHI

ALTER TABLE KETQUATHI ADD GHICHU varchar(100)
ALTER TABLE KETQUATHI DROP COLUMN GHICHU 

UPDATE KETQUATHI
SET GHICHU ='Cam thi' 
WHERE KETQUATHI.LANTHI = 3 AND (DIEM<5 AND LANTHI=3)
/* 
	4. Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau: 
		* Nếu DIEMTB >=9 thì XEPLOAI='SX'
		* Nếu 8<=DIEMTB<= thì XEPLOAI='G'
		* Nếu 6.5<=DIEM<8 thì XEPLOAI='K'
		* Nếu 5<=DIEMTB<6,5 thì XEPLOAI='TB'
		* Nếu DIEMTB<5 thì XEPLOAI ='Y'
*/ 
ALTER TABLE HOCVIEN
ADD XEPLOAI varchar(10)

SELECT* FROM HOCVIEN

UPDATE HOCVIEN
SET XEPLOAI = 'SX'
WHERE DIEMTB>=9

UPDATE HOCVIEN
SET XEPLOAI='G'
WHERE DIEMTB >=8 AND DIEMTB <9

UPDATE HOCVIEN
SET XEPLOAI='K'
WHERE DIEMTB>=6.5 AND DIEMTB<8

UPDATE HOCVIEN
SET XEPLOAI='TB'
WHERE DIEMTB>=5 AND DIEMTB<6.5

UPDATE HOCVIEN
SET XEPLOAI='Y'
WHERE DIEMTB<5
-----------------------------------------------------------------------PHẦN 3 từ 6->10-----------------------------------------------------------------
/*
	6. Tìm tên những môn học mà giáo viên 'Tran Tam Thanh' dạy học trong học kỳ 1 năm 2006
*/
SELECT MAMH
FROM GIANGDAY GD, GIAOVIEN GV
WHERE (GD.MAGV=GV.MAGV)
AND (GV.HOTEN='Tran Tam Thanh') AND HOCKY=1 AND NAM=2006

/* 
	7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp 'K11' dạy học trong học kì 1 năm 2006
*/
SELECT MH.MAMH, MH.TENMH
FROM LOP L, GIANGDAY GD, MONHOC MH
WHERE (L.MALOP=GD.MALOP) AND (GD.MAMH=MH.MAMH)
AND (HOCKY=1) AND NAM=2006 AND  MAGV IN (SELECT L2.MAGVCN FROM LOP L2  WHERE L2.MALOP='K11')

/*
	8. Tìm họ tên lớp trưởng của các lớp mà giáo viên "Nguyen To Lan" dạy môn "Co so du lieu" 
*/
SELECT HV.HO, HV.TEN
FROM HOCVIEN HV
WHERE HV.MAHV IN (SELECT L.TRGLOP FROM LOP L, GIANGDAY GD, GIAOVIEN GV, MONHOC MH
					WHERE (L.MALOP=GD.MALOP) AND (GD.MAGV=GV.MAGV) AND (GD.MAMH=MH.MAMH)
					AND (GV.HOTEN='Nguyen To Lan') AND (MH.TENMH='Co so du lieu')) 

/*
	9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn học "Co So Du Lieu"
*/
SELECT MH2.MAMH, MH2.TENMH
FROM MONHOC MH2
WHERE MH2.MAMH IN (SELECT DK.MAMH_TRUOC
				FROM DIEUKIEN DK, MONHOC MH
				WHERE (DK.MAMH=MH.MAMH) AND (MH.TENMH='Co so du lieu'))

/*
	10. Môn 'Cau Truc Roi Rac' là môn bắt buộc phải học liền trước những môn học nào?
*/
SELECT MH2.TENMH, MH2.MAMH
FROM MONHOC MH2
WHERE MH2.MAMH IN (SELECT DK.MAMH
			FROM DIEUKIEN DK, MONHOC MH
			WHERE (DK.MAMH_TRUOC=MH.MAMH) AND (MH.TENMH='Cau truc roi rac'))
-----------------------------------------------------------------------PHẦN 3 từ 11->18-----------------------------------------------------------------

/* 
	11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp 'K11' và 'K12' trong cùng học kỳ 1 năm 2006
*/ 
SELECT GV.HOTEN
FROM GIAOVIEN GV
WHERE GV.MAGV IN (SELECT GV2.MAGV
				  FROM GIAOVIEN GV2, GIANGDAY GD
				  WHERE (GV2.MAGV=GD.MAGV ) AND (GD.MALOP='K11') AND (GD.HOCKY=1) AND (GD.NAM=2006)
				  INTERSECT
				  SELECT GV3.MAGV
				  FROM GIAOVIEN GV3, GIANGDAY GD2
				  WHERE (GV3.MAGV=GD2.MAGV) AND (GD2.MALOP='K12') AND (GD2.HOCKY=1) AND (GD2.NAM=2006)
				 )

/* 
	12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL	ở lần thứ nhất nhưng chưa THI LẠI môn này
*/
SELECT HV.MAHV, HV.HO, HV.TEN
FROM HOCVIEN HV
WHERE HV.MAHV IN (SELECT KQ.MAHV FROM KETQUATHI KQ WHERE (KQ.LANTHI=1) AND (KQ.DIEM<5) AND (KQ.MAMH='CSDL')
				  EXCEPT 
				  SELECT KQ2.MAHV FROM KETQUATHI KQ2 WHERE (KQ2.LANTHI>1))

/* 
	13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào  
*/
SELECT DISTINCT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS (SELECT GD2.MAMH
				  FROM GIANGDAY GD2
				  WHERE GD2.MAGV=GV.MAGV)

/*
	14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách 
*/ 
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS(SELECT MH.MAMH
				 FROM GIANGDAY GD2, MONHOC MH
				 WHERE (MH.MAMH=GD2.MAMH) AND (GV.MAGV=GD2.MAGV) AND (GV.MAKHOA=MH.MAKHOA))

/*
	15. Tìm họ tên các học viên thuộc lớp 'K11' thi một môn bất kỳ quá 3 lần nhưng vẫn không đạt hoặc thi lần thứ 2 môn CTRR được 5 điểm
*/
SELECT HV.HO, HV.TEN
FROM HOCVIEN HV, KETQUATHI KQT
WHERE (HV.MAHV=KQT.MAHV) AND (KQT.LANTHI=3) AND (KQT.KQUA='Khong Dat') AND (HV.MALOP='K11')
UNION
SELECT HV3.HO, HV3.TEN
FROM HOCVIEN HV3, KETQUATHI KQT2
WHERE (HV3.MAHV=KQT2.MAHV) AND (KQT2.MAMH='CTRR') AND (KQT2.LANTHI=2) AND (KQT2.DIEM=5)

/*
	16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất 2 lớp trong cùng một học kỳ của một năm học
*/
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
WHERE GV.MAGV IN (SELECT GD.MAGV
				  FROM GIANGDAY GD, LOP L 
				  WHERE (L.MALOP=GD.MALOP) AND (MAMH='CTRR')
				  GROUP BY MAGV 
				  HAVING COUNT(L.MALOP)>1)

/* 
	17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
*/ 
SELECT*
FROM HOCVIEN HV, KETQUATHI KQT
WHERE (HV.MAHV=KQT.MAHV) AND (KQT.MAMH='CSDL') 
AND KQT.LANTHI=(SELECT MAX(KQT2.LANTHI) FROM KETQUATHI KQT2 WHERE KQT.MAMH=KQT2.MAMH AND KQT.MAHV=KQT2.MAHV) 
ORDER BY HV.MAHV ASC

SELECT *
FROM KETQUATHI KQT
WHERE KQT.MAMH='CSDL'

/*
	18. Danh sách học viên và điểm thi môn "Co So Du Lieu" (chỉ lấy điểm cao nhất của các lần thi)
*/
SELECT HV.MAHV, HV.HO, HV.TEN, MAX(KQT.DIEM) Diem_Cao_Nhat
FROM HOCVIEN HV, KETQUATHI KQT
WHERE (HV.MAHV=KQT.MAHV) AND (KQT.MAMH='CSDL')
GROUP BY HV.MAHV, HV.HO, HV.TEN

------------------------------------------------------------------------LAB 4---------------------------------------------------------------------------

-----------------------------------------------------------------------PHẦN 3 từ 19->25-----------------------------------------------------------------
/*
	19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất. 
*/
SELECT K2.MAKHOA, K2.TENKHOA
FROM KHOA K2
WHERE K2.NGTLAP = (SELECT MIN(NGTLAP) Thanh_Lap_Som_Nhat FROM KHOA K)

SELECT* FROM KHOA

/* 
	20. Có bao nhiêu giáo viên có học hàm là GS và PGS
*/
SELECT COUNT(HOCHAM) HOCHAM_GS_PGS
FROM GIAOVIEN GV
WHERE GV.HOCHAM='GS' OR GV.HOCHAM='PGS'

/*
	21. Thống kê có bao nhiêu giáo viên có học vị là 'CN', 'KS', 'Ths', 'TS', 'PTS' trong mỗi khoa. 
*/
SELECT GV.HOCVI, COUNT(GV.HOCHAM) HocHam
FROM GIAOVIEN GV
GROUP BY GV.HOCVI

/*
	22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt)
*/
SELECT KQ.MAMH, COUNT(KQ.KQUA) SO_HS_DAT
FROM KETQUATHI KQ
WHERE KQ.KQUA='Dat'
GROUP BY KQ.MAMH
union
SELECT MAMH, COUNT(KQUA) SO_HS_KDAT
FROM KETQUATHI
WHERE KQUA='Khong Dat'
GROUP BY MAMH

/* 
	23. Tìm giáo viên (mã giao viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học
*/
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
INNER JOIN GIANGDAY GD ON GV.MAGV=GD.MAGV
INNER JOIN LOP L ON L.MAGVCN=GV.MAGV
WHERE GD.MALOP=L.MALOP

/*
	24. Tìm họ tên lớp trưởng có sỉ số cao nhất
*/
SELECT L2.TRGLOP
FROM LOP L2
WHERE L2.SISO IN(
SELECT TOP 1 L.SISO
FROM LOP L
ORDER BY L.SISO DESC)

/*
	25. Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả lần thi)
*/
SELECT L.TRGLOP
FROM LOP L
WHERE L.TRGLOP IN (
SELECT KQ.MAHV
FROM KETQUATHI KQ
WHERE KQ.KQUA='Khong Dat' AND KQ.LANTHI=(SELECT MAX(KQ2.LANTHI)
FROM KETQUATHI KQ2
WHERE KQ2.MAMH=KQ.MAMH AND KQ.MAHV=KQ2.MAHV)
GROUP BY KQ.MAHV
HAVING COUNT(KQ.MAMH)>3)

-----------------------------------------------------------------------PHẦN 3 từ 25->35----------------------------------------------------------------- 
/* 
	26. Tìm học viên (mã hv, họ tên) có số môn đạt điểm 9 10 nhiều nhất
*/
SELECT TOP 1 HV.MAHV, HV.HO, HV.TEN 
FROM HOCVIEN HV
JOIN KETQUATHI KQ ON HV.MAHV = KQ.MAHV
WHERE KQ.DIEM=9 OR KQ.DIEM=10
GROUP BY HV.MAHV, HV.HO, HV.TEN
ORDER BY COUNT(KQ.DIEM) DESC

/*
	27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9, 10 nhiều nhất. 
*/

	SELECT KQT.MAHV, HV.MALOP, HV.HO, HV.TEN, COUNT(KQT.DIEM)
	FROM KETQUATHI KQT JOIN HOCVIEN HV ON HV.MAHV=KQT.MAHV
	WHERE KQT.DIEM BETWEEN 9 AND 10 
	GROUP BY KQT.MAHV, HV.MALOP, HV.HO, HV.TEN

/* 
	28. Trong từng học kỳ của từng năm mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp
*/

SELECT GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM, COUNT(GD.MAMH) SOMH, COUNT(GD.MALOP) SOLOP
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MAGV=GD.MAGV
GROUP BY GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM

/* 
	29. Trong từng học kỳ của năm tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất
*/
SELECT TOP 1 GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM
FROM GIAOVIEN GV, GIANGDAY GD
WHERE GV.MAGV=GD.MAGV
GROUP BY GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM
ORDER BY COUNT(GD.MAMH) DESC, COUNT(GD.MALOP) DESC
/*
	30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ nhất) nhất
*/
SELECT TOP 1 MH.MAMH, MH.TENMH
FROM MONHOC MH
JOIN KETQUATHI KQT ON MH.MAMH=KQT.MAMH
WHERE KQT.KQUA='Khong Dat' AND KQT.LANTHI=1
GROUP BY MH.MAMH, MH.TENMH
ORDER BY COUNT(KQT.KQUA) DESC

/*
	31. Tìm môn học (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1)
*/
SELECT DISTINCT HV.MAHV, HV.HO, HV.TEN
FROM HOCVIEN HV
JOIN KETQUATHI KQT ON HV.MAHV = KQT.MAHV
WHERE KQT.LANTHI>0 AND HV.MAHV NOT IN (
SELECT KQ.MAHV
FROM KETQUATHI KQ
WHERE KQ.KQUA='Khong Dat' AND KQ.LANTHI=1 OR KQ.LANTHI=0
)

/* 
	32. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ lần thi sau cùng) 
*/
SELECT DISTINCT HV.MAHV, HV.HO, HV.TEN
FROM HOCVIEN HV
JOIN KETQUATHI KQT ON HV.MAHV=KQT.MAHV
WHERE KQT.LANTHI>0  AND HV.MAHV NOT IN(
SELECT KQ.MAHV
FROM KETQUATHI KQ
WHERE (KQ.KQUA='Khong Dat' AND KQ.LANTHI=(
SELECT MAX(KQ1.LANTHI)
FROM KETQUATHI KQ1
WHERE KQ1.MAHV=KQ.MAHV AND KQ1.MAMH=KQ.MAMH)))

/* 
	33. Tìm học viên (mã học viên, tên học viên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ nhất)
*/
select* from MONHOC

SELECT HV.MAHV, HV.HO, HV.TEN
FROM HOCVIEN HV
WHERE NOT EXISTS(
SELECT * FROM MONHOC MH
WHERE MH.MAMH NOT IN(
SELECT KQT.MAMH
FROM KETQUATHI KQT 
WHERE KQT.KQUA='Dat' AND KQT.LANTHI=1  AND MH.MAMH=KQT.MAMH AND HV.MAHV=KQT.MAHV) )

/*
	34. Tìm học viên (mã học viên, tên học viên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng)
*/
-- Tìm lần thi sau cùng của tất cả học viên
SELECT HV.MAHV, HV.HO, HV.TEN
FROM HOCVIEN HV
WHERE NOT EXISTS(
SELECT * 
FROM MONHOC MH
WHERE MH.MAMH NOT IN(
SELECT KQT.MAMH
FROM KETQUATHI KQT 
WHERE KQT.LANTHI=(SELECT MAX(KQ.LANTHI)
FROM KETQUATHI KQ
GROUP BY KQ.MAHV, KQ.MAMH
HAVING KQ.MAHV=KQT.MAHV AND KQ.MAMH=KQT.MAMH
) AND KQT.KQUA='Dat' AND KQT.MAMH=MH.MAMH AND KQT.MAHV=HV.MAHV))

/*
	35. Tìm học viên (mã học viên, tên học viên) có điểm thi cao nhất trong từng môn (lấy điểm thi ở lần thi sau cùng)
*/ 
--Tìm danh sách từng môn cao nhất.
--


SELECT KQT.MAMH, KQT.MAHV, HV.HO, HV.TEN, KQT.DIEM
FROM KETQUATHI KQT JOIN HOCVIEN HV ON KQT.MAHV=HV.MAHV
WHERE EXISTS
 (
	SELECT KQ1.MAMH, MAX(KQ1.DIEM)
	FROM KETQUATHI KQ1
	WHERE EXISTS(
		SELECT KQ2.MAHV, KQ2.MAMH, MAX(KQ2.LANTHI)
		FROM KETQUATHI KQ2
		WHERE KQ1.MAMH=KQ2.MAMH AND KQ1.MAHV=KQ2.MAHV
		GROUP BY KQ2.MAHV, KQ2.MAMH
		HAVING MAX(KQ2.LANTHI)=KQ1.LANTHI
	) AND KQT.MAMH=KQ1.MAMH 
	GROUP BY KQ1.MAMH
	HAVING KQT.DIEM=MAX(KQ1.DIEM)
	)

-----------------------------------------------------------------------LAB 05----------------------------------------------------------------- 
/* 
	9. Lớp trưởng của một lớp phải là học viên của lớp đó.
*/

CREATE TRIGGER hocvien_lop_delete_hocvien
ON HOCVIEN
FOR DELETE
AS
BEGIN
	DECLARE @ma_hv char(5), @ma_malop char(3)
	SELECT @ma_hv=MAHV, @ma_malop=MALOP
	FROM deleted
	DECLARE @ma_lop_truong char(5)
	SELECT @ma_lop_truong=TRGLOP
	FROM LOP
	WHERE MALOP=@ma_malop
	IF(@ma_hv=@ma_lop_truong)
	BEGIN
	rollback tran
	print 'hoc vien dang la lop truong, khong the xoa duoc. HOCVIEN DELETE'
	END
END


CREATE TRIGGER hocvien_lop_update_lop
ON LOP
FOR UPDATE 
AS
IF(UPDATE(TRGLOP))
BEGIN
	DECLARE @ma_lop_inserted char(3), @lop_truong_new char(5)
	SELECT @ma_lop_inserted=MALOP, @lop_truong_new=TRGLOP
	FROM inserted

	DECLARE @ma_lop_delete char(3)
	SELECT @ma_lop_delete = MALOP
	FROM HOCVIEN
	WHERE MAHV=@lop_truong_new
	IF(@ma_lop_inserted!=@ma_lop_delete)
	BEGIN
	ROLLBACK TRAN
	PRINT 'khong the doi lop truong, lop truong phai la thanh vien lop do. LOP_UPDATE'
	END
END


CREATE TRIGGER hocvien_lop_update_hocvien
ON HOCVIEN
FOR UPDATE 
AS
BEGIN 
	DECLARE @malop_new char(3), @mahocvien char(5)
	SELECT @malop_new=MALOP, @mahocvien=MAHV -- có được lớp với có được mã học viên đổi lớp 
	FROM inserted
	DECLARE @truong_lop char(5), @ma_lop_old char(3)
	SELECT @truong_lop=TRGLOP, @ma_lop_old=MALOP
	FROM LOP
	WHERE TRGLOP=@mahocvien
	IF(@mahocvien=@truong_lop AND @ma_lop_old!=@malop_new)
	BEGIN
	ROLLBACK TRAN
	PRINT 'Khong the thay doi lop cho hoc vien, hoc vien dang la lop truong. HOCVIEN_UPDATE '
	END
END

SELECT* FROM LOP
UPDATE HOCVIEN
SET MALOP='K12'
WHERE MAHV='K1108'
/* 
	10. Trưởng khoa phải là giáo viên thuộc khoa và có học vị 'TS' hoặc 'PTS'
*/

CREATE TRIGGER giaovien_khoa_giangvien_delete
ON GIAOVIEN 
FOR DELETE
AS
BEGIN 
	DECLARE @ma_gv_xoa char(4), @ma_khoa varchar(4)
	SELECT @ma_gv_xoa=MAGV, @ma_khoa=MAKHOA
	FROM deleted
	DECLARE @matrgkhoa char(4)
	SELECT @matrgkhoa=TRGKHOA
	FROM KHOA
	WHERE MAKHOA=@ma_khoa
	IF(@ma_gv_xoa=@matrgkhoa)
	BEGIN 
	ROLLBACK TRAN
	PRINT 'khong the xoa giao vien, giao vien dang la truong khoa. GIAOVIEN_DELETE'
	END
END

CREATE TRIGGER giaovien_khoa_giangvien_update
ON GIAOVIEN
FOR UPDATE
AS
BEGIN
	DECLARE @ma_gv_update char(4), @ma_khoa_update varchar(4)
	SELECT @ma_gv_update=MAGV
	FROM inserted

	DECLARE @matruongkhoa varchar(4)
	SELECT @matruongkhoa=TRGKHOA
	FROM KHOA
	WHERE TRGKHOA=@ma_gv_update
	IF(@ma_gv_update=@matruongkhoa)
	BEGIN 
	ROLLBACK TRAN
	PRINT 'khong the thay doi khoa cho giao vien, giao vien la truong khoa. GIAOVIEN_ UPDATE'
	END
END

CREATE TRIGGER giaovien_khoa_khoa_update
ON KHOA
FOR UPDATE 
AS
IF(UPDATE(TRGKHOA))
BEGIN 
	DECLARE @ma_truogkhoa_new char(4), @ma_khoa_new varchar(4)
	SELECT @ma_truogkhoa_new = TRGKHOA, @ma_khoa_new=MAKHOA
	FROM inserted
	DECLARE @ma_khoa_old varchar(4), @hoc_vi varchar(10)
	SELECT @ma_khoa_old=MAKHOA, @hoc_vi=HOCVI
	FROM GIAOVIEN
	WHERE MAGV=@ma_truogkhoa_new
	if(@ma_khoa_new!=@ma_khoa_old OR (@hoc_vi!='TS' AND @hoc_vi!='PTS'))
	BEGIN 
		ROLLBACK TRAN
		PRINT 'dieu kien khong phu hop de thay doi truong khoa. KHOA UPDATE'
	END
END

/*
	15. Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này
*/
DROP TRIGGER kqt_hv_gd_ketquathi_insert

CREATE TRIGGER kqt_hv_gd_ketquathi_insert
ON KETQUATHI
FOR INSERT
AS
BEGIN 
	DECLARE @ma_mon_hoc_insert varchar(10), @ma_hocvien_insert char(5), @ma_lop_insert char(3), @ngay_thi smalldatetime
	SELECT @ma_hocvien_insert=MAHV, @ma_mon_hoc_insert=MAMH, @ngay_thi=NGTHI
	FROM inserted
	SELECT @ma_lop_insert=MALOP
	FROM HOCVIEN
	WHERE HOCVIEN.MAHV=@ma_hocvien_insert
	DECLARE @ngay_ket_thuc smalldatetime
	SELECT @ngay_ket_thuc=DENNGAY
	FROM GIANGDAY GD JOIN HOCVIEN HV ON GD.MALOP=HV.MALOP JOIN KETQUATHI KQT ON KQT.MAMH=GD.MAMH
	WHERE HV.MAHV=@ma_hocvien_insert AND GD.MAMH=@ma_mon_hoc_insert AND HV.MALOP=@ma_lop_insert
	IF(@ngay_ket_thuc>@ngay_thi)
	BEGIN
		ROLLBACK TRAN
		PRINT 'khong the them ket qua thi, ngay thi phai lon hon ngay ket thuc mon hoc. KETQUATHI_INSERT'
	END
END



CREATE TRIGGER kqt_hv_gd_ketquathi_update
ON KETQUATHI
FOR UPDATE
AS
IF(UPDATE(NGTHI))
BEGIN
	DECLARE @ngay_thi_update smalldatetime, @ma_hv_update char(5), @ma_lop_update char(3), @ma_mh_update varchar(10)
	SELECT @ngay_thi_update=NGTHI, @ma_hv_update=MAHV, @ma_mh_update=MAMH
	FROM inserted
	SELECT @ma_lop_update=MALOP
	FROM HOCVIEN
	WHERE MAHV=@ma_hv_update
	DECLARE @ng_ket_thuc smalldatetime
	SELECT @ng_ket_thuc=DENNGAY
	FROM GIANGDAY GD JOIN HOCVIEN HV ON GD.MALOP=HV.MALOP JOIN KETQUATHI KQT ON KQT.MAMH=GD.MAMH
	WHERE HV.MALOP=@ma_lop_update AND GD.MAMH=@ma_mh_update AND HV.MAHV = @ma_hv_update 
	IF(@ng_ket_thuc>@ngay_thi_update)
	BEGIN
		ROLLBACK TRAN
		PRINT 'khong the thay doi ngay thi, ngay thi phai lon hon ngay ket thuc hoc phan. KETQUATHI_UPDATE'
	END
END

CREATE TRIGGER kqt_hv_gd_hocvien_update
ON HOCVIEN
FOR UPDATE 
AS 
IF(UPDATE(MALOP))
BEGIN 
	DECLARE @ma_lop_update char(3), @ma_hv_update char(5), @ma_mon_update varchar(10)
	SELECT @ma_lop_update=MALOP, @ma_hv_update=MAHV
	FROM inserted
	SELECT @ma_mon_update=MAMH
	FROM HOCVIEN HV JOIN KETQUATHI KQT ON HV.MAHV=KQT.MAHV
	WHERE HV.MAHV=@ma_hv_update AND MALOP=@ma_lop_update
	DECLARE @ma_lop_old char(3)
	SELECT @ma_lop_old=MALOP
	FROM KETQUATHI KQT JOIN GIANGDAY GD ON KQT.MAMH=GD.MAMH
	WHERE MAHV=@ma_hv_update AND GD.MAMH=@ma_mon_update
	IF(@ma_lop_update!=@ma_lop_old)
	BEGIN 
		ROLLBACK TRAN
		PRINT 'khong the thay doi duoc lop, hoc vien bi rang buoc giua ket qua thi va giang day. HOCVIEN_UPDATE'
	END
END

CREATE TRIGGER kqt_hv_gd_giangday_update
ON GIANGDAY
FOR UPDATE 
AS
IF(UPDATE(DENNGAY))
BEGIN 
	DECLARE @den_ngay_update smalldatetime, @ma_lop_update char(3), @ma_mh_update varchar(10) 
	SELECT @den_ngay_update=DENNGAY, @ma_lop_update=MALOP, @ma_mh_update=MAMH
	FROM inserted
	DECLARE @ngay_thi smalldatetime
	SELECT @ngay_thi=NGTHI
	FROM KETQUATHI KQT JOIN HOCVIEN HV ON KQT.MAHV=HV.MAHV
	WHERE KQT.MAMH=@ma_mh_update AND HV.MALOP=@ma_lop_update
	IF(@ngay_thi<@den_ngay_update)
	BEGIN 
		ROLLBACK TRAN
		PRINT 'khong the thay doi DENNGAY cua GIANGDAY, DENNGAY phai be hon NGAY THI. GIANGDAY_UPDATE'
	END
END

/*
	16. Mỗi học kỳ của một môn học, một lớp chỉ được học tối đa 3 môn
*/
SELECT* FROM HOCVIEN
SELECT* FROM KETQUATHI

SELECT HV.MAHV, HV.HO, HV.TEN, MAMH, KQT.DIEM
FROM HOCVIEN HV JOIN KETQUATHI KQT ON HV.MAHV=KQT.MAHV
WHERE HV.MAHV='K1101'
GROUP BY HV.MAHV, HV.HO, HV.TEN, MAMH, KQT.DIEM
ORDER BY KQT.MAMH

SELECT GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM, COUNT(GD.MAMH) SO_mh
FROM GIAOVIEN GV JOIN GIANGDAY GD ON GV.MAGV = GD.MAGV
GROUP BY GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM

SELECT GD.MAMH
FROM GIAOVIEN GV JOIN GIANGDAY GD ON GV.MAGV=GD.MAGV JOIN MONHOC MH ON GD.MAMH=MH.MAMH
WHERE GV.MAGV='GV01' OR (MH.TCLT+MH.TCTH>=5)

SELECT HV.MAHV
FROM HOCVIEN HV
WHERE NOT EXISTS (
	SELECT*
	FROM MONHOC MH2
	WHERE NOT EXISTS(
		SELECT MH.MAMH
		FROM MONHOC MH JOIN KETQUATHI KQT ON KQT.MAMH= MH.MAMH
		WHERE MH2.MAMH=MH.MAMH AND KQT.MAHV=HV.MAHV
		)
)

--Tính tổng số thành viên trong lớp. 
SELECT SISO=COUNT(MAHV)
FROM LOP L JOIN HOCVIEN HV ON L.MALOP=HV.MALOP
WHERE L.MALOP='K11'

