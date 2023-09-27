SET SERVEROUTPUT ON
DECLARE
 fname VARCHAR2(25);
BEGIN
 SELECT first_name 
 INTO fname 
 FROM employees WHERE employee_id=200;
 DBMS_OUTPUT.PUT_LINE(' First Name is : '||fname);
END;
/

SET SERVEROUTPUT ON
DECLARE
 emp_hiredate   employees.hire_date%TYPE;
 emp_salary     employees.salary%TYPE;  
BEGIN
  SELECT   hire_date, salary
  INTO     emp_hiredate, emp_salary
  FROM     employees
  WHERE    employee_id = 100;  
END;
/

SET SERVEROUTPUT ON
DECLARE    
   sum_sal  NUMBER(10,2); 
   deptno   NUMBER NOT NULL := 60;           
BEGIN
   SELECT  SUM(salary)  -- group function
   INTO sum_sal FROM employees
   WHERE  department_id = deptno;
   DBMS_OUTPUT.PUT_LINE ('The sum of salary is '  || sum_sal);
END;
/

DECLARE
  hire_date      employees.hire_date%TYPE;
  sysdate        hire_date%TYPE;
  employee_id    employees.employee_id%TYPE := 176;        
BEGIN
  SELECT 	hire_date, sysdate
  INTO   	hire_date, sysdate
  FROM   	employees
  WHERE  	employee_id = employee_id;        
END;
/

BEGIN
 INSERT INTO employees
  (employee_id, first_name, last_name, email,     
   hire_date, job_id, salary)
   VALUES(employees_seq.NEXTVAL, 'Ruth', 'Cores',
   'RCORES',sysdate, 'AD_ASST', 4000);
END;
/

DECLARE					
  sal_increase   employees.salary%TYPE := 800;   
BEGIN
  UPDATE	employees
  SET		salary = salary + sal_increase
  WHERE	job_id = 'ST_CLERK';
END;
/

DECLARE
  deptno   employees.department_id%TYPE := 10; 
BEGIN							
  DELETE FROM   employees
  WHERE  department_id = deptno;
END;
/

VARIABLE rows_deleted VARCHAR2(30)
DECLARE
  empno employees.employee_id%TYPE := 176;
BEGIN
  DELETE FROM  employees 
  WHERE employee_id = empno;
  :rows_deleted := (SQL%ROWCOUNT || ' row deleted.');
END;
/






