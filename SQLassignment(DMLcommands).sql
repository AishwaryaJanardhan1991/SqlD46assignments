Create database Management;
Use management;
create table Managers (
Manager_ID int primary key not null unique,
First_Name varchar(50) not null,
Last_name varchar(50) not null,
DOB date not null,
Age int check (Age > 20 and Age < 60),
last_update timestamp default current_timestamp,
Gender char(1) check (Gender in('M', 'F','O')),
Department varchar(50) not null,
Salary decimal(10,2) check(salary>0) not null);

Desc Managers;

insert into Managers (Manager_ID, First_Name, Last_name, DOB, Age, Gender, Department, Salary) 
values (1, 'Eva', 'Jacob', '1984-05-12', 40, 'F', 'Science', 42000),
 (2, 'Aliya', 'Jayson', '1993-04-09', 31, 'F', 'Botany', 23000),
 (3, 'suma', 'Mani', '1994-03-02', 30, 'F', 'Hindi', 25000),
 (4, 'Dhanya', 'Alex', '1984-02-03', 40, 'F', 'Zoology', 36000),
 (5, 'Meera', 'Nandan', '1992-03-08', 32, 'F', 'English', 28000),
 (6, 'Mayookha', 'Sundar', '1983-05-14', 41, 'F', 'IT', 55000),
 (7, 'Madu', 'Sudan', '1981-01-30', 43, 'M', 'IT', 72000),
 (8, 'Aswathi', 'Krishna', '1994-02-28', 30, 'F', 'Maths', 28000),
 (9, 'sayooj', 'Sivan', '1994-06-02', 30, 'M', 'Geography', 24000),
 (10, 'Asha', 'Sony', '1987-01-13', 37, 'F', 'IT', 24000);
 select * from Managers;
 -- Retrieving name and date of birth
 select First_Name, Last_name, DOB
 from Managers where Manager_ID = 1;
 
 -- Annual income of all managers
 select Manager_ID, First_name, Last_name, (Salary * 12) as Annual_Income
 from Managers;
 
 -- displaying records except Aliya
 Select * from Managers where not First_name = 'Aliya';
 
 -- Managers in It department and salary greater than 25000
 Select * from Managers
 where Department = 'IT' and Salary > 25000;
 
 -- Managers Salary Between 10000 and 35000
 Select * from Managers
 Where salary between 10000 and 35000 ;
 
 
 
 