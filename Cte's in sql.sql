
--CTE's
use pranay

select * from students
create table students_details(
std_id int ,
std_name varchar(100),
std_gender varchar(100),
std_age int,
std_class int,
std_fee int,
std_location varchar(max));



alter table students_details alter column std_class varchar(100);
--adding primary key constarint on std_id column
Alter table students_details alter column std_id int not null

alter table students_details add primary key (std_id)

insert into students_details values (101,'ram','Male',16,'10 th class',40000,'Khammam'),
(102,'kumar','Male',14,'8 th class',25000,'warangal'),
(103,'siri','Female',16,'10 th class',40000,'Khammam'),
(104,'laxman','Male',13,'7 th class',20000,'vijayawada'),
(105,'ramya','Female',14,'8 th class',25000,'Khammam'),
(106,'sagar','Male',16,'10 th class',40000,'warangal'),
(107,'laxmi','Female',16,'10 th class',40000,'warangal'),
(108,'pragna','Female',14,'8 th class',25000,'Khammam'),
(109,'sai','Male',15,'9 th class',35000,'vijayawada'),
(110,'janu','Male',16,'10 th class',40000,'warangal'),
(111,'devendra','Male',15,'9 th class',35000,'Khammam'),
(112,'srinu','Male',14,'8 th class',25000,'warangal'),
(113,'rajesh','Male',13,'7 th class',20000,'Khammam'),
(114,'charan','Male',15,'9 th class',35000,'warangal'),
(115,'uha','Female',16,'10 th class',40000,'Khammam'),
(116,'chandana','Female',15,'9 th class',35000,'Khammam'),
(117,'amrutha','Female',14,'8 th class',25000,'vijayawada'),
(118,'ashwini','Female',16,'10 th class',40000,'vijayawada'),
(119,'devansh','Male',14,'8 th class',25000,'Khammam'),
(120,'priyanka','Female',15,'9 th class',35000,'Khammam');


select * from students_details

select std_id,std_name,A.std_gender,std_age,std_class,std_fee,std_location,A.gender_total
from students_details 
inner join 
(select std_gender , count (*) as gender_total from students_details 
group by std_gender ) as A
on
A.std_gender= students_details.std_gender;



select std_id,std_name,A.std_gender,std_age,std_class,std_fee,std_location,A.gender_total,A.total_fee,A.max_fee,A.min_fee
from students_details
inner join
(select std_gender, count(*) as gender_total,
sum(std_fee) as total_fee,
max(std_fee) as max_fee,
min(std_fee) as min_fee
from students_details
group by std_gender) as A
on
A.std_gender=students_details.std_gender;

--group by commmand
select std_gender,count(*) as gender_total from students_details
group by std_gender

--over clause with partition by
select std_id ,std_name,std_gender,std_class,
count(*) over (partition by std_gender) as gender_total
from students_details
where std_class in('10 th class','9 th class')

--rank functon with order by clause
select std_id,std_name,std_gender,std_fee,
rank() over (order by std_fee desc) as [rank]
from students_details

--rank function with partition by 
select std_id,std_name,std_gender,std_fee,
rank() over (partition by std_gender order by std_fee desc) as [rank]
from students_details

--dense_rank function with order by clause
select std_id,std_name,std_gender,std_fee,
dense_rank() over( order by std_fee desc) as [dense_rank]
from students_details

--dense rank with partition by clause
select std_id,std_name,std_gender,std_fee,
dense_rank() over (partition by std_gender order  by std_fee desc) as [dense_rank]
from students_details

--row_number function with order by clause
select std_id,std_name,std_gender,std_fee,
row_number() over (order by std_fee desc) as [row_number]
from students_details

--row_number with partition by clause
select std_id,std_name,std_gender,std_fee,
row_number() over (partition by std_gender order by std_fee desc) as [row_number]
from students_details


select std_id,std_name,std_gender,std_fee,
rank() over(order by std_fee desc) as [rank],
dense_rank() over( order by std_fee desc) as [dense_rank],
row_number() over (order by std_fee desc) as [row_number]
from students_details
---------------------------------------------------------------------------

--cte's

with sample_cte1
as
(
select * from students_details where std_gender = 'Male'
)
select * from sample_cte1



with sample_cte1
as
(
select * from students_details where std_gender ='Female'
)
select count(*) as total_students from sample_cte1


with sample_cte1
as
(
select * from students_details where std_gender ='Female'
)
select sum(std_fee) as total_fee from sample_cte1 where std_age >=16


with sample_cte1
as
(
select * from students_details where std_gender ='Female'
)
select max(std_fee) as max_fee from sample_cte1 where std_age >=16


with sample_cte1
as
(
select * from students_details where std_gender ='Female'
)
select min(std_fee) as min_fee from sample_cte1 where std_age >=13


with sample_cte1(id,[name],gender,class)
as
(
select std_id,std_name,std_gender,std_class from students_details where std_gender = 'Male'
)
select id,[name],gender,class from sample_cte1

--inserting and updating and deleting with cte's
with sample_cte1
as
(
select * from students_details
)
insert sample_cte1 values (121,'karunya','Female',16,'10 th class',40000,'Khammam')
update sample_cte1 set Std_name ='Anupama' where std_id = 121
delete sample_cte1 where std_id = 121



--creating view on cte's result set

create view vw_for10thclass
as
with sample_cte
as
(
select * from students_details where std_class='10 th class'
)
select * from sample_cte


select * from vw_for10thclass

--creating multiple cte's in single with clause

with new_cte1
as
(
select *from students_details where std_class='10 th class'
),
new_cte2
as
(
select * from students_details where std_class='9 th class'
)
select * from new_cte1
union all
select * from new_cte2

====================================
with new_cte 
as
(
select count(*) as total_male_students from students_details where std_gender= 'Male'
)
select * from new_cte
