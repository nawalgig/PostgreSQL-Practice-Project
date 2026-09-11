# SQL Company Database & Practice Tasks

A comprehensive PostgreSQL project featuring a relational database schema, mock dataset insertions, and 20 progressive practice tasks spanning beginner to intermediate SQL concepts.

---

## **Project Overview**

This repository contains a complete script (`Company.sql`) designed to test, practice, and demonstrate core PostgreSQL database operations, string manipulation functions, table constraints, updates, aggregations, and multi-table joins.

---

## **Database Schema**

The database consists of three relational tables:
1. **`departments`**: Stores department info (`dept_id`, `dept_name`, `location`)[cite: 1].
2. **`employees`**: Stores staff records with a foreign key relation to departments (`emp_id`, `first_name`, `last_name`, `dept_id`, `salary`, `position`, `hire_date`, `email`, `phone_number`)[cite: 1].
3. **`projects`**: Tracks department projects (`proj_id`, `proj_name`, `dept_id`, `budget`, `start_date`, `end_date`)[cite: 1].

---

## **Included Tasks & Queries**

The script provides commented solutions for the following 20 tasks:

* **Beginner Level (Tasks 1–10)**
  * **Task 1**: Retrieve all employees from the IT department[cite: 1].
  * **Task 2**: Show top 5 highest-paid employees[cite: 1].
  * **Task 3**: Find employees whose last name starts with 'S'[cite: 1].
  * **Task 4**: Display full name as `Employee_Name`[cite: 1].
  * **Task 5**: Combine all department names into a single string using `STRING_AGG`[cite: 1].
  * **Task 6**: Extract the first 3 letters of each employee’s first name[cite: 1].
  * **Task 7**: Replace text string values ("Developer" with "Software Engineer")[cite: 1].
  * **Task 8**: Clean and capitalize names using `TRIM` and `INITCAP`[cite: 1].
  * **Task 9**: Filter grouped records using `GROUP BY` and `HAVING` (avg salary > 70000)[cite: 1].
  * **Task 10**: Aggregate total employees and average salary per department[cite: 1].

* **Intermediate Level (Tasks 11–20)**
  * **Task 11**: Update records conditionally (increase Finance salaries by 10%)[cite: 1].
  * **Task 12**: Alter table schema to add an email column[cite: 1].
  * **Task 13**: Demonstrate cascade deletion behavior (`ON DELETE CASCADE`)[cite: 1].
  * **Task 14**: Implement table constraints (`CHECK` constraint for salary validation)[cite: 1].
  * **Task 15**: Complex logical evaluations (`BETWEEN`, `OR`, `AND`)[cite: 1].
  * **Task 16**: Regular expression manipulation (`REGEXP_REPLACE`) for formatting phone numbers[cite: 1].
  * **Task 17**: String parsing using `SPLIT_PART`[cite: 1].
  * **Task 18**: String boundary extraction (`LEFT`, `RIGHT`)[cite: 1].
  * **Task 19**: Exclusion filtering using `NOT IN`[cite: 1].
  * **Task 20**: Multi-table inner joins combined with aggregation (`SUM`)[cite: 1].

---

## **Getting Started**

1. Ensure **PostgreSQL** is installed on your local machine or server.
2. Clone this repository or copy the contents of `Company.sql`.
3. Open your preferred PostgreSQL client (such as *pgAdmin*, *DBeaver*, or the command-line interface *psql*).
4. Run the script to automatically set up the schema, load sample seed data (50 employees, departments, and active projects), and execute all test queries.
