-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;


SELECT emp_no, first_name, last_name FROM employees
SELECT title, from_date, to_date FROM title

SELECT e.emp_no, e.first_name, e.last_name,
	   ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN title as ti
ON (e.emp_no = ti.emp_no)
WHERE e.birth_date between '1952-01-01' and '1955-12-31'
ORDER BY emp_no;

SELECT emp_no, first_name, last_name, title from retirement_titles

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name, rt.last_name, rt.title
-- INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;


-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.emp_no), ut.title
-- INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY Count(ut.emp_no) DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01' ) 
    AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;