USE employees;
SELECT * FROM departments;

SELECT *
	FROM employees;

SELECT emp_no, first_name
	FROM employees;
    
SELECT emp_no, first_name, birth_date AS THE_BIRTHDAY
	FROM employees;

-- Only women
SELECT first_name, last_name, gender
	FROM employees
    WHERE gender = "F";
    
-- Women named Basil
SELECT first_name, last_name, gender
	FROM employees
    WHERE gender = "F"
    AND first_name = "Basil";
    
-- Women named Basil: no need to show gender
SELECT first_name, last_name
	FROM employees
    WHERE gender = "F"
    AND first_name = "Basil";
    
-- Indentation: just because
-- Not case sensitive: 

SELECT first_name, last_name
	FROM employees
    WHERE gender = "f"
    AND first_name = "bAsiL";
    
-- Either women named Covnot OR men
SELECT first_name, last_name, gender
	FROM employees	
    WHERE (gender = "F" AND last_name = "Covnot")
    OR gender = "M";
    
-- Hugo, Mark, Ramzi, Huan
SELECT * FROM employees WHERE gender = "M";

SELECT first_name, last_name
FROM employees
WHERE first_name = "Hugo" OR 
first_name = "Mark" OR
first_name = "Ramzi" OR
first_name = "Huan";

-- Everyone but them 
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name NOT IN ('Hugo' , 'Mark', 'Ramzi', 'Huan');

SELECT * FROM employees where gender = "F";

-- Ana, Anne, Anneke, ....
SELECT * FROM employees
WHERE first_name LIKE ("Annek_"); # ONE of whatever

-- Annemarie, Anneke, Anneli
SELECT * FROM employees
WHERE first_name LIKE ("Ann%"); # Many of whatever

-- Anwar, Angel...
SELECT * FROM employees
WHERE first_name LIKE ("An___"); # Two of whatever

-- Every MAN born in 1955
SELECT first_name, last_name, birth_date
FROM employees
WHERE gender = "M"
AND birth_date LIKE "1955%";

-- Every MAN born in Q4 of 1955: oct, nov, dec
SELECT first_name, last_name, birth_date
FROM employees
WHERE gender = "M"
AND birth_date LIKE "1955-1%";


-- Everyone born in the 60s: between 1960 and 1969
SELECT * FROM employees 
WHERE birth_date
LIKE ("196%");




-- Everyone hired in the 90s:
SELECT * FROM employees 
WHERE hire_date
BETWEEN "1990-01-01" AND "1999-12-31";

-- Everyone hired between 1985 and 1995:
SELECT * FROM employees 
WHERE hire_date
BETWEEN "1985-01-01" AND "1995-12-31";

-- SALARIES
select * from salaries;

SELECT min(salary) FROM salaries; -- 38k 
SELECT MAX(salary) FROM salaries; -- 158k
SELECT AVG(salary) FROM salaries; -- 63.810k
SELECT COUNT(salary) FROM salaries;
SELECT COUNT(*) FROM salaries;

select COUNT(*) from employees; -- 300027
SELECT COUNT(DISTINCT(first_name)) from employees; -- 1277 unique names
SELECT DISTINCT(first_name) from employees; -- 1277 unique names

-- Everyone: 60-70
SELECT * FROM salaries
WHERE salary > 60000 and salary < 70000;
-- 588188 rows

-- Everyone: 60-70
SELECT * FROM salaries
WHERE salary BETWEEN 60000 and 70000;

-- Highest paid people
SELECT * FROM salaries
ORDER BY salary DESC; -- 157821 k

-- Lowest paid people
SELECT * FROM salaries
ORDER BY salary ASC; -- $ 38.735

SELECT * FROM employees
WHERE first_name
BETWEEN "A" AND "C"; -- A, B (upper bound, not included)

SELECT *, salary as GROSS FROM salaries ; 

-- After_tax column
SELECT *,
	salary AS gross, 
	ROUND(salary * 0.85) AS after_tax 
from salaries;


-- After_tax column
SELECT
	salary AS gross, 
	ROUND(salary * 0.85) AS after_tax,
	(salary + (salary * 0.15)) AS total_cost_per_emp
from salaries;

-- Most expensive worker: 43624
SELECT emp_no,
	salary AS gross, 
	ROUND(salary * 0.85) AS after_tax,
	(salary + (salary * 0.15)) AS total_cost_per_emp
from salaries
ORDER BY total_cost_per_emp DESC; -- 43624

SELECT * FROM employees
WHERE emp_no = "43624";


-- Join: everyone in both tables

SELECT 
	first_name, last_name, -- 1. Columns in table 1 
    salary, (salary + (salary * 0.15)) AS total_cost_per_emp -- 2. Columns in table2
    
    FROM employees 
	JOIN salaries
		ON employees.emp_no = salaries.emp_no
	ORDER BY total_cost_per_emp DESC;
    
    
-- Joins
	-- 1. Table
    -- 2. Columns
    -- 3. Keys we're joining by