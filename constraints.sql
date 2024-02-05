--SQL constraints
use nagraj@123
create table a(
id int unique not null,
name varchar(100) not null,
job varchar(100) not null
)
select * from a 
insert into a values (1,'ram','se')
insert into a values (1,'kumar','se')--throw an error 
--due to we mention unique constraint on id column. while declaring the table we pass unique constraint for id column,
--so how many records you going to insert in that table all thet records id column values id diffrent
--or you maintain diff b/w that id column values otherwise it's through an error
insert into a values (2,'laxman','bankjob')
insert into a values (3,'sam','bankjob')--not null constraint allows the duplicates
insert into a values (4,'uha',null)--throw an error
--you pass any one column value 'NULL' it's not accepted.
--because not null constraint other then null values only accepted.
insert into a values (3,'sam','')--you pass without value just pass empty string it's accepted.
--adding not null constaint 
alter table dbo.a add unique (id)
--drop the unique constarint
alter table a
drop [UQ__a__3213E83E90D1584B]
 
---------------------------------------------------------------------------
alter table dbo.a drop [UQ__a__DC90FCA0A3E2B235]
alter table dbo.a add  unique (job)
 
==========================================================================================================
 
use nagraj@123
create table apollo_hospital_staff(
person_id int primary key,
person_name varchar (100) not null,
person_role varchar(100) not null,
person_gender  varchar(10),
person_sal int
)
drop table apollo_hospital_staff
select * from apollo_hospital_staff
insert into apollo_hospital_staff values (1,'siri','surgeon','F',100000)
delete from apollo_hospital_staff where person_id=2
insert into apollo_hospital_staff values (1,'siri','surgeon','F',100000)--throw an error
--here that duplicates not allowed in id column because
--while declaring the table we mention primary key constraint for that id column
--primary key combination of unique and not null
--so,id column not taking duplicates and null values
insert into apollo_hospital_staff values (2,'sam','General surgery','F',80000)
insert into apollo_hospital_staff values (3,'ram','Neuro surgeon','M',200000)
insert into apollo_hospital_staff values (4,'laxman','Ophthalmologist','M',200000)
insert into apollo_hospital_staff values (5,'uha','gynecologist','F',200000)
insert into apollo_hospital_staff values (6,'amrutha','Cardiologist surgeon','F',300000)
insert into apollo_hospital_staff values (null,'amrutha','Cardiologist surgeon','F',300000)
insert into apollo_hospital_staff (person_name,person_role,person_gender,person_sal) values ('amrutha','Cardiologist surgeon','F',300000)--throw an error
--here we don't pass value for id column then it's taking null value,butprimary key not allow null values also
--droping the primary constaint
alter table dbo.apollo_hospital_staff drop [PK__apollo_h__543848DFCC60A6AE]
--Add the primary key constraint
alter table dbo.apollo_hospital_staff add primary key (person_id)
======================================================================================================
use nagraj@123
Create table voters (
voter_id int primary key identity,
voter_name varchar(100) not null,
voter_age int check(voter_age >=18),
--voter_add varchar(100) default 'khammam'
)
drop table voters
select * from voters
insert into voters values ('ram',19)
insert into voters values ('siri',19)
insert into voters values ('kumar',23)
insert into voters values ('sam',18)
insert into voters values ('uha',17)--throw an error
--here you trying to pass bellow check condtion value then, it's trrow an error
 
alter table voters
add constraint primary key
(voter_id)
========================================================================================================
use nagraj@123
create table b (
p_id int primary key identity(1,5),
p_name varchar(100),
p_age int default(20),
p_add varchar(100) default 'hyd'
)
select * from b
insert into b values('ram',20,'hyd')
insert into b (p_name)values('siri')
insert into b (p_name)values('laxman')
insert into b (p_name)values('sam')
insert into b values('ram',25,'khammam')
 
==========================================================================================
use nagraj@123
create table table1(col1 int, col2 int )
 
alter table table1 
--alter column col1 int not null
add constraint sflks primary key (col2)
 
=====================================================================================================================
=====================================================================================================================
use nagraj@123
--primary key is combination of unique and not null
create table customer_tab1 (
c_id int primary key ,
c_name varchar(100),
c_add varchar(max),
c_city varchar(100)
)
 
select * from customer_tab1
 
insert into customer_tab1 values (1,'ram','nvc 2-160/2 chinthakani mandal 507206','khammam'),
(2,'siri','ramapuram 2-110/1 madira mandal 607346','vijayawada'),
(3,'laxman','kodad 3-09/2 kodad mandal 468308','suryapet'),
(4,'kumar','navarm 1-03/2 ragunathapalem mandal 406237','khammam'),
(5,'sam','bonakal 2-153/1 bonakal mandal 693709','khammam')
 
========================================================================================================================
create table orders_tab1 (
order_id int primary key,
order_item varchar(100) not null,
ordder_quantity int,
price_of_1 int,
c_id int foreign key references customer_tab1(c_id)
)
 
select * from orders_tab1
 
insert into orders_tab1 values (101,'laptop',1,50000,1),
(102,'mouse',2,500,2),(103,'charger',3,600,3),
(104,'iphone',1,60000,4),(105,'realme',3,10000,5)
 
insert into orders_tab1 values (109,'laptop',1,50000,6)--error
 
--in customer table c_id 6 is not available and c_id refrence to c_id in order table so we can't insert this row
 
--ex
delete from customer_tab1 where c_id=3;--error
--we can't delete row because in two tables we have relation
--create the foreign key while declaring the table
--column name constraint references table name(column_name)
--c_id int foreign key references customer_tab1(c_id)
 
--drop the foreign key
--alter table name drop constraint column name
alter table  dbo.orders_tab1  drop  FK__orders_tab__c_id__2739D489
 
 
--create foreign key on existed table
--alter table name add constraint(column nmae) references table name(column_nmae)
 
alter table dbo.orders_tab1 add foreign key(c_id) references customer_tab1(c_id)
has context menu

