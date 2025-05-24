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