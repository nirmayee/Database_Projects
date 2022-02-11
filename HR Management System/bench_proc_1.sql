set serverout on;
create or replace procedure get_bench_emp
(xemp_id in number,
fname out varchar2,
lname out varchar2,
desgid out number,
deptid out number)  is
begin
select first_name,last_name,designation_id ,deptid into fname,lname,desgid,deptid
from hrms_employee_details where emp_id = xemp_id;
end get_bench_emp;
/

desc get_bench_emp

DECLARE
 EMPNO NUMBER;
 fname varchar2(60);
 lname varchar2(60);
 desgid number;
 deptid number;

 BEGIN
   EMPNO := 1100;

   get_bench_emp(EMPNO,fname,lname,desgid,deptid);
Dbms_Output.Put_Line(empno||' Name :'||' '||fname||' lastname: '||lname||' DesignationID : '||desgid||' DepartmentID: '||deptid );
 END;
 /
 
 