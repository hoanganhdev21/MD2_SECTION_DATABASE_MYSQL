-- 1. Tạo cơ sở dữ liệu Student_Management
create database Student_Management;

-- 2. Sử dụng cơ sở dữ liệuninstall
use Student_Management;

-- 3. Xoá database
drop database Student_Management;
-- 4. Tạp bảng lớp gồm các
create table class(
class_id int primary key auto_increment,
class_name varchar(20) not null unique,
class_status bit default(1)
);


-- 5. 
create table student(
student_id char(5) primary key,
student_name varchar(50) not null,
age int check(age>=18),
address text,
sex bit default(1),
student_status bit default(1)
);

-- 6. Tạo bảng class_student
create table class_student(
class_id int ,
student_id char(5),
-- FK
foreign key (class_id) references class(class_id),
foreign key (student_id) references student(student_id),
-- PK
primary key (student_id, class_id)

);
-- 7. Thêm cột email vào bảng student
alter table student 
add column email varchar(50);

-- 8. Sưa kiểu dữ liệu
alter table student 
modify column email text;

-- 9. Xoá cột email trong student
alter table student 
drop column email;

-- 10. Thêm contrains cho 1 cột: thêm unique cho student_name
alter table student add constraint unique_student_name unique(student_name);

-- 11. Xoá constraint unique trên strudent_name
alter table student drop constraint unique_student_name;

-- 12. Xoá bảng student
drop table student;