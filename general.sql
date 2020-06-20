
/*renting comics*/
--block one

CREATE TABLE `client` (
	`id` int UNSIGNED  NOT NULL AUTO_INCREMENT,
	`lastname` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`middlename` varchar(255),
	`phone` int(255) NOT NULL,
	`email` varchar(255),
	PRIMARY KEY (`id`)
);

CREATE TABLE `comics` (
	`id` int UNSIGNED  NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`price` FLOAT NOT NULL,
	`instock` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `comic_author` (
	`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`comic_id` int UNSIGNED NOT NULL,
	`author_id` int UNSIGNED  NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `author` (
	`id` int UNSIGNED  NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`lastname` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `employees` (
	`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`lastname` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`middlename` varchar(255),
	`dateofbirth` DATE,
	`position` varchar(255) NOT NULL,
	`salary` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` int,
	PRIMARY KEY (`id`)
);

CREATE TABLE `rent` (
	`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`employee_id` int UNSIGNED NOT NULL,
	`client_id` int UNSIGNED NOT NULL,
	`comics_id` int UNSIGNED NOT NULL,
	`date_start` DATE NOT NULL,
	`date_end` DATE NOT NULL,
	`price` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `comic_author` ADD CONSTRAINT `comic_author_fk0` FOREIGN KEY (`comic_id`) REFERENCES `comics`(`id`);

ALTER TABLE `comic_author` ADD CONSTRAINT `comic_author_fk1` FOREIGN KEY (`author_id`) REFERENCES `author`(`id`);

ALTER TABLE `rent` ADD CONSTRAINT `rent_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employees`(`id`);

ALTER TABLE `rent` ADD CONSTRAINT `rent_fk1` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`);

ALTER TABLE `rent` ADD CONSTRAINT `rent_fk2` FOREIGN KEY (`comics_id`) REFERENCES `comics`(`id`);

--block two 

create view `clients_who_didnt_return` as
	select concat_ws(' ', t.name, t.lastname) AS client_name, t.phone, t.email, s.name as `comics`, r.date_end
	from `client` AS t, `comics` as s, `rent` as r
	where r.client_id = t.id and r.comics_id = s.id and CURDATE() > r.date_end 
	order by r.date_end;

create view `comics_out_of_stock` as
	select name, instock 
	from `comics`
	where instock = 0;


-- block three

--drop view `clients_who_didnt_return`;
--drop view `comics_out_of_stock`;
--drop table `rent`;
--drop table `employees`;
--drop table `author`;
--drop tBble `comic_author`;
--drop tBble `comics`;
--drop tBble `client`;


--block four

--select * from `rent` order by id asc;
--select * from `employees` order by id asc;
--select * from `author` order by id asc;
--select * from `comics` order by id asc;
--select * from `client` order by id asc;

--block five 

-- client
select `id`, `lastname`, `name` from `client` where `name`= 'client_name';
insert into `client` (`lastname`,`name`,`middlename`,`phone`,`email`) values ('lastname', 'name', 'middle', 1234567890, 'name@example.com');
update `client` set `name` = 'proper_name' where `id` = 1 limit 1;
delete from `client` where `id` = 1 limit 1;

-- comics
select `id`, `name`, `price`, `instock` from `comics` where `name`= 'comic_name';
insert into `comics` (`name`,`price`,`instock`) values ('comic_name', 000.00, 1);
update `comics` set `name` = 'proper_name' where `id` = 1 limit 1;
delete from `comics` where `id` = 1 limit 1;

-- comic author 
select `id`, `comic_id`, `author_id` from `comic_author` where `name`= 'comic_name';
insert into `comic_author` (`comic_id`,`author_id`) values ( 1, 1);
update `comic_author` set `comic_id` = 1 where `id` = 1 limit 1;
delete from `comic_author` where `id` = 1 limit 1;

-- employees
select `id`, `lastname`,`name`,`middlename`,`dateofbirth`,`position`,`salary`,`email`, `phone` from `employees` where `name`= 'employee_name';
insert into `employees` (`lastname`,`name`,`middlename`,`dateofbirth`,`position`,`salary`,`email`, `phone`) values ('lastname', 'name', 'middle', 'yyyy-mm-dd', 'position', 00000, 'smthh@smth.com', 0123456789);
update `employees` set `name` = 'proper_name' where `id` = 1 limit 1;
delete from `employees` where `id` = 1 limit 1;

-- rent 
select `id`, `employee_id`,`client_id`,`comics_id`,`date_start`,`date_end`, `price` 
from `client` as t, `comics` as s, `rent` as r
where `date_start`= 'yyyy-mm-dd' and r.client_id = t.id and r.comics_id = s.id;
insert into `rent` (`employee_id`,`client_id`,`comics_id`,`date_start`,`date_end`, `price`) values (0, 0, 0, 'yyyy-mm-dd', 'yyyy-mm-dd', 000.0)
update `rent` set `date_start` = 'yyyy-mm-dd' where `id` = 1 limit 1;
delete from `rent` where `id` = 1 limit 1;