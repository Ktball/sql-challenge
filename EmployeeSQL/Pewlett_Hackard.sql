-- Request 1 List the employee number, last name, first name, sex, and salary of each employee.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
	from employees e
	inner join salaries s on e.emp_no = s.emp_no
	order by e.emp_no asc;


-- Request 2 List the first name, last name, and hire date for the employees who were hired in 1986.
select 
	first_name,
	last_name,
	hire_date
	from employees
	where extract (year from hire_date) = 1986;
	

-- -- Request 3 List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
select 
	dm.dept_no,
	dm.emp_no,
	d.dept_name,
	e.last_name,
	e.first_name
	from dept_manager dm
 	inner join departments d on d.dept_no = dm.dept_no
	inner join employees e on e.emp_no = dm.emp_no;


-- Request 4 List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.
select
	de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	from dept_emp de
	join departments d on d.dept_no = de.dept_no
	join employees e on e.emp_no = de.emp_no
	order by emp_no asc;


-- Request 5 List first name, last name, and sex of each employee whose first name 
-- is Hercules and whose last name begins with the letter B.
select 
	first_name,
	last_name,
	sex
	from employees
	where 
		first_name = 'Hercules'
		AND
		last_name like 'B%';

-- Request 6 List each employee in the Sales department, including their employee number, 
-- last name, and first name.
select 
	e.emp_no,
	e.last_name,
	e.first_name
	from employees e
	join dept_emp de on e.emp_no = de.emp_no
	join departments d on d.dept_no = de.dept_no
	where d.dept_name = 'Sales'
	order by emp_no asc;

	
-- Request 7 List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	from employees e
	join dept_emp de on e.emp_no = de.emp_no
	join departments d on d.dept_no = de.dept_no and d.dept_name in ('Development','Sales')
	order by emp_no asc;

-- Request 8 List the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees share each last name).
Select 
	last_name,
	count (*) as num_employees
	from employees
	group by last_name
	order by num_employees desc;

