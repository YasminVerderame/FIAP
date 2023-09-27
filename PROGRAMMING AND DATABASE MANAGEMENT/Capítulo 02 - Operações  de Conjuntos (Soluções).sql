--1
SELECT department_id
FROM   departments
MINUS
SELECT department_id
FROM   employees
WHERE  job_id = 'ST_CLERK';

--2
SELECT country_id,country_name
FROM   countries
MINUS
SELECT country_id,country_name
FROM countries
NATURAL JOIN locations
NATURAL JOIN departments;

--3
COLUMN dummy NOPRINT
SELECT  job_id, department_id, 'x' dummy
FROM    employees
WHERE department_id = 10
UNION
SELECT  job_id, department_id, 'y' dummy
FROM    employees
WHERE department_id = 50
UNION
SELECT  job_id, department_id, 'z' dummy
FROM    employees
WHERE department_id = 20
ORDER BY  dummy;
COLUMN dummy PRINT

--4
SELECT    employee_id,job_id
FROM      employees
INTERSECT 
SELECT   employee_id,job_id
FROM     job_history;

--5
SELECT last_name,department_id,TO_CHAR(null)
FROM   employees
UNION
SELECT TO_CHAR(null),department_id,department_name
FROM  departments;
