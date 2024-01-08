create database data_test2;

create table `data_test2`.`student` (
`id` INT NOT NULL AUTO_INCREMENT ,
`name` NVARCHAR(20) NOT NULL,
`age` INT NOT NULL,
`country` NVARCHAR(50) NOT NULL,
primary key (`id`)
);

alter table `data_test2`.`student`
add `gmail` nvarchar(20) not null
;

INSERT INTO `data_test2`.`student`(`name`,`age`,`country`)VALUES('HOÀNG ANH 1','22','Ninh Bình');

