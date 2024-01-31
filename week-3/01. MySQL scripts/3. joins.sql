USE employees;

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
    
SELECT DISTINCT(first_name) FROM employees;

SELECT DISTINCT(CONCAT (first_name, " ", last_name) ) AS unique_names
FROM employees;
  
SELECT COUNT(DISTINCT(CONCAT (first_name, " ", last_name))) AS unique_names
FROM employees; -- 27k

-- Whaty is the average salary by sex
	-- grouping by: gender
    -- aggregate: avg(salary)
    -- gender & salary
    -- salaries:  salary
    -- employees: gender
    
SELECT *,
	gender, -- Table 1: employees
    salary -- Table 2: salaries
FROM
	employees 
    JOIN salaries
		ON employees.emp_no = salaries.emp_no; -- 3. Common key: emp_no
    
    
SELECT
	gender, -- Table 1: employees
    -- salary, -- Table 2: salaries
    AVG(salary)
FROM
	employees 
    JOIN salaries
		ON employees.emp_no = salaries.emp_no
GROUP BY (gender);

    
SELECT
	gender, -- Table 1: employees
    AVG(salary)
FROM
	employees 
    JOIN salaries
		ON employees.emp_no = salaries.emp_no
GROUP BY (gender);
    
-- Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause 
-- and contains nonaggregated column 'employees.salaries.salary' 
-- which is not functionally dependent on columns in GROUP BY clause;
--  this is incompatible with sql_mode=only_full_group_by	0.00040 se


-- How many people are M & F

SELECT gender, COUNT(gender)
FROM employees
GROUP BY gender;

-- What are the most frequent names
SELECT first_name, COUNT(first_name) AS the_count
from employees
GROUP BY first_name
ORDER BY the_count DESC;
     
-- The MOST repeated
SELECT first_name, COUNT(first_name) AS the_count
from employees
GROUP BY first_name
ORDER BY the_count desc
LIMIT 1;


SELECT first_name, COUNT(first_name) AS the_count
from employees
GROUP BY first_name
ORDER BY the_count desc;

-- All the people in the company where their names
-- are repeated more than 270
-- filter

SELECT first_name, COUNT(first_name) AS the_count
FROM employees
	-- filtering: where
		-- where is a filter that happens BEFORE GROUPING
GROUP BY first_name
	HAVING the_count > 290
ORDER BY the_count DESC;

-- ALl the women whose name happens more than 120 times
SELECT first_name, COUNT(first_name) AS the_count, gender
FROM employees
	WHERE gender = "F"
GROUP BY first_name
	HAVING the_count > 120
ORDER BY the_count DESC;


SELECT first_name
FROM employees
	WHERE gender = "F"; -- where filters row by row (unnagregated)
    
-- HAVING vs. WHERE
	-- Having is filtering based on the value of the aggregation
    -- Where: filters before
    

select * from departments;

-- MANAGERS VERSION
-- 0. Join employees & departments: who belongs where
-- 1. How many employees each departmen has: group by
-- 2. Having: only show me employees belonging to big / small department

-- 0. Join employees & departments: who belongs where
SELECT
	first_name, last_name, -- Table 1: employees
	dept_name -- Table 3: departments
	
    FROM
		employees
	JOIN
		dept_manager
			ON employees.emp_no = dept_manager.emp_no -- Key 1: emp_no
	JOIN 
		departments
			ON dept_manager.dept_no = departments.dept_no; -- Key 2: dept_no


SELECT
	dept_name,
    COUNT(dept_name)
	
    FROM
		employees
	JOIN
		dept_manager
			ON employees.emp_no = dept_manager.emp_no -- Key 1: emp_no
	JOIN 
		departments
			ON dept_manager.dept_no = departments.dept_no -- Key 2: dept_no
            
	GROUP BY dept_name
    ORDER BY COUNT(dept_name) DESC;

-- EMPLOYEES VERSION
-- 0. Join employees & departments: who belongs where
SELECT
	first_name, last_name, -- Table 1: employees
	dept_name -- Table 3: departments
	
    FROM
		employees
	JOIN
		dept_emp
			ON employees.emp_no = dept_emp.emp_no -- Key 1: emp_no
	JOIN 
		departments
			ON dept_emp.dept_no = departments.dept_no; -- Key 2: dept_no

-- 1. How many employees each departmen has: group by
SELECT
	dept_name,
    COUNT(dept_name) as the_count
	
    FROM
		employees
	JOIN
		dept_emp
			ON employees.emp_no = dept_emp.emp_no -- Key 1: emp_no
	JOIN 
		departments
			ON dept_emp.dept_no = departments.dept_no -- Key 2: dept_no
            
	GROUP BY dept_name
    ORDER BY the_count DESC;


-- 2. Having: only show me employees belonging to big / small department
SELECT
	dept_name,
    COUNT(dept_name) as the_count
	
    FROM
		employees
	JOIN
		dept_emp
			ON employees.emp_no = dept_emp.emp_no -- Key 1: emp_no
	JOIN 
		departments
			ON dept_emp.dept_no = departments.dept_no -- Key 2: dept_no
	GROUP BY dept_name
    HAVING the_count > 50000
    ORDER BY the_count DESC;

-- 2. Having: only show me employees belonging to big / small department
SELECT
	dept_name,
    COUNT(dept_name) as the_count
	
    FROM
		employees
	JOIN
		dept_emp
			ON employees.emp_no = dept_emp.emp_no -- Key 1: emp_no
	JOIN 
		departments
			ON dept_emp.dept_no = departments.dept_no -- Key 2: dept_no
	WHERE gender = "F" -- With all the rows. Non-aggregated, before grouping by
	GROUP BY dept_name
		HAVING the_count > 20000 -- After aggregation is done
    ORDER BY the_count DESC;


USE publications;
-- An identifying relationship is one where the child table
-- cannot be uniquely identified without its parent. T

-- dotted line / discontinous: non-identifying relationship. on its own
-- non dotted line / con tintous: identifying relationship. cant on its own

/* book -- discontinout
author (FK)
title(FN)
content
*/

/* book -- continuous
ISBN (PK) 
content
*/


-- The names of the titles published

-- 1. Tables
-- 2. Columns
-- 3. Keys

select * from titles;
-- 1. WHAT: select columns: title, au_lname
-- 2. WHERE: Tables: titles, titleauthor, authors
-- 3. HOW: Keys: title_id, au_id

SELECT 
	title, -- Table 1: titles
    au_lname -- Table 3: authors
    
    FROM 
		titles
	JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
    JOIN authors
		ON titleauthor.au_id = authors.au_id;



USE employees;
-- Best paid department?

-- 1. WHAT: select columns: salary, dept_name
-- 2. WHERE: Tables: salaries, employees, dept_emp, departments
-- 3. HOW: Keys: emp_no, emp_no, dept_no

-- 4. GROUP BY
SELECT 
    dept_name, -- Table 4: departments
	AVG(salary) AS  the_mean -- Tabla 1: salaries
    
	FROM salaries
    JOIN employees
		ON salaries.emp_no = employees.emp_no
    JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
    JOIN departments
		ON dept_emp.dept_no = departments.dept_no

GROUP BY dept_name
ORDER BY the_mean DESC;












    
    
    