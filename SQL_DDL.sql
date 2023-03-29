create table (
	id serial primary key,
	employee_name varchar(50) not null
);

insert into employees (employee_name)
values ('Richard'),
('Monica'),
('Chandler'),
('Rachel'),
('Ellen'),
('Stephan'),
('Edward'),
('Taylor'),
('Britney'),
('Maria'),
('Bob'),
('Jessica'),
('Jennifer'),
('Wendy'),
('Joe'),
('Barak'),
('Kanye'),
('Vadim'),
('Mila'),
('Rocki'),
('Orlando'),
('Katy'),
('Elithabeth'),
('Robert'),
('Alex'),
('Nick'),
('Justin'),
('Opra'),
('Ben'),
('Jimmy'),
('Andy'),
('Norma'),
('Janet'),
('Teri'),
('Lynette'),
('Donna'),
('Larry'),
('David'),
('Sam'),
('Isis'),
('Kim'),
('Travis'),
('Chloe'),
('Emma'),
('Eva'),
('Rayan'),
('Bill'),
('Whoppi'),
('Marlee'),
('Kendal'),
('Reign'),
('Tomas'),
('Debra'),
('Dion'),
('Nickole'),
('Mandy'),
('Paul'),
('Ruth'),
('Eduardo'),
('Roberto'),
('Susanne'),
('Chris'),
('Jean'),
('Nency'),
('Matt'),
('Joel'),
('July'),
('Robert'),
('Kaley'),
('North');

select * from employees;

create table salary (
	id serial primary key,
	monthly_salary int not null
);

insert into salary (monthly_salary)
	values (1000),
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

select * from salary;

create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	с int not null
);

insert into employee_salary (employee_id, salary_id)
values 
(17, 10),
(1, 4), 
(3, 6),
(14, 12),
(4, 16),
(5, 15),
(26, 8),
(8, 11),
(9, 3),
(20, 13),
(11, 8),
(7, 2),
(12, 9),
(13, 10),
(15, 13),
(16, 14),
(18, 11),
(22, 15),
(19, 12),
(21, 14),
(39, 2),
(23, 16),
(24, 5),
(25, 7),
(2, 5),
(101, 5),
(100, 9),
(102, 1),
(103, 2),
(104, 3),
(105, 7),
(106, 4),
(107, 3),
(108, 12),
(109, 9),
(40, 1),
(36, 14),
(37, 11),
(38, 7),
(6, 4);

select * from employee_salary;

create table roles (
id serial primary key,
role_name int not null unique
);

ALTER table roles ALTER COLUMN role_name type varchar(30);

insert into roles (role_name)
values 
('Junior Python developer'),
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

select * from roles;

create table roles_employee (
	id serial primary key,
	employee_id int not null,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

insert into roles_employee (employee_id, role_id)
values 
(26, 19), 
(3, 17),
(24, 5),
(4, 16),
(6, 4),
(11, 8),
(8, 11),
(23, 16),
(9, 3),
(10, 16),
(12, 9),
(36, 14),
(2, 5),
(14, 12),
(16, 17),
(17, 10),
(40, 1),
(19, 12),
(20, 13),
(21, 14),
(13, 10),
(22, 18),
(32, 3),
(25, 7),
(7, 2),
(27, 9),
(28, 1),
(29, 2),
(5, 15),
(30, 19),
(33, 20),
(34, 9),
(1, 4),
(35, 5),
(37, 11),
(15, 13),
(38, 7),
(39, 2),
(31, 4),
(18, 6);

select * from roles_employee;

