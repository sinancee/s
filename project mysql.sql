CREATE DATABASE library;
USE library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
);
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;
SELECT Books.Book_title, Customer.Customer_name 
FROM IssueStatus 
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;
SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

SELECT Customer_name 
FROM Customer 
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

SELECT Branch_no, COUNT(Emp_Id) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no;

SELECT Customer.Customer_name 
FROM IssueStatus 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id 
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(Emp_Id) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no 
HAVING Total_Employees > 5;

SELECT Employee.Emp_name, Branch.Branch_address 
FROM Branch 
JOIN Employee ON Branch.Manager_Id = Employee.Emp_Id;

SELECT Customer.Customer_name 
FROM IssueStatus 
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id 
WHERE Books.Rental_Price > 25;





