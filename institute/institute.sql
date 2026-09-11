-- Drop tables if they already exist to avoid conflicts (in reverse order of dependencies)
DROP TABLE IF EXISTS enrollments CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS students CASCADE;

-- ==========================================
-- 1. CREATE TABLES
-- ==========================================

-- Create Students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(100) NOT NULL,
    gpa NUMERIC(3, 2) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Create Courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- Create Enrollments table
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE,
    grade VARCHAR(5),
    semester VARCHAR(50) NOT NULL
);


-- ==========================================
-- 2. INSERT SAMPLE DATA
-- ==========================================

-- Insert Students (including names matching task requirements like 'Student1', 'Student10', etc.)
INSERT INTO students (first_name, last_name, department, gpa, age, email) VALUES
('Student1', 'Smith', 'Computer Science', 3.85, 19, 'student1@university.edu'),
('Alice', 'Johnson', 'Computer Science', 3.40, 20, 'alice.j@university.edu'),
('Bob', 'Williams', 'Economics', 3.20, 22, 'bob.w@university.edu'),
('Charlie', 'Brown', 'Physics', 3.90, 18, 'charlie.b@university.edu'),
('Student10', 'Davis', 'Computer Science', 3.10, 21, 'student10@university.edu'),
('Diana', 'Prince', 'Mathematics', 3.65, 19, 'diana.p@university.edu'),
('Ethan', 'Hunt', 'Economics', 2.90, 23, 'ethan.h@university.edu'),
('Fiona', 'Gallagher', 'Physics', 3.75, 20, 'fiona.g@university.edu'),
('George', 'Clooney', 'Computer Science', 3.55, 22, 'george.c@university.edu'),
('Hannah', 'Montana', 'Economics', 3.45, 19, 'hannah.m@university.edu');

-- Insert Courses
INSERT INTO courses (course_name, department) VALUES
('Microeconomics 101', 'Economics'),
('Macroeconomics 201', 'Economics'),
('Data Structures', 'Computer Science'),
('Quantum Mechanics', 'Physics'),
('Calculus I', 'Mathematics');

-- Insert Enrollments
INSERT INTO enrollments (student_id, course_id, grade, semester) VALUES
(1, 3, 'A', 'Fall 2025'),
(2, 3, 'B', 'Fall 2025'),
(3, 1, 'C', 'Spring 2025'),
(4, 4, 'A', 'Fall 2025'),
(5, 3, 'C', 'Spring 2025'),
(6, 5, 'B', 'Fall 2025'),
(7, 2, 'C', 'Spring 2025'),
(8, 4, 'A', 'Fall 2025');


-- ==========================================
-- LEVEL: LOW (Tasks 1–10)
-- ==========================================

-- Task 1: Display all students from the Computer Science department
SELECT * 
FROM students 
WHERE department = 'Computer Science';

-- Task 2: Show students whose GPA > 3.5
SELECT * 
FROM students 
WHERE gpa > 3.5;

-- Task 3: List all Economics courses
SELECT * 
FROM courses 
WHERE department = 'Economics';

-- Task 4: Retrieve the first 5 students ordered by GPA (descending)
SELECT * 
FROM students 
ORDER BY gpa DESC 
LIMIT 5;

-- Task 5: Find students aged between 18 and 21
SELECT * 
FROM students 
WHERE age BETWEEN 18 AND 21;

-- Task 6: Show students whose email ends with '@university.edu'
SELECT * 
FROM students 
WHERE email LIKE '%@university.edu';

-- Task 7: Display all distinct departments from the courses table
SELECT DISTINCT department 
FROM courses;

-- Task 8: Count how many students are in each department
SELECT department, COUNT(*) AS student_count 
FROM students 
GROUP BY department;

-- Task 9: Find students whose GPA is not between 3.0 and 3.8
SELECT * 
FROM students 
WHERE gpa NOT BETWEEN 3.0 AND 3.8;

-- Task 10: Retrieve students whose first name starts with 'Student1' using LIKE
SELECT * 
FROM students 
WHERE first_name LIKE 'Student1%';


-- ==========================================
-- LEVEL: MEDIUM (Tasks 1–10)
-- ==========================================

-- Task 1: Update the GPA of Student10 to 3.90
UPDATE students 
SET gpa = 3.90 
WHERE first_name = 'Student10';

-- Task 2: Delete all enrollments with grade 'C'
DELETE FROM enrollments 
WHERE grade = 'C';

-- Task 3: Add a new column phone VARCHAR(15) to the students table
ALTER TABLE students 
ADD COLUMN phone VARCHAR(15);

-- Task 4: Drop the enrollments table (for testing)
DROP TABLE IF EXISTS enrollments;

-- (Re-creating enrollments table & data temporarily so subsequent tasks dependent on enrollments can execute cleanly)
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE,
    grade VARCHAR(5),
    semester VARCHAR(50) NOT NULL
);
INSERT INTO enrollments (student_id, course_id, grade, semester) VALUES
(1, 3, 'A', 'Fall 2025'),
(2, 3, 'B', 'Fall 2025'),
(4, 4, 'A', 'Fall 2025'),
(6, 5, 'B', 'Fall 2025');

-- Task 5: Create a rule/trigger that prevents deleting students who are enrolled in courses
CREATE OR REPLACE FUNCTION prevent_student_deletion()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM enrollments WHERE student_id = OLD.student_id) THEN
        RAISE EXCEPTION 'Cannot delete student who is actively enrolled in courses.';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_prevent_student_delete
BEFORE DELETE ON students
FOR EACH ROW
EXECUTE FUNCTION prevent_student_deletion();

-- Task 6: Find students enrolled in Fall 2025 semester using IN
SELECT * 
FROM students 
WHERE student_id IN (
    SELECT student_id 
    FROM enrollments 
    WHERE semester = 'Fall 2025'
);

-- Task 7: Retrieve students not in the Physics department
SELECT * 
FROM students 
WHERE department <> 'Physics';

-- Task 8: Show the top 3 students by GPA using LIMIT
SELECT * 
FROM students 
ORDER BY gpa DESC 
LIMIT 3;

-- Task 9: Group students by department and show the average GPA
SELECT department, AVG(gpa) AS average_gpa 
FROM students 
GROUP BY department;

-- Task 10: Display students whose age < 20 AND GPA > 3.5
SELECT * 
FROM students 
WHERE age < 20 AND gpa > 3.5;