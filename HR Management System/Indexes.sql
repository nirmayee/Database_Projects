create index emp_indx on hrms_employee_details(emp_id,designation_id,dept_id);

create index skills_indx on skills (skill_id,skill_name);

create index wage_indx on wages (Designation_ID, Wages);

create index leaves_indx on hrms_employee_leaves (emp_id, leave_startdate, leave_enddate);

create index emp_skill_indx on hrms_employee_trainings (emp_id, skill_id, training_completed);

--only for unique record validation

create unique index emp_id_uniq on hrms_employee_details(emp_id,dept_id);

create unique index dept_ind_uniq on department(dept_id, dept_name);

create unique index desg_ind_uniq on designation(designation_id, designation_name );

DROP index emp_indx;
DROP index skills_indx;
DROP index wage_indx;
DROP index leaves_indx;
DROP index emp_skill_indx;
DROP index emp_id_uniq;
DROP index dept_ind_uniq;
DROP index desg_ind_uniq;
