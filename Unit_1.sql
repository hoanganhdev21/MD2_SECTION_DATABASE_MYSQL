-- 1. create database Unit1
Create database Unit_1;

-- 2. use database
use Unit_1;

-- 3. create table
-- Phiếu xuất
create table export_bill (
number_bill int primary key auto_increment,
bill_date timestamp
);
-- Vật tư
create table supplies(
supplies_id char(5) primary key,
supplies_name varchar(50) not null unique
);

create table export_bill_supplies(
number_bill int,
supplies_id char(5),
export_unit_price varchar(50),
export_quantity int,

-- FK
foreign key (number_bill) references export_bill(number_bill),
foreign key (supplies_id) references supplies(supplies_id),

-- PK 
primary key(number_bill, supplies_id)
);

-- Phiếu nhập
create table coupon (
number_coupon int primary key,
coupon_date timestamp
);

create table supplies_coupon(
supplies_id char(5),
number_coupon int,
input_unit_price varchar(50),
number_of_import int,

-- FK
foreign key (supplies_id) references supplies(supplies_id),
foreign key (number_coupon) references coupon(number_coupon),

-- PR
primary key(supplies_id, number_coupon)
);

-- Đơn đặt hàng
create table orders (
orders_id int primary key,
orders_date timestamp not null
);

create table supplies_orders(
supplies_id char(5),
orders_id int,
-- FK
foreign key (supplies_id) references supplies(supplies_id),
foreign key (orders_id) references orders(orders_id),
-- PR
primary key(supplies_id, orders_id)
);

-- Nhà cung cấp
create table supplier (
supplier_id int primary key,
supplier_name varchar(50) unique not null,
supplier_address text,
supplier_phone varchar(10)
);

alter table orders 
add column supplier_id int;

-- Thêm khoá ngoại tham chiếu từ order đến supplier 
ALTER TABLE orders ADD CONSTRAINT fk_orders_supplier FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id);

