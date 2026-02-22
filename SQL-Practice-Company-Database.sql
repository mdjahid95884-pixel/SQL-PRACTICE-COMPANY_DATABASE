CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50));
    
INSERT INTO employees VALUES
(1, 'Amit', 25, 'Sales', 45000, 'Mumbai'),
(2, 'Priya', 30, 'HR', 50000, 'Delhi'),
(3, 'Rahul', 28, 'IT', 70000, 'Bangalore'),
(4, 'Sneha', 35, 'Finance', 65000, 'Mumbai'),
(5, 'Arjun', 24, 'Sales', 40000, 'Delhi'),
(6, 'Neha', 32, 'IT', 72000, 'Hyderabad'),
(7, 'Vikram', 29, 'HR', 48000, 'Chennai'),
(8, 'Anjali', 26, 'Finance', 60000, 'Bangalore'),
(9, 'Rohit', 31, 'Sales', 52000, 'Mumbai'),
(10, 'Kavya', 27, 'IT', 68000, 'Delhi');

SELECT * FROM employees;



SELECT name,department,salary
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

SELECT *  FROM employees
WHERE name LIKE "A%";

SELECT *  FROM employees
WHERE city LIKE "%i";

SELECT *  FROM employees
WHERE name LIKE "A%" AND  salary > 40000;

SELECT name,department,city,salary
FROM employees
WHERE (salary > 65000 AND department = "IT") OR city = "MUMBAI";

SELECT name, salary 
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);


SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
        WHERE salary < (
            SELECT MAX(salary)
            FROM employees
        )
    )
);


SELECT name, department,salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees)));


SELECT name, department, salary
FROM employees
WHERE salary IN (
    SELECT salary FROM (
        SELECT DISTINCT salary
        FROM employees
        ORDER BY salary DESC
        LIMIT 3
    )as top_3_salary);