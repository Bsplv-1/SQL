/*SQL HomeWork 2*/
/*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/
select e.id, e.employee_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id;

/*2. Вывести всех работников у которых ЗП меньше 2000.*/
select e.id, e.employee_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where monthly_salary < 2000;

/*3. Вывести все зарплатные позиции, но работник по ним не назначен. 
(ЗП есть, но не понятно кто её получает.)*/
select e.id, e.employee_name, s.monthly_salary from employees e
right join employee_salary es on es.employee_id=e.id
right join salary s on es.salary_id=s.id
WHERE e.employee_name IS null;

/*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
(ЗП есть, но не понятно кто её получает.)
*/
select e.id, e.employee_name, s.monthly_salary from employees e
right join employee_salary es on es.employee_id=e.id
right join salary s on es.salary_id=s.id
WHERE e.employee_name IS null and s.monthly_salary <2000 ;

/*5. Найти всех работников кому не начислена ЗП.*/
select e.id, e.employee_name, s.monthly_salary from employees e
left join employee_salary es on es.employee_id=e.id
left join salary s on es.salary_id=s.id
WHERE s.monthly_salary is null
order by id;

/*6. Вывести всех работников с названиями их должности.*/
select e.id, e.employee_name, r.role_name from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
order by id;

/*7. Вывести имена и должность только Java разработчиков*/
select e.id, e.employee_name, r.role_name from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
where role_name like '%Java developer%';

/*8. Вывести имена и должность только Python разработчиков.*/
select e.id, e.employee_name, r.role_name from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
where role_name like '%Python developer%';

/*9. Вывести имена и должность всех QA инженеров.*/
select e.id, e.employee_name, r.role_name from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
where role_name like '%QA engineer%';

/*10. Вывести имена и должность ручных QA инженеров.*/
select e.id, e.employee_name, r.role_name from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
where role_name like '%Manual QA engineer%';

/*11. Вывести имена и должность автоматизаторов QA*/
select e.id, e.employee_name, r.role_name from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
where role_name like '%Automation QA engineer%';

/*12. Вывести имена и зарплаты Junior специалистов*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Junior%';

/*13. Вывести имена и зарплаты Middle специалистов*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Middle%';

/*14. Вывести имена и зарплаты Senior специалистов*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Senior%';

/*15. Вывести зарплаты Java разработчиков*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Java d%';

/*16. Вывести зарплаты Python разработчиков*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Python d%';

/*17. Вывести имена и зарплаты Junior Python разработчиков*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Junior Python%';

/* 18. Вывести имена и зарплаты Middle JavaScript разработчиков*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Middle JavaScript%';

/*19. Вывести имена и зарплаты Senior Java разработчиков*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Senior Java d%';

/*20. Вывести зарплаты Junior QA инженеров*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Junior%QA%';

/*21. Вывести среднюю зарплату всех Junior специалистов*/
select AVG(s.monthly_salary) as avg_salary_jun from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%Junior%';

/*22. Вывести сумму зарплат JS разработчиков*/
select SUM(s.monthly_salary) as sum_salary_js from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%JavaScript d%';

/* 23. Вывести минимальную ЗП QA инженеров*/
select MIN(s.monthly_salary) as min_salary_qa from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%QA engineer%';

/*24. Вывести максимальную ЗП QA инженеров*/
select MAX(s.monthly_salary) as max_salary_qa from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%QA engineer%';

/*25. Вывести количество QA инженеров*/
select COUNT(r.role_name) as qa_qty from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
where role_name like '%QA engineer%';

/*26. Вывести количество Middle специалистов*/
select COUNT(r.role_name) as Middle_qty from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
where role_name like '%Middle%';

/* 27. Вывести количество разработчиков*/
select COUNT(r.role_name) as developer_qty from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
where role_name like '%developer%';

/*28. Вывести фонд (сумму) зарплаты разработчиков.*/
select SUM(s.monthly_salary) from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where role_name like '%developer%';

/*30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов, 
у которых ЗП от 1700 до 2300*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where s.monthly_salary between 1700 and 2300
order by monthly_salary;

/*31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов
у которых ЗП меньше 2300*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where s.monthly_salary < 2300
order by monthly_salary;

/*32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у
 которых ЗП равна 1100, 1500, 2000*/
select e.id, e.employee_name, r.role_name, s.monthly_salary, es.salary_id from employees e
join roles_employee re on  re.employee_id=e.id
join roles r on r.id=re.role_id
join employee_salary es on es.employee_id=e.id
join salary s on es.salary_id=s.id
where s.monthly_salary=1100 or s.monthly_salary=1500 or s.monthly_salary=2000
order by monthly_salary;