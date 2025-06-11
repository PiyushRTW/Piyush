CREATE DATABASE AYAAN_INT894

/*Advance SQL - Assessment 
▪ Create DB with “Your Name”  
▪ Save the file with “Your Name_ID” .sql extension  
▪ Mention the query before executing
*/
 
Create table PRODUCT ( 
ProductID INT PRIMARY KEY AUTO_INCREMENT,
ProductName  VARCHAR(50),
Price DECIMAL ,
StockQuantity INT );
  
INSERT INTO PRODUCT(ProductName,Price,StockQuantity) VALUES
('MOBILE',300,40),
('TV',500,20),
('TABLET',200,10),
('WATCH',450,40),
('AC',800,5);
  
  
-- 1. Create a stored procedure that takes a ProductID as input and returns the Price of the product. 
DELIMITER //
CREATE PROCEDURE GETPRICE(IN PRODUCT_ID INT)
BEGIN
     SELECT PRICE FROM PRODUCT WHERE PRODUCTID = PRODUCT_ID;
END
//

CALL GETPRICE(1);   -- USE THE PROCEDURE

-- 2. Create a stored procedure that takes a ProductID and a Quantity as input and updates the StockQuantity of the product.
DELIMITER //
CREATE PROCEDURE UPDATESTOCK(IN PRODUCT_ID INT,IN QUANTITY INT)
BEGIN
    UPDATE PRODUCT SET StockQuantity = QUANTITY WHERE ProductId = PRODUCT_ID;
END 
//

SELECT * FROM PRODUCT;
CALL UPDATESTOCK(2,30);
 
-- 3. Create a stored procedure that takes ProductName, Price, and StockQuantity as  input and inserts a new product into the Products table.
DELIMITER //
CREATE PROCEDURE ADDPRODUCT(IN NAME VARCHAR(50),IN PRICE DECIMAL,IN QUANTITY INT ) 
BEGIN
     INSERT INTO PRODUCT(ProductName,Price,StockQuantity) VALUES(NAME,PRICE,QUANTITY);
END
//

SELECT * FROM PRODUCT;
CALL ADDPRODUCT('BLENDER',250,20);

 
-- 4. Create a stored procedure to find minimum and maximum price of the product. 
DELIMITER //
CREATE PROCEDURE MAXMIN()
BEGIN
     SELECT MAX(Price) AS MAX_PRICE,MIN(Price) AS MIN_PRICE FROM PRODUCT;
END
//

CALL MAXMIN();


-- 5. Create a stored procedure that takes a Price as input and returns all products with a price less than the given value. 
DELIMITER // 
CREATE PROCEDURE COMPAREPRODUCT(IN PRIC DECIMAL) 
BEGIN
     SELECT * FROM PRODUCT WHERE Price < PRIC;
END
//

CALL COMPAREPRODUCT(400);

-- 6. Create a trigger that fires after an UPDATE on the Products table. If the Price is changed, insert a record into the ProductLogs table with the ProductID, OldPrice, 
-- NewPrice, and current LogDate. 
CREATE TABLE PRODUCTLOG(
PRODUCTID INT,
OLDPRICE DECIMAL,
NEWPRICE DECIMAL,
DATE_ DATE
);

DELIMITER //
CREATE TRIGGER LOGPRODUCT  
AFTER UPDATE ON PRODUCT
FOR EACH ROW
BEGIN
    IF NEW.Price <> OLD.Price THEN
        INSERT INTO PRODUCTLOG VALUES(NEW.ProductID,OLD.Price,NEW.Price,NOW());
    END IF;
END
//

UPDATE PRODUCT SET Price = 200 WHERE ProductID = 6;
SELECT * FROM PRODUCTLOG;

-- 7. Create a trigger that fires before an UPDATE on the Products table. If the 
-- StockQuantity is being updated to a negative value, prevent the update and display a message. 
DELIMITER //
CREATE TRIGGER STOCKERROR
BEFORE UPDATE ON PRODUCT
FOR EACH ROW
BEGIN
      IF NEW.StockQuantity < 0 THEN
           SIGNAL SQLSTATE '45000'
           SET message_text="STOCK CANNOT BE NEGATIVE";
      END IF;
END
//

UPDATE PRODUCT SET StockQuantity = -1 WHERE ProductID = 1;


-- 8. Create a trigger that fires before an INSERT on the Products table. If the StockQuantity is not provided, set its default value to 0. 
DELIMITER //
CREATE TRIGGER SETSTOCK 
BEFORE INSERT ON PRODUCT
FOR EACH ROW
BEGIN
     IF NEW.StockQuantity IS NULL THEN
      SET NEW.StockQuantity = 0;
     END IF;
END
//

INSERT INTO PRODUCT(ProductName,Price,StockQuantity) VALUES ('MIXER',500,NULL);

SELECT * FROM PRODUCT;

-- 9. Create a trigger that fires after an UPDATE on the Products table. If the ProductName 
-- is changed, print a message stating that the product name was altered. 
DELIMITER //
CREATE TRIGGER UPDATENAME 
AFTER UPDATE ON PRODUCT
FOR EACH ROW
BEGIN 
      DECLARE VAR VARCHAR(50);
      
      IF NEW.ProductName <> OLD.ProductName THEN
         SET VAR= "PRODUCT NAME HAS BEEN ALTERED";
         SELECT VAR;
      END IF;
END
//
UPDATE PRODUCT SET ProductName = "TELEVISION" WHERE ProductID = 2;

-- 10. Create a trigger that fires before an UPDATE on the Products table. If the Price is being 
-- increased by more than 50%, prevent the update and display a message. 
DELIMITER //
CREATE TRIGGER PREVENTINFLATION 
BEFORE UPDATE ON PRODUCT
FOR EACH ROW
BEGIN
     IF NEW.Price > (1.5 * OLD.Price) THEN
     SIGNAL SQLSTATE '45000'
     SET message_text='PRICE INCREASED BY MORE THAN 50%';
     END IF;
END
//

SELECT * FROM PRODUCT;
UPDATE PRODUCT SET Price=15 WHERE ProductID = 3;