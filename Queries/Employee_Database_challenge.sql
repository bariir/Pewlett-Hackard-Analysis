-- Deliverable 1: The Number of Retiring Employees by Title
-- Create retirement_titles table with retirement employee titles
SELECT
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Create unique titles table
SELECT DISTINCT ON (t.emp_no)
t.emp_no,
t.first_name,
t.last_name,
t.title
INTO unique_titles
FROM retirement_titles t
WHERE t.to_date = '9999-01-01'
ORDER BY t.emp_no ASC, t.to_date DESC;


-- Create table to hold count of retiring employees and their titles 
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) desc


--Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (emp.emp_no)
	emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	emp.birth_date,
	dm.from_date, 
	dm.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS emp
JOIN dept_emp AS dm
ON emp.emp_no = dm.emp_no
JOIN titles AS t
ON emp.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01'
AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no


