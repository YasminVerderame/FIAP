--1
CREATE OR REPLACE VIEW employees_vu AS
    SELECT employee_id, last_name employee, department_id
    FROM employees;

--2
SELECT   *
FROM     employees_vu;   

--3
SELECT   employee, department_id 
FROM     employees_vu;

--4
CREATE VIEW dept50 AS   
   SELECT   employee_id empno, last_name employee,
            department_id deptno
   FROM     employees
   WHERE    department_id = 50
   WITH CHECK OPTION CONSTRAINT emp_dept_50;

--5
DESCRIBE dept50

SELECT   *
FROM     dept50;              

--6
UPDATE   dept50
SET      deptno = 80
WHERE    employee = 'Matos';

