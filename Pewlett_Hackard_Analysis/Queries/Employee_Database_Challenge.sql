--The number of Retiring Employees by Title
*******  Deliverable 1 ********

SELECT e.emp_no,
		e.first_name, 
		e.last_name,
		t.title,
		t.from_date, 
		t.to_date
-- INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
	WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt. title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

SELECT title, COUNT(*)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

******* DELIVERABLE 2  ********

SELECT DISTINCT ON (e.emp_no)e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN'1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;
