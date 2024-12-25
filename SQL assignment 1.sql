-- CREATING DATABASE

create DATABASE SCHOOL;
use SCHOOL;

-- CREATING TABLES
create table Student (
Roll_No int auto_increment primary key,
Name varchar(50),
Marks int,
Grade char(1)
);

Desc Student;

Insert into Student ( Name, Marks, Grade) Values
('Ajay', 90, 'A'),
('Swathi', 95, 'A'),
('Meena', 80, 'A'),
('Chandu', 70, 'B'),
('Sudha' , 55, 'C'),
('Mani', 60, 'C'),
('Bindhu', 95, 'A'),
('Aysha', 100, 'A');

Select * from Student;

Alter table Student ADD contact varchar(12);

Alter table Student drop column Grade;

Rename table Student to CLASSTEN;

Truncate table CLASSTEN;

Drop table CLASSTEN;














