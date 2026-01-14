# Online Course Enrolment and Progress Tracking System

## Project Overview
This project is an Online Course Tracking System implemented using MySQL / SQL.  
It allows administrators and instructors to manage courses, enroll students, and track student progress. The system also supports "data analysis and reporting" to monitor course performance, student completion rates, and instructor activity.

---

## Features

- Create and manage courses with instructor assignment.
- Enroll students into multiple courses.
- Track student progress module-wise (Not Started, In Progress, Completed).
- Store and calculate student scores for each module.
- Generate reports for:
  - Course-wise completion percentage
  - Top performing students
  - Students with no progress
  - Most popular courses
  - Instructor-wise course and enrollment statistics
- Support bulk data import via CSV.

---

## Database Schema

### Tables:
1. Users
   - Stores information of students and instructors.
2. Courses
   - Stores course details and instructor assignment.
3. Enrollments
   - Links students to courses they are enrolled in.
4. Progress
   - Tracks module-wise completion status and scores for each enrollment.

---

## Project Structure

Online-Course-Enrolment-and-Progress-Tracking-System/
│
├── sql/
│ ├── schema_data.sql # Table creation and sample data
│ ├── queries.sql # Analytical queries
│
├── data/
│ ├── users.csv
│ ├── courses.csv
│ ├── enrollments.csv
│ ├── progress.csv
|
---

## How to Use

### 1. Import Database
- Use MySQL Workbench or command line to run `schema_data.sql`.
- This will create all tables and insert sample data.

### 2. Import CSV Data (Optional)
- CSV files (`users.csv`, `courses.csv`, `progress.csv`) can be imported using Table Data Import Wizard in MySQL Workbench.

### 3. Execute Queries
- Open `queries.sql` in MySQL Workbench.
- Run queries to:
  - Track course completion.
  - Identify top-performing students.
  - Analyze instructor activity.
  - Generate reports for student progress.

---

## Technologies Used

- Database: MySQL 8.0  
- SQL Concepts: CREATE TABLE, INSERT, JOIN, GROUP BY, ORDER BY, HAVING, ENUM, NOT EXISTS, Aggregate functions  
- Data Handling: CSV files for bulk data import  
- Tools: MySQL Workbench

---

## Important Notes

- All date formats in CSV must be YYYY-MM-DD to ensure compatibility with MySQL.
- Progress scores can be empty for modules marked as "Not Started".
- The `Progress` table tracks each module for every enrollment.
- ENUM fields are used to restrict completion status: `Not Started`, `In Progress`, `Completed`.

---

## Author

Kumutha A  
B.E in Electronics and Communication Engineering (2022-2026)
Email: Kumutha.a05@gmail.com  

---
