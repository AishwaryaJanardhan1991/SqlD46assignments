create database COUNTRYANDPOPULATION1;
use COUNTRYANDPOPULATION1 ;

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
Lname varchar(50),
Population bigint,
Rating decimal(3, 1) check (Rating >=0 and Rating <=10),
Country_ID int,
Country_name varchar(50),
foreign key (Country_ID) references Country(ID)
);
desc persons;



-- inserting values to country table
INSERT INTO Country (Country_name, Population, Area) VALUES
('China', 1020000, 3300000.00),
('USA', 8800000, 750000.00),
('Canada', 200000, 150000.00),
('India', 1250000, 1050000.00),
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
(5, 'Danya', 'Sony', 345646757, 8.4, 4,'India'),
(6, 'Fida', 'Fathima', 8765432809, 5.7, 2,'USA'),
(7, 'Viswa', 'Sathi', 896432567890, 6.8, 7,'UK'),
(8, 'Siva', 'Chandru', 76789879997, 4.6, 1,'China'),
(9, 'Mini', 'Lucifer', 3385685669, 5.3, 3,'Canada'),
(10, 'Mikha', 'Lorance', 6256678898, 3.7, 3, 'Canada');
select * from Persons;

-- 1) First 3 characters of country name
select left(Country_name, 3) as Firstchar from Country;

-- 2) Concatenate firstname and lastname
select concat(Fname, ' ', Lname) as Fullname from Persons;

-- 3) Count numbers of unique country
select count(distinct(Country_name)) as Uniquecountry from Persons;

-- 4) Maximum population from the country Table
select Max(Population) as Maxpopulation from Country;

-- 5) Minimum population from Country table
select min(Population) as Minpopulation from Persons;

-- 6) Inserting 2 raws with Lame is null
INSERT INTO Persons VALUES
(11, 'Sonara', Null, 5454656532, 4.3, 1,'China'),
(12, 'Suda', Null, 1245369878, 5.3, 7,'UK');
select * from persons;
Select count(Lname) as nonnullLname from Persons;

-- 7) Number of raws in the persons table
Select count(ID) as TotalRaws from Persons;
select count(*) as totalrows from Persons;

-- 8) population of the country for first 3 raws
Select Population from Country limit 3;

-- 9) Query for printing 3 random raws of country
select * from Country order by rand() limit 3;

-- 10) Persons ordered by their rating in descending order
Select Fname, Lname, Rating from persons order by Rating desc;

-- 11) Total population for each country in the persons table
select Country_ID, sum(Population) as Totalpopulation From Persons group by Country_ID;

-- 12) Countries in the persons table with total population greater than 50000
select Country_ID, sum(Population) as Totalpopulation From Persons group by Country_ID having sum(population)>50000;

-- 13) Total number of persons, average rating for each country,only for countries with more than 2 persons ordered by the average rating in ascending order
  select Country_ID, Count(*) as Totalpersons, Avg(Rating) As Avereagerate from Persons
  group by Country_ID having count(*)>2 order by Avg(Rating) asc;
  

