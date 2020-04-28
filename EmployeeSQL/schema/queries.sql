-- Data Analysis

---- Part 1 - Method 1- Join Method
SELECT e.emp_no , e.last_name , e.first_name , e.gender , s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no


-- Part 1 - Mehotd 2 - Subqueries (super slow)
SELECT emp_no , last_name , first_name ,  gender ,
	(SELECT salary
	FROM salaries
	WHERE salaries.emp_no = employees.emp_no)
FROM employees
LIMIT 10;


---- Part 2 
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


---- Part 3 - Method 1 - Subquery
SELECT dept_no , emp_no , from_date , to_date,
	(SELECT first_name
	FROM employees
	WHERE employees.emp_no = dept_manager.emp_no),
	(SELECT last_name
	FROM employees
	WHERE employees.emp_no = dept_manager.emp_no),
	(SELECT dept_name
	FROM departments
	WHERE dept_manager.dept_no = departments.dept_no)
FROM dept_manager;


----- Part 3 - Mehtod 2 - Join 
SELECT dm.dept_no , d.dept_name , dm.emp_no , e.last_name , e.first_name ,  dm.from_date , dm.to_date
FROM dept_manager AS dm
JOIN employees AS e ON dm.emp_no = e.emp_no
JOIN departments AS d ON  dm.dept_no = d.dept_no;


---- Part 4
SELECT e.emp_no , e.last_name , e.first_name , d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no;


---- Part 5
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND
	  last_name LIKE 'B%';


---- Part 6 - Creating View Named = 'Report Department'
CREATE VIEW report_department AS
SELECT e.emp_no , e.last_name , e.first_name , d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no;


---- Part 6 - Calling View Named = 'Report Department'
SELECT *
FROM report_department
WHERE dept_name = 'Sales';


---- Part 7 - Calling View Named = 'Report Department'
SELECT *
FROM report_department
WHERE dept_name IN ('Sales' , 'Development');


---- Part 8
SELECT last_name , count (last_name) AS "Number of Each Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Number of Each Last Name" DESC;



SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;