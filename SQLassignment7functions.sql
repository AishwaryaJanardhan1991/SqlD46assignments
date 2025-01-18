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
('USA', 8800000, 750000.00),
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
(3, 'Srida', 'Sivam', 342546326, 7.2, 7,'UK'),
(4, 'Thushara', 'Lucky', 5436657677, 2.8, 2,'USA'),
(5, 'Danya', 'Sony', 566777888, 8.4, 4,'India'),
(6, 'Fida', 'Fathima', 8765432809, 5.7, 2,'USA'),
(7, 'Viswa', 'Sathi', 896432567890, 6.8, 7,'UK'),
(8, 'Siva', 'Chandru', 76789879997, 4.6, 2, 'USA'),
(9, 'Mini', 'Lucifer', 54667888809, 5.3, 3,'Canada'),
(10, 'Mikha', 'Lorance', 6256678898, 3.7, 9, 'Australia');
select * from Persons;
 
 -- 1.Adding new column DOB in Persons table (data type as Date).
Alter table Persons add column DOB date ;

-- 2.User-defined function to calculate age using DOB.
Delimiter $$
create function Calculatedage (DOB date)
returns int
deterministic
No sql
Begin
return datediff(Current_date, DOB)/365.25;
end $$
Delimiter ;

-- 3.Fetching Age of all persons using fuction(Calculated age)
-- Updating table
Update Persons set DOB = '2001-06-08' where ID=1;
Update Persons set DOB = '2000-04-18' where ID=2;
Update Persons set DOB = '2000-12-05' where ID=3;
Update Persons set DOB = '2001-05-31' where ID=4;
Update Persons set DOB = '2001-01-25' where ID=5;
Update Persons set DOB = '2000-12-12' where ID=6;
Update Persons set DOB = '2001-03-16' where ID=7;
Update Persons set DOB = '2000-11-08' where ID=8;
Update Persons set DOB = '2001-02-24' where ID=9;
Update Persons set DOB = '1999-12-06' where ID=10;
select * from Persons;
select ID, Fname, Lname, DOB, Calculatedage(DOB) as age from Persons;

-- 4. Find the length of each country name 
select Country_name, length(Country_name) as totalcharacters from Country;

-- 5. Extract the first three characters of each country
select Country_name, left(Country_name, 3) as Firstthreechar from Country;

-- 6. Converting all country names to uppercase and lowercase
Select Country_name, ucase(Country_name) as Uname from Country;
Select Country_name, Lcase(Country_name) as Lname from Country;