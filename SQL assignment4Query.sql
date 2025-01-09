create database COUNTRYANDPOPULATION;
use COUNTRYANDPOPULATION ;

create table Country (
ID int primary key auto_increment,
Country_name varchar(50) not null,
Population varchar(50) not null,
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
(1, 'Mona', 'Lucy', 65655677809, 4.1, 1,'Chaina'),
(2, 'Suku', 'Tina', 76568888782, 5.9, 9,'Australia'),
(3, 'Srida', 'Sivam', 342546326, 7.2, 7,'UK'),
(4, 'Thushara', 'Lucky', 5436657677, 2.8, 2,'USA'),
(5, 'Danya', 'Sony', null, 8.4, 4,'India'),
(6, 'Fida', 'Fathima', 8765432809, 5.7, 2,'USA'),
(7, 'Viswa', 'Sathi', 896432567890, 6.8, 7,'UK'),
(8, 'Siva', 'Chandru', 76789879997, 4.6, null, null),
(9, 'Mini', 'Lucifer', null, 5.3, 3,'Canada'),
(10, 'Mikha', 'Lorance', 6256678898, 3.7, null, null);
select * from Persons;

-- 1)Distinct country names
select distinct Country_name from Persons;

-- 2)first name and Last name from persons table
select Fname as First_name, Lname as Last_name from Persons;

-- 3)all persons with rating greater than 4.0
select Fname, Lname from Persons where Rating > 4.0;

-- 4)countries with population greater than 1000000
select Country_name from Country where population > 1000000;

-- 5)persons from USA / Rating greater than 4.5
select * from Persons where Country_name = 'USA' or Rating >4.5;

-- 6)all persons where country name is null
select * from Persons where Country_name is null;
select Fname, Lname from Persons where Country_name is null;

-- 7)All persons from USA, UK, Canada
select * from Persons where Country_name in('USA','UK','Canada');

-- 8)all persons not from countries India and astralia
select * from Persons where Country_name not in( 'India', 'Australia');

-- 9)Countries with Population between 500000 and 2000000
select * from Country where Population between 500000 and 2000000;

-- 10) all countries name not starting with 'C'
select * from Country where Country_name not like 'C%';
