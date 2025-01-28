create database COUNTRYANDPOPULATION;
use COUNTRYANDPOPULATION ;

create table Country (
ID int primary key auto_increment,
Country_name varchar(50) not null,
Population bigint,
Area decimal(10,2) not null
);
desc Country;

create table Persons (
ID int primary key,
Fname varchar(50) not null,
Lname varchar(50) not null,
Population bigint,
Rating decimal(3, 1) check (Rating >=0 and Rating <=10),
Country_ID int,
Country_name varchar(50),
foreign key (Country_ID) references Country(ID)
);
desc persons;

-- inserting values to country table
INSERT INTO Country (Country_name, Population, Area) VALUES
('China', 102000000, 3300000.00),
('US', 8800000, 750000.00),
('Canada', 200000, 150000.00),
('India', 125000000, 1050000.00),
('Pakisthan', 1200000, 500000.00),
('Nepal', 2400000, 330000.00),
('UK', 7200000, 1250000.00),
('UAE', 5000000, 1480000.00),
('Australia', 500000, 450000.00),
('France', 400000, 210000.00);
select * from Country;

-- inserting values to persons table
INSERT INTO Persons VALUES
(1, 'Mona', 'Lucy', 65655677809, 4.1, 1,'China'),
(2, 'Suku', 'Tina', 76568888782, 5.9, 9,'Australia'),
(3, 'Srida', 'Sivam', 342546326, 6.5, 7,'UK'),
(4, 'Thushara', 'Lucky', 5436657677, 3.0, 2,'US'),
(5, 'Danya', 'Sony', 566777888, 4.0, 4,'India'),
(6, 'Fida', 'Fathima', 8765432809, 5.0, 2,'US'),
(7, 'Viswa', 'Sathi', 896432567890, 2.0, 7,'UK'),
(8, 'Siva', 'Chandru', 76789879997, 4.0, 2,'US'),
(9, 'Mini', 'Lucifer', 54667888809, 4.0, 3,'Canada'),
(10, 'Mikha', 'Lorance', 6256678898, 3.7, 9,'Australia');
select * from Persons;

-- 1. Find the number of persons in each country
select Country_name, count(*) as Number_of_person
from Persons
group by Country_name;

-- 2. Find the number of persons in each country sorted from high to low.
select Country_name, count(*) as Number_of_person
from Persons
group by Country_name order by Number_of_person desc;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
Select Country_name, avg(Rating) as AvgRating
from Persons
group by Country_name having AvgRating>3.0;

-- 4. Find the countries with the same rating as the US. (Use Subqueries) 
select Country_name, Rating
from Persons
where Rating = (
    select avg(Rating)
    from Persons
    where Country_name = 'US'
);
-- 5. Select all countries whose population is greater than the average population of all nations.
select Country_name, Population
from country 
where Population > (select Avg (Population) from Country);

-- creating a new database
create database Product;
Use Product;
create table Customer (
Customer_Id int auto_increment primary key,
First_name varchar(50) not null,
Last_name varchar(50) not null,
Email varchar(50) not null,
Phone_no varchar(15) not null,
Address varchar(250),
City varchar(50),
State varchar(50),
Zip_code varchar(6),
Country varchar(50)
);
Desc Customer;
insert into Customer(Customer_Id, First_name, Last_name, Email, Phone_no, State, Country)values
(Default,'Radha', 'Davis', 'RadhaDavis2000@gmail.com',8987767666,'London', 'UK'),
(Default,'Soudha', 'Sonu', 'Soudhasonu1992@gmail.com',8976655556, 'California', 'US'),
(Default,'Sona', 'Dennis', 'SonaDennisD1995@gmail.com',8976674559, 'California','US'),
(Default,'Mina', 'Cleatus', 'MinanaCleatusD1997@gmail.com',8764689099, 'California','US'),
(Default,'Chandu', 'Sudhakar', 'ChanduSudhakarD1987@gmail.com',8647458485,'London', 'UK'),
(Default,'Sayana', 'Tomy', 'SayanaTomyD1993@gmail.com',9445825552, 'California','US'),
(Default,'Rona', 'Vargees', 'RonaVargeesD1996@gmail.com',6511522321, 'London', 'UK'),
(Default,'Muthu', 'Gowda', 'MuthuGowdaD1980@gmail.com',7852655555,'London', 'UK'),
(Default,'Samuel', 'Fransis', 'SamuelFransisD1983@gmail.com',8552136219, 'California','US'),
(Default,'Divya', 'Alosius', 'DivyaAlosiusD1997@gmail.com',8125847859, 'California','US');
select * from customer;

-- 1)creating view named customer_info
create view Customer_info as
select First_name, Last_name, concat(First_name,' ',Last_name)
as fullname, Email from Customer;
-- Displaying view
select* from Customer_info;

-- 2)creating View named US_Customer
Create view US_Customer as
Select * from Customer where Country = 'US';
-- Displaying view
select First_name, Last_name, Country from US_customer;

-- 3)creating View named Customer_Details with fullname and details
Create view Customer_Details as
select First_name, Last_name, concat(First_name,' ',Last_name) as
Full_name, Email, Phone_no, State from Customer;
-- Displaying view
select * from Customer_Details;

-- 4)updating phone numners of California Customers(Customer_Details)
Update Customer set Phone_No =7677657655 where Customer_Id=2 and Country = 'California';
Update Customer set Phone_No =7456566665 where Customer_Id=3 and Country = 'California';
Update Customer set Phone_No =7464755687 where Customer_Id=4 and Country = 'California';
Update Customer set Phone_No =7587668886 where Customer_Id=6 and Country = 'California';
Update Customer set Phone_No =7655695685 where Customer_Id=9 and Country = 'California';
Update Customer set Phone_No =7586756899 where Customer_Id=10 and Country = 'California';
-- Displaying updated phone numbers for customers in California
Select * from Customer_Details where state = 'California';

-- 5)Counting the numbers of each state+state with more than 5 customers
Select State, count(State) as Count_customer from customer group by state
having Count_customer>5;

-- 6)Number of customers in each state from Customer_Details view
Select State, count(State) as No_of_customer from Customer_Details group by state;

-- 7)Returning all column from Customer_Details sorted by states in ascending order
select * from Customer_details order by state asc;
