Create database NishantCommonModule

Use NishantCommonModule

Create Table Students
(StudentID int primary key,
FirstName varchar(20),
LastName varchar(20),
Age int,
SpecializationID varchar(5) foreign key references Specialization(SpecializationsID))

insert into Students values
(1001, 'Ramesh', 'Patel', 21, 'S101'),
(1002, 'Suresh', 'Mehta', 20, 'S101'),
(1003, 'Rajesh', 'Sharma', 20, 'S103'),
(1004, 'Amit', 'Shukla', 19, 'S105'),
(1005, 'Kabir', 'Mehra', 21, 'S102'),
(1006, 'Anand', 'Gupta', 22, 'S103'),
(1007, 'Sameer', 'Pandey', 24, 'S104')

Create table Specialization
(SpecializationsID varchar(5) primary key,
SpecializationName varchar(20))

Insert into Specialization values
('S101','AI/ML'),
('S102','FS -.NET'),
('S103','FS - Java'),
('S104','Cloud Tech'),
('S105','Data Science')

Create table Courses
(CourseID varchar(5) primary key,
CourseName varchar(20),
Credits int)

Insert into Courses values
('C1','Course1',3),
('C2','Course2',3),
('C3','Course3',3),
('C4','Course4',4),
('C5','Course5',4)


Create table Enrollments
(EnrollmentID varchar(5) primary key,
StudentID int foreign key references Students(StudentID),
CourseID varchar(5) foreign key references Courses(CourseID),
Grade char(1))

Insert into Enrollments values
('E101',1001,'C1','A'),
('E102',1002,'C2','B'),
('E103',1003,'C4','C'),
('E104',1004,'C3','A'),
('E105',1005,'C1','B'),
('E106',1006,'C5','B'),
('E107',1007,'C3','C')

insert into Enrollments values
('E108',1002,'C1','A'),
('E109',1003,'C2','B'),
('E110',1006,'C4','C'),
('E111',1007,'C3','A'),
('E112',1004,'C1','B'),
('E113',1001,'C5','B'),
('E114',1005,'C3','C')

select * from Students
select * from Courses
select * from Enrollments
select * from Specialization

--1. Retrieve the names of students and their corresponding Specialization names. 
Select FirstName, SpecializationName
from Students
left join Specialization
on Students.SpecializationID=Specialization.SpecializationsID
--2. Find the names of students who have enrolled in all courses offered by the university. 

select FirstName from Students
inner join Enrollments
on Students.StudentID=Enrollments.StudentID
group by FirstName
having count(CourseID)=5


--3. Retrieve the list of students along with the courses they are enrolled in and their grades.  
select FirstName, CourseName, Grade from Students
left join Enrollments
on Students.StudentID=Enrollments.StudentID
left join Courses
on Courses.CourseID=Enrollments.CourseID

--4. Find the names of students who have never received a grade lower than ‘B’ in any course. 
select distinct(FirstName), Grade from Students
inner join Enrollments
on Students.StudentID=Enrollments.StudentID
left join Courses
on Courses.CourseID=Enrollments.CourseID
where Grade<='B'


select * from Students
select * from Courses
select * from Enrollments
select * from Specialization
--5. Retrieve the list of Specialization along with the number of students enrolled in each Specialization. 
select SpecializationName, count(StudentID) as[Number of Students]
from Specialization
left join Students
on Specialization.SpecializationsID=Students.SpecializationID
group by SpecializationName
--6. Find the names of students who have received an 'A' grade in any course. 
Select FirstName, CourseName from Students
inner join Enrollments
on Students.StudentID=Enrollments.StudentID
left join Courses
on Enrollments.CourseID=Courses.CourseID --have put CourseName additionally on my own as only names output was not looking good.
where Grade='A'

--7. Retrieve the list of courses along with the total number of credits for students enrolled in each course. 
select CourseName, sum(credits) as [Total Credits]
from Courses
left join Enrollments
on Enrollments.CourseID=Courses.CourseID
group by CourseName

--8. Find the names of students who are enrolled in both 'AI/ML' and 'Cloud Tech'. 
select FirstName, SpecializationName from Students
inner join Specialization
on Students.SpecializationID=Specialization.SpecializationsID
where SpecializationName in ('AI/ML', 'Cloud Tech')


--9. Retrieve the names of students along with their Specialization names and the courses they are enrolled in. 

Select FirstName,SpecializationName, CourseName from Students
left join Specialization
on Students.SpecializationID=Specialization.SpecializationsID
left join Enrollments
on Students.StudentID=Enrollments.StudentID
left join Courses
on Enrollments.CourseID=Courses.CourseID


--10. Retrieve the list of students along with their specialization names and the total number of credits they have enrolled.

Select FirstName, SpecializationName, sum(credits) as [Total Credits]
from Students
left join Specialization
on Students.SpecializationID=Specialization.SpecializationsID
left join Enrollments
on Students.StudentID=Enrollments.StudentID
left join Courses
on Enrollments.CourseID=Courses.CourseID
group by FirstName, SpecializationName