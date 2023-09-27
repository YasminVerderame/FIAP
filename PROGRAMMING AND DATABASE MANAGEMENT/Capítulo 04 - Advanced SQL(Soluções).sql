--Exercício  - Manipulação de Grandes Conjuntos de Dados
========================================================
--2
DESC sal_history 

--4
DESC mgr_history

--6
DESC special_sal

--7a
INSERT ALL
WHEN SAL > 20000 THEN
INTO  special_sal VALUES (EMPID, SAL)
ELSE
INTO sal_history VALUES(EMPID,HIREDATE,SAL)
INTO mgr_history VALUES(EMPID,MGR,SAL)   
SELECT employee_id EMPID, hire_date HIREDATE,
       salary SAL, manager_id MGR
FROM employees
WHERE employee_id < 125;

--7b
SELECT * FROM  special_sal;

--7c
SELECT * FROM  sal_history;

--7d
SELECT * FROM mgr_history; 

--Exercício – Relatórios por Agrupamento de Dados Relacionados
==============================================================
--01
SELECT manager_id,job_id,sum(salary)
FROM   employees
WHERE manager_id < 120
GROUP BY ROLLUP(manager_id,job_id);

--02
SELECT manager_id MGR ,job_id JOB,
sum(salary),GROUPING(manager_id),GROUPING(job_id)
FROM   employees
WHERE manager_id < 120
GROUP BY ROLLUP(manager_id,job_id);

--03
SELECT manager_id, job_id, sum(salary)
FROM   employees
WHERE manager_id < 120
GROUP BY CUBE(manager_id, job_id);

--04
SELECT manager_id MGR ,job_id JOB,
sum(salary),GROUPING(manager_id),GROUPING(job_id)
FROM   employees
WHERE manager_id < 120
GROUP BY CUBE(manager_id,job_id);

--05
SELECT department_id, manager_id, job_id,  SUM(salary)
FROM employees
GROUP BY 
GROUPING SETS
((department_id, manager_id, job_id),
(department_id, job_id),(manager_id,job_id));


--Exercício- CONSULTAS HIERÁQUICAS
==================================
--02
SELECT last_name, salary, department_id
FROM employees
START WITH last_name = 'Mourgos'
CONNECT BY PRIOR employee_id = manager_id;

--03
SELECT last_name
FROM employees
WHERE last_name != 'Lorentz'
START WITH last_name = 'Lorentz'
CONNECT BY PRIOR manager_id = employee_id
/

--04
COLUMN name FORMAT A20

SELECT LPAD(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_')  name,manager_id mgr, department_id deptno
FROM employees
START WITH last_name = 'Kochhar'                 
CONNECT BY PRIOR employee_id = manager_id
/
COLUMN name CLEAR

--05
SELECT last_name,employee_id, manager_id
FROM   employees
WHERE  job_id != 'IT_PROG' 
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id
AND last_name != 'De Haan'
/
