University Database & SQL Practice Tasks
A comprehensive PostgreSQL project featuring a university relational database schema, mock dataset insertions, and 20 progressive practice tasks across Low and Medium difficulty levels.

Project Overview
This repository contains a complete PostgreSQL script designed to practice core and intermediate database operations, including relational modeling, constraints, triggers, pattern matching, updates, aggregations, and subqueries within an academic management context.

Database Schema
The database consists of three relational tables:

students: Stores student profile records (student_id, first_name, last_name, department, gpa, age, email).

courses: Stores course offerings (course_id, course_name, department).

enrollments: Tracks student course registrations and academic performance (enrollment_id, student_id, course_id, grade, semester) with foreign key cascade rules.

Included Tasks & Queries
The script provides commented solutions for the following practice tasks:

Low Level (Tasks 1–10)

Task 1: Display all students from the Computer Science department.

Task 2: Show students whose GPA > 3.5.

Task 3: List all Economics courses.

Task 4: Retrieve the first 5 students ordered by GPA (descending).

Task 5: Find students aged between 18 and 21.

Task 6: Show students whose email ends with '@university.edu'.

Task 7: Display all distinct departments from the courses table.

Task 8: Count how many students are in each department.

Task 9: Find students whose GPA is not between 3.0 and 3.8.

Task 10: Retrieve students whose first name starts with 'Student1' using LIKE.

Medium Level (Tasks 1–10)

Task 1: Update the GPA of Student10 to 3.90.

Task 2: Delete all enrollments with grade 'C'.

Task 3: Add a new column phone VARCHAR(15) to the students table.

Task 4: Drop the enrollments table for testing and re-establish relations.

Task 5: Create a function and trigger to prevent deleting students actively enrolled in courses.

Task 6: Find students enrolled in the Fall 2025 semester using IN.

Task 7: Retrieve students not in the Physics department.

Task 8: Show the top 3 students by GPA using LIMIT.

Task 9: Group students by department and calculate the average GPA.

Task 10: Display students whose age < 20 AND GPA > 3.5.

Getting Started
Ensure PostgreSQL is installed on your local machine or server.

Open your preferred PostgreSQL client (such as pgAdmin, DBeaver, or the command-line interface psql).

Run the complete script to automatically drop existing tables, create the schema, load sample seed data, and execute all test queries.
