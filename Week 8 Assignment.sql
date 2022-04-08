-- 1. I want to know how many employees with each title were born after 1965-01-01.
SELECT count(t.title) as "Number of Employees", title as "Title"
FROM titles t 
INNER JOIN employees e ON t.emp_no = e.emp_no
WHERE e.birth_date > '1965-01-01'
GROUP BY title;

-- 2. I want to know the average salary per title.
SELECT title as "Title", round(avg(s.salary), 2) as "Average Salary"
FROM titles t
INNER JOIN salaries s ON t.emp_no = s.emp_no
GROUP BY title;

-- 3. How much money was spent on salary for the marketing department between the years 1990 and 1992?
select d.dept_name as "Department", sum(s.salary) as "Salary"
from departments d
inner join dept_emp de on d.dept_no = de.dept_no
inner join salaries s on s.emp_no = de.emp_no
WHERE s.from_date > '1989-12-31' AND s.to_date < '1993-01-01'
group by d.dept_name
having d.dept_name = 'Marketing';

