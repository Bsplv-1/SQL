/*Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками.
*/
CREATE TABLE employees (
	id serial PRIMARY KEY,
	employee_name varchar(50) NOT NULL	
);

insert into employees (employee_name) values
	('Richard'),
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

/*Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
Наполнить таблицу salary 15 строками:
*/
create table salary (
	id serial primary key,
	monthly_salary int not null
);

insert into salary (monthly_salary) values
	(500),
	(700),
	(1000),
	(1200),
	(1500),
	(1700),
	(2000),
	(2500),
	(3000),
	(3500),
	(4000),
	(4500),
	(5000),
	(5500),
	(6000);

select * from salary;

/*Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
*/
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

/*Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
*/
insert into employee_salary (employee_id, salary_id) values
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10),
	(11,11),
	(12,12),
	(13,13),
	(14,14),
	(15,15),
	(16,1),
	(17,2),
	(18,3),
	(19,4),
	(20,5),
	(21,6),
	(22,7),
	(23,8),
	(24,9),
	(25,10),
	(26,11),
	(27,12),
	(28,13),
	(29,14),
	(30,15),
	(100,6),
	(101,7),
	(102,1),
	(103,9),
	(104,4),
	(105,8),
	(106,6),
	(107,5),
	(108,2),
	(109,3);
	
/*Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
*/
create table roles (
	id serial primary key,
	role_name int not null unique
);

/*Поменять тип столба role_name с int на varchar(30)
 */
alter table roles 
alter column role_name type varchar(30);

/*Наполнить таблицу roles 20 строками:
 */
insert into roles (role_name) values 
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
	
/*Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
*/
create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
	role_id int not null, 
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);
	
/*Наполнить таблицу roles_employee 40 строками:
 */
insert into roles_employee (employee_id, role_id) values  
	(20, 1),
	(19, 2),
	(18, 3),
	(17, 4),
	(16, 5),
	(15, 6),
	(14, 7),
	(13, 8),
	(12, 9),
	(11, 10),
	(10, 11),
	(21, 12),
	(22, 13),
	(23, 14),
	(24, 15),
	(25, 16),
	(26, 17),
	(27, 18),
	(28, 19),
	(29, 20);

insert into roles_employee (employee_id, role_id) values
	(30, 1),
	(39, 2),
	(38, 3),
	(37, 4),
	(36, 5),
	(35, 6),
	(34, 7),
	(33, 8),
	(32, 9),
	(31, 10),
	(50, 11),
	(51, 12),
	(52, 13),
	(53, 14),
	(54, 15),
	(55, 16),
	(56, 17),
	(57, 18),
	(58, 19),
	(59, 20);

update employee_salary 
set salary_id = 7
where employee_id = 24;

select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
order by id;
