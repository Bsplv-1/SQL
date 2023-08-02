CREATE TABLE salary (
	id serial primary key,
	monthly_selary int not null
);
CREATE TABLE roles (
	id serial primary key,
	role_title varchar(30) unique not null
);

CREATE TABLE roles_salary (
	id serial primary key,
	id_role int not null,
	id_salary int not null,
	foreign key (id_role)
		references roles(id),
	foreign key (id_salary)
		references salary(id)
);

CREATE TABLE public.students (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	"password" varchar(50) NOT NULL,
	created_on timestamp NOT NULL,
	CONSTRAINT students_email_key UNIQUE (email),
	CONSTRAINT students_pkey PRIMARY KEY (id)
);


insert into roles_salary(id_role, id_salary)
values (1, 1),
(2, 3),
(3, 7),
(4, 1),
(5, 5),
(6, 8);

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

insert into salary (monthly_selary)
values 
(500),
(700),
(900),
(1000),
(1200),
(1400),
(1500),
(1700),
(2000);



select * from roles_salary;

select role_title, monthly_selary from roles_salary rs
left join salary s on id_salary = s.id
right join roles r on id_role = r.id

alter table roles
add column parking int;

alter table roles
rename column parking to taxi;

alter table salary
rename column monthly_selary to monthly_salary;

alter table roles
drop column taxi;

update salary
set monthly_salary = 1600
where id = 7;

select * from students;
select count(*) from students;
select id from students;
select name from students;
select email from students;
select name, email from students;
select id, name, email, created_on  from students;
select * from students where password = '12333';
select * from students where created_on = '2021-03-26 00:00:00';
select * from students where name like 'Anna%'; 
select * from students where name like '%8'; 
select * from students where name like '%a%'; 
select * from students where created_on = '2021-07-12 00:00:00';
select * from students where created_on = '2021-07-12 00:00:00' and password = '1m313';
select * from students where created_on = '2021-07-12 00:00:00' and name like '%Andrey%';
select * from students where created_on = '2021-07-12 00:00:00' and name like '%8%';
select * from students where id = '110';
select * from students where id = '153';
select * from students where id > '140';
select * from students where id < '130';
select * from students where id < '127' or id > '188';
select * from students where id <= '137';
select * from students where id >= '137';
select * from students where id > '180' and id < '190';
select * from students where id between '180' and '190';
select * from students where password='12333' or password='1m313' or password='123313';
select * from students where created_on='2020-10-03 00:00:00' or created_on='2021-05-19 00:00:00' or created_on='2021-03-26 00:00:00';
select min(id) from students;
select max(id) from students;
select count(*) from students;
select id, name, created_on  from students ORDER BY created_on;
select id, name, created_on  from students ORDER BY created_on desc;



