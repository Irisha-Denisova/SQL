select * from salary_1;
select * from roles_1;
select * from employers;
select * from employer_salary;
select * from roles_employer;

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employer_name, monthly_salary from employer_salary
join employers on employer_id = employers.id
join salary_1 on salary_id = salary_1.id; 

--2. Вывести всех работников у которых ЗП меньше 2000.
select employer_name, monthly_salary from employer_salary
join employers on employer_id = employers.id
join salary_1 on salary_id = salary_1.id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employer_name, monthly_salary from employer_salary
left join employers on employer_salary.employer_id = employers.id
join salary_1 on employer_salary.salary_id = salary_1.id
where employer_name is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employer_name, monthly_salary from employer_salary
left join employers on employer_salary.employer_id = employers.id
join salary on employer_salary.salary_id = salary.id
where employer_name is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.
select employer_name, monthly_salary from employer_salary
join employers on employer_id = employers.id
join salary_1 on salary_id = salary_1.id
where monthly_salary is null;

--6. Вывести всех работников с названиями их должности.
select employer_name, role_name from roles_employer
join employers on employer_id = employers.id
join roles_1 on role_id = roles_1.id; 

--7. Вывести имена и должность только Java разработчиков.
select employer_name, role_name from roles_employer
join employers on employer_id = employers.id
join roles_1 on role_id = roles_1.id
where role_name like '%Java%';

--8. Вывести имена и должность только Python разработчиков.
select employer_name, role_name from roles_employer
join employers on employer_id = employers.id
join roles_1 on role_id = roles_1.id
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.
select employer_name, role_name from roles_employer
join employers on employer_id = employers.id
join roles_1 on role_id = roles_1.id
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
select employer_name, role_name from roles_employer
join employers on employer_id = employers.id
join roles_1 on role_id = roles_1.id
where role_name like '%Manual QA%';

--11. Вывести имена и должность автоматизаторов QA
select employer_name, role_name from roles_employer
join employers on employer_id = employers.id
join roles_1 on role_id = roles_1.id
where role_name like '%Automation QA%';

--12. Вывести имена и зарплаты Junior специалистов
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id  
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id  
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id  
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select role_name, monthly_salary from roles_employer
join roles_1 on roles_employer.role_id = roles_1.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
where role_name like '%Java%';

--16. Вывести зарплаты Python разработчиков
select role_name, monthly_salary from roles_employer
join roles_1 on roles_employer.role_id = roles_1.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id  
where role_name like '%Junior%Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id  
where role_name like '%Middle%JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id  
where role_name like '%Senior%Java%';

--20. Вывести зарплаты Junior QA инженеров
select role_name, monthly_salary from roles_employer
join roles_1 on roles_employer.role_id = roles_1.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
where role_name like '%Junior%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов 
select avg(monthly_salary) from salary_1
join roles_1 on salary_1.id = roles_1.id 
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from salary_1
join roles_1 on salary_1.id = roles_1.id 
where role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from salary_1
join roles_1 on salary_1.id = roles_1.id 
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from salary_1
join roles_1 on salary_1.id = roles_1.id 
where role_name like '%QA%';

--25. Вывести количество QA инженеров 
select count(role_name) from roles_1
where role_name like '%QA%';

--26. Вывести количество Middle специалистов.
select count(role_name) from roles_1
where role_name like '%Middle%';

--27. Вывести количество разработчиков 
--первый вариант (выводит только кол-во)
select count(role_name) from roles_1
where role_name like '%developer%';

--второй вариант (выводит каждую должность, содержащую слово 'developer' отдельно, и ее кол-во)
select role_name, count(*) from roles_1 
where role_name like '%developer%'
group by role_name;

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) from salary_1
join roles_1 on salary_1.id = roles_1.id 
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id
order by monthly_salary; 

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id
where monthly_salary between 1700 and 2300 order by monthly_salary; 

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id
where monthly_salary<2300 order by monthly_salary; 

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select role_name, monthly_salary, employer_name from roles_employer
join employers on roles_employer.employer_id = employers.id
join employer_salary on employer_salary.employer_id = roles_employer.employer_id
join salary_1 on salary_1.id = employer_salary.salary_id 
join roles_1 on roles_employer.role_id = roles_1.id
where monthly_salary=1100 or monthly_salary=1500 or monthly_salary=2000 order by monthly_salary;