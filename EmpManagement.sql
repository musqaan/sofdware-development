CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Position VARCHAR(50) NOT NULL,
    DepartmentID INT,
    HireDate DATE NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE Salaries (
    SalaryID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2) NOT NULL,
    EffectiveDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Departments (DepartmentName, Location)
VALUES ('Human Resources', 'New York'),
       ('IT Department', 'San Francisco'),
       ('Finance', 'Chicago'),
       ('Sales', 'Los Angeles'),
       ('Marketing', 'Miami');

INSERT INTO Employees (FirstName, LastName, Email, Position, DepartmentID, HireDate)
VALUES ('John', 'Doe', 'john.doe@example.com', 'HR Manager', 1, '2022-05-01'),
       ('Jane', 'Smith', 'jane.smith@example.com', 'Software Engineer', 2, '2020-08-15'),
       ('Michael', 'Brown', 'michael.brown@example.com', 'Financial Analyst', 3, '2021-01-10'),
       ('Emily', 'Davis', 'emily.davis@example.com', 'Sales Executive', 4, '2023-02-20'),
       ('David', 'Wilson', 'david.wilson@example.com', 'Marketing Manager', 5, '2022-11-30');

INSERT INTO Salaries (EmployeeID, SalaryAmount, EffectiveDate)
VALUES (1, 60000.00, '2022-05-01'),
       (2, 80000.00, '2020-08-15'),
       (3, 75000.00, '2021-01-10'),
       (4, 50000.00, '2023-02-20'),
       (5, 70000.00, '2022-11-30');

SELECT e.EmployeeID, e.FirstName, e.LastName, e.Position, d.DepartmentName, s.SalaryAmount, s.EffectiveDate
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.EffectiveDate = (SELECT MAX(EffectiveDate) FROM Salaries WHERE EmployeeID = e.EmployeeID);


-- Update salary record for EmployeeID = 2 (Jane Smith)
INSERT INTO Salaries (EmployeeID, SalaryAmount, EffectiveDate)
VALUES (2, 85000.00, '2023-01-01');

SELECT d.DepartmentName, AVG(s.SalaryAmount) AS AverageSalary
FROM Salaries s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
