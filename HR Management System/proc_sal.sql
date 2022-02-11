create or replace procedure get_emp_yrsalary
(       xemp_id in number,
sdate in date,
edate in date,
fname out varchar2,
lname out varchar2,
xwage  out number,
totalhrs out number,
totalsal out number)  is
begin
select sum(round(24*mod(to_date(time_out,'HH24.MI')-to_date(time_in,'HH24.MI'),1),2)) into totalhrs
from hrms_employee_attendance
where emp_id = xemp_id and attendance_date between sdate and edate;

select first_name,last_name,wages into fname,lname,xwage
from hrms_employee_details a, WAGES b
where a.emp_id = xemp_id and
a.Designation_ID = b.Designation_ID;
totalsal := xwage * totalhrs;
end get_emp_yrsalary;
/

alter session set NLS_DATE_FORMAT='YYYY-MM-DD'

DECLARE
 EMPNO NUMBER;
 sdate date;
 edate date;
 fname varchar2(60);
 sname varchar2(60);
 wage  number;
 tothrs number;
 totsal number;
 SALARY NUMBER;
 BEGIN
   EMPNO := 1100;
   sdate := '2021-01-01';
   edate := '2021-12-31';
   get_emp_salary(EMPNO,sdate,edate,fname,sname,wage,tothrs,totsal);
Dbms_Output.Put_Line(empno||' Name :'||' '||fname||' lastname: '||sname||' Wage : '||wage||' Total Hours: '||tothrs||' Total Salary :'||
totsal);
 END;
/