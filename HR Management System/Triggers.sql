CREATE OR REPLACE TRIGGER emp_trg BEFORE INSERT OR UPDATE ON hrms_employee_details
FOR EACH ROW
DECLARE 
v_int NUMBER(12) := 0;
BEGIN
  IF INSERTING THEN
:new.creation_date := sysdate;
  END IF;
  if updating then
:new.update_date := sysdate;
end if;
END;
/

CREATE OR REPLACE TRIGGER emp_trg_ip BEFORE INSERT OR UPDATE ON hrms_employee_details
FOR EACH ROW
DECLARE 
v_asset NUMBER(12) := 0;
ip_Add varchar2(15);
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING THEN
select ip_fetch into ip_Add from dual;
:new.creation_date := sysdate;
:new.ip_address  := ip_add;
END IF;
END;
/

CREATE OR REPLACE TRIGGER emplogyee_log BEFORE UPDATE OR DELETE ON hrms_employee_details_log
FOR EACH ROW
DECLARE
st varchar(10);
st1 char(1);
ip_history varchar2(15);
ed date:=sysdate;
begin
if updating then
   st:='UPDATE';
elsif deleting then
  st:='DELETE';
end if;
select ip_fetch into ip_history from dual;
insert into hrms_employee_details_log values(
:old.EMP_ID  ,
:old.FIRST_NAME,
:old.MIDDLE_NAME,
:old.LAST_NAME,
:old.DESIGNATION_ID,
:old.DEPT_ID,
:old.BIRTHDATE,
:old.SEX,
:old.COMPANY_EMAILID,
:old.PHONE_NO,
:old.HOUSENO,
:old.STREET_NAME,
:old.CITY,
:old.PINCODE,
:old.EMPLOYMENT_DATE,
:old.REPORTING_MANAGER,
:old.CREATION_DATE,
ip_history,
sysdate,
ST);
END;
/