--DROP table department CASCADE CONSTRAINTS;
create table department(
    dept_id NUMBER(5) NOT NULL,
    dept_name VARCHAR2(50) NOT NULL,
    PRIMARY KEY(dept_id)
);

--DROP table designation CASCADE CONSTRAINTS;
create table designation(
    designation_id NUMBER(5) NOT NULL,
    designation_name VARCHAR2(50) NOT NULL,
    PRIMARY KEY(designation_id)
);

--DROP table PROJECTS CASCADE CONSTRAINTS;
CREATE TABLE PROJECTS(
    project_id VARCHAR2(10)NOT NULL,
    project_name VARCHAR2(50) NOT NULL, 
    PRIMARY KEY (project_id)
);

--DROP table ASSET CASCADE CONSTRAINTS;
CREATE TABLE ASSET(
    asset_Id NUMBER(10) NOT NULL,
    asset_name VARCHAR2(50) NOT NULL, 
    asset_type VARCHAR2(50) NOT NULL, 
    PRIMARY KEY (asset_Id)
);

--DROP table skills CASCADE CONSTRAINTS;
create table skills(
    skill_id NUMBER NOT NULL,
    skill_name VARCHAR2(100) NOT NULL,
    skill_level VARCHAR2(100) NOT NULL,
    PRIMARY KEY(skill_id)
);

--DROP table WAGES CASCADE CONSTRAINTS;
CREATE TABLE WAGES(
    Wage_ID NUMBER(5),
    Designation_ID NUMBER(20) NOT NULL, 
    Wages  NUMBER(20) NOT NULL,
    PRIMARY KEY (Wage_ID),
    CONSTRAINT Design_FK FOREIGN KEY (Designation_ID) REFERENCES DESIGNATION(Designation_ID));

--DROP table hrms_employee_details CASCADE CONSTRAINTS;
create table hrms_employee_details(
    emp_id NUMBER(5) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    middle_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    designation_id NUMBER(15) NOT NULL,
    dept_id  NUMBER(5) NOT NULL,
    birthdate DATE NOT NULL,
    sex VARCHAR2(10) NOT NULL,
    company_emailid VARCHAR2(50) NOT NULL,
    phone_no NUMBER(10)NOT NULL,
    houseno NUMBER(15) NOT NULL,
    street_name VARCHAR2(50) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    pincode NUMBER(5) NOT NULL,
    employment_date DATE NOT NULL,
    reporting_manager VARCHAR2(50) NOT NULL,
    creation_date date,
    update_date DATE,
    ip_address VARCHAR(15),
    PRIMARY KEY(emp_id),
    CONSTRAINT FK_DEPT FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id),
    CONSTRAINT FK_DESIGNATION FOREIGN KEY (designation_id) REFERENCES DESIGNATION(designation_id)
);

--DROP table hrms_employee_projects CASCADE CONSTRAINTS;
create table hrms_employee_projects(
    project_id VARCHAR2(10) NOT NULL,
    emp_id  NUMBER(5) NOT NULL,
    project_startdate DATE NOT NULL,
    project_enddate DATE NOT NULL,
    project_status VARCHAR2(30) NOT NULL,
    CONSTRAINT pk_project PRIMARY KEY(project_id,emp_id),
    CONSTRAINT FK_employeedetails FOREIGN KEY (emp_id) REFERENCES hrms_employee_details(emp_id),
    CONSTRAINT FK_projectdetails FOREIGN KEY (project_id) REFERENCES PROJECTS(project_id)
);

--DROP table hrms_employee_salary CASCADE CONSTRAINTS;
create table hrms_employee_salary(
    salary_id NUMBER(5),
    emp_id  NUMBER NOT NULL,
    annual_income NUMBER(10) DEFAULT 0,
    taxable VARCHAR2(30) NOT NULL,
    loans VARCHAR2(30) NOT NULL,
    insurance VARCHAR2(30) NOT NULL,
    PRIMARY KEY(salary_id),
    CONSTRAINT FK_empid FOREIGN KEY (emp_id) REFERENCES hrms_employee_details(emp_id)
);

--DROP table hrms_employee_asset CASCADE CONSTRAINTS;
create table hrms_employee_asset(
    asset_id NUMBER(5),
    emp_id NUMBER(5),
    start_date DATE,
    end_date DATE,
    CONSTRAINT pk_asset PRIMARY KEY(asset_id,emp_id),
    CONSTRAINT FK_employeedet FOREIGN KEY (emp_id) REFERENCES hrms_employee_details(emp_id),
    CONSTRAINT FK_assetdetails FOREIGN KEY (asset_id) REFERENCES ASSET(asset_id)
    );


--DROP table hrms_employee_trainings CASCADE CONSTRAINTS;
create table hrms_employee_trainings(
    training_id NUMBER(5),
    emp_id  NUMBER NOT NULL,
    skill_id NUMBER NOT NULL,
    training_completed VARCHAR2(100) NOT NULL,
    PRIMARY KEY(training_id),
    CONSTRAINT empid FOREIGN KEY (emp_id) REFERENCES hrms_employee_details(emp_id),
    CONSTRAINT skillid FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);



--DROP table hrms_employee_leaves CASCADE CONSTRAINTS;
create table hrms_employee_leaves(
    leave_id NUMBER NOT NULL,
    emp_id  NUMBER NOT NULL,
    leave_startdate DATE NOT NULL,
    leave_enddate DATE NOT NULL,
    leavetype VARCHAR2(30) NOT NULL,
    PRIMARY KEY(leave_id),
    CONSTRAINT employeeid FOREIGN KEY (emp_id) REFERENCES hrms_employee_details(emp_id)
);

--DROP table hrms_employee_attendance CASCADE CONSTRAINTS;
create table hrms_employee_attendance(
    attendance_id NUMBER NOT NULL,
    emp_id  NUMBER NOT NULL,
    attendance_date DATE NOT NULL,
    time_in VARCHAR2(20) NOT NULL,
    time_out VARCHAR(20) NOT NULL,
    remarks VARCHAR2(100) NOT NULL,
    PRIMARY KEY(attendance_id),
    CONSTRAINT employid FOREIGN KEY (emp_id) REFERENCES hrms_employee_details(emp_id)
);


--DROP table hrms_kra_kpi CASCADE CONSTRAINTS;
create table hrms_kra_kpi(
    emp_id  NUMBER NOT NULL,
    financial_year NUMBER NOT NULL,
    key_result_area VARCHAR(20) NOT NULL,
    key_performace_indicator NUMBER NOT NULL,
    kpi_target NUMBER NOT NULL,
    reviewer1_remarks VARCHAR(50)NOT NULL,
    CONSTRAINT employeid FOREIGN KEY (emp_id) REFERENCES hrms_employee_details(emp_id)
);

--DROP table hrms_employee_details_log;
create table hrms_employee_details_log(
    emp_id NUMBER(5) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    middle_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    designation_id NUMBER(15) NOT NULL,
    dept_id  NUMBER(5) NOT NULL,
    birthdate DATE NOT NULL,
    sex VARCHAR2(10) NOT NULL,
    company_emailid VARCHAR2(50) NOT NULL,
    phone_no NUMBER(10)NOT NULL,
    houseno NUMBER(15) NOT NULL,
    street_name VARCHAR2(50) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    pincode NUMBER(5) NOT NULL,
    employment_date DATE NOT NULL,
    reporting_manager VARCHAR2(50) NOT NULL,
    creation_date DATE,
    update_date DATE,
    ip_address VARCHAR(15),
    upd_ip_address VARCHAR(15),
    Upd_date DATE,
    Status VARCHAR2(15)
);
    



