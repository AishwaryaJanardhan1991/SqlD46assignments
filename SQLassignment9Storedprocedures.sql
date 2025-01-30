-- CREATING DATABASE WORKERS
create database Workers;
Use Workers;

-- Creating the table Worker
create table Worker (
Worker_Id INT auto_increment primary key,
FirstName CHAR(25),
LastName CHAR(25),
Salary INT,
JoiningDate DATETIME,
Department CHAR(25)
);
Desc Worker;

-- Inserting values into the Worker table
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'Sudha', 'Rani', 57000, '2019-10-11 12:05:00', 'IT'),
(2, 'Divya', 'Siva', 42000, '2021-05-10 10:22:25', 'HR'),
(3, 'Nirosha', 'Bosle', 170000, '2014-08-02 11:55:05', 'Finance'),
(4, 'Susan', 'Devasi', 38000, '2022-11-22 11:15:00', 'IT'),
(5, 'Mikel', 'Jackson', 48000, '2020-09-29 11:25:00', 'HR'),
(6, 'Nivedhya', 'Tomas', 18000, '2025-01-05 09:55:00', 'Finance'),
(7, 'Kavya', 'Madhavan', 43000, '2022-09-08 12:15:10', 'IT'),
(8, 'Sudha', 'Moorthi', 55000, '2021-07-21 10:45:25', 'HR'),
(9, 'Mohan', 'lal', 52000, '2021-09-29 09:45:38', 'Finance'),
(10, 'Lalu', 'Alex', 44000, '2022-09-25 11:20:00', 'HR'),
(11, 'Maya', 'Devi', 28000, '2024-10-12 11:00:05', 'IT'),
(12, 'Vinaya', 'Sasidharan', 32000, '2025-01-22 09:11:12', 'Finance'),
(13, 'Manya', 'Sudharsan', 34000, '2024-10-15 09:35:40', 'HR'),
(14, 'Vinaya', 'Sasidharan', 32000, '2023-12-25 10:24:48', 'IT');
select * from Worker;

-- sample stored procedure for checking
Delimiter $$
create procedure getworker (IN id INT)
begin
select * from Worker where id = Worker_Id;
end $$
Delimiter ;
call getworker(1);

# Assignment 9 Stored Procedure Question Answers

-- 1. Creating a stored procedure to add a new record to the Worker table
Delimiter //
create procedure Add_Worker(IN Add_Worker_Id INT,
IN Add_FirstName CHAR(25), IN Add_LastName CHAR(25),
IN Add_Salary INT, IN Add_JoiningDate DATETIME,
IN Add_Department CHAR(25))
begin
Insert into Worker values (Add_Worker_Id, Add_FirstName, Add_LastName,
Add_Salary, Add_JoiningDate, Add_Department);
end //
Delimiter ;
-- calling Add_Worker
call Add_Worker(15, 'Vinaya', 'Sasidharan', 32000, '2024-08-30 09:58:18', 'Finance');
select * from Worker;

-- 2. Creating a stored procedure to retrieve the salary of a worker
Delimiter //
create Procedure GetWorkerSalary (
    IN Get_Worker_Id INT,
    OUT p_Salary INT)
Begin
    Select Salary into p_Salary
    from Worker
    where Worker_Id = Get_Worker_Id;
End //
Delimiter ;
-- Calling the GetWorkerSalary procedure
call GetWorkerSalary(10, @Salary);
select @Salary as Get_Salary;

-- 3. Creating a stored procedure to update the department of a worker
Delimiter //
create procedure Update_WorkerDepartment (
    IN P_Worker_Id INT,
    IN p_Department CHAR(25))
Begin
    Update Worker
    set Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
    END //
Delimiter ;
-- Calling the Update_WorkerDepartment procedure
call Update_WorkerDepartment(5, 'IT');
call Update_WorkerDepartment(11, 'Finance');
select * from Worker;

-- 4. Creating a stored procedure to retrieve the number of workers in a department
Delimiter $$
create procedure Count_worker_Departmentwise(IN p_Department CHAR(25),
OUT p_WorkerCount INT)
begin
select count(Worker_Id) into p_WorkerCount
from worker
where Department = p_Department;
end $$
Delimiter ;
-- calling Count_worker_Departmentwise
call Count_worker_Departmentwise('IT', @WorkerCount);
select @WorkerCount as Workers_in_Departments;

-- 5. Creating a stored procedure to retrieve the average salary of a department
Delimiter //
create procedure Get_AvgSalaryinDepartment(IN p_Department CHAR(25),
OUT p_AvgSalary Decimal(10,2))
Begin
select avg(Salary) into p_AvgSalary
From Worker
Where Department = p_Department;
end //
Delimiter ; 
-- Calling the Get_Avg Salary in Department
call Get_AvgSalaryinDepartment('HR', @avgSalary);
select @avgSalary as AverageSalary;



