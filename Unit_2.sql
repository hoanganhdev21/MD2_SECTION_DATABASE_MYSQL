create database Unit_2;

-- Sử dụng database
use Unit_2; 

-- Tạo bảng
create table Customer (
cID char(5) primary key unique,
cName varchar(50) not null,
cAge int check(cAge >=18)
);

create table Orders (
oID char(5) primary key unique,
cID char(5) not null unique,
cDate timestamp not null,
oTotalPrice varchar(50)
);

create table Product(
pID char(5) primary key unique,
pName varchar(50) not null unique,
pPrice float not null
);

create table OrdersDetail(
oID char(5),
pID char(5),

-- FK
foreign key (oID) references Orders(oID),
foreign key (pID) references Product(pID),

-- PK
primary key(oID, pID)
);

alter table Orders Add constraint fk_Order_Detail foreign key (cID) references Customer(cID);
 