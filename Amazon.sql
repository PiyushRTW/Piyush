use Amazon

create table Registration(
Reg_ID int identity primary key,
FirstName varchar(30) not null,
LastName varchar(30) not null,
Email nvarchar(30) unique not null, --alternate key
PWD nvarchar(20) not null,
Ph_No int,
DOB date)

alter table Registration add Age int check(Age>=15)

select * from Registration

insert into Registration values
('Ramesh', 'Kumar', 'ramesh123@ramesh.com', '1234abcd',0000000000, 16)

insert into Registration values
('Aarav', 'Sharma', 'aarav.sharma@example.com', 'Password123', 9876543, 25),
('Ananya', 'Iyer', 'ananya.iyer@example.com', 'SecurePass1', 98765432, 22),
('Vihaan', 'Gupta', 'vihaan.gupta@example.com', 'VihaanPass45', 98765432, 30),
('Ishita', 'Mehta', 'ishita.mehta@example.com', 'Ishita@123', 98765432, 18),
('Kabir', 'Reddy', 'kabir.reddy@example.com', 'Kabir#2023', 98765432, 28);

drop table Registration

create table Login(
Log_ID varchar(6) primary key,
Reg_ID int Foreign Key references Registration(Reg_ID)
)

drop table Login

INSERT INTO Login (Log_ID, Reg_ID)
VALUES
(A101, 2),  -- Log_ID 1 linked to Ramesh Kumar (Reg_ID 2)
(2, 4),  -- Log_ID 2 linked to Aarav Sharma (Reg_ID 4)
(3, 5),  -- Log_ID 3 linked to Ananya Iyer (Reg_ID 5)
(4, 6),  -- Log_ID 4 linked to Vihaan Gupta (Reg_ID 6)
(5, 7),  -- Log_ID 5 linked to Ishita Mehta (Reg_ID 7)
(6, 8),  -- Log_ID 6 linked to Kabir Reddy (Reg_ID 8)
(7, 9),  -- Log_ID 7 linked to Meera Nair (Reg_ID 9)
(8, 10), -- Log_ID 8 linked to Rohan Patel (Reg_ID 10)
(9, 11), -- Log_ID 9 linked to Sanya Kapoor (Reg_ID 11)
(10, 12), -- Log_ID 10 linked to Aditya Mishra (Reg_ID 12)
(11, 13); -- Log_ID 11 linked to Tanya Singh (Reg_ID 13)

select * from Registration

select * from Login

create table Category(
CID varchar(10) primary key, 
Category_name varchar(20) unique not null)

select * from Category



create table Products(
PID varchar(20) primary key,
P_name varchar(30) unique not null,
BID varchar(100) foreign key references Brands(B_ID) on update cascade on delete cascade,
Descriptions varchar(200),
Quantity int not null)
--quantity(inventory: seller, brand)

drop table products

create table Brands(
B_ID varchar(100) primary key,
B_name varchar(200) unique)
--

INSERT INTO Brands (B_ID, B_name)
VALUES
('BR001', 'Tata'),
('BR002', 'Samsung'),
('BR003', 'Apple'),
('BR004', 'Nike'),
('BR005', 'Sony');


INSERT INTO Products (PID, P_name, BID, Descriptions, Quantity)
VALUES
('PR001', 'iPhone 15', 'BR003', 'Apple flagship smartphone with A16 chip.', 50),
('PR002', 'AirPods Pro', 'BR003', 'Noise-cancelling wireless earbuds from Apple.', 100),
('PR003', 'Galaxy S23', 'BR002', 'Samsung premium smartphone with advanced features.', 70),
('PR004', 'Sony Bravia TV', 'BR005', '4K Ultra HD smart TV from Sony.', 30),
('PR005', 'Nike Air Max', 'BR004', 'Popular running shoes by Nike.', 120);


select * from Brands
select * from Products

insert into Brands values
('BR006', 'Puma')

insert into Products values
('PR006', 'Puma Sport', 'BR006', 'Just another shoes', 60)

delete from Brands where B_ID='B009'

