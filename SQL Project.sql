/*Creating a database called InvetoryDB*/
Create database InvetoryDB;
Use InvetoryDB;

/*Creating a table called Items*/
Create table Items(
ItemID int Primary Key,
ItemName varchar(30), 
Category varchar(30),
Price float,
StockQuantity int
);

/*Inserting records into Items table*/
insert into Items values
(001, 'Desk', 'Furniture', 300.00, 20),
(002, 'Chair', 'Furniture', 150.00, 50), 
(003, 'Notebook', 'Stationery', 10.00, 100) ,
(004, 'Pen', 'Stationery', 2.00, 200), 
(005, 'Monitor', 'Electronics', 250.00, 30);



Select* from Items;

/*Creating a table called Customers*/
Create table Customers(
CustomerID int Primary Key ,
FirstName varchar(20),
LastName varchar(30), 
Email varchar(50),
Phone varchar(20)
);

/*Inserting records into tbale Customers*/
insert into Customers values
(101, 'Mandla', 'Xaba', 'mandla.xaba@gmail.com ', '081-456-7890'), 
(102, 'Mlondi', 'Nzama', 'mlondi.nzama@gmail.com', '073-567-8901'), 
(103, 'Noluthando', 'Ncube', 'nolu.ncube@gmail.com', '068-678-9012');

Select* from Customers;

/*Creating a table called Orders*/
Create table Orders(
OrderID int Primary Key, 
CustomerID int Foreign Key references Customers(CustomerID), 
OrderDate date,
TotalAmount float
);

/*Inserting records into Orders table*/
insert into Orders values
(001, 101, '2024-07-01', 600.00), 
(002, 102, '2024-07-02', 300.00), 
(003, 103, '2024-07-03', 150.00);

Select* from Orders;

/*Creating a table called OrderItems*/
Create table OrderItems(
OrderItemID int Primary Key, 
OrderID int Foreign Key references Orders(OrderID),
ItemID int Foreign Key references Items(ItemID), 
Quantity int,
LineTotal float
);



/*Inserting records into table OrderItems*/
insert into OrderItems values
(001, 001, 001, 2, 600.00), 
(002, 001, 003, 5, 50.00) ,
(003, 002, 002, 2, 300.00), 
(004, 003, 004, 10, 20.00); 

Select* from OrderItems;



/*Questions and Answers*/


/*Display all orders showing OrderID, CustomerID, OrderDate, and TotalAmount*/

Select* from Orders;


SELECT 
    o.OrderID,
    o.CustomerID,
    o.OrderDate,
    SUM(oi.LineTotal) AS TotalAmount
FROM orders o
JOIN orderItems oi ON o.OrderID = oi.OrderID
GROUP BY o.OrderID, o.CustomerID, o.OrderDate
ORDER BY o.OrderID;



/*Using a sub-query, write a SQL query that increases the price of all Items in the Furniture category by 10%*/

 UPDATE Items
SET Price = Price * 1.10
WHERE ItemID IN (
    SELECT ItemID 
    FROM Items 
    WHERE Category = 'Furniture'
);

Select* from Items;



/*Write a query to display the total quantity sold and total revenue for each item*/

 Select itemName, stockQuantity as totalQuantitySold, (price * stockQuantity) as totalRevenue
 from Items;


/*Create a stored procedure to keep a SQL query to find the best-selling item by total sales amount
Show the ItemName and TotalSalesAmount*/

CREATE PROCEDURE GetBestSellingItem2
AS
select top 1 ItemName, (price * stockQuantity) as totalSalesAmount
from Items;
go

    EXEC GetBestSellingItem2;





/*Create a stored procedure to keep a SQL query that displays the total amount spent by each customer*/

CREATE PROCEDURE GetCustomerTotalSpent
AS
BEGIN
    SELECT 
        c.CustomerID,
        c.FirstName,
        SUM(oi.lineTotal) AS TotalAmountSpent
    FROM Customers c
    JOIN orders o on c.customerID = o.customerID
    JOIN orderItems oi on o.orderID =oi.orderID
    GROUP BY c.CustomerID, c.FirstName
    ORDER BY TotalAmountSpent DESC;
    END;

EXEC GetCustomerTotalSpent;



/*Create a view that uses the JOIN statement to display the customer who has placed the highest total orders
The view should show the CustomerID, FirstName, LastName, and TotalAmount*/

CREATE VIEW TopCustomer AS
SELECT TOP 1
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(oi.LineTotal) AS TotalAmount
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN orderItems oi ON o.OrderID = oi.OrderID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalAmount DESC;

Select* from Topcustomer;



