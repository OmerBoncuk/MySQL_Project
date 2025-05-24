use employees;

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from rehber;
select * from salaries;
select * from titles;


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