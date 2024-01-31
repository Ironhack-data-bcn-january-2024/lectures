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
