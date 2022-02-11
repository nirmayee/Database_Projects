set serverout on;
 create or replace procedure get_pf_bonus
(       xemp_id in number,
pf out number,
bonus out number)  is
begin
 select (ANNUAL_INCOME*.4)/12,(ANNUAL_INCOME*.4)/8.33  into pf,bonus
from hrms_employee_salary
where emp_id=xemp_id;
  EXCEPTION
      WHEN NO_DATA_FOUND THEN
 null;
end get_pf_bonus;
/

DECLARE
 EMPNO NUMBER;
 PF number;
 BONUS number;

 BEGIN
   EMPNO := 1100;
   PF := 20000;
   BONUS:= 20000;

   get_pf_bonus(EMPNO,PF,BONUS );
Dbms_Output.Put_Line(empno||' PF :'||' '||PF||' BONUS: '||BONUS||' ' );
 END;
 
 
 