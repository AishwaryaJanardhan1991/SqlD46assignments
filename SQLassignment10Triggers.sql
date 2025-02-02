-- ASSIGNMENT 10 TRIGGERS( BEFORE AND AFTER)

-- creating a database
create database teacherssalary;
use teacherssalary;

-- 1. creating table teachers
create table teachers (
ID int primary key,
Name varchar(50) not null,
Subject varchar(50) not null,
Experience int not null,
Salary decimal(10,2)
);
Desc teachers;

-- Inserting values to table teachers
insert into teachers (ID, Name, Subject, Experience, Salary) values
(1, 'Asha', 'Hindi', 4, 40000.00),
(2, 'Thaha', 'Malayalam', 5, 50000.00),
(3, 'Nathasha', 'Zoology', 12, 160000.00),
(4, 'Nirmala', 'Maths', 3, 30000.00),
(5, 'Sreeja', 'Social', 4, 42000.00),
(6, 'Arathi', 'English', 20, 225000.00),
(7, 'Jaseera', 'Hindi', 2, 23000.00),
(8, 'Neelija', 'Malayalam', 11, 130000.00);
select * from teachers;

-- 2. creating before trigger for Salary should not be negetive
Delimiter // 
create trigger before_insert_teacher
before insert on teachers
for each row
begin
if new.Salary <0 then
Signal sqlstate '45000' 
set message_text = "Salary cannot be negetive";
end if ;
end //
Delimiter ;
show triggers;
insert into teachers values(9,'Anupama', 'Malayalam', 2, -20000);
select * from teachers;

-- 3. creating after insert trigger to Teachers log table ( New entries of teachers)
-- creating table named teacher_log
create table teacher_log (
teacher_Id int primary key,
action varchar(50),
timestamp timestamp default current_timestamp
);
desc teacher_log;

-- performing after insert trigger
Delimiter //
create trigger after_insert_teacher
After insert on teachers
for each row
begin
insert into teacher_log(teacher_id, action, timestamp)
values(new.ID, 'Insert', now());
end //
Delimiter ;
show triggers;
-- checking for values when inserting new rows
insert into teachers values
(10, 'Beena','Zoology', 8, 105000.00),
(11, 'Mayookha', 'Social', 2, 330000);
Select * from teachers;
select * from teacher_log;

-- 4. creating before delete trigger for teachers table,
-- pop up error message while deleting teacher having more than 10 years experience 
Delimiter // 
create trigger before_delete_teacher
before delete on teachers
for each row
begin
if old.Experience >10 then
Signal sqlstate '45000' 
set message_text = "Error in deleting teachers having experience greater than 10" ;
end if ;
end //
Delimiter ;
show triggers;
select * from teachers;
Delete from teachers where ID = 3;
Delete from teachers where ID = 6;

-- 5. creating after delete trigger when inserting a row to teacher_log table and that row is deleted from teacher table.
Delimiter // 
create trigger after_delete_teacher
After delete on teachers
for each row
begin
insert into teacher_log (teacher_id, action, timestamp)
values (old.ID, 'Delete', now());
end //
Delimiter ;
show triggers;
select * from teachers;
select * from teacher_log;
delete From teachers where ID =1;
select * from teacher_log;