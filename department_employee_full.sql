-- Department and Employee Database
-- Complete SQL code reconstructed and cleaned from the uploaded images

DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;

CREATE TABLE DEPARTMENT (
    deptID INT PRIMARY KEY NOT NULL,
    deptname VARCHAR(50) NOT NULL
);

CREATE TABLE EMPLOYEE (
    empId INTEGER PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    emailID VARCHAR(50),
    salary DECIMAL(10,2),
    deptID INT,
    FOREIGN KEY (deptID) REFERENCES DEPARTMENT(deptID)
);

-- Insert departments
INSERT INTO DEPARTMENT VALUES (1, 'CSE');
INSERT INTO DEPARTMENT VALUES (0, 'AIML');
INSERT INTO DEPARTMENT VALUES (3, 'CSE');
INSERT INTO DEPARTMENT VALUES (4, 'BT');
INSERT INTO DEPARTMENT VALUES (5, 'CSE');

-- Insert employees
INSERT INTO EMPLOYEE VALUES
(100, 'asmit', 'giri', 'asmit@gmail.com', 60000, 1);

INSERT INTO EMPLOYEE VALUES
(101, 'arit', 'mandal', 'arit@gmail.com', 65000, 1);

INSERT INTO EMPLOYEE VALUES
(102, 'kripamay', 'mandal', 'kripa@gmail.com', 70000, 3);

INSERT INTO EMPLOYEE VALUES
(103, 'shantanu', 'dandapat', 'shantanu@gmail.com', 67000, 1);

INSERT INTO EMPLOYEE VALUES
(104, 'pritam', 'mandal', 'pritam@gmail.com', 5000, 5);

-- Display all departments
SELECT * FROM DEPARTMENT;

-- Display all employees
SELECT * FROM EMPLOYEE;

-- Find average salary of all employees
SELECT AVG(salary) AS AVGsSalary
FROM EMPLOYEE;

-- Find employees whose salary is greater than the average salary
SELECT *
FROM EMPLOYEE
WHERE salary > (
    SELECT AVG(salary)
    FROM EMPLOYEE
);

-- Find employee(s) having the maximum salary in their own department
SELECT *
FROM EMPLOYEE E1
WHERE salary = (
    SELECT MAX(salary)
    FROM EMPLOYEE E2
    WHERE E1.deptID = E2.deptID
);

-- Find departments having more than 2 employees
SELECT deptID, COUNT(*) AS totalemp
FROM EMPLOYEE
GROUP BY deptID
HAVING COUNT(*) > 2;

-- Find employees whose salary is greater than the overall average
-- but less than the maximum salary of their department
SELECT *
FROM EMPLOYEE E
WHERE salary > (
    SELECT AVG(salary)
    FROM EMPLOYEE
)
AND salary < (
    SELECT MAX(salary)
    FROM EMPLOYEE
    WHERE deptID = E.deptID
);

-- Find employees whose department is not among departments
-- having an employee with salary below 20000
SELECT *
FROM EMPLOYEE
WHERE deptID NOT IN (
    SELECT deptID
    FROM EMPLOYEE
    WHERE salary < 20000
      AND deptID IS NOT NULL
);

COMMIT;
