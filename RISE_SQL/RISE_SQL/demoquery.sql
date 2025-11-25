CREATE DATABASE DEMO
USE DEMO
--TABLE CREATION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE ADDRESSINFO
(ADDID INT IDENTITY(2000,1 )PRIMARY KEY,PHYADD VARCHAR(100) , SECONDARYADD VARCHAR(100),STATENAME VARCHAR(20) ,
CITY VARCHAR(20) , COUNTRY VARCHAR(20) , PINCODE INT )

CREATE TABLE USERINFO 
(USERID INT IDENTITY(1,1) PRIMARY KEY,
FIRSTNAME VARCHAR(50) NOT NULL,LASTNAME VARCHAR(50) ,
PHONE VARCHAR(20) ,EMAIL VARCHAR(50) ,
DOB DATE,ADDRESSID INT,
GENDER VARCHAR(10),AGE INT,
FOREIGN KEY (ADDRESSID) REFERENCES ADDRESSINFO(ADDID),
CONSTRAINT CHECK_LENGTH CHECK (LEN(PHONE)=10)
)

CREATE TABLE LOGININFO
(LOGINID INT,USERNAME VARCHAR(50) ,EMAIL VARCHAR(50) ,PASSWORD_ VARCHAR(50)
FOREIGN KEY (LOGINID) REFERENCES USERINFO(USERID)) 


CREATE TABLE PROFILEINFO(
ID INT , NAME_ VARCHAR(50) , EMAIL VARCHAR(50),
FOREIGN KEY (ID) REFERENCES USERINFO(USERID))

CREATE TABLE PRODUCTINFO
(PRODUCTID INT IDENTITY(1200,1) PRIMARY KEY,PRODUCTNAME VARCHAR(50),
BRANDID INT ,BRANDNAME VARCHAR(20),PRICE MONEY,DESCRIPTION_ VARCHAR(100) ,
TYPEOFPRODUCT VARCHAR(30),QUANTITY INT)

CREATE TABLE SUBCATEGORY (
SC_ID INT PRIMARY KEY , SC_NAME VARCHAR (50), PRODUCT_ID INT  ,
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTINFO(PRODUCTID))

CREATE TABLE PAYMENTINFO(
PAYMENTID INT  PRIMARY KEY,USERID INT,
TRANSACTIONID INT IDENTITY(127975,10),TIMEOFTRANSACTION TIME,
STATUSOFTRANSACTION VARCHAR(20),
FOREIGN KEY (USERID) REFERENCES USERINFO(USERID)
)

CREATE TABLE WISHLIST(
WID INT IDENTITY(6000,1),USERID INT,PID INT,
FOREIGN KEY (USERID) REFERENCES USERINFO(USERID),
FOREIGN KEY (PID) REFERENCES PRODUCTINFO(PRODUCTID))

--DROP TABLES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP TABLE ADDRESSINFO
DROP TABLE USERINFO      --REFERENCES ADDRESSINFO
DROP TABLE LOGININFO     --REFRENCES USERINFO
DROP TABLE PROFILEINFO   --REFERENCES USERINFO
DROP TABLE PAYMENTINFO   --REFERENCES USERINFO
DROP TABLE WISHLIST      --REFERENCES USERINFO AND PRODUCTINFO
DROP TABLE PRODUCTINFO    
DROP TABLE SUBCATEGORY   --REFERENCES PRODUCTINFO

--FETCH TABLES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT * FROM ADDRESSINFO
SELECT * FROM USERINFO   
SELECT * FROM LOGININFO  
SELECT * FROM PAYMENTINFO 
SELECT * FROM PROFILEINFO  
SELECT * FROM PRODUCTINFO    
SELECT * FROM SUBCATEGORY   
SELECT * FROM WISHLIST

--INSERT INTO TABLES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Insert into ADDRESSINFO
INSERT INTO ADDRESSINFO (PHYADD, SECONDARYADD, STATENAME, CITY, COUNTRY, PINCODE) VALUES
('123 Main St', 'Apt 4B', 'California', 'Los Angeles', 'USA', 90001),
('456 Elm St', 'Suite 300', 'Texas', 'Houston', 'USA', 77001),
('789 Pine St', NULL, 'New York', 'New York City', 'USA', 10001),
('321 Oak St', 'Floor 2', 'Florida', 'Miami', 'USA', 33101),
('555 Maple St', NULL, 'Illinois', 'Chicago', 'USA', 60601),
('777 Cedar St', 'Unit 5', 'Washington', 'Seattle', 'USA', 98101),
('999 Birch St', NULL, 'Georgia', 'Atlanta', 'USA', 30301),
('159 Redwood St', 'Bldg 1', 'Nevada', 'Las Vegas', 'USA', 89101),
('753 Walnut St', NULL, 'Ohio', 'Columbus', 'USA', 43201),
('852 Cherry St', 'Room 12', 'Colorado', 'Denver', 'USA', 80201);

-- Insert into USERINFO
INSERT INTO USERINFO (FIRSTNAME, LASTNAME, PHONE, EMAIL, DOB, ADDRESSID, GENDER, AGE) VALUES
('John', 'Doe', '9876543210', 'johndoe@example.com', '1990-05-15', 2000, 'Male', 33),
('Jane', 'Smith', '8765432109', 'janesmith@example.com', '1992-08-22', 2001, 'Female', 31),
('Alice', 'Brown', '7654321098', 'alicebrown@example.com', '1985-11-10', 2002, 'Female', 38),
('Bob', 'Johnson', '6543210987', 'bobjohnson@example.com', '1988-02-25', 2003, 'Male', 36),
('Charlie', 'Davis', '5432109876', 'charliedavis@example.com', '1995-07-19', 2004, 'Male', 28),
('Emma', 'Wilson', '4321098765', 'emmawilson@example.com', '1980-09-30', 2005, 'Female', 43),
('David', 'Martinez', '3210987654', 'davidmartinez@example.com', '1993-12-05', 2006, 'Male', 30),
('Sophia', 'Taylor', '2109876543', 'sophiataylor@example.com', '1996-04-18', 2007, 'Female', 27),
('Liam', 'Harris', '1098765432', 'liamharris@example.com', '1987-06-09', 2008, 'Male', 36),
('Olivia', 'Clark', '0987654321', 'oliviaclark@example.com', '1999-01-23', 2009, 'Female', 25);

-- Insert into LOGININFO
INSERT INTO LOGININFO (LOGINID, USERNAME, EMAIL, PASSWORD_) VALUES
(1, 'johndoe90', 'johndoe@example.com', 'pass1234'),
(2, 'janesmith22', 'janesmith@example.com', 'securePass'),
(3, 'aliceB85', 'alicebrown@example.com', 'helloAlice'),
(4, 'bobJ88', 'bobjohnson@example.com', 'bobSecure'),
(5, 'charlieD95', 'charliedavis@example.com', 'charDpass'),
(6, 'emmaW80', 'emmawilson@example.com', 'emmaStrong'),
(7, 'davidM93', 'davidmartinez@example.com', 'dMartinez'),
(8, 'sophiaT96', 'sophiataylor@example.com', 'sophiaTay'),
(9, 'liamH87', 'liamharris@example.com', 'liamH789'),
(10, 'oliviaC99', 'oliviaclark@example.com', 'oliviaC99');

-- Insert into PRODUCTINFO
INSERT INTO PRODUCTINFO (PRODUCTNAME, BRANDID, BRANDNAME, PRICE, DESCRIPTION_, TYPEOFPRODUCT, QUANTITY) VALUES
('Laptop', 20000, 'Dell', 800.00, 'High-performance laptop', 'Electronics', 50),
('Smartphone', 20010, 'Samsung', 999.99, 'Latest Android phone', 'Electronics', 100),
('Headphones', 20020, 'Sony', 150.50, 'Noise-canceling headphones', 'Accessories', 75),
('Smartwatch', 20030, 'Apple', 399.00, 'Apple Watch Series 7', 'Wearable', 40),
('Backpack', 20040, 'Nike', 75.00, 'Durable travel backpack', 'Fashion', 30),
('Shoes', 20050, 'Adidas', 120.00, 'Running shoes', 'Footwear', 60),
('Tablet', 20060, 'Lenovo', 300.00, 'Android tablet', 'Electronics', 25),
('Camera', 20070, 'Canon', 850.00, 'Professional DSLR', 'Photography', 20),
('Bluetooth Speaker', 20080, 'JBL', 200.00, 'Waterproof portable speaker', 'Audio', 90),
('Monitor', 20090, 'LG', 250.00, 'Full HD 27-inch monitor', 'Electronics', 55);

-- Insert into SUBCATEGORY
INSERT INTO SUBCATEGORY (SC_ID, SC_NAME, PRODUCT_ID) VALUES
(1, 'Laptops', 1200),
(2, 'Phones', 1201),
(3, 'Accessories', 1202),
(4, 'Wearables', 1203),
(5, 'Bags', 1204),
(6, 'Shoes', 1205),
(7, 'Tablets', 1206),
(8, 'Cameras', 1207),
(9, 'Audio', 1208),
(10, 'Monitors', 1209)

--INSERT INTO WISHLIST
INSERT INTO WISHLIST (USERID , PID) VALUES
(1,1200),
(1,1201),
(2,1201),
(3,1203),
(5,1205),
(5,1204),
(2,1202),
(5,1202),
(6,1201),
(3,1200)

--UPDATE TABLES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UPDATE ADDRESSINFO SET  STATENAME='MIAMI' WHERE ADDID IN (6,7)  
UPDATE PRODUCTINFO SET PRICE=600 WHERE BRANDNAME = 'JBL'

--DELETE FROM TABLES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELETE FROM PRODUCTINFO WHERE PRICE <120
DELETE FROM USERINFO WHERE FIRSTNAME='JOHN'

--VIEWS
CREATE VIEW VIEW_USERINFO
AS
SELECT USERID,FIRSTNAME,LASTNAME,PHONE FROM USERINFO WHERE USERID BETWEEN 1 AND 7

SELECT * FROM VIEW_USERINFO
DROP VIEW VIEW_USERINFO

--SINGLE INDEX
CREATE INDEX IDX_USERINFO ON USERINFO(FIRSTNAME) 

--DEPARTMENT  IS HR I WANT TO CHANGE SALARY AND AGE > 30 
