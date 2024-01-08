CREATE DATABASE QUANLYDIEMSINHVIEN;
USE QUANLYDIEMSINHVIEN;

-- DANH MỤC KHOA
Create table DMKhoa(
	MaKhoa char(2) primary key,
	TenKhoa nvarchar(30)not null
);

-- DANH MỤC SINH VIÊN
Create table DMSV(
MaSV char(3) not null primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7)not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar (20),
MaKhoa char(2),
HocBong float
);

-- MÔN HỌC
create table DMMH(
MaMH char (2) not null,
TenMH nvarchar (25)not null,
SoTiet tinyint,
Constraint DMMH_MaMH_pk primary key(MaMH)
);

-- KẾT QUẢ
Create table KetQua
(
MaSV char(3) not null,
MaMH char (2)not null ,
LanThi tinyint,
Diem decimal(4,2),
Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV,MaMH,LanThi)
);

-- CREATE FOREIGN KEY
Alter table dmsv
add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
References DMKhoa (MaKhoa);
Alter table KetQua
add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);


-- INPUT DATA
-- INPUT DATA DMMH
Insert into DMMH(MaMH,TenMH,SoTiet)
values('01','Cơ Sở Dữ Liệu',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('02','Trí Tuệ Nhân Tạo',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('03','Truyền Tin',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('04','Đồ Họa',60);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('05','Văn Phạm',60);

-- INPUT DATA DMKhoa
Insert into DMKhoa(MaKhoa,TenKhoa)
values('AV','Anh Văn');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TH','Tin Học');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TR','Triết');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('VL','Vật Lý');

-- INPUT DATA DMSV
Insert into DMSV
values('A01','Nguyễn Thị','Hải','Nữ','1990-03-20','Hà Nội','TH',130000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02','Trần Văn','Chính','Nam','1992-12-24','Bình Định','VL',150000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03','Lê Thu Bạch','Yến','Nữ','1990-02-21','TP Hồ Chí Minh','TH',170000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04','Trần Anh','Tuấn','Nam','1990-12-20','Hà Nội','AV',80000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01','Trần Thanh','Mai','Nữ','1991-08-12','Hải Phòng','TR',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02','Trần Thị Thu','Thủy','Nữ','1991-01-02','TP Hồ Chí Minh','AV',0);

-- INPUT DATA RESULT
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','02',1,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10);

-- QUERRY SQL
-- 1.  
select * FROM DMSV;
SELECT sv.MaSV, sv.HoSV, sv.TenSV, sv.HocBong
FROM dmsv sv
ORDER BY sv.MaSV ASC;

-- 2. 
SELECT sv.MaSV, sv.HoSV, sv.TenSV, sv.Phai, sv.NgaySinh
FROM dmsv sv
ORDER BY sv.Phai ASC; 

-- 3. 
SELECT sv.HoSV, sv.TenSV, sv.NgaySinh, sv.HocBong
FROM dmsv sv
ORDER BY sv.NgaySinh ASC, sv.HocBong desc;

-- 4.
select * from dmmh;
SELECT m.MaMH, m.TenMH, m.SoTiet
FROM DMMH m
WHERE TenMH LIKE 'T%'
ORDER BY TenMH;

-- 5.
SELECT sv.HoSV, sv.TenSV, sv.Phai
FROM dmsv sv
WHERE sv.TenSV LIKE '%i'
ORDER BY sv.TenSV;

-- 6.
SELECT * FROM dmkhoa;
SELECT k.MaKhoa, k.TenKhoa
FROM dmkhoa k
WHERE k.TenKhoa LIKE '_n%'
ORDER BY k.TenKhoa;

-- 7.
SELECT sv.MaSV, sv.HoSV, sv.TenSV, MaKhoa, sv.HocBong
FROM dmsv sv 
WHERE sv.HoSV LIKE '%Thi%';

-- 8. 
SELECT sv.MaSV, sv.TenSV, MaKhoa, sv.HocBong
FROM dmsv sv 
WHERE sv.HocBong > 100000
ORDER BY MaKhoa DESC;

-- 9.
SELECT sv.MaSV, sv.HoSV, sv.TenSV, sv.MaKhoa, sv.NoiSinh, sv.HocBong
FROM dmsv sv 
WHERE sv.HocBong >= 130000 AND sv.NoiSinh = 'Ha Noi';

-- 10. 
SELECT * FROM dmsv;
SELECT sv.MaSV, sv.MaKhoa, sv.Phai
FROM dmsv sv
INNER JOIN dmkhoa ON sv.MaKhoa = dmkhoa.MaKhoa
WHERE dmkhoa.MaKhoa IN ('AV', 'VL');

-- 11.
SELECT sv.MaSV, sv.NgaySinh, sv.NoiSinh, sv.HocBong
FROM dmsv sv 
WHERE sv.NgaySinh BETWEEN '1991-01-02' AND '1991-08-12';

-- 12.
SELECT sv.MaSV, sv.NgaySinh, sv.NoiSinh, sv.HocBong
FROM dmsv sv 
WHERE sv.HocBong BETWEEN '80000' AND '150000';

-- 13.
SELECT * FROM dmmh;
SELECT m.MaMH, m.TenMH, m.SoTiet
FROM dmmh m
WHERE m.SoTiet >= 30 AND m.SoTiet <= 45;

-- 14. 
SELECT sv.MaSV, sv.HoSV, sv.TenSV, kh.TenKhoa, sv.Phai
FROM dmsv sv
INNER JOIN dmkhoa kh ON sv.MaKhoa = kh.MaKhoa
WHERE kh.TenKhoa IN ('Anh Văn', 'Vật Lý') AND sv.Phai = 'Nam';

-- 15. 
SELECT sv.HoSV, sv.TenSV, sv.Phai
FROM dmsv sv
WHERE sv.Phai ='Nữ' and sv.TenSV LIKE '%n%';

-- 16. 
SELECT sv.HoSV, sv.TenSV, sv.NoiSinh, sv.NgaySinh
FROM dmsv sv
WHERE sv.NoiSinh ='Hà Nội' AND month(sv.NgaySinh) = 03;

-- 17. 
SELECT sv.HoSV, sv.TenSV, sv.NoiSinh, sv.NgaySinh
FROM dmsv sv
WHERE sv.NgaySinh > 20;

-- 18. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
SELECT sv.HoSV, sv.TenSV, kh.TenKhoa, sv.NgaySinh
FROM dmsv sv
INNER JOIN dmkhoa kh ON sv.MaKhoa = kh.MaKhoa
WHERE YEAR(CURRENT_DATE()) - YEAR(sv.NgaySinh) BETWEEN 30 AND 33;

-- 19. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên,Phái, Ngày sinh.
SELECT sv.HoSV, sv.Phai, sv.NgaySinh
FROM dmsv sv
WHERE MONTH(sv.NgaySinh) BETWEEN 3 AND 5 AND YEAR(sv.NgaySinh) = 1990;

-- 20. .Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”
SELECT sv.MaSV, sv.Phai, sv.MaKhoa,
  CASE
    WHEN sv.HocBong > 500000 THEN 'Học bổng cao'
    ELSE 'Mức trung bình'
  END AS 'Mức Học Bổng'
FROM dmsv sv;