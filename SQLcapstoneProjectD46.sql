# CAPSTONE PROJECT SQL - LIBRARY MANAGEMENT SYSTEM

-- creating database
CREATE DATABASE LIBRARY;
USE LIBRARY;

-- creating table 1 'Branch'
create table Branch (
Branch_no int auto_increment primary key,
Manager_Id int,
Branch_address varchar(250),
Contact_no varchar(15) not null unique);
Desc Branch;

-- inserting values to library branch from main, sub, central and department branches.
insert into Branch (Branch_No, Manager_Id, Branch_address, Contact_no) values
(1, 101, 'Main Branch of Science Library, Jayanagar Bangalore', '8945456523'),
(2, 102, 'Sub Branch of science Library Marathahalli Bangalore','8489566553'),
(3, 103, 'Sub Branch of Science Library Hebbal Bangalore','7595546885'),
(4, 116, 'Branch of IT Main Department Nagasandra Bangalore', '8998745555'),
(5, 111, 'Branch of IT Central Department MG Road, Bangalore', '6878987823'),
(6, 112, 'Branch of IT Department-sub Kammanahalli Bangalore', '6565484898'),
(7, 128, 'Sub Branch of History Kalyan Nagar Bangalore', '6565484856'),
(8, 129, 'Branch of History Central Gandhinagar Bangalore', '8945562132'),
(9, 125, 'Main Branch of History kothanur Bangalore', '8567895425'),
(10, 130, 'Cental Library for Department of Malayalam Chinnasandra Bangalore', '7575656564'),
(11, 131, 'Library for Department of Malayalam Madiwala Bangalore', '7556897554'),
(12, 132, 'Sub Library for Department of Malayalam Chickpet Bangalore', '7155488864'),
(13, 133, 'Cental Branch Library for Department of Malayalam Asok Nagar Bangalore', '7148956654');
Select * from Branch;

-- creating Table 2 'Employee'
create table Employee (
Emp_Id int primary key,
Emp_name varchar(50),
Position varchar(50),
Salary Decimal(10,2),
Branch_no int,
Foreign key (Branch_no) references Branch(Branch_no));
Desc Employee;

insert into Employee ( Emp_Id, Emp_name, Position, Salary, Branch_no) values
(101, 'Devasena Naik', 'Senior Associate', 87000.00, 1),
(102, 'Rachana Vinod', 'Junior Associate', 25000.50, 5),
(103, 'Shivakami Ayyar', 'Associate', 35000.00, 5),
(104, 'Yamuna Thilak', 'Junior Associate', 15000.50, 5),
(105, 'Nandhikesh Naran', 'Senior Associate', 82000.20, 5),
(106, 'Venkatesh Subramanyan', 'Professor', 97000.50, 6),
(107, 'Vinayaka sachidev', 'Lecturer', 67500.00, 5),
(108, 'Krishnaraj Padiyath', 'Librarian', 35000.00, 8),
(109, 'Vishnu Narayanan', 'Associate', 43000.00, 5),
(110, 'Nayana Damodharan', 'Senior', 78000.00, 10),
(111, 'Nandhitha Shivankutti', 'Trainee', 18000.00, 10),
(112, 'Shyama Devi', 'Lecturer', 68000.00, 11),
(113, 'Sayooj krishnan', 'Librarian', 28000.00, 10);
select * from Employee;

-- creating Table 3 'Books'
create table Books (
ISBN VARCHAR(13) primary key unique,
Book_title varchar(150),
Category varchar(100),
Rental_price decimal(10,2),
Status varchar(3), check (Status in('Yes','No')),
Author varchar(50),
Publisher varchar(50));
Desc Books;

Insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) values
('9781050150121', 'Fundamentals of Physics','Science', 32.50, 'No', 'P K Sharma', 'D C Books'),
('9791250251122', 'Advanced Organic Chemistry', 'Science', 60.20, 'Yes', 'James William', 'D C Books'),
('9791450453124', 'Randamoozham', 'Malayalam', 30.00, 'No', 'M T Vasudevan Nair', 'Book Factory'),
('9781850554125', 'Invertebrate Zoology', 'Science', 40.20, 'Yes', 'S Leelavathy', 'SaraS'),
('9791750655120', 'Computer Systems', 'IT', 25.50, 'Yes', 'Randal Bryant', 'D C Books'),
('9781650756126', 'Human Body Encyclopedia', 'Science', 23.50, 'No', 'Margerette Mary', 'Wonder Book House'),
('9791550857127', 'Our Planet Earth & its history', 'History', 20.00, 'No','Rudolf Jerald','Wonder Book House'),
('9781150958128', 'History & Sociology themes and perspectives','History', 65.00,'Yes',' Michael Haralambos', 'Collin Books'),
('9791250159129', 'Diagnostic Radiology', 'Science', 38.00, 'Yes', 'Manavjit Singh Sandhu', 'Jaypee Brothers'),
('9798686554434', 'Quantum Physics', 'Science', 18.30, 'No', 'Albert Einstein', 'Physics World'),
('9787687754678', 'Organic Chemistry', 'Science', 22.20, 'Yes', 'Robert Doyle', 'Chem Press'),
('9786456444337', 'Python Programming', 'IT', 23.50, 'No', 'Guido Rossum', 'Code World'),
('9786767564543', 'History of India', 'History', 25.00, 'Yes', 'Rajesh Kumar', 'Heritage Press'),
('9798787654321', 'Data Science And AI', 'IT', 32.00, 'Yes', 'John Fedric', 'Tech Press'),
('9798878878788', 'Chemmeen', 'Malayalam', 24.00, 'Yes', 'Thakazhi Sivasankara Pillai', 'Current Books'),
('9785547778222', 'Pathummayude Aadu', 'Malayalam', 38.00, 'Yes', 'Vaikom Muhammad Basheer', 'D C Books'),
('9786566566665', 'Balyakalasakhi', 'Malayalam', 27.00, 'Yes', 'Vaikom Muhammad Basheer', 'Mathrubhumi Books');
 select * from Books;
 
-- creating table 4 'Customer'
create table Customer (
Customer_Id int primary key,
Customer_name varchar(50) unique,
Customer_address varchar(250),
Reg_date date);
Desc Customer;

Insert into Customer ( Customer_Id, Customer_name, Customer_address, Reg_Date) values
(1, 'Asha Madan', 'Kailash House Minarva Appartments Bangalore 560078', '2023-12-01'),
(2, 'Sunitha Williams', 'Galaxy House plot no 99 Whitefield Bangalore 576648', '2020-12-14'),
(3, 'Samuel Fransis', 'Mantri Mantion Kalyan Nagar Bangalore 560044', '2015-10-25'),
(4, 'Nirmala Joy', 'Soundarya Residency MG road Bangalore 560077', '2019-08-14'),
(5, 'Mouny Roy', 'Terresa apartment Kothnur street Bangalore 569009', '2020-11-12'),
(6, 'Soumya Vijayan', 'Subadramma Clinic Road Bangalore 560079', '2016-12-12'),
(7, 'Nayana Narayanan', 'Raja Rajeshwary road Rajaji nagar Bangalore 560484', '2018-04-15'),
(8, 'Sudakara kurupp', 'Polycampus buildng North Junction Bangalore 598844', '2020-10-16'),
(9, 'Midhya Madavan', 'Laxana Appartments Poorvabeech Bangalore 560087', '2021-05-04'),
(10, 'Soundarya Thilakan', 'Somarajappa Building flat03 kumarapura Bangalore 560089', '2019-04-03');  
select * from Customer;

-- creating table 5 'Issue Status'
create table IssueStatus (
Issue_Id int auto_increment primary key,
Issued_Cust int,
foreign key (Issued_cust) references Customer(Customer_Id),
Issued_book_name varchar(150),
Issue_date date,
ISBN_book varchar(13),
foreign key (ISBN_book) references Books(ISBN));
Desc IssueStatus;

insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date,ISBN_Book) values
(1, 2, 'Fundamentals of Physics', '2023-06-12', 9781050150121),
(2, 3, 'Invertebrate Zoology', '2024-02-15', 9781850554125),
(3, 3, 'Our Planet Earth & its history', '2023-06-12', 9791550857127),
(4, 6, 'Randamoozham', '2023-12-05', 9791450453124),
(5, 5, 'History & Sociology themes and perspectives','2024-01-02', 9781150958128),
(6, 1, 'Diagnostic Radiology','2024-12-12', 9791250159129),
(7, 10, 'Advanced Organic Chemistry', '2023-11-16', 9791250251122),
(8, 5, 'Data Science And AI', '2025-01-01', 9798787654321),
(9, 9, 'Computer Systems', '2024-11-02', 9791750655120),
(10, 10,'Human Body Encyclopedia', '2023-12-01', 9781650756126);
select * from  IssueStatus;

-- creating table 6 Return Status
create table ReturnStatus (
Return_Id int primary key,
Return_Cust int,
Return_book_name varchar(150),
Return_book_date date,
ISBN_book2 varchar(13),
foreign key (ISBN_book2) references Books(ISBN));
Desc ReturnStatus;

insert into Returnstatus (Return_Id, Return_Cust, Return_book_name, Return_book_date, ISBN_book2) values
(101, 5, 'History & Sociology themes and perspectives', '2024-03-16', 9781150958128),
(102, 9, 'Computer Systems', '2024-12-12', 9791750655120),
(103, 10,'Human Body Encyclopedia', '2024-06-16', 9781650756126),
(104, 10, 'Advanced Organic Chemistry', '2024-02-10', 9791250251122),
(105, 2, 'Fundamentals of Physics', '2023-12-16', 9781050150121),
(106, 6, 'Randamoozham', '2024-03-15', 9791450453124);
select * from ReturnStatus;

-- 1. Retrieving Book_title, Category and rental price of all available books.
select Book_title, Category, Rental_Price from Books where Status = 'Yes';

-- 2. Employee names and their respective salaries in descending order of salary
select Emp_name, Salary from Employee order by Salary desc;

-- 3. Retrieving the book titles and the corresponding customers who have issued those books
select b.Book_title, c.Customer_name 
from IssueStatus i 
inner join Books b on i.Isbn_book = b.ISBN 
inner join Customer c on i.Issued_cust = c.Customer_Id;

-- 4. Displaying the total count of books in each category.
select Category, count(*) as Total_Books_Count
from Books
group by Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select Emp_name, Position, Salary
from Employee
where Salary > 50000;

-- 6. listing customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer_name from Customer
where Reg_date < '2022-01-01' and Customer_Id not in (select Issued_cust from IssueStatus);

-- 7. Displaying the branch numbers and the total count of employees in each branch.
select Branch_no, count(*) as Total_Emp_Branchwise
from Employee 
group by Branch_no;

-- 8.  Display the names of customers who have issued books in the month of June 2023.
select distinct c.Customer_name 
from IssueStatus i 
inner join Customer c on i.Issued_cust = c.Customer_Id 
where i.Issue_date between'2023-06-01' and '2023-06-30';

-- 9. Retrieve book_title from book table containing history.
select Book_title from Books where Book_title like '%history%';

-- 10..Retrieving branch numbers, count of employees for branches having more than 5 employees
select  Branch_no, count(*) as Totat_emp_Count 
from Employee group by Branch_no 
having count(*) > 5;

-- 11. Retrieving the names of employees and their respective branch addresses
select b.Branch_no, e.Emp_name, b.Branch_address 
from Employee e 
inner join Branch b on e.Emp_Id = b.Manager_Id;

-- 12. Displaying the names of customers who have issued books with a rental price higher than Rs. 25.
select c.Customer_name, b.Rental_Price
from IssueStatus i inner join Books b on I.Isbn_book = b.ISBN 
inner join Customer c on I.Issued_cust = c.Customer_Id 
where b.Rental_Price > 25;
