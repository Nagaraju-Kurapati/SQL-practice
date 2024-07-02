use nagraj@123
--Sql joins
Create table Employee_tab1(
emp_id int unique not null,
emp_name varchar(100) not null,
emp_role varchar(100) not null,
emp_email varchar(max))

select * from Employee_tab1
truncate table Employee_tab1
insert into Employee_tab1 values (101,'ram','Developer','ram123@gmail.com'),(102,'Laxman','Quality Assurance','laxman12@gmail.com'),
(103,'siri','Developer','siri12@gmail.com'),(104,'kumar','Quality Assurance','kumar354@gmail.com'),
(108,'krishna','Developer','krishna12@gmail.com'),(109,'uha','Human Resource','uha354@gmail.com'),
(118,'jani','Talent acquisition','jani12@gmail.com'),(119,'ravi','Accountant','ravi354@gmail.com'),
(110,'dev','Accountant','dev12@gmail.com'),(114,'sagar','Project management officer','sagar354@gmail.com'),
(120,'sai','Project management officer','sai12@gmail.com'),(122,'laxmi','Human Resource','laxmi354@gmail.com')

--creating table
Create table departments1(
dept_id int not null,
dept_name varchar(100) not null,
dept_salary int not null,
emp_id int unique not null)

select *from departments1
drop table departments1
insert into departments1 values (10,'Delivery',50000,101),(20,'Quality',40000,102),
(10,'Delivery',40000,103),(20,'Quality',30000,104),(30,'HR',40000,109),(30,'HR',40000,122),(40,'Accounts',50000,110),
(40,'Accounts',60000,119),(50,'PMO',30000,120)
insert into departments1 values (40,'Accounts',50000,106)
--inner join
Select * from Employee_tab1 as A
inner join departments1 as B
on A.emp_id= B.emp_id
--inner join 
select A.emp_id,A.emp_name,A.emp_role,B.dept_id,B.dept_name,B.dept_salary from Employee_tab1 as A
inner join departments1 as B
on A.emp_id= B.emp_id
--left outer join
select A.emp_id,A.emp_name,A.emp_role,B.dept_id,B.dept_name,B.dept_salary from Employee_tab1 as A
left outer join departments1 as B
on A.emp_id= B.emp_id
--right jion
select A.emp_id,A.emp_name,A.emp_role,B.dept_id,B.dept_name,B.dept_salary,B.emp_id from Employee_tab1 as A
right outer  join departments1 as B
on A.emp_id= B.emp_id
--full join
select A.emp_id,A.emp_name,A.emp_role,B.dept_id,B.dept_name,B.dept_salary from Employee_tab1 as A
full outer join departments1 as B
on A.emp_id= B.emp_id

---------------------------------------------------------
--self join
--creating table
Create table Employee_manager (
emp_id int unique not null,
emp_name varchar(100),
manager_id int );

select * from Employee_manager
insert into Employee_manager values(1,'ram',3),
(2,'laxman',4),(3,'siri', 5),(4,'sam',3),(5,'kumar',4)

select A.emp_name as manager_name,B.emp_name as employee_name from Employee_manager as A
inner join Employee_manager as B
on A.emp_id =B.manager_id;

------------------------------------------------------------
--creating table
create table cricket_players(
id int unique not null,
[name] varchar(100),
email varchar(100));

select * from cricket_players

insert into cricket_players values(1,'ram','ram123@gmail.com'),(2,'laxman','laxman12@gmail.com'),(3,'siri','siri@gmail.com')

--creating table
create table hockey_players(
id int unique not null,
[name] varchar(100),
email varchar(100));

select * from hockey_players

insert into hockey_players values(1,'ram','ram123@gmail.com'),(2,'rajesh','rajesh12@gmail.com'),(3,'sam','sam@gmail.com')

--union operator
select id,[name],email from cricket_players
UNION 
select id,[name], email from hockey_players


select * from cricket_players
UNION ALL
select * from hockey_players


select * from cricket_players
UNION
select id,[name] from hockey_players

--intersect operator
select * from cricket_players
INTERSECT
select *from hockey_players

--Except operator
select * from cricket_players
Except
select * from hockey_players

--Except operator
select * from hockey_players
Except
select * from cricket_players
-------------------------------------------------------------
select count(id) from cricket_players
select * from departments1

select count(*) from departments1
select count(emp_id) from departments1
select sum(dept_salary) as total_salary from departments1

select min(dept_salary) as min_sal from departments1

select max(dept_salary) as max_sal from departments1

select avg(dept_salary) as avg_sal from departments1
----------------------------------------------------------------------------------
--group by command
--here which columns you mention group by command those columns must and should present in select statement
select * from daemons
select emp_gender,sports, sum(emp_sal) as total_salary from daemons 
group by emp_gender,sports
----------------------------------------
--having mostly using to mention conditions on group by columns
--and having also used on aggregate functions
--where clause we can't use on aggregate functions
select * from school

select std_class, sum(std_fee) as total_fee from school 
where std_class in(2,3,4,5)
group by std_class
having sum(std_fee) >40000;
----------------------------------------
select * from Infosys

select emp_role,emp_location, max(emp_sal) from Infosys group by emp_role,emp_location
having sum(std_fee) >=40000;
---------------------------------------------
--views

create view vw_foremployee
as
Select A.*,B.dept_name,B.dept_salary,B.dept_id from Employee_tab1 as A
inner join departments1 as B
on A.emp_id= B.emp_id;

select * from departments1

select * from vw_foremployee


Create view vw_forouters
as
select *from Employee_tab1

Create view vw_forinfosys
as 
select * from infosys;

--retrieve the data from views
select * from vw_forinfosys

--for example we want creation query for any view use sp_helptext [system store procedure]
--using that we get creation query for tahat view
sp_helptext vw_forinfosys;

--and using alter we modify the views 
Alter view vw_forinfosys
as
select emp_id,emp_name,emp_role,emp_location from infosys

select * from vw_forinfosys


--using drop to delete the view
--syntax
--Drop view view_name
drop view vw_forinfosys

--And we inset , update and delete operations perform on views
--but when ever user perform above actions than those actions should impact on orginal table
--insert operation on view
insert into vw_forinfosys values (10,'bharath','QA',50000,'hyd')
select * from vw_forinfosys
select * from Infosys
--new record inserted in vw_forinfosys view and that record insert into orginal table[Infosys] also

--update operation on view
update vw_forinfosys set emp_name='mahesh' where emp_id=4;
select * from vw_forinfosys
select * from Infosys
--the record updated in vw_forinfosys view and that record updated into orginal table[Infosys] also


--Delete operation on view
delete from vw_forinfosys where emp_id=10;
select * from vw_forinfosys
select * from Infosys
--the above record deleted in vw_forinfosys view and that record deleted into orginal table[Infosys] also



