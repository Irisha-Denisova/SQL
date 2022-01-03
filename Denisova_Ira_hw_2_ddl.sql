create table employers (
	id serial primary key,
	employer_name varchar(50) not null
);

select * from epmloyers;

--drop table employers; 

--Наполнить таблицу employee 70 строками.
insert into employers(employer_name)
	values('name1'),
		('name2'),
		('name3'),
		('name4'),
		('name5'),
		('name6'),
		('name7'),
		('name8'),
		('name9'),
		('name10'),
		('name11'),
		('name12'),
		('name13'),
		('name14'),
		('name15'),
		('name16'),
		('name17'),
		('name18'),
		('name19'),
		('name20'),
		('name21'),
		('name22'),
		('name23'),
		('name24'),
		('name25'),
		('name26'),
		('name27'),
		('name28'),
		('name29'),
		('name30'),
		('name31'),
		('name32'),
		('name33'),
		('name34'),
		('name35'),
		('name36'),
		('name37'),
		('name38'),
		('name39'),
		('name40'),
		('name41'),
		('name42'),
		('name43'),
		('name44'),
		('name45'),
		('name46'),
		('name47'),
		('name48'),
		('name49'),
		('name50'),
		('name51'),
		('name52'),
		('name53'),
		('name54'),
		('name55'),
		('name56'),
		('name57'),
		('name58'),
		('name59'),
		('name60'),
		('name61'),
		('name62'),
		('name63'),
		('name64'),
		('name65'),
		('name66'),
		('name67'),
		('name68'),
		('name69'),
		('name70');
	
select * from employers;	

	
--Создать таблицу salary
create table salary_1(
	id serial primary key,
	monthly_salary int not null
	);

--Наполнить таблицу salary 15 строками:
insert into salary_1(monthly_salary)
	values(1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	
select * from salary_1;

--drop table employer_salary;

--Создать таблицу employee_salary
create table employer_salary(
	id serial primary key,
	employer_id int not null unique,
	salary_id int not null
);

select * from employer_salary;

--Наполнить таблицу employer_salary 40 строками:(в 10 строк из 40 вставить несуществующие employer_id)

insert into employer_salary (employer_id, salary_id)
	values(1, 2),
		(2, 4),
		(3, 2),
		(4, 3),
		(5, 10),
		(6, 4),
		(7, 6),
		(8, 8),
		(9, 1),
		(10, 9),
		(11, 14),
		(12, 15),
		(13, 1),
		(14, 2),
		(15, 3),
		(16, 7),
		(17, 5),
		(18, 6),
		(19, 7),
		(20, 8),
		(21, 9),
		(22, 10),
		(23, 11),
		(24, 12),
		(25, 13),
		(26, 14),
		(27, 15),
		(28, 1),
		(29, 2),
		(71, 3),
		(72, 4),
		(73, 5),
		(74, 6),
		(75, 7),
		(76, 8),
		(77, 9),
		(78, 10),
		(79, 11),
		(80, 12),
		(81, 13);

	
select * from employer_salary;


create table roles_1(
	id serial primary key,
	role_name int unique not null
);

select * from roles_1;


alter table roles_1
alter column role_name type varchar(30);


insert into roles_1 (role_name)
	values('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

select * from roles_1;


create table roles_employer(
	id serial primary key,
	employer_id int not null unique,
	role_id int not null,
	foreign key (employer_id)
		references employers (id),
	foreign key (role_id)
		references roles_1 (id)
);

select * from roles_employer;

insert into roles_employer(employer_id, role_id)
values(1, 2),
	(2, 4),
	(3, 9),
	(4, 13),
	(5, 4),
	(6, 2),
	(7, 9),
	(8, 13),
	(9, 3),
	(10, 4),
	--10
	(11, 15),
	(12, 16),
	(13, 1),
	(14, 3),
	(15, 4),
	(16, 7),
	(17, 8),
	(18, 10),
	(19, 11),
	(20, 13),
	--20
	(21, 17),
	(22, 14),
	(23, 13),
	(24, 5),
	(25, 6),
	(26, 17),
	(27, 9),
	(28, 5),
	(29, 15),
	(30, 19),
	--30
	(31, 8),
	(32, 15),
	(33, 7),
	(34, 3),
	(35, 1),
	(36, 2),
	(37, 10),
	(38, 13),
	(39, 14),
	(40, 6);
	
select * from roles_employer;

--drop table employer_salary; 

