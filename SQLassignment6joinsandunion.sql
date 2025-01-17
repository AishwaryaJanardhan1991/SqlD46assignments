create database COUNTRYANDPOPULATION;
use COUNTRYANDPOPULATION;

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
(5, 'Danya', 'Sony', 354474575, 8.4, 4,'India'),
(6, 'Fida', 'Fathima', 8765432809, 5.7, 2,'USA'),
(7, 'Viswa', 'Sathi', 896432567890, 6.8, 7,'UK'),
(8, 'Siva', 'Chandru', 76789879997, 4.6, 4,'India' ),
(9, 'Mini', 'Lucifer', 534474854, 5.3, 3,'Canada'),
(10, 'Mikha', 'Lorance', 6256678898, 3.7, 9,'Australia');
select * from Persons;

-- Question1
-- inner join
select P.ID, P.Fname, P.Lname, P.Population, P.Rating, C.Country_name 
from Persons P INNER JOIN Country C on P.Country_ID = C.ID;

-- left join
select P.ID, P.Fname, P.Lname, P.Population, P.Rating, C.Country_name 
from Persons P LEFT JOIN Country C on P.Country_ID = C.ID;

-- right join
select P.ID, P.Fname, P.Lname, P.Population, P.Rating, C.Country_name 
from Persons P RIGHT JOIN Country C on P.Country_ID = C.ID;

-- Question 2
-- Country names from Country and Persons tables including duplicates
select Country_name as Countryname from Country
UNION
select Country_name as Cname from Persons;

-- Question 3
-- all distinct country names from Country and Persons tables
select Country_name as Countryname from Country
UNION ALL
select Country_name as Cname from Persons;

-- Question 4
-- Round the ratings to nearest integer in the persons table
select ID, Fname, Lname, Rating, round(Rating) as Rating_rounded from Persons;
