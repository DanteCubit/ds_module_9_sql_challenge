-- 1) List the employee number, last name, first name, sex, and salary of each employee.
-- Followed live instructor demonstration of code.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees e 
	join salaries s on e.emp_no = s.emp_no
Order by
	e.last_name ASC,
	s.salary DESC;

-- 2) List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	e.first_name,
	e.last_name,
	e.hire_date
FROM
	employees e
WHERE
	EXTRACT(YEAR FROM e.hire_date) = 1986
Order by
	e.last_name ASC;
	
-- 3)List the manager of each department along with their department number,
-- department name, employee number, last name, and first name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_no,
	ds.dept_name
FROM
	dept_manager d 
	join employees e on e.emp_no = d.emp_no
	join departments ds on ds.dept_no = d.dept_no
Order by
	e.emp_no ASC;

-- 4)List the department number for each employee 
-- along with that employee’s employee number, last name, first name, and department name.
SELECT
	d.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e 
	join departments d on e.emp_no = e.emp_no
Order by
	d.dept_name ASC;

-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
-- Followed live instructor demonstration of code.
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	employees e
WHERE
	e.first_name = 'Hercules'
	and e.last_name like 'B%'
ORDER BY
	e.last_name ASC,
	e.first_name ASC;

-- 6) List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
    e.emp_no,
    e.first_name,
    e.last_name
FROM
    employees e
    join dept_emp de on e.emp_no = de.emp_no
    join departments d on de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales'
ORDER BY
    e.last_name ASC;

-- 7) List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name as department_name
FROM
    employees e
    join dept_emp de on e.emp_no = de.emp_no
    join departments d on de.dept_no = d.dept_no
WHERE
    d.dept_name in ('Sales', 'Development')
ORDER BY
    e.last_name ASC;

-- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
-- Followed live instructor demonstration of code.
SELECT
	e.last_name,
	count(e.emp_no) as num_last_name
FROM
	employees e
GROUP BY
	e.last_name
ORDER BY
	num_last_name ASC;

-- BONUS) WHO is the UNIQUE  Employee (by last name)?
SELECT
	*
FROM
	employees e
WHERE
	e.last_name = 'Foolsday'
