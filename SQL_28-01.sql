--drop database nish01
--Script to create DB
use Company
--to modify db name
alter database Nish1
modify name = nish01
alter database CO
modify name= Company

--create a new table
create table employees
(ID int,
ename varchar(20),
age int,
salary money,
city varchar(20))
--adding attribute in an existing table
alter table employees add department varchar(20)
--getting all records from employees table using 'select' literal
select * from employees

--insert method
insert into employees values (1, 'Suresh', 20, 20000,'vadodara',  'fullstack')
select 'Nishant' as name, 'Rise' as deparment

select name, create_date, modify_date from sys.tables

insert into employees(ID, ename, age, city, department) values (7, 'Ramesh', 20, 'Vadodara', 'fullstack' )

insert into employees values
(2, 'Mahesh', 20, 30000,'ahmedabad',  'devops'),
(3, 'Kamlesh', 20, 40000,'rajkot',  'QA'),
(4, 'Nitesh', 20, 70000,'vadodara',  'DS'),
(5, 'Pritesh', 20, 10000,'ahmedabad',  'BA'),
(6, 'Hitesh', 20, 30000,'surat',  'DE')

--update method 1
update employees set salary=35000 where id=7
update employees set salary=NULL where ename='Hitesh'

--update method 2
update employees set age =27 where salary is NULL

--update method 3
update employees set salary = 25000 where salary is not NULL

--delete method 1
delete from employees where id =5

insert into employees values
(9, 'Amit', 25, 45000,'vadodara',  'QA')

insert into employees values
(10, 'Asha', 26, 55000,'vadodara',  'QA')
--delete method 3
delete from employees 

--using where
select * from employees where id=2

select ename as firstname from employees where city='ahmedabad' or (salary between 25000 and 100000)

create table Students(
ID int,
Student_Name varchar(20),
STD int,
Section char(1),
Grades char(1))


select * from Students

insert into Students values
(1, 'AAAA', 9, 'B', 'C'),
(2, 'BBBB', 11, 'A', 'A'),
(3, 'CCCC', 11, 'C', 'A'),
(4, 'DDDD', 6, 'D', 'B'),
(5, 'EEEE', 8, 'A', 'D'),
(6, 'FFFF', 9, 'C', 'F'),
(7, 'GGGG', 10, 'B', 'C'),
(8, 'HHHH', 12, 'B', 'B')

alter table Students add birth Date
use Company
update Students set birth='2006' where STD=12 
update Students set birth='2007' where STD=11


-----------------------------------------------------
-----------------------------------------------------
create database Amazon
use Amazon
--tables
--operations
--insert
--ddl,dml

--creating Product details table
create table Product_details(
PID int,
Product_name varchar(15),
Category varchar(10),
Price Money,
Quantity int)

alter table Product_details alter column Category varchar(15)


insert into Product_details values
(211, 'Hair_Dryer', 'Electronics', 4959, 1),
(392, 'Nike Air Jordan', 'Footwears', 23000, 2),
(205, 'Justice', 'Books', 700, 1)

select * from Product_details

select * from employees
select name, salary, 
case
when salary>80000 then 'high salary'
else 'mid'
end as income
from employees
select replace(departmentID, 1, 5) from employees

--replace, case(select case when else end), cast, coalesce, CTE(with CTEname as)
EXEC sys.sp_rename 'Product_details', 'Cart_table'

select name from sys.tables;

---Cart table: will include all the products in the customer's cart

select * from Cart_table

insert into Cart_table values(137, 'The lost Symbol', 'Books', 540, 3)
update Cart_table set Product_name= 'The Lost Symbol' where PID=137


---Day Sale table: which products have what percentage of sale today

create table Day_Sale
(Product_name varchar(15),
Category varchar(10),
Price Money,
Sale_percentage int)

select * from Day_Sale
alter table Day_Sale alter column Category varchar(20)
insert into Day_Sale values
('Laptop', 'Electronics', 750, 15),
('Shoes', 'Fashion', 300, 10),
('Watch', 'Accessories', 2000, 20),
('Smartphone', 'Electronics', 75000, 5),
('Backpack', 'Fashion', 490, 25);

alter table Day_Sale drop column Price

alter table Day_Sale add Discount_Upto money

update Day_Sale set Discount_Upto = 700 where Category='Electronics'
update Day_sale set Discount_Upto = 1000 where Category='Fashion'
update Day_Sale set Discount_Upto = 3500 where Category='Electronics'

--Reseller end day sales table: will have product from one particular reseller on the e-commerce with all its sales of a month
use Amazon
create table Day_end_report(
ORDER_NO int,
Customer_Name varchar(20),
Product_name varchar(20),
Quantity int,
Previous_purchases int,
)

alter table Day_end_report add Price money

select * from Day_end_report

insert into Day_end_report values
(1, 'Ramesh', 'Laptop', 2, 5, 74000),
(2, 'Suresh', 'Smartphone', 3, 10, 40000),
(3, 'Mahesh', 'Headphones', 1, 3, 3000),
(4, 'Amit', 'Keyboard', 4, 7, 2500),
(5, 'Sumit', 'Mouse', 6, 12, 500)

insert into Day_end_report(ORDER_NO, Customer_Name, Product_name, Quantity, Price) values (6, 'Prakash', 'Laptop', 1, 55000)

exec sys.sp_rename 'Day_end_report', 'DER'

select Customer_name,Previous_purchases from DER where Product_name='Laptop'

update DER set Previous_purchases=0 where Previous_purchases is NULL

select * from DER

--customer click behavior data of 10000 customers
drop table behaviour
create table behaviour(
age_range varchar(4),
most_viewed_category varchar(20),
most_used_filter varchar(20),
)
select * from behaviour

alter table behaviour alter column age_range varchar(8)
insert into behaviour values 
('15 to 20', 'electronics', 'rating'),
('20 to 25','fashion','price'),
('25 to 30','fashion','price'),
('35 to 40','toys','price'),
('40 to 45','gadgets','brand'),
('45 to 50','travel','rating')

alter table behaviour add Years year
--between and in operator check

select 5 & 3 as bitwiseand, 5 |3 as bitwiseOR, 5 ^ 3 as bitwiseXOR

declare @x as int
set @x=10;
set @x*=10;
select @x as X;




