create Database Sales;
Use Sales;

-- creating table Orders
create table Orders (
Order_ID int primary key not null unique,
Customer_name varchar(50) not null,
Product_category varchar(50) not null,
Ordered_Item varchar(50) not null,
Contact_No varchar(12) not null
);
Desc Orders;

-- adding new column
Alter table Orders add column Order_Quantity int not null;

-- Rename the Orders table to Sales_Orders
Rename table Orders to Sales_Orders;

-- inserting values
Insert into Sales_Orders (Order_ID, Customer_name, Product_Category, Ordered_item, Contact_No, Order_Quantity) values
(1, 'mina Jacob', 'Furniture', 'chair', 6764567664, 4),
(2, 'suma Janson', 'Furniture', 'table', 6764511164, 1),
(3, 'Aira Sabu,', 'Electronics', 'Laptop', 8564765434, 1),
(4, 'Athira Madav', 'Stationery', 'Book', 7676543434, 3),
(5, 'Sreeja Sajeev', 'Furniture', 'Sofa', 6565434321, 1),
(6, 'Nakul Dev', 'Electronics', 'I phone', 8787656543,1),
(7, 'Sitara Jayan', 'Stationery', 'Magazine', 5656432312, 5),
(8, 'Sakira Hussain', 'Furniture', 'Book Rack', 8787656543, 1),
(9, 'Minarva Nazrin', 'Stationery', 'Book', 9898766543, 4),
(10, 'Nitara Jain', 'Electronics', 'Iron Box', 7676543421, 1);

Desc Sales_Orders;
select * from Sales_Orders;

-- Retrieving columns from table
Select Customer_Name,Ordered_item from Sales_Orders;

-- updating product name 
Update Sales_Orders set Ordered_item = 'Dining table' where Order_ID=2;

-- deleting table
Drop table Sales_Orders;



 




