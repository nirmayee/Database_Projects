create or replace function ip_fetch return varchar2
is
IP VARCHAR2(15);
begin
Select sys_context('USERENV','IP_ADDRESS') INTO IP FROM DUAL;
RETURN IP;
END;

select ip_fetch from dual;

--- Male Female Ratio

create or replace function male_female return varchar2
 is
 v1 VARCHAR2(15);
 v2 VARCHAR2(15);
 mf VARCHAR2(30);
 begin
 Select count(*)||' '||decode(SEX,'M','Male','F','Female') into v1 FROM hrms_employee_details
 where SEX='M'
 group by decode(SEX,'M','Male','F','Female');
 Select count(*)||' '||decode(SEX,'M','Male','F','Female') into v2 FROM hrms_employee_details
 where SEX='F'
 group by decode(SEX,'M','Male','F','Female');
  MF := v1 ||' '|| v2;
 RETURN MF;
 END;
/

select male_female as male_female_ratio  from dual;

select count(*)as total_employee from hrms_employee_details;
