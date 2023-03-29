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

/*SQL HomeWork 2*/
/*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/
select e.employee_name, s.monthly_salary, r.role_name
from employees e
left join employee_salary es on e.id=es.employee_id 
left join salary s on es.salary_id=s.id
left join roles_employee re on e.id=re.employee_id
left join roles r on r.id=re.role_id
where monthly_salary is not null
;

/*2. Вывести всех работников у которых ЗП меньше 2000.*/
select e.employee_name, s.monthly_salary, r.role_name
from employees e 
left join employee_salary es on e.id=es.employee_id 
left join salary s on es.salary_id=s.id 
left join roles_employee re on e.id=re.employee_id
left join roles r on r.id=re.role_id
where salary_id < 8;

/*3. Вывести все зарплатные позиции, но работник по ним не назначен. 
(ЗП есть, но не понятно кто её получает.)*/
select s.monthly_salary, es.employee_id, e.employee_name 
from employee_salary es 
left join salary s on es.salary_id=s.id 
left join employees e on e.id=es.employee_id
where employee_name is null
;

/*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
(ЗП есть, но не понятно кто её получает.)*/
select s.monthly_salary, es.employee_id, e.employee_name 
from employee_salary es 
left join salary s on es.salary_id=s.id 
left join employees e on e.id=es.employee_id
where employee_name is null and monthly_salary<2000
;

/*5. Найти всех работников кому не начислена ЗП.*/
select e.employee_name, s.monthly_salary
from employee_salary es 
right join salary s on es.salary_id=s.id 
right join employees e on e.id=es.employee_id
where monthly_salary is null
;

/*6. Вывести всех работников с названиями их должности.*/
select e.employee_name, r.role_name
from employees e
LEFT join employee_salary es on e.id=es.employee_id 
LEFT join roles_employee re on e.id=re.employee_id
LEFT join roles r on r.id=re.role_id
where role_name is not NULL
;

/*7. Вывести имена и должность только Java разработчиков*/
select e.employee_name, r.role_name
from employees e
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Java developer'
;

/*8. Вывести имена и должность только Python разработчиков.*/
select e.employee_name, r.role_name
from employees e
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Python developer'
;

/*9. Вывести имена и должность всех QA инженеров.*/
select e.employee_name, r.role_name
from employees e
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%QA engineer'
;

/*10. Вывести имена и должность ручных QA инженеров.*/
select e.employee_name, r.role_name 
from employees e
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Manual QA engineer'
;

/*11. Вывести имена и должность автоматизаторов QA*/
select e.employee_name, r.role_name 
from employees e
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Automation QA engineer'
;

/*12. Вывести имена и зарплаты Junior специалистов*/
select e.employee_name, s.monthly_salary, r.role_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Junior%'
;

/*13. Вывести имена и зарплаты Middle специалистов*/
select e.employee_name, s.monthly_salary, r.role_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Middle%'
;

/*14. Вывести имена и зарплаты Senior специалистов*/
select e.employee_name, s.monthly_salary, r.role_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Senior%'
;

/*15. Вывести зарплаты Java разработчиков*/
select s.monthly_salary, r.role_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Java developer%'
;

/*16. Вывести зарплаты Python разработчиков*/
select s.monthly_salary, r.role_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Python developer%'
;

/*17. Вывести имена и зарплаты Junior Python разработчиков*/
select e.employee_name, s.monthly_salary, r.role_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Junior Python%'
;

/* 18. Вывести имена и зарплаты Middle JavaScript разработчиков*/
select e.employee_name, s.monthly_salary, r.role_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Middle JavaScript%'
;

/*19. Вывести имена и зарплаты Senior Java разработчиков*/
select e.employee_name, s.monthly_salary, r.role_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%Senior Java developer%'
;

/*20. Вывести зарплаты Junior QA инженеров*/
select s.monthly_salary, r.role_name, e.employee_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like 'Junior Manual QA%' or role_name like 'Junior Automation QA%'
;

/*21. Вывести среднюю зарплату всех Junior специалистов*/
select AVG(s.monthly_salary)
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like 'Junior%'
;

/*22. Вывести сумму зарплат JS разработчиков*/
select SUM(s.monthly_salary)
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%JavaScript%'
;

/* 23. Вывести минимальную ЗП QA инженеров*/
select min(s.monthly_salary)
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%QA%'
;

/*24. Вывести максимальную ЗП QA инженеров*/
select max(s.monthly_salary)
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%QA%'
;

/*25. Вывести количество QA инженеров*/
select COUNT(r.role_name)
from employees e
join employee_salary es on e.id=es.employee_id
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%QA%'
;

/*26. Вывести количество Middle специалистов*/
select COUNT(r.role_name)
from employees e
join employee_salary es on e.id=es.employee_id
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like 'Middle%'
;

/* 27. Вывести количество разработчиков*/
select COUNT(r.role_name)
from employees e
join employee_salary es on e.id=es.employee_id
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%developer%'

/*28. Вывести фонд (сумму) зарплаты разработчиков.*/
select sum(s.monthly_salary)
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where role_name like '%developer%'
;

/*30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов, 
у которых ЗП от 1700 до 2300*/
select s.monthly_salary, r.role_name, e.employee_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary
;

/*31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов
у которых ЗП меньше 2300*/
select s.monthly_salary, r.role_name, e.employee_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where monthly_salary<2300
order by monthly_salary
;

/*32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у
 которых ЗП равна 1100, 1500, 2000*/
select s.monthly_salary, r.role_name, e.employee_name
from employees e
join employee_salary es on e.id=es.employee_id
join salary s on es.salary_id=s.id 
join roles_employee re on e.id=re.employee_id
join roles r on r.id=re.role_id
where monthly_salary=1100 or monthly_salary=1500 or monthly_salary=2000
order by monthly_salary
;