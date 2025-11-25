USE JAN2025

CREATE TABLE SALES(
SALE_ID INT PRIMARY KEY,
PRODUCT_ID VARCHAR(20) NOT NULL ,
CUSTOMER_ID INT NOT NULL,
SALE_DATE DATE,
QUANTITY INT CHECK(QUANTITY>0),
PRICE INT CHECK(PRICE>0),
REGION VARCHAR(30)
)

SELECT * FROM SALES
DROP TABLE SALES

INSERT INTO SALES   
VALUES  
(1, 101, 1001, '2024-02-01', 5, 200, 'North America'),  
(2, 102, 1002, '2024-02-02', 3, 150, 'Europe'),  
(3, 103, 1003, '2024-02-03', 10, 300, 'Asia'),  
(4, 104, 1004, '2024-02-04', 2, 120, 'South America'),  
(5, 105, 1005, '2024-02-05', 7, 250, 'Africa');  


--1) Write a query to find the total sales amount for each product.
SELECT PRODUCT_ID,SUM(PRICE*QUANTITY) AS TOTAL FROM SALES GROUP BY PRODUCT_ID

--2) Write a query to find the average quantity sold for each region.
SELECT REGION,AVG(QUANTITY) AS AVG_QTY FROM SALES GROUP BY REGION 

--3) Write a query to count the number of sales for each customer.
SELECT CUSTOMER_ID,COUNT(SALE_ID) AS NUM_SALES FROM SALES GROUP BY CUSTOMER_ID

--4) Write a query to find the maximum sale amount in each region.
SELECT REGION,SUM(PRICE*QUANTITY) AS TOTAL FROM SALES GROUP BY REGION

--5) Write a query to find the minimum quantity sold for each product.
SELECT PRODUCT_ID , MIN(QUANTITY) FROM SALES GROUP BY PRODUCT_ID

--6) Write a query to find the total sales amount for each product, but only includeproducts with total sales greater than 1000.
SELECT PRODUCT_ID,SUM(PRICE*QUANTITY) AS TOTAL FROM SALES GROUP BY PRODUCT_ID HAVING  SUM(PRICE*QUANTITY)>1000 

--7) Write a query to find the average quantity sold for each region, but only includeregions with more than 10 sales.
SELECT REGION,AVG(QUANTITY) AS AVG_QTY FROM SALES GROUP BY REGION HAVING COUNT(QUANTITY)>10

--8) Write a query to find the total sales amount for each customer, but only includecustomers with a maximum sale amount greater than 500.
SELECT CUSTOMER_ID,SUM(PRICE*QUANTITY) FROM SALES GROUP BY CUSTOMER_ID HAVING MAX(PRICE*QUANTITY)>500

--9) Write a query to find the average sale amount for each customer, but only includecustomers with more than 5 sales.
SELECT CUSTOMER_ID , AVG(PRICE*QUANTITY) FROM SALES GROUP BY CUSTOMER_ID HAVING COUNT(QUANTITY)>5

--10) Write a query to find the total sales amount for each region, but only include regionswith total sales greater than 5000.
SELECT REGION,SUM(PRICE*QUANTITY) FROM SALES GROUP BY REGION HAVING SUM(PRICE*QUANTITY)>5000

--11) Write a query to find total number of sales BETWEEN 
SELECT COUNT(QUANTITY) AS TOTAL_SALES FROM SALES WHERE SALE_DATE BETWEEN '2024-02-01' AND '2024-02-04'

--12) Write a query to find the maximum quantity sold for each product
SELECT PRODUCT_ID , MAX(QUANTITY) as MAX_ FROM SALES GROUP BY PRODUCT_ID

--13)