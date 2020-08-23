-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    e.gender,
    s.salary
FROM "Employees" e
JOIN "salaries" s 
ON (e.emp_no = s.emp_no);

-- 2. List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM "Employees" 
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name, dept_manager.emp_no, e.last_name, e.first_name, dept_manager.from_date, dept_manager.to_date
FROM "Departments" d
JOIN "dept_manager"  
ON (d.dept_no = dept_manager.dept_no)
JOIN "Employees" e
ON (dept_manager.emp_no = e.emp_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM "dept_emp"
JOIN "Employees" e
ON (dept_emp.emp_no = e.emp_no)
JOIN "Departments" d
ON (dept_emp.dept_no = d.dept_no);

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM "Employees" e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.


SELECT dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM "dept_emp"
JOIN "Employees" e
ON (dept_emp.emp_no = e.emp_no)
JOIN "Departments" d
ON dept_emp.dept_no = d.dept_no
WHERE (d.dept_name = 'Sales');

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


SELECT dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM "dept_emp"
JOIN "Employees" e
ON (dept_emp.emp_no = e.emp_no)
JOIN "Departments" d
ON (dept_emp.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales') 
OR (d.dept_name = 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM "Employees" e
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

SELECT * FROM "Employees" e
WHERE "emp_no" = '499942';
