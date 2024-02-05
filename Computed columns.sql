use nagraj@123
 --computed columns
--in sql server we have option to create the computed columns/calculated columns.
--other than columns we called as normal columns.those columns store the values physically in the table.
--on computed columns use constarint,function and combination of diffrent operators.[+,-.*,/]
--creating the table 

create table emp_payroll (
emp_id int identity,
emp_name varchar(100),
emp_role varchar(100),
basic_pay int,
house_allowance int,
medical_allowance int,
gross_pay as (basic_pay)+(house_allowance)+(medical_allowance)
)
 
select * from emp_payroll
insert into emp_payroll values('ram','manager',50000,8000,10000),
('siri','asst manager',40000,6000,5000),
('kumar','junior executive',20000,4000,2000)
insert into emp_payroll values('sam','incharge',35000,5000,3000),
('devansh','floor manager',50000,8000,10000)
insert into emp_payroll values('sriram','team lead',45000,6000,5000)

--adding one more computed column in table
--adding the computed columns on existed table
alter table Emp_payroll add
company_name as 'Cognine';
alter table Emp_payroll add [date] as getdate()
--update the columns then automatically computed column value also updated
update Emp_payroll set basic_pay=25000 where emp_id=3
select emp_id,emp_name,emp_role,gross_pay from Emp_payroll
 
select * from Emp_payroll where emp_id is not null order by gross_pay desc
 
select emp_id,emp_name,emp_role,gross_pay from Emp_payroll where emp_id is not null order by gross_pay asc
--modify or update the computed column 
--error[The column "gross_pay" cannot be modified because it is either a computed column]
 
update Emp_payroll set gross_pay =2000 where emp_id =2
--droping the computed column
 
alter table Emp_payroll drop column [date] 
--creating one more computed column  on another computed column 
--error[Computed column 'gross_pay' in table 'Emp_payroll' is not allowed to be used in another computed-column definition.]
--we can't create computed column on another computed column.
alter table Emp_payroll add bonus as (gross_pay) +2000;

--if we can update the column then automatically computed columns also updated.

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
use nagraj@123
 
create table student_marks (
std_id smallint primary key  identity(1,1),
std_name varchar(100) not null,
sub1_tel_marks int,
sub2_eng_marks int,
sub3_mat_marks int,
sub4_sci_marks int,
std_percentage as(((sub1_tel_marks)+(sub2_eng_marks)+(sub3_mat_marks)+(sub4_sci_marks))*100)/400  --create the computed column 
)
 
 
select * from student_marks
insert into student_marks values ('ram',98,85,90,95),
('laxman',90,80,84,92),('siri',99,95,98,99),('kumar',90,72,70,82),
('krish',93,88,95,98)
--here insert any one subject marks is 0 then consider remains subjects marks and calculate the percentage.
insert into student_marks values ('sam',98,85,90,0)
--we wantedly insert any null value in any one of the subject then it's return null value only.
insert into student_marks values ('sanjeev',98,85,90,Null)
insert into student_marks(std_name,sub1_tel_marks,sub2_eng_marks,sub3_mat_marks) values ('kiran',95,93,87)