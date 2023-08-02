create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

create table roles (
	id serial primary key,
	role_title varchar(30) unique not null
);

select * from roles;

create table role_salary (
	id serial primary key,
	id_role int not null, 
	id_salary int not null,
	foreign key (id_role)
		references roles(id),
	foreign key (id_salary)
		references salary(id)
);

select * from role_salary;

insert into salary(id, monthly_salary)
values (500),
(700),
(900),
(1000),
(1200),
(1400),
(1500),
(1700),
(2000);

select * from salary
order by id;

insert into roles(role_title)
values ('QA_manual_junior'),
    ('QA_manual_middle'),
    ('QA_manual_senior'),
    ('QA_automation_junior'),
    ('QA_automation_middle'),
    ('QA_automation_senior'),
    ('Java_developer_junior'),
    ('Java_developer_middle'),
    ('Java_developer_senior'),
    ('CEO'),
    ('CTO'),
    ('HR'),
    ('Manager'),
    ('Designer');
    
insert into roles_salary (id_role, id_salary)
values (1, 1),
	(2, 3),
	(3, 7),
	(4, 1),
	(5, 5),
	(6, 8);

select role_title, monthly_salary from role_salary 
join salary on id_salary = salary.id
join roles on id_role = roles.id;

alter table roles 
add column parking int;

select * from roles;

alter table roles 
rename column parking to taxi;

alter table roles 
drop column taxi;

update salary 
set monthly_salary = 1600 
where id = 7;

drop table employees  ;
