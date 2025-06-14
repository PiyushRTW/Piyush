

-- SCRIPT TO CREATE A DATABASE
CREATE DATABASE JAN

-- TO USE THE DATABASE
USE JAN

--TO DROP THE DATABASE
DROP DATABASE JAN

--TO MODIFY DATABASE NAME
ALTER DATABASE JAN 
MODIFY NAME = JAN2025

--View all tables
SELECT NAME FROM SYS.TABLES 

--VIEW TABLE DETAILS
EXEC SP_HELP EMPLOYEEDETAILS

--RENAME TABLE COLUMNS
EXEC SP_RENAME <TABLENAME.COLUMNNAME>,<NEWCOLUMNNAME>

--CREATE A NEW TABLE
CREATE TABLE EMPLOYEEDETAILS
(EID INT IDENTITY PRIMARY KEY, --AUTO GENERATE INCREMENT VALUE , INCREMENT(SEED,INCREMENT VALUE)
ENAME VARCHAR(20),
EAGE INT CHECK (EAGE >=18),
DEPARTMENT VARCHAR(20),
DID INT FOREIGN KEY (DID) REFERENCES DEPARTMENT(DID) ON UPDATE CASCADE ON DELETE CASCADE,             --UPDATE IN PARENT TABLE REFLECTS CHANGES IN CHILD TABLE
SALARY MONEY,
CITY VARCHAR(20))

CREATE TABLE DEPARTMENT(
DID INT PRIMARY KEY,
DNAME VARCHAR(40),LOCATION VARCHAR(40))

INSERT INTO DEPARTMENT VALUES 
(30,'QA','GROUNDFLOOR'),
(20,'FS','FIRSTFLOOR')

--SELECT ROWS FROM TABLE
SELECT * FROM DEPARTMENT
SELECT * FROM EMPLOYEEDETAILS

--SELECT IS A LITERAL, DOES NOT ALWAYS GO WITH TABLE ,CAN BE USED AS CALCULATOR OR TO SHOW INTEGERS
SELECT (4+3)*2

--IT SUPORTS ONLY SINGLE QUOTES FOR STRINGS
SELECT 'AYAAN'

--TO PUT COLUMN NAMES USE ALIAS "AS"
SELECT 'KETAN' AS NAME, 'RISE' AS DEPARTMENT

--STORE PROCEDURE TO LIST ALL DATABASES
exec sp_databases

--TO LIST ALL TABLES WITH CREATION DATE OR LAST MODIFICATION DATE
SELECT NAME, create_date,modify_date FROM SYS.tables

--INSERT INTO TABLE
INSERT INTO EMPLOYEEDETAILS VALUES(1,'SURESH',20,'FS',20000,'VADODARA')

SELECT * FROM EMPLOYEEDETAILS

INSERT INTO EMPLOYEEDETAILS VALUES(2,'RAMESH',20,'FS','VADODARA') --NOT ALLOWED

--INSERT METHOD 2
INSERT INTO EMPLOYEEDETAILS(EID,ENAME,DEPARTMENT,SALARY,CITY)
VALUES('PIYUSH','QA',25000,'ANAND')
INSERT INTO EMPLOYEEDETAILS VALUES('SURESH',20,'FS',20000,'VADODARA')

--INSERT METHOD 3
INSERT INTO EMPLOYEEDETAILS (ENAME,EAGE,DEPARTMENT,DID,SALARY,CITY)
VALUES('NARESH',23,'QA',30,30000,'NAVSARI'),
('MAHESH',22,'DA',20,25000,'ANAND'),
('JAYESH',24,'DS',30,40000,'AHMEDABAD'),
('KAMESH',25,'DE',30,30000,'SURAT'),
('HITESH',26,'DA',20,30000,'VADODARA'),
('NARESH',18,'QA',20,30000,'AHMEDABAD')


--UPDATE METHOD 1
UPDATE EMPLOYEEDETAILS SET EAGE = 22 WHERE EID = 1
UPDATE DEPARTMENT SET DID=40 WHERE DID =20

SELECT * FROM EMPLOYEEDETAILS

--UPDATE METHOD 2 TO TARGET NULL VALUES
UPDATE EMPLOYEEDETAILS SET EAGE = 18 WHERE EAGE IS NULL

--UPDATE METHOD 3 TO TARGET ALL VALUES
UPDATE EMPLOYEEDETAILS SET SALARY = 25000

--UPDATE ONLY SPECIFIC ROWS
UPDATE EMPLOYEEDETAILS SET EAGE = 18 WHERE EID IN(1,5,7,9)

--DELETE METHOD 1
DELETE FROM EMPLOYEEDETAILS WHERE EID = 8

--DELETE METHOD 2
DELETE FROM EMPLOYEEDETAILS WHERE EAGE IS NULL 

--DELETE METHOD 3 ALL TUPLES DELETED EXCEPT TABLE SCHEMA
DELETE FROM EMPLOYEEDETAILS 

--DELETE METHOD 4 DELETE TABLE ALONG WITH SCHEMA
DROP TABLE EMPLOYEEDETAILS

--DELETE METHOD 5
TRUNCATE TABLE EMPLOYEEDETAILS

--DELETE VS DROP VS TRUNCATE
--DELETE   - ALL RECORDS ARE DELETED EXCEPT SCHEMA BUT WE CAN ADD CONDITIONS
--DROP     - ALL RECORDS+TABLE SCHEMA DELETED
--TRUNCATE - ALL RECORDS ARE DELETED EXCEPT SCHEMA BUT WE CANNOT ADD CONDITIONS

--WHERE CLAUSE 
SELECT * FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'QA'

SELECT * FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'DA' OR DEPARTMENT='QA'

SELECT * FROM EMPLOYEEDETAILS
WHERE (DEPARTMENT = 'DA' AND EAGE =22) AND CITY ='ANAND'

SELECT * FROM EMPLOYEEDETAILS
WHERE SALARY BETWEEN 25000 AND 30000

SELECT EID,ENAME AS FIRSTNAME  FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'DA' OR DEPARTMENT ='QA'

--ALTER:TO CHANGE COLUMN NAME, DATATYPE ,DATASIZE ,ADD A COLUMN
ALTER TABLE EMPLOYEEDETAILS ADD --CONDITION LIKE COLUMN NAME AND TYPE
ALTER <TABLENAME> ALTER COLUMN <CN> <DT> <SIZE>
ALTER <TN> DROP COLUMN <CN>

--TURN OFF AUTO INCREMENT
SET IDENTITY_INSERT EMPLOYEEDETAILS OFF

--AGGREGATE : MAX,MIN,AVG,SUM,COUNT
SELECT SUM(SALARY) FROM EMPLOYEEDETAILS
SELECT MAX(SALARY) FROM EMPLOYEEDETAILS
SELECT MIN(SALARY) FROM EMPLOYEEDETAILS
SELECT COUNT(EID) FROM EMPLOYEEDETAILS       
SELECT COUNT(DISTINCT SALARY) FROM EMPLOYEEDETAILS WHERE SALARY IS NOT NULL 

SELECT * FROM EMPLOYEEDETAILS

--How many rows are in the Employeedetails table?
SELECT COUNT(*) FROM EMPLOYEEDETAILS

--How many rows in the Employeedetails table do not have a NULL value in the Age column?
SELECT COUNT(*) FROM EMPLOYEEDETAILS WHERE AGE IS NOT NULL 

--What is the average Salary for QA Department?
SELECT AVG(SALARY) FROM EMPLOYEEDETAILS WHERE DEPARTMENT='QA'

--How expensive is the highest Salary in the Employeedetails table?
SELECT MAX(SALARY) FROM EMPLOYEEDETAILS

--What is the total salary expenditure for the entire company
SELECT SUM(SALARY) AS TOTALSALARY FROM EMPLOYEEDETAILS

--What is the average age of employees in the "FS" department?
SELECT AVG(EAGE) FROM EMPLOYEEDETAILS WHERE DEPARTMENT='FS'

--What is the youngest employee's age in the company?
SELECT MIN(EAGE) FROM EMPLOYEEDETAILS 

--CONTROL FLOW OF SQL STATEMENTS-> FROM > WHERE > GROUPBY > HAVING > SELECT > ORDERBY  

--How many different cities are employees located in?
SELECT COUNT(DISTINCT CITY) FROM EMPLOYEEDETAILS

--GROUP BY  AND  HAVING

--FIND THE DEPARTMENTS WITH AN AVG SALARY GREATER THAN 20000
SELECT DEPARTMENT FROM EMPLOYEEDETAILS WHERE SALARY > 20000 GROUP BY DEPARTMENT

--LIST THE CITIES WHERE THE AVG AGE IS GREATER THAN 20
SELECT CITY,AVG(EAGE) FROM EMPLOYEEDETAILS  GROUP BY CITY HAVING AVG(EAGE)>20

--FIND THE DEPARTMENTS WITH MORE THAN 5 EMPLOYEES
SELECT DEPARTMENT,COUNT(EID) FROM EMPLOYEEDETAILS  GROUP BY DEPARTMENT HAVING COUNT(EID)>5

--LIST THE CITIES WHERE TOTAL SALARY OF ALL EMPLOYEES EXCEEDS 30000
SELECT CITY,SUM(SALARY) FROM EMPLOYEEDETAILS GROUP BY CITY HAVING SUM(SALARY)>30000

--FIND THE DEPARTMENTS WHERE THE AVG AGE OF EMPLOYEES IS BETWEEN 20 AND 25
SELECT DEPARTMENT,AVG(EAGE) FROM EMPLOYEEDETAILS GROUP BY DEPARTMENT HAVING AVG(EAGE) BETWEEN 20 AND 25

--FIND THE CITIES WHERE THE NO. OF EMP IS GREATER THAN 2 AND AVG SALARY IS LESS THAN 20000
SELECT CITY,COUNT(EID) AS COUNTEMP,AVG(SALARY) AS AVGSALARY FROM EMPLOYEEDETAILS GROUP BY CITY HAVING COUNT(EID) >2 AND AVG(SALARY) < 20000


--KEY:- A SET OF ATTRIBUTES USED TO DEFINE A RECORD OR ROW UNIQUELY
--PRIMARY KEY:A KEY THAT TAKES UNIQUE AND NOT NULL VALUES (ONLY 1 PER TABLE)(CREATES A ORDERED SEQUENCE OF RECORDS IRRESEPECTIVE OF INSERTION ORDER)
--ALTERNATE KEY:A KEY THAT WAS SUPPOSED TO BE A PRIMARY KEY BUT WASNT CHOSESN AS PK ( ONLY 1 PER TABLE)
--SUPER KEY: A SUPER SET OF KEYS 
--CANDIDATE KEY: MINIMAL KEY DERIVED FROM SUPER KEY
--FOREIGN KEY: USED TO ESTABLISH A RELATION BETWEEN TWO TABLES
--UNIQUE KEY: TAKES UNQIUE AND NULL VALUES
--COMPOSITE KEY: COMBINATION OF PRIMARY KEY AND OTHER KEYS


--CLAUSES
--WHERE Clause
--ORDER BY clause
--HAVING Clause
--TOP Clause
--GROUP BY Clause


--CONSTRAINTS
--PRIMARY 
--FOREIGN
--NOT NULL
--CHECK
--UNIQUE
--DEFAULT

--DIFFERENCE BETWEEN CONSTRAINTS AND KEYS 

--VIEW:TEMPORARY VIRTUAL TABLE (DOES NOT STORE ON DISK)
CREATE VIEW EMPVIEW
AS 
SELECT  ENAME,SALARY,COUNT(*) AS RECORDCOUNT FROM EMPLOYEEDETAILS   --READ ONLY VIEW
WHERE SALARY >20000 GROUP BY ENAME,SALARY

CREATE VIEW EMPVIEW2
AS
SELECT EID,ENAME,DEPARTMENT FROM EMPLOYEEDETAILS WHERE DEPARTMENT='FS'  --UPDATEABLE VIEW  

SELECT * FROM EMPLOYEEDETAILS
SELECT * FROM EMPVIEW
SELECT * FROM EMPVIEW2
DROP VIEW EMPVIEW

UPDATE EMPVIEW2 SET DEPARTMENT='DS' WHERE DEPARTMENT='FS' --AFFECTS THE BASE TABLE

UPDATE EMPVIEW SET SALARY=20000 WHERE ENAME='HITESH'      -- CANNOT UPDATE 
--A VIEW IS NOT UPDATEABLE IF IT does not use aggregations (SUM, COUNT, AVG), DISTINCT, GROUP BY, or JOIN.
--IMPACT OF VIEW ON BASE TABLE AND DOES VIEW EFFECT RECORDS OR ATTRIBUTES

--INDEXES:TO IMPROVE SPEED

--CLUSTERED INDEX:(ONLY ON PRIMARY KEY)
CREATE CLUSTERED INDEX IDX_EMPLOYEEDETAILS ON EMPLOYEEDETAILS(EID)

--SINGLE COLUMN INDEX:POINTS TO SINGLE COLUMN
CREATE INDEX INDEX_SALARY ON EMPLOYEEDETAILS(SALARY)

SELECT * FROM EMPLOYEEDETAILS WHERE SALARY >10000

--UNIQUE INDEX:
CREATE UNIQUE INDEX IDX_UNIQUE ON EMPLOYEEDETAILS(NAME)

--COMPOSITE INDEX
CREATE INDEX IDX_DEPT_SALARY ON EMPLOYEEDETAILS(DEPARTMENT,SALARY)

--ALTER INDEX
EXEC SP_RENAME 'EMPLOYEEDETAILS.IDX_UNIQUE','IDX_EMPLOYEE_UNAME','INDEX'
--SHOW ALL INDEX 
EXEC SP_HELPINDEX 'EMPLOYEEDETAILS'

--SET OPERATORS (UNION,INTERSECT,EXCEPT)
/*PREREQUISITES : NUMBER OF COLUMNS MUST BE SAME 
ORDER OF THE COLUMN MUST BE SAME 
DATATYPE OF THE COLUMN MUST BE SAME
*/
CREATE TABLE BANK_BRD
(BID INT,BNAME VARCHAR(20),LOCATION VARCHAR(20))

CREATE TABLE BANK_AHM
(BID INT,BNAME VARCHAR(20),LOCATION VARCHAR(20))

INSERT INTO BANK_BRD VALUES
(10,'SBI','ATLADRA'),
(20,'AXIS','AKOTA'),
(30,'HDFC','ALKAPURI')

INSERT INTO BANK_AHM VALUES
(10,'SBI','ATLADRA'),
(40,'HDFC','CTM'),
(50,'KOTAK','AMBAVADI')

SELECT * FROM BANK_BRD  UNION  SELECT * FROM BANK_AHM  --UNION OPERATOR
SELECT * FROM BANK_BRD  UNION ALL SELECT * FROM BANK_AHM  --UNION OPERATOR INCLUDING DUPLICATE VALUES

SELECT * FROM BANK_BRD  INTERSECT  SELECT * FROM BANK_AHM  --INTERSECT OPERATOR

SELECT * FROM BANK_BRD  EXCEPT  SELECT * FROM BANK_AHM  --EXCEPT OPERATOR

CREATE TABLE SALARY (
EID INT FOREIGN KEY (EID) REFERENCES EMPLOYEEDETAILS, ENAME VARCHAR(40),DID INT FOREIGN KEY (DID) REFERENCES DEPARTMENT(DID), SALARY MONEY)

DROP TABLE SALARY


--subquery
CREATE TABLE EMP (
EMPLOYEE_ID INT, FIRST_NAME VARCHAR(30), LAST_NAME VARCHAR(30) ,
EMAIL VARCHAR(30), PHONE_NUMBER INT, HIRE_DATE DATE, JOB_ID INT,
SALARY MONEY,COMMISSION_PCT VARCHAR(20),MANAGER_ID INT,DEPARTMENT_ID INT)
TRUNCATE TABLE EMP
INSERT INTO EMP (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 5551234, '2023-01-15', 10, 60000, '0.15', 301, 10),
(2, 'Alice', 'Smith', 'alice.s@example.com', 5552345, '2022-05-20', 11, 75000, '0.20', 302, 11),
(3, 'Bob', 'Johnson', 'bob.j@example.com', 5553456, '2023-03-01', 12, 50000, '0.10', 301, 11),
(4, 'Eve', 'Williams', 'eve.w@example.com', 5554567, '2022-09-10', 10, 65000, '0.15', 303, 12),
(5, 'Charlie', 'Brown', 'charlie.b@example.com', 5555678, '2023-02-01', 13, 80000, '0.25', 302, 13);

SELECT * FROM EMP 
--1
SELECT FIRST_NAME AS FIRSTNAME, LAST_NAME AS LASTNAME FROM EMP 
--2
SELECT DISTINCT DEPARTMENT_ID FROM EMP
--3
SELECT * FROM EMP ORDER BY FIRST_NAME DESC 
--4
SELECT FIRST_NAME,LAST_NAME,SALARY,SALARY*0.15 AS PF FROM EMP
--5
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY FROM EMP ORDER BY SALARY ASC
--6
SELECT SUM(SALARY) AS TOTAL_SALARIES FROM EMP
--7
SELECT MAX(SALARY) AS MAX_SALARY,MIN(SALARY) AS MIN_SALARY FROM EMP
--8
SELECT AVG(SALARY) AS AVG_SALARY,COUNT(EMPLOYEE_ID) AS NUM_EMP FROM EMP
--9
SELECT COUNT(EMPLOYEE_ID) AS NUM_EMP FROM EMP
--10 
SELECT COUNT(JOB_ID) AS TOTAL_JOBS FROM EMP
--SUBQUERY
SELECT * FROM EMP WHERE SALARY>(SELECT AVG(SALARY) FROM EMP )
SELECT * FROM EMP WHERE DEPARTMENT_ID = (SELECT EMPLOYEE_ID=102)


--JOINS
--INNER JOIN : SELECT * FROM TABLE A INNER JOIN TABLE B ON A.KEY = B.KEY
--LEFT JOIN : LEFT JOIN TABLE B ON A..KEY = B.KEY
--RIGHT JOIN : SELECT * FROM TABLE A RIGHT JOIN TABLE B ON A.KEY = B.KEY
--FULL OUTER JOIN : SELECT * FROM TABLE A FULL OUTER JOIN TABLE B ON A.KEY = B.KEY
--LEFT EXCLUSIVE JOIN : SELECT * FROM TABLE A LEFT JOIN TABLE B ON A.KEY = B.KEY WHERE B.KEY IS NULL
--RIGHT EXCLUSIVE JOIN : SELECT * FROM TABLE A RIGHT JOIN TABLE B ON A.KEY = B.KEY WHERE A.KEY IS NULL
--FULL EXCLUSIVE JOIN : SELECT * FROM TABLE A FULL OUTER JOIN TABLE B ON A.KEY = B.KEY WHERE A.KEY IS NULL OR B.KEY IS NULL

CREATE TABLE STUDENT (
SID INT,SNAME VARCHAR(30),COURSEID INT)

CREATE TABLE COURSE(
COURSEID INT,NAME VARCHAR(30),FEE INT)

INSERT INTO STUDENT VALUES
(1,'SURESH',10),
(2,'MAHESH',20),
(3,'JAYESH',30),
(4,'RAMESH',40)

INSERT INTO COURSE VALUES
(10,'CLOUD',20000),
(20,'QA',15000),
(30,'FS',25000),
(40,'DEVOPS',30000),
(50,'DATASCIENCE',40000)

SELECT * FROM STUDENT INNER JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID    --INNER JOIN
SELECT * FROM STUDENT RIGHT JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID    --RIGHT JOIN
SELECT * FROM STUDENT LEFT JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID     --LEFT JOIN
SELECT * FROM STUDENT FULL  JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID    --FULL JOIN
SELECT * FROM STUDENT LEFT JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID WHERE COURSE.COURSEID IS NULL    --LEFT EXCLUSIVE JOIN
SELECT * FROM STUDENT RIGHT JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID WHERE STUDENT.COURSEID IS NULL  --RIGHT EXCLUSIVE JOIN
SELECT * FROM STUDENT RIGHT JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID WHERE STUDENT.COURSEID IS NULL OR COURSE.COURSEID IS NULL  --FULL EXCLUSIVE JOIN

SELECT * FROM EMP
SELECT * FROM DEPARTMENT

SELECT ISNULL(S.SNAME,'NAME CORRECTION') AS STUDENTNAME FROM STUDENT S JOIN COURSE C ON S.COURSEID=C.COURSEID
SELECT * FROM STUDENT CROSS JOIN COURSE
SELECT * FROM EMP,DEPARTMENT WHERE EMP.EID=DEPARTMENT.DID

--joins practice
--1.list all employees and their department names using joins
SELECT e.FIRST_NAME,e.LAST_NAME,d.DNAME FROM EMP e JOIN
    DEPARTMENT d ON e.DEPARTMENT_ID = d.DID;

--2.list all employees and their deoartment names,including employees who arenot assigned to any department
SELECT e.FIRST_NAME,e.LAST_NAME,d.DNAME FROM EMP e
LEFT JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.DID;

--3.list all departments and the number of employees in each deoartment 
SELECT d.DNAME, COUNT(e.EMPLOYEE_ID) AS NumberOfEmployees FROM DEPARTMENT d
LEFT JOIN EMP e ON d.DID = e.DEPARTMENT_ID GROUP BY d.DNAME;

--4.find the employee with the highest salary
SELECT FIRST_NAME, LAST_NAME,SALARY FROM EMP WHERE
    SALARY = (SELECT MAX(SALARY) FROM EMP);

--5.list all employees who work in the QA department
SELECT e.FIRST_NAME, e.LAST_NAME FROM EMP e
JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.DID WHERE d.DNAME = 'QA';

--6.list all departments managed by 'Suresh'
SELECT d.DNAME FROM DEPARTMENT d JOIN EMP m ON d.DID = m.DEPARTMENT_ID
WHERE m.FIRST_NAME = 'Suresh';


SELECT * FROM EMP
SELECT * FROM DEPARTMENT
CREATE TABLE MANAGER( MID INT, MNAME VARCHAR(30), DID INT )
CREATE TABLE PROJECT( PID INT , PNAME VARCHAR(20), EID INT)
DROP TABLE PROJECT
DROP TABLE MANAGER
SELECT * FROM PROJECT
INSERT INTO EMP (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 5551234, '2023-01-15', 10, 60000, '0.15', 301, 60),
(2, 'Alice', 'Smith', 'alice.s@example.com', 5552345, '2022-05-20', 11, 75000, '0.20', 302, 70),
(3, 'Bob', 'Johnson', 'bob.j@example.com', 5553456, '2023-03-01', 12, 50000, '0.10', 301, 60),
(4, 'Eve', 'Williams', 'eve.w@example.com', 5554567, '2022-09-10', 10, 65000, '0.15', 303, 80),
(5, 'Charlie', 'Brown', 'charlie.b@example.com', 5555678, '2023-02-01', 13, 80000, '0.25', 302, 70);

INSERT INTO DEPARTMENT VALUES
(10,'CLOUD','GROUNDFLOOR'),
(11,'BACKEND','FIRSTFLOOR'),
(12,'DEVOPS','SECONDFLOOR'),
(13,'DS','SECONDFLOOR'),
(14,'DA',NULL)

INSERT INTO MANAGER VALUES
(101,'SURESH',10),
(102,'MUKESH',11),
(103,'RAMESH',12),
(104,'JIGNESH',13)

INSERT INTO PROJECT VALUES
(101,'CHATBOT',1),
(102,'WEB SCRAPING',1),
(103,'ECOMMMERS APP',2),
(104,'WEBSITE',3)

SELECT * FROM EMP
SELECT * FROM DEPARTMENT
SELECT * FROM MANAGER
SELECT * FROM PROJECT


--1. FETCH EMPLOYEE NAME & DEPARTMENT NAME THEY BELONGS TO
SELECT * FROM EMP E JOIN DEPARTMENT D ON E.DEPARTMENT_ID=D.DID

--2. FETCH ALL EMPLOYEE & DEPARTMENT
SELECT * FROM EMP E  LEFT JOIN  DEPARTMENT D ON E.DEPARTMENT_ID=D.DID

--3. FETCH EMPLOYEE NAME,DEPARTMENT NAME ,MANAGER NAME & PROJECT NAME THEY ARE WORKING ON
SELECT FIRST_NAME,DNAME,MNAME,PNAME FROM EMP AS E INNER JOIN DEPARTMENT AS D ON E.DEPARTMENT_ID =D.DID  JOIN MANAGER AS M ON D.DID=M.DID JOIN PROJECT AS P ON P.EID=E.EMPLOYEE_ID  



--FUNCTIONS 

SELECT LOWER(FIRST_NAME) FROM EMP 

SELECT UPPER(FIRST_NAME) AS [CAPITAL LETTER],
LEN(FIRST_NAME) FROM EMP WHERE LEN(FIRST_NAME) > 6

SELECT LEFT(FIRST_NAME,2) FROM EMP

SELECT RIGHT(FIRST_NAME,2) FROM EMP

SELECT RIGHT(LEFT(FIRST_NAME,2),1) FROM EMP 

SELECT FIRST_NAME + ' ' + LAST_NAME AS [FULL NAME] FROM EMP

SELECT LEFT(FIRST_NAME,1)+LEFT(LAST_NAME,1) FROM EMP 

SELECT LEFT(FIRST_NAME,1) + '.'+ LEFT(LAST_NAME,1)+'@'+'OUTLOOK.COM' FROM EMP

SELECT MONTH(HIRE_DATE) AS MONTHNAME ,YEAR(HIRE_DATE) AS YEARNAME FROM EMP

SELECT FORMAT(HIRE_DATE,'MM-yyyy') FROM EMP

SELECT DATENAME(MONTH,HIRE_DATE) + CAST(YEAR(HIRE_DATE) AS VARCHAR(4)) FROM EMP


--PROCEDURES

/*CREATE PROCEDURE <NAME>
AS 
BEGIN
{SQL SYNTAX}
END*/

CREATE PROCEDURE PROC1
AS 
BEGIN 
SELECT FIRST_NAME,HIRE_DATE FROM EMP
END

PROC1

SELECT * FROM EMP

CREATE PROCEDURE GETEMPDEPTMANID
@DEPARTMENT VARCHAR(20),
@MANAGER VARCHAR(20)
AS
BEGIN
SELECT DEPARTMENT_ID,MANAGER_ID FROM EMP WHERE DEPARTMENT_ID=@DEPARTMENT AND MANAGER_ID=@MANAGER 
END

GETEMPDEPTMANID '11' ,' 302'
GETEMPDEPTMANID  @MANAGER='302',@DEPARTMENT='11' --OVERRIDE 

DROP PROCEDURE GETEMPDEPTMANID

ALTER TABLE EMP ADD CITY VARCHAR(20)
ALTER TABLE EMP ADD GENDER VARCHAR(10)

UPDATE EMP SET CITY='VADODARA' WHERE EMPLOYEE_ID IN (1,3,5)
UPDATE EMP SET CITY='VADODARA' WHERE EMPLOYEE_ID IN (2,4)

UPDATE EMP SET GENDER='MALE' WHERE EMPLOYEE_ID IN (1,3,5)
UPDATE EMP SET GENDER='FEMALE' WHERE EMPLOYEE_ID IN (2,4)


CREATE PROCEDURE GETEMPIDDEPTGEN
@EMPID INT,
@DEPT VARCHAR(20),
@GEN VARCHAR(10)
AS
BEGIN
SELECT EMPLOYEE_ID,DEPARTMENT_ID,GENDER FROM EMP WHERE EMPLOYEE_ID=@EMPID AND DEPARTMENT_ID=@DEPT AND GENDER=@GEN
END

GETEMPIDDEPTGEN @EMPID='1',@DEPT='10',@GEN='MALE'


CREATE TABLE ORDERS(
ORDERID VARCHAR(20),CUSTOMERID VARCHAR(20),ORDERDATE DATE,TOTALAMOUNT INT)

INSERT INTO ORDERS (ORDERID, CUSTOMERID, ORDERDATE, TOTALAMOUNT) VALUES
('ORD001', 'CUST001', '2024-01-15', 250),
('ORD002', 'CUST002', '2024-01-16', 150),
('ORD003', 'CUST003', '2024-01-17', 300),
('ORD004', 'CUST001', '2024-01-18', 400),
('ORD005', 'CUST004', '2024-01-19', 100),
('ORD006', 'CUST002', '2024-01-20', 200),
('ORD007', 'CUST005', '2024-01-21', 350),
('ORD008', 'CUST003', '2024-01-22', 500),
('ORD009', 'CUST004', '2024-01-23', 450),
('ORD010', 'CUST001', '2024-01-24', 600);

CREATE PROCEDURE GETCUSTOMER
@CUSTID VARCHAR(20)
AS
BEGIN
SELECT CUSTOMERID,ORDERID,ORDERDATE,TOTALAMOUNT FROM ORDERS WHERE CUSTOMERID=@CUSTID
END

GETCUSTOMER @CUSTID='CUST001'

CREATE PROCEDURE ADDCUSTOMER
@CUSTID VARCHAR(20),
@ORDERID VARCHAR(20),
@ORDERDATE DATE,
@TOTALAMOUNT INT
AS
BEGIN
INSERT INTO ORDERS VALUES(@CUSTID,@ORDERID,@ORDERDATE,@TOTALAMOUNT)
END

ADDCUSTOMER @ORDERID='ORD011', @CUSTID='CUST002',@ORDERDATE ='2024-01-24',@TOTALAMOUNT= 200

SP_HELPTEXT GETCUSTOMER

ALTER PROCEDURE GETCUSTOMER
@CUSTID VARCHAR(20)
WITH ENCRYPTION
AS
BEGIN
SELECT CUSTOMERID,ORDERID,ORDERDATE,TOTALAMOUNT FROM ORDERS WHERE CUSTOMERID=@CUSTID
END

--SP_HELP       INTERVIEW QNA DIFFERENCE BETWEEN HELP AND HELP TEXT 
--SP_HELPTEXT

--STORED PROCCEDURE WITH OUTPUT PARAMETER
CREATE PROCEDURE DOUBLENUMBER
@INPUTNUM INT ,
@OUTPUTNUM INT OUTPUT
AS 
BEGIN
 SET @OUTPUTNUM = @INPUTNUM *2
END

DECLARE @RESULT INT
EXEC DOUBLENUMBER 5,@RESULT OUT
SELECT @RESULT

DROP PROC DOUBLENUMBER


CREATE PROCEDURE CALCULATEBILL
@NUMBEROFCOFFEE INT,
@PRICEPERCOFFEE INT,
@TOTALBILL INT OUTPUT
AS
BEGIN
  SET @TOTALBILL = @NUMBEROFCOFFEE * @PRICEPERCOFFEE
END

DECLARE @CUSTOMERBILL INT
EXEC  CALCULATEBILL 2,500 , @CUSTOMERBILL OUTPUT
PRINT @CUSTOMERBILL

--ASSIGNMENT SP
-- Create Customers table
CREATE TABLE CUSTOMER (
    CUSTOMERID VARCHAR(20) PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(100)
);

-- Insert sample data into Customers table
INSERT INTO CUSTOMER VALUES ('CUST001', 'John', 'Doe', 'johndoe@example.com');
INSERT INTO CUSTOMER VALUES ('CUST002', 'Jane', 'Smith', 'janesmith@example.com');
INSERT INTO CUSTOMER VALUES ('CUST010', 'Mike', 'Johnson', 'mikejohnson@example.com');

-- Create Products table
CREATE TABLE PRODUCTS (
    PRODUCTID VARCHAR(20) PRIMARY KEY,
    PRODUCTNAME VARCHAR(50),
    DESCRIPTION VARCHAR(100),
    PRICE MONEY
);

-- Insert sample data into Products table
INSERT INTO PRODUCTS VALUES ('PROD001', 'Laptop', 'Gaming Laptop', 1200.50);
INSERT INTO PRODUCTS VALUES ('PROD002', 'Smartphone', 'Android Phone', 800.75);
INSERT INTO PRODUCTS VALUES ('PROD003', 'Headphones', 'Noise Cancelling', 150.00);

-- Create Orders table
CREATE TABLE ORDERS (
    ORDERID VARCHAR(20) PRIMARY KEY,
    CUSTOMERID VARCHAR(20),
    ORDERDATE DATE,
    FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID)
);

-- Insert sample data into Orders table
INSERT INTO ORDERS VALUES ('ORD001', 'CUST001', '2024-03-01');
INSERT INTO ORDERS VALUES ('ORD002', 'CUST002', '2024-03-03');
INSERT INTO ORDERS VALUES ('ORD003', 'CUST010', '2024-03-05');

-- Create OrderDetails table
CREATE TABLE ORDERDETAILS (
    ORDERID VARCHAR(20),
    PRODUCTID VARCHAR(20),
    QTY INT,
    UNITPRICE MONEY,
    FOREIGN KEY (ORDERID) REFERENCES ORDERS(ORDERID),
    FOREIGN KEY (PRODUCTID) REFERENCES PRODUCTS(PRODUCTID)
);

-- Insert sample data into OrderDetails table
INSERT INTO ORDERDETAILS VALUES ('ORD001', 'PROD001', 2, 1200.50);
INSERT INTO ORDERDETAILS VALUES ('ORD002', 'PROD002', 1, 800.75);
INSERT INTO ORDERDETAILS VALUES ('ORD003', 'PROD003', 3, 150.00);

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/*Create a stored procedure that takes a CustomerID as input and returns the
customer's FirstName, LastName, and Email from a Customers table.*/
CREATE PROCEDURE spGETCUSTOMER
@CUSTID VARCHAR(20)
AS
BEGIN
  SELECT FIRST_NAME,LAST_NAME,EMAIL FROM CUSTOMER WHERE CUSTOMERID=@CUSTID
END

EXEC spGETCUSTOMER 'CUST010'


/*Create a stored procedure that takes ProductID, ProductName, Description, and
Price as input and inserts a new product into a Products table.*/
CREATE PROCEDURE spADDPRODUCT
@PRODUCTID VARCHAR(20),
@PRODUCTNAME VARCHAR(20),
@DESCRIPTION VARCHAR(20),
@PRICE MONEY
AS
BEGIN
  INSERT INTO PRODUCTS VALUES(@PRODUCTID,@PRODUCTNAME,@DESCRIPTION,@PRICE)
END

SELECT * FROM PRODUCTS
EXEC spADDPRODUCT 'PRD004','SMARTPHONE','ANDROID PHONE',900

/*Create a stored procedure that takes a ProductID and a NewPrice as input and
updates the price of the specified product in the Products table.*/
CREATE PROCEDURE spUPDATEPRODUCT
@PRODUCTID VARCHAR(20),
@NEWPRICE MONEY
AS
BEGIN
  UPDATE PRODUCTS SET PRICE=@NEWPRICE WHERE PRODUCTID = @PRODUCTID
END

EXEC spUPDATEPRODUCT 'PRD004',900

/*Create a stored procedure that takes StartDate and EndDate as input and returns all
orders placed within that date range from an Orders table.*/
CREATE PROCEDURE spGETORDERS
@STARTDATE DATE,
@ENDDATE DATE
AS
BEGIN 
  SELECT ORDERID FROM ORDERS WHERE ORDERDATE BETWEEN @STARTDATE AND @ENDDATE
END

SELECT * FROM ORDERS
EXEC spGETORDERS  '2024-01-01','2024-03-03'

/*Create a stored procedure that takes an OrderID as input and calculates the total
amount of the order (sum of Quantity * UnitPrice from an OrderDetails table).
Return the total amount as an output parameter.*/
CREATE PROCEDURE spORDERTOTAL
@ORDERID VARCHAR(20),
@TOTALAMOUNT INT OUTPUT
AS
BEGIN
   SELECT @TOTALAMOUNT=SUM(QTY * UNITPRICE)  FROM ORDERDETAILS WHERE ORDERID = @ORDERID 
END

SELECT * FROM ORDERDETAILS

DECLARE @RESULT INT
EXEC spORDERTOTAL 'ORD001',@RESULT OUT
PRINT @RESULT

/*Create a stored procedure that takes a number N as an input, and returns the top N
products by total sales from a products table, and an order details table.*/
CREATE PROCEDURE spTOPN
@N INT
AS
BEGIN
  SELECT TOP(@N) * FROM PRODUCTS
END

EXEC spTOPN 2


--Trigger



CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)

Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)

CREATE TRIGGER tr_tblEMployee_ForInsert   -- TRIGGER FOR INSERT
ON tblEmployee
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END

Insert into tblEmployee values (7,'Tan', 2300, 'Female', 3)

SELECT * FROM tblEmployeeAudit
SELECT * FROM tblEmployee

DISABLE TRIGGER tr_tblEMployee_ForInsert ON tblEmployee

CREATE TRIGGER tr_tblEMployee_ForDelete    --TRIGGER FOR DELETE
ON tblEmployee
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
END


CREATE TRIGGER PREVENTNEGATIVESTOCK
ON PRODUCTS
AFTER UPDATE
AS 
BEGIN 
     IF EXISTS (SELECT 1 FROM inserted WHERE QTY<0)
	 BEGIN 
	 RAISERROR('STOCK QUANTITY CANNOT BE NEGATIVE',16,1)
	 ROLLBACK TRANSACTION
	 END
END

SELECT * FROM PRODUCTS
UPDATE PRODUCTS SET QTY = -1 WHERE PRODUCTID IN('PRD004')

Create trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
 Select * from deleted
 Select * from inserted 
End

Update tblEmployee set Name = 'Tods', Salary = 2000, 
Gender = 'Female' where Id = 4

CREATE TRIGGER tr_SETORDERDATE 
ON ORDERS
INSTEAD OF INSERT 
AS 
BEGIN
   INSERT INTO ORDERS (ORDERID,ORDERDATE)
   SELECT ORDERID, ISNULL(ORDERDATE,GETDATE())
   FROM INSERTED
END

CREATE VIEW vEMPLOYEEDETAILS
AS 
SELECT ID,NAME,GENDER,DEPTNAME FROM tblEmployee JOIN tblDEPARTMENT 

--INSTEAD OF  TRIGGER ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

Select * from vWEmployeeDetails

Insert into vWEmployeeDetails values(7, 'Valarie', 'Female', 'IT') -- VIEW NOT UPDATEABLE

--CREATE TRIGGER
Create trigger tr_vWEmployeeDetails_InsteadOfInsert
on vWEmployeeDetails
Instead Of Insert
as
Begin
 Declare @DeptId int
 
 --Check if there is a valid DepartmentId
 --for the given DepartmentName
 Select @DeptId = DeptId 
 from tblDepartment 
 join inserted
 on inserted.DeptName = tblDepartment.DeptName
 
 --If DepartmentId is null throw an error
 --and stop processing
 if(@DeptId is null)
 Begin
  Raiserror('Invalid Department Name. Statement terminated', 16, 1)
  return
 End
 
 --Finally insert into tblEmployee table
 Insert into tblEmployee(Id, Name, Gender, DepartmentId)
 Select Id, Name, Gender, @DeptId
 from inserted
End



--QUERY OPTIMIZATION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DECLARE @EID INT =1
DECLARE @ENAME VARCHAR(20)=''

IF EXISTS (SELECT 1 FROM tblEmployee WHERE ID=@EID)
BEGIN
UPDATE tblEmployee
SET NAME=@ENAME
WHERE ID =@EID
PRINT 'NAME ADDED SUCCESSFULLY'
END
ELSE 
BEGIN
 PRINT 'NAME NOT ADDED'
END


DECLARE @EID1 INT =1

IF EXISTS (SELECT 1 FROM tblEmployee WHERE ID=@EID1)
BEGIN
DELETE FROM tblEmployee
WHERE ID=@EID
    PRINT 'EMPLOYEE DELETED'
END
ELSE
BEGIN
  PRINT 'UNABLE TO DELETE'
END


--TRIGGER ASSIGNMENT~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Create a Trigger for Logging of Deleted Employees.
CREATE TABLE LOG_EMP
(EID VARCHAR(20),DELETE_DATE DATETIME)

CREATE TRIGGER tr_LOG_DELEMPLOYEES
ON tblEmployee
AFTER DELETE
AS
BEGIN
  
  INSERT INTO LOG_EMP (EID,DELETE_DATE)
  SELECT Id,GETDATE()
  FROM deleted
END

DELETE FROM tblEmployee WHERE  Id IN(1,2)

SELECT * FROM tblEmployee


-- Create a Trigger for Updating Employee's Last Modified Date on Update.
CREATE TRIGGER tr_EMPUPDATEMODIFIED
ON tblEmployee
AFTER UPDATE 
AS 
BEGIN
UPDATE tblEmployee
SET LASTMODIFIED = GETDATE()
FROM inserted I
WHERE tblEmployee.Id=I.Id
END

-- Trigger to keep log of department IDs that have been deleted.
CREATE TABLE LOG_EMP
(EID VARCHAR(20),DELETE_DATE DATETIME)

CREATE TRIGGER tr_LOG_DELEMPLOYEES
ON tblEmployee
AFTER DELETE
AS
BEGIN
  
  INSERT INTO LOG_EMP (EID,DELETE_DATE)
  SELECT EID,GETDATE()
  FROM deleted
END



-- Create Trigger to prevent duplicate email addresses from being entered in the Employees table.
CREATE TRIGGER UNIQUEEMP
ON tblEmployee
AFTER INSERT,UPDATE
AS
BEGIN
IF EXISTS (SELECT 1 FROM inserted i
          JOIN tblEmployee E ON i.Email = E.Email
		  WHERE i.Id <> E.Id)
   BEGIN
        RAISERROR('EMAIL ALREADY EXISTS',16,1)
		ROLLBACK TRANSACTION
		END
END

-- Create a Trigger if a column named Status is not provided during an insert, set its default value to 'Pending'.
DEFAULT VALUE TO 'PENDING'

CREATE TRIGGER tr_SETDEFAULTSTATUS
INSTEAD OF INSERT
ON ORDERS
AS
BEGIN
   INSERT INTO ORDERD (ORDERID,STATUS)
   SELECT ORDERID,ISNULL(STATUS,'PENDING')
   FROM inserted
END
