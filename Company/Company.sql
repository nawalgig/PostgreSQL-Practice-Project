-- Drop tables if they already exist to avoid conflicts
DROP TABLE IF EXISTS projects CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

-- Create Departments table
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dept_id INT REFERENCES departments(dept_id) ON DELETE CASCADE,
    salary NUMERIC(10, 2) NOT NULL,
    position VARCHAR(100) NOT NULL,
    hire_date DATE DEFAULT CURRENT_DATE,
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Create Projects table
CREATE TABLE projects (
    proj_id SERIAL PRIMARY KEY,
    proj_name VARCHAR(150) NOT NULL,
    dept_id INT REFERENCES departments(dept_id) ON DELETE CASCADE,
    budget NUMERIC(12, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Departments Insert
INSERT INTO departments (dept_name, location)
VALUES ('IT','Karachi'),('HR','Lahore'),('Finance','Islamabad'),
('Marketing','Karachi'),('Operations','Lahore');

-- Employees Insert (50 rows)
INSERT INTO employees (first_name,last_name,dept_id,salary,position,phone_number)
VALUES
('Raj','Sharma',1,85000,'Developer','+92-300-1234567'),
('Sara','Khan',2,60000,'HR Executive','+92-301-2345678'),
('Ali','Raza',3,95000,'Accountant','+92-302-3456789'),
('Meera','Patel',4,72000,'Marketing Lead','+92-303-4567890'),
('John','Doe',1,90000,'System Analyst','+92-304-5678901'),
('Fatima','Sheikh',1,78000,'Developer','+92-305-6789012'),
('Ahmed','Ali',2,55000,'HR Assistant','+92-306-7890123'),
('Zainab','Malik',3,88000,'Financial Analyst','+92-307-8901234'),
('Bilal','Ahmed',4,65000,'SEO Specialist','+92-308-9012345'),
('Usman','Ghani',5,70000,'Operations Manager','+92-309-0123456'),
('Ayesha','Siddiqui',1,92000,'DevOps Engineer','+92-310-1112233'),
('Hassan','Raza',2,75000,'HR Manager','+92-311-2223344'),
('Sana','Mir',3,67000,'Junior Accountant','+92-312-3334455'),
('Imran','Khan',4,81000,'Marketing Manager','+92-313-4445566'),
('Kiran','Naz',5,58000,'Logistics Coordinator','+92-314-5556677'),
('Hamza','Farooq',1,110000,'Software Engineer','+92-315-6667788'),
('Nida','Dar',2,62000,'Recruiter','+92-316-7778899'),
('Omer','Farooq',3,99000,'Senior Accountant','+92-317-8889900'),
('Rabia','Basri',4,53000,'Content Writer','+92-318-9990011'),
('Tariq','Jamil',5,77000,'Supply Chain Lead','+92-319-0001122'),
('Zoya','Akhtar',1,84000,'QA Engineer','+92-320-1122334'),
('Fahad','Mustafa',2,71000,'Payroll Officer','+92-321-2233445'),
('Mahnoor','Baloch',3,105000,'Finance Manager','+92-322-3344556'),
('Daniyal','Zafar',4,76000,'PPC Expert','+92-323-4455667'),
('Sobia','Khan',5,64000,'Operations Assistant','+92-324-5566778'),
('Kamran','Akmal',1,93000,'Software Engineer','+92-325-6677889'),
('Hira','Mani',2,59000,'HR Coordinator','+92-326-7788990'),
('Waqas','Younis',3,82000,'Auditor','+92-327-8899001'),
('Mehwish','Hayat',4,89000,'Brand Manager','+92-328-9900112'),
('Shoaib','Akhtar',5,91000,'Senior Logistics Lead','+92-329-0011223'),
('Anum','Fayyaz',1,79000,'UI/UX Designer','+92-330-1122445'),
('Rizwan','Ali',2,68000,'Training Specialist','+92-331-2233556'),
('Nabeel','Shaukat',3,94000,'Tax Consultant','+92-332-3344667'),
('Alizeh','Shah',4,66000,'Social Media Manager','+92-333-4455778'),
('Farhan','Saeed',5,73000,'Operations Analyst','+92-334-5566889'),
('Mariam','Naqvi',1,96000,'System Architect','+92-335-6677990'),
('Danish','Taimoor',2,54000,'HR Intern','+92-336-7788001'),
('Sarmad','Khoosat',3,87000,'Budget Analyst','+92-337-8899112'),
('Mahira','Khan',4,95000,'Creative Director','+92-338-9900223'),
('Fawad','Khan',5,83000,'Warehouse Manager','+92-339-0011334'),
('Yumna','Zaidi',1,88000,'Software Engineer','+92-340-1122556'),
('Bilal','Ashraf',2,69000,'HR Specialist','+92-341-2233667'),
('Sajal','Aly',3,74000,'Financial Advisor','+92-342-3344778'),
('Ahad','Raza',4,79000,'Marketing Coordinator','+92-343-4455889'),
('Hania','Amir',5,61000,'Inventory Clerk','+92-344-5566990'),
('Muneeb','Butt',1,91000,'Database Administrator','+92-345-6677001'),
('Iqra','Aziz',2,57000,'HR Assistant','+92-346-7788112'),
('Shahid','Afridi',3,102000,'Chief Financial Officer','+92-347-8899223'),
('Sanam','Saeed',4,84000,'Communications Lead','+92-348-9900334'),
('Imad','Wasim',5,76000,'Operations Specialist','+92-349-0011445');

-- Projects Insert
INSERT INTO projects (proj_name,dept_id,budget,start_date,end_date)
VALUES
('Website Revamp',1,500000,'2024-01-01','2024-06-30'),
('Recruitment Drive',2,200000,'2024-02-01','2024-03-31'),
('Audit 2024',3,300000,'2024-03-01','2024-05-31'),
('Ad Campaign',4,400000,'2024-04-01','2024-07-31'),
('Logistics Upgrade',5,250000,'2024-05-01','2024-08-31');

-- Task 1: Retrieve all employees from IT department
SELECT e.* FROM employees e JOIN departments d ON e.dept_id = d.dept_id WHERE d.dept_name = 'IT';

-- Task 2: Show top 5 highest-paid employees
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- Task 3: Find employees whose last name starts with 'S'
SELECT DISTINCT * FROM employees WHERE last_name LIKE 'S%';

-- Task 4: Display full name as "Employee_Name"
SELECT CONCAT(first_name, ' ', last_name) AS "Employee_Name" FROM employees;

-- Task 5: Combine all department names into one string
SELECT STRING_AGG(dept_name, ', ') AS all_departments FROM departments;

-- Task 6: Extract first 3 letters of each employee’s first name
SELECT SUBSTRING(first_name FROM 1 FOR 3) AS short_name FROM employees;

-- Task 7: Replace "Developer" with "Software Engineer"
SELECT REPLACE(position, 'Developer', 'Software Engineer') AS updated_title FROM employees;

-- Task 8: Clean and capitalize employee names
SELECT INITCAP(TRIM(first_name)) AS cleaned_name FROM employees;

-- Task 9: Find departments with avg salary > 70000
SELECT d.dept_name, AVG(e.salary) AS avg_salary FROM employees e JOIN departments d ON e.dept_id = d.dept_id GROUP BY d.dept_name HAVING AVG(e.salary) > 70000;

-- Task 10: Show total employees and average salary per department
SELECT d.dept_name, COUNT(*) AS total_employees, AVG(e.salary) AS avg_salary FROM employees e JOIN departments d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

-- Task 11: Increase salary by 10% for Finance employees
UPDATE employees e SET salary = salary * 1.10 FROM departments d WHERE e.dept_id = d.dept_id AND d.dept_name = 'Finance';

-- Task 12: Add column email to employees table
ALTER TABLE employees ADD COLUMN IF NOT EXISTS email VARCHAR(255);

-- Task 13: Delete a department and observe cascade effect
DELETE FROM departments WHERE dept_id = 5;

-- Task 14: Add CHECK constraint to ensure salary > 30000
ALTER TABLE employees ADD CONSTRAINT check_salary_min CHECK (salary > 30000);

-- Task 15: Find employees hired between two dates or earning > 90000
SELECT * FROM employees WHERE hire_date BETWEEN '2023-01-01' AND '2025-12-31' OR salary > 90000;

-- Task 16: Remove non-numeric characters from phone numbers
SELECT REGEXP_REPLACE(phone_number, '[^0-9]', '', 'g') AS cleaned_phone FROM employees;

-- Task 17: Split full name into first and last parts
SELECT SPLIT_PART(CONCAT(first_name, ' ', last_name), ' ', 1) AS first_name, SPLIT_PART(CONCAT(first_name, ' ', last_name), ' ', 2) AS last_name FROM employees;

-- Task 18: Show first 2 and last 2 characters of project names
SELECT LEFT(proj_name, 2) AS first_two, RIGHT(proj_name, 2) AS last_two FROM projects;

-- Task 19: List employees not in HR or Marketing
SELECT e.* FROM employees e JOIN departments d ON e.dept_id = d.dept_id WHERE d.dept_name NOT IN ('HR', 'Marketing');

-- Task 20: Show total project budget per department
SELECT d.dept_name, SUM(p.budget) AS total_budget FROM departments d JOIN projects p ON d.dept_id = p.dept_id GROUP BY d.dept_name;