create database Piyush
use piyush

create table employee (
EmployeeID int,
EmployeeName char(100),
Department char(10),
DOJ date,
ProjectName varchar(20),
ProjectID varchar
)
alter table employee alter column ProjectID int
--1. Insert at least 6 records in employee table.
insert into employee values (101, 'Piyush Rathwa', 'DevOps', '2025-01-25', 'CIplatform', 6534)
insert into employee values (102, 'Jay Gamit', 'QA', '2025-01-17', 'Weatherforecast', 9021),
(103, 'Pooja Thakar', 'Cloud', '2024-12-17', 'trading platform', 4563),
(104, 'Vasu Rathod', 'FS', '2025-02-02', 'library management', 6734),
(105, 'Druvam Narkar', 'DA', '2025-01-23', 'Impulse', 6352),
(106, 'Shah Jay', 'DS', '2025-01-17', 'kaizen', 8604),
(107, 'Vinayak Chavda', 'MD', '2024-12-21', 'Weatherforecast', 9021)

select * from employee

--2. How can you modify the column EmployeeName to increase its length from 100 to 150
--characters?

alter table employee alter column EmployeeName char(150)

--3. Write a query to rename the table Employee to EmployeeDetails.

alter table employee modify name EmployeeDetails

--4 Write a query to update the Department of an employee whose EmployeeID is 101 to 'HR'

update employee set Department = 'HR' where EmployeeID = 101

--5 Write a query to delete all employees who joined before 2022-01-01

delete from employee where DOJ < '2022-01-01'

--6. Write a query to insert multiple employees in one statement.

insert into employee values (108, 'Jay Gamit', 'QA', '2025-01-17', 'Weatherforecast', 9021),
(109, 'Pooja Thakar', 'Cloud', '2024-12-17', 'trading platform', 4563),
(110, 'Vasu Rathod', 'FS', '2025-02-02', 'library management', 6734)

--7. Write a query to get employees who are either in the ‘IT’ or ‘HR’ department.
select * from employee where Department = 'IT' or Department = 'HR'

--8. Write a query to get employees who are NOT in the ‘Marketing’ department.
select * from employee where department <> 'Marketing'

--9. Write a query to get all employees whose EmployeeName starts with A.

select * from employee where EmployeeName like 'A%'

--10. Write a query to get all employees who joined between 2022-01-01 and 2023-01-01

select * from employee where DOJ between '2022-01-01' and '2023-01-01'

--11. Write a query to find employees whose ProjectName contains the word ‘Finance’.

select * from employee where Department like '%finance%'

--12. Write a query to retrieve all employees who do not have an assigned ProjectID.

select * from employee where ProjectID is null

--13.  find employees whose EmployeeName starts with J

select * from employee where EmployeeName like 'j%'

--14. Retrieve employees who work in the IT department and have a ProjectID greater than
--500.

select * from employee where Department = 'IT' and ProjectID > 500 

--15. Write query to demonstrate the use of compound operator.

declare @x
@x = 4
@x += 10

select x