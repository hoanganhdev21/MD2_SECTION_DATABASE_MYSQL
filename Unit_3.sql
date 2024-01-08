create database Unit_3;

-- Sử dụng database
use Unit_3; 

-- Tạo bảng
CREATE TABLE DVKHACH (
MADV CHAR(5) PRIMARY KEY UNIQUE,
TENDV VARCHAR(50) NOT NULL UNIQUE,
DIACHI TEXT NOT NULL,
DIENTHOAI VARCHAR(10)
);

CREATE TABLE NGUOIDAT(
MASOND CHAR(5) PRIMARY KEY UNIQUE,
MADV CHAR(5) NOT NULL unique,
HOTENND VARCHAR(30) NOT NULL
);

ALTER TABLE NGUOIDAT ADD constraint PK_NGUOIDAT_DVKHACH foreign key (MADV) references DVKHACH(MADV);

CREATE TABLE HANG (
MAHANG CHAR(5) PRIMARY KEY UNIQUE,
TENHANG VARCHAR(50) NOT NULL UNIQUE,
DONVITINH VARCHAR(10) NOT NULL,
MOTAHANG TEXT NOT NULL
);

CREATE TABLE DAT(
MASOND CHAR(5),
MAHANG CHAR(5),
-- foreign key
foreign key (MASOND) references NGUOIDAT(MASOND),
foreign key (MAHANG) references HANG(MAHANG),
-- primary key 
PRIMARY KEY (MASOND, MAHANG) 
);

ALTER TABLE DAT
ADD COLUMN SODH CHAR(5) UNIQUE;
ALTER TABLE DAT
ADD COLUMN NGAYDAT DATE NOT NULL;
ALTER TABLE DAT
ADD COLUMN SOLUONG INT NOT NULL;

CREATE TABLE NGUOIGIAO (
MASONG CHAR(5) PRIMARY KEY UNIQUE,
HOTENNG VARCHAR(50) NOT NULL
);

CREATE TABLE NOIGIAO(
MASODDG CHAR(5) PRIMARY KEY UNIQUE,
TENNOIGIAO TEXT
);

CREATE TABLE NGUOINHAN(
MASONN CHAR(5) PRIMARY KEY UNIQUE,
HOTENNN VARCHAR(5) NOT NULL
);

ALTER TABLE NGUOINHAN
ADD COLUMN MADV CHAR(5) NOT NULL UNIQUE;

ALTER TABLE NGUOINHAN ADD CONSTRAINT FK_NGUOINHAN_DONVIDH FOREIGN KEY (MADV) references DVKHACH(MADV);

CREATE TABLE GIAO(
MAHANG CHAR(5),
MASONG CHAR(5),
MASODDG CHAR(5),
MASONN CHAR(5),
SOPG INT NOT NULL,
NGAYGIAO DATE NOT NULL,
SOLUONG INT NOT NULL, 
DONGIA FLOAT,

-- foreign key
foreign key (MAHANG) references HANG(MAHANG),
foreign key (MASONG) references NGUOIGIAO(MASONG),
foreign key (MASODDG) references NOIGIAO(MASODDG),
foreign key (MASONN) references NGUOINHAN(MASONN),
-- primary key
PRIMARY KEY (MAHANG,MASONG,MASODDG,MASONN)
);