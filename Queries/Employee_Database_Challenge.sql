--Creating Retirement Titles CSV
SELECT e.emp_no, e.first_name, e.last_name,
ti.title, ti.from_date, ti.to_date INTO retirement_titles
FROM employees AS e INNER JOIN
titles as ti ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, 
rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date  DESC;

-- Create table with count of retirees by title
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title
ORDER BY COUNT(ut.emp_no) DESC;

-- Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name,
e.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employees AS e INNER JOIN
titles as ti ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;