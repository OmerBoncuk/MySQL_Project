-- -- -- Omer Boncuk -- -- --
-- 1. List all employees in department
select * from employees;

-- 7. This query retrieves employees who have salaries between 50000 and 100000
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary BETWEEN 50000 AND 100000;

-- 13. Find the latest salaries for each employee
SELECT e.emp_no, e.first_name, e.last_name, s.salary, s.from_date
FROM employees e
JOIN (
    SELECT emp_no, MAX(from_date) AS latest_date
    FROM salaries
    GROUP BY emp_no
) AS latest_s ON e.emp_no = latest_s.emp_no
JOIN salaries s ON s.emp_no = latest_s.emp_no AND s.from_date = latest_s.latest_date;

-- 19. List the names, last names, hire dates of all employees hired between January 01, 1985 and
-- December 31, 1989, sorted by hire date.
select e.first_name, e.last_name, e.hire_date
from employees e
where hire_date between '1985-01-01' AND '1989-12-31'
order by hire_date desc;

-- -- -- Baris Saydam -- -- --
-- QUERY_6
select dept_emp.emp_no, employees.first_name, last_name, salaries.salary from dept_emp 
left JOIN salaries ON dept_emp.emp_no = salaries.emp_no
left JOIN employees ON dept_emp.emp_no = employees.emp_no 
where dept_no like '%d007%' and salaries.salary > 70000 order by salary asc LIMIT 250; 

-- QUERY_12
select employees.emp_no, first_name, last_name, salaries.salary from  employees 
left JOIN salaries ON employees.emp_no = salaries.emp_no
where salaries.salary = (select max(salary) from salaries);

-- QUERY_18
select first_name, last_name, hire_date from employees where hire_date < '1990-01-01' 
order by hire_date desc LIMIT 250;

-- -- -- Diyar Olmez -- -- --
-- Query_5
select avg(salaries.salary) as Average_salarys
from employees
join salaries ON employees.emp_no = salaries.emp_no
where employees.gender = 'F';

-- Query_11 
select emp_no, salary, from_date, to_date
from salaries
where emp_no = 10102
order by from_date;


-- Query_21_A 
SELECT COUNT(*) AS erkek_sayisi
FROM employees
WHERE gender = 'M';

-- Query_21_B 
SELECT COUNT(*) AS kadin_sayisi
FROM employees
WHERE gender = 'F';

-- Query_21_C 
SELECT gender, COUNT(*) AS sayi
FROM employees
GROUP BY gender;

-- Query_21_D 
SELECT COUNT(*) AS toplam_calisan
FROM employees;

-- -- -- Atilla Avci -- -- --
-- 2. query

select * from departments,employees 
where dept_name='Human Resources';

-- 8. query

SELECT departments.dept_name, AVG(salaries.salary) AS average_salary
FROM employees, departments, dept_emp, salaries
WHERE employees.emp_no = dept_emp.emp_no
  AND departments.dept_no = dept_emp.dept_no
  AND employees.emp_no = salaries.emp_no
GROUP BY departments.dept_name;

-- 14. query

SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees, salaries, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no
  AND dept_emp.dept_no = departments.dept_no
  AND employees.emp_no = salaries.emp_no
  AND departments.dept_name = 'Sales'
ORDER BY salaries.salary DESC
limit 1;

-- 20. query

SELECT employees.first_name, employees.last_name, employees.hire_date, salaries.salary
FROM employees, salaries, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no
  AND dept_emp.dept_no = departments.dept_no
  AND employees.emp_no = salaries.emp_no
  AND departments.dept_name = 'Sales'
  AND employees.hire_date BETWEEN '1985-01-01' AND '1989-12-31'
ORDER BY salaries.salary DESC;

-- -- -- Erdem Ozkan -- -- --
select avg(salary) as AverageSalary, employees.*  from employees
left join salaries on employees.emp_no=salaries.emp_no
where gender='M'
group by employees.emp_no
order by first_name ;

select salaries.* from salaries
where emp_no=10102;

select e.first_name,e.last_name,s.*, d.dept_name
from salaries s 
JOIN (
    SELECT emp_no, MAX(salary) AS max_salary
    FROM salaries
    GROUP BY emp_no
) AS max_s ON s.emp_no = max_s.emp_no AND s.salary = max_s.max_salary
JOIN dept_emp de on s.emp_no = de.emp_no
JOIN employees e on s.emp_no = e.emp_no
JOIN departments d on de.dept_no = d.dept_no
order by s.salary desc;

-- -- -- Gamze Batmaz -- -- --
use employees;
-- Tüm çalışanların ortalama maaşını hesapla(3)
select avg(salary)  from salaries;

-- - Departman adlarını da içeren her departmanın ortalama maasini hesapla(9)
SELECT 
    d.dept_name ,AVG(s.salary) FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no GROUP BY d.dept_name;
    
    -- Araştırma Departmanındaki Ortalama En Yüksek Maaşlı Çalışanı Bul(15)
    SELECT e.emp_no,e.first_name,e.last_name,d.dept_name,s.salary FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no WHERE d.dept_name = 'Research' ORDER BY s.salary DESC LIMIT 1;