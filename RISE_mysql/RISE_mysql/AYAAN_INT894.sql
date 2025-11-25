CREATE DATABASE AYAAN_INT894

/*Advance SQL - Assessment 
▪ Create DB with “Your Name”  
▪ Save the file with “Your Name_ID” .sql extension  
▪ Mention the query before executing
*/
 
Create a table named Products with the following columns: 
ProductID 
ProductName  
Price 
StockQuantity  
1. Create a stored procedure that takes a ProductID as input and returns the Price of the 
product. 
2. Create a stored procedure that takes a ProductID and a Quantity as input and updates 
the StockQuantity of the product. 
3. Create a stored procedure that takes ProductName, Price, and StockQuantity as 
input and inserts a new product into the Products table. 
4. Create a stored procedure to find minimum and maximum price of the product. 
5. Create a stored procedure that takes a Price as input and returns all products with a 
price less than the given value. 
6. Create a trigger that fires after an UPDATE on the Products table. If the Price is 
changed, insert a record into the ProductLogs table with the ProductID, OldPrice, 
NewPrice, and current LogDate. 
7. Create a trigger that fires before an UPDATE on the Products table. If the 
StockQuantity is being updated to a negative value, prevent the update and display a 
message. 
8. Create a trigger that fires before an INSERT on the Products table. If the StockQuantity 
is not provided, set its default value to 0. 
9. Create a trigger that fires after an UPDATE on the Products table. If the ProductName 
is changed, print a message stating that the product name was altered. 
10. Create a trigger that fires before an UPDATE on the Products table. If the Price is being 
increased by more than 50%, prevent the update and display a message. 