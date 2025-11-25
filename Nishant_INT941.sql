create database Nishant
use Nishant

create table Employee
(Employee_ID int,
EmployeeName varchar(20),
Department varchar(20),
DOJ date,
ProjectName varchar(20),
ProjectID int)

insert into Employee values
(101, 'Ramesh', 'Finance', '2024-09-12', 'E-COM', 431),
(102, 'Suresh', 'DE', '2022-09-12', 'Market', 578),
(103, 'Hitesh', 'HR', '2023-09-12', 'Finance', 703),
(104, 'Pritesh', 'DS', '2024-09-12', 'Prediction', 136),
(105, 'Mahesh', 'Cloud', '2012-09-12', 'Hotel', 229),
(106, 'Jignesh', 'FS', '2022-09-12', 'Market', 578)

select * from Employee

alter table Employee alter column EmployeeName varchar(100)

exec sys.sp_rename 'Employee', 'EmployeeDetails'

select * from EmployeeDetails

update EmployeeDetails set Department= 'HR' where Employee_ID=101

delete from EmployeeDetails where DOJ<'2022'

insert into EmployeeDetails values
(106, 'Jitesh', 'HR', '2023-09-01', 'Finance', 431),
(104, 'Rahesh', 'IT', '2024', 'Finance', 554),
(105,'Amit', 'IT', '2023', 'System', 554) 

update EmployeeDetails set Employee_ID=109 where EmployeeName='Jitesh'

select * from EmployeeDetails where Department='HR' or Department='IT'

select * from EmployeeDetails where Department<>'Marketing'

select * from EmployeeDetails where EmployeeName like 'A%'

select * from EmployeeDetails where DOJ>'2022' and DOJ<'2023'

select * from EmployeeDetails where ProjectName like '%Finance%'

select * from EmployeeDetails where ProjectID is null

select * from EmployeeDetails where EmployeeName like 'J%'

select * from EmployeeDetails where Department='IT' and ProjectID>500

--compound operator
select EmployeeName +', '+ Department as Details from EmployeeDetails
