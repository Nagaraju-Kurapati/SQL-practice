--aggregate functions
--this functions perform manipulations on set of values and return single value
--sum(),avg(),max(),count(),min()
use nagraj@123
Create table school (
std_id int primary key identity,
std_name varchar(100) not null,
std_gender varchar(100),
std_class int,
std_fee int
)
select * from school
 
insert into school values('ram','M',5,10000),('siri','f',8,20000),
('laxman','M',8,20000),('sam','F',7,15000),('sagar','M',5,10000),
('rani','F',5,10000),('siri','F',9,30000),
('kumar','M',7,15000),('sriram','M',6,12000),('sravan','M',6,12000),
('rajesh','M',9,30000),('krishna','M',8,20000),('uha','F',6,12000),
('charan','M',6,12000)
 
select count(std_id)as total_students from school
select sum(std_fee) as total_fee from school
select max(std_fee) as max_fee from school
select min(std_fee) as min_fee from school
select avg(std_fee) as avg_fee from school
 
--group by clause
--this is used with aggregate functions to group the result set by one or more columns
--what ever selected columns those columns present in group by command.
 
select std_gender,avg(std_fee) as avg_fee from School group by std_gender
select std_class,max(std_fee) as max_fee from school group by std_class
 
select voter_add, count(voter_id) as total_voters from voters_list group by voter_add
select emp_location,max(salary) as max_sal from employees group by emp_location
select emp_gender,avg(salary) as avg_sal from employees group by emp_gender
select emp_company,sum(salary) as total_sal from employees group by emp_company
select emp_company,min(salary) as min_sal from employees group by emp_company
 
select std_class,sum(std_fee) as total_fee from school group by std_class
 
 
--like operator
--like operator mostly using on where clause %,_,[]
--it's mostly using the search specified pattern in a column
select * from school where std_name like '%a'
select * from school where std_name like 's%m'
select * from school where std_name like 'k%'
select * from school where std_name like '%sh%'
select * from school where std_name like 's__'
select * from school where std_name like '______a'
select * from school where std_name like '_a%'
select * from school where std_name like '[s,k,r,m,u]%'
select * from school where std_name like '[a-z]%'
 
 
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Std_id]
      ,[Std_name]
      ,[Std_branch]
      ,[Std_marks]
      ,[Std_add]
  FROM [pranay].[dbo].[sample_data]
 
  select sum(std_marks) from [pranay].[dbo].[sample_data]
    select avg(std_marks) from [pranay].[dbo].[sample_data]
	  select max(std_marks) from [pranay].[dbo].[sample_data]
	    select min(std_marks) from [pranay].[dbo].[sample_data]
		  select count(Std_id) from [pranay].[dbo].[sample_data]
		    select count(*) from [pranay].[dbo].[sample_data]