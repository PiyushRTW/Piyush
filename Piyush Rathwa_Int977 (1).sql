create database assessment2
use assessment2

create table employee(
 EmployeeID int primary key,
 FirstName varchar(15),
 LastName varchar(15),
 DepartmentID int,
 Salary money check (Salary>0),
 HireDate date not null)

 insert into employee values(
 1,'Piyush','Rathwa',101,60000,'2024-06-17')

  insert into employee values
 (2,'Pooja','thakar',102,90000,'2024-03-15'),
 (3,'JAy','GAmit',103,40000,'2024-01-15'),
 (4,'nadeem','turab',104,80000,'2024-04-26'),
 (5,'abc','xyz',105,50000,'2024-03-15'),
 (6,'pqr','abc',106,37000,'2024-04-15'),
 (7,'lmn','opq',107,20000,'2024-05-15'),
 (8,'rst','uvw',108,39000,'2024-06-15'),
 (9,'xyz','abx',109,52000,'2024-07-15'),
 (10,'RTX','GTX',110,60000,'2024-08-15'),
 (11,'ved','thakar',111,1000000,'2024-12-15'),
 (12,'mayank','Ahir',112,26000,'2024-11-15')

 update employee set DepartmentID = 101 where DepartmentID in (105,108,111,112)

 --1. Write a query to find all employees whose salary is greater than the average salary
--of all employees.

select * from employee
select FirstName,lastname from employee where salary > (select Avg(Salary) from employee)

--2. Write a query to find the total number of employees hired in each year.
select count(EmployeeID) as '2024' from employee where HireDate between '2024-02-14' and '2025-02-14'
select count(EmployeeID) as '2023' from employee where HireDate between '2023-02-14' and '2024-02-14'
select count(EmployeeID) as '2022' from employee where HireDate between '2022-02-14' and '2023-02-14'

--3. Write a query to find the average salary of employees in each department, but only
--include departments with more than 5 employees.

select DepartmentID,avg(salary) 
from employee 
group by DepartmentID 
having DepartmentID in 
(select DepartmentID from employee group by DepartmentID having COUNT(EmployeeID)>5)

--4. Write a query to find all employees who were hired in the last 3 years and have a
--salary greater than 50,000.

select FirstName, LastName from employee where HireDate between '2022-02-14' and '2025-02-14' and salary>50000

--5. Write a query to find the total salary paid to employees in each department, but only
--include departments where the total salary is greater than 500,000.

select DepartmentID,Sum(Salary) from employee 
group by DepartmentID having DepartmentID in 
(Select DepartmentID from employee group by DepartmentID having Sum(Salary) > 500000 ) 

--6. Write a query to find departments with more than 10 employees.
select DepartmentID,Count(*) from employee group by DepartmentID having Count(*)>10

--7. Write a query to find employees who have been with the company for more than 10
--years and have a salary greater than 60,000.

select FirstName,LastName from employee where HireDate < '2015-02-14' and Salary > 60000

--8. Write a query to find departments with an average salary greater than 70,000.

select DepartmentID,avg(Salary) from employee group by DepartmentID having avg(Salary) > 70000

--9. Write a query to find the total number of employees in each department.
select DepartmentID,count(EmployeeID) from employee group by DepartmentID 

--10. Write a query to find the highest salary among all employees.
select max(Salary) as 'Highest Salary' from employee