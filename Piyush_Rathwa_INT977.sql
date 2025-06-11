create database Piyush_Rathwa_INT977;
use Piyush_Rathwa_INT977;

-- Advance SQL - Assessment

-- ▪ Create DB with “Your Name”
-- ▪ Save the file with “Your Name_ID” .sql extension
-- ▪ Mention the query before executing
-- Create a table named Products with the following columns:
-- ProductID
-- ProductName
-- Price
-- StockQuantity
 create table Products(
 ProductID int primary key auto_increment,
 productname varchar(30),
 Price decimal(10,2),
 StockQuantity int
 );
 drop table products;
 select * from products;

 insert into Products(productname,Price,StockQuantity) values ('laptop',25000,5),
 ('phone',12000,12),
 ('charger',1200,10),
 ('Tv',35000,5),
 ('Washing machines',30000,7),
 ('jackets',12000,5),
 ('graphic card',100000,2),
 ('processor',45000,10),
 ('ram',2500,25),
 ('SSd',8000,15),
 ('displays',12000,5);
 
 signal sqlstate '45000' set message_text
 
-- 1. Create a stored procedure that takes a ProductID as input and returns the Price of the
-- product.

delimiter // 
create procedure check_price (in prodid int)
begin 
select Price from Products where ProductID = prodid;
end
//
delimiter ;

call check_price(7);

-- 2. Create a stored procedure that takes a ProductID and a Quantity as input and updates
-- the StockQuantity of the product.

delimiter //
create procedure update_quantity(in productID int, in quant int)
begin
update Products set StockQuantity = quant where products.ProductID = productID;
end
//
drop procedure update_quantity
call update_quantity(2,24);

select * from products;
-- 3. Create a stored procedure that takes ProductName, Price, and StockQuantity as
-- input and inserts a new product into the Products table.

delimiter //
create procedure insert_product(in Product_name varchar(20),in Price decimal(10,2),in quantity int)
begin
declare name varchar(20);
declare amount decimal(10,2);
declare quant int;

set name = Product_name;
set amount = Price;
set quant = quantity;

insert into Products(productname,Price,StockQuantity) values (name,amount,quant);
end
//
delimiter ;

call insert_product('xyz',3562,23);
-- 4. Create a stored procedure to find minimum and maximum price of the product.

delimiter //
create procedure find_min()
begin
select max(Price) as max_amount from products;
end
//
delimiter ;

delimiter //
create procedure find_max()
begin
select min(Price) as min_amount from products;
end
//
delimiter ;

call find_min();
call find_max();
-- 5. Create a stored procedure that takes a Price as input and returns all products with a
-- price less than the given value.

delimiter //
create procedure check_affordable_product(in price decimal(10,2))
begin
select ProductId,productname from Products where Products.Price < price;
end
//
delimiter ; 

call check_affordable_product(10000);
-- 6. Create a trigger that fires after an UPDATE on the Products table. If the Price is
-- changed, insert a record into the ProductLogs table with the ProductID, OldPrice,
-- NewPrice, and current LogDate.

create table Productslog(
Log_ID int primary key auto_increment,
ProductID int,
OldPrice decimal(10,2),
Newprice decimal(10,2),
LogDate datetime
);
delimiter //
create trigger tr_Logtrigger
after update on products
for each row
begin 
declare newprice decimal(10,2);
declare Oldprice decimal(10,2);
declare product_ID int;

set product_ID = new.ProductID;
set newprice = new.Price;
set oldprice = old.Price;

insert into Productslog(ProductID,OldPrice,NewPrice,LogDate) values (product_ID,oldprice,newprice,now());

end 
//

update products set Price = 2000 where ProductID = 1
select * from Productslog;


-- 7. Create a trigger that fires before an UPDATE on the Products table. If the
-- StockQuantity is being updated to a negative value, prevent the update and display a
-- message.

delimiter //

create trigger tr_PreventNegativeQuantity
before update on products
for each row
begin
if new.StockQuantity < 0 then
 signal sqlstate '45000' set message_text = 'Pls enter a Valid Quantity. Negative is prohibited';
 end if;
end
//

update products set StockQuantity = -3 where ProductID = 1;
-- 8. Create a trigger that fires before an INSERT on the Products table. If the StockQuantity
-- is not provided, set its default value to 0.

delimiter //
create trigger tr_SetDefaultQuantity
before insert on products
for each row
begin
if new.StockQuantity is null then
 set new.StockQuantity = 0;
 end if;
end
//

insert into Products(productname,Price) values ('laptop',25000);
select * from Products;

-- 9. Create a trigger that fires after an UPDATE on the Products table. If the ProductName
-- is changed, print a message stating that the product name was altered.

delimiter //
create trigger tr_messagefornameupdate
after update on products
for each row
begin
if new.productname <> old.productname then
signal sqlstate '45000' set message_text = 'Product name has been changed';
 end if;
end
//
-- 10.Create a trigger that fires before an UPDATE on the Products table. If the Price is being
-- increased by more than 50%, prevent the update and display a message.
delimiter //
create trigger tr_PreventPriceIncrement
before update on products
for each row
begin
if new.Price > Old.price*1.5 then
 signal sqlstate '45000' set message_text = 'Increment more than 50% is not allowed';
 end if;
end
//
select * from Products;

update Products set Price = 30000 where ProductID = 3;