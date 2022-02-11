set serverout on;
create or replace procedure get_emp_age
 (       xemp_id in number,
 fname out varchar2,
 lname out varchar2,
 age out number)  is
 begin
 select first_name,last_name,round((sysdate-BIRTHDATE)/365)
 into fname,lname,age
 from hrms_employee_details
 where emp_id = xemp_id;
 end get_emp_age;
/


DECLARE
 EMPNO NUMBER;
 fname varchar2(60);
 sname varchar2(60);
 age  number;
 
 BEGIN
   EMPNO := 1080;
   get_emp_age(EMPNO,fname,sname,age);
Dbms_Output.Put_Line(empno||' Name :'||' '||fname||' lastname: '||sname||' Age : '||age);
 END;
/
