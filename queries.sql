USE onlinecouredetaildb;

-- Course-wise Completion Percentage
SELECT 
    c.title,
    ROUND(
        SUM(CASE WHEN p.completion_status = 'Completed' THEN 1 ELSE 0 END) 
        / COUNT(p.id) * 100, 2
    ) AS completion_percentage
FROM Courses c
JOIN Enrollments e ON c.id = e.course_id
JOIN Progress p ON e.id = p.enrollment_id
GROUP BY c.id, c.title;

-- Top Performing Students Based on Average Score
SELECT 
    u.name,
    ROUND(AVG(p.score), 2) AS average_score
FROM Users u
JOIN Enrollments e ON u.id = e.user_id
JOIN Progress p ON e.id = p.enrollment_id
WHERE p.score IS NOT NULL
GROUP BY u.id, u.name
ORDER BY average_score DESC;

-- Students with No Progress Recorded
SELECT DISTINCT u.name
FROM Users u
JOIN Enrollments e ON u.id = e.user_id
LEFT JOIN Progress p ON e.id = p.enrollment_id
WHERE p.id IS NULL;

-- Most Popular Course (Highest Enrollment)
SELECT 
    c.title,
    COUNT(e.user_id) AS total_enrollments
FROM Courses c
JOIN Enrollments e ON c.id = e.course_id
GROUP BY c.id, c.title
ORDER BY total_enrollments DESC
LIMIT 1;

-- Instructor-wise Course Count
SELECT 
    u.name AS instructor_name,
    COUNT(c.id) AS course_count
FROM Users u
JOIN Courses c ON u.id = c.instructor_id
WHERE u.role = 'Instructor'
GROUP BY u.id, u.name;

-- Students Who Completed All Modules of a Course

SELECT DISTINCT u.name
FROM Users u
JOIN Enrollments e ON u.id = e.user_id
WHERE NOT EXISTS (
    SELECT 1
    FROM Progress p
    WHERE p.enrollment_id = e.id
    AND p.completion_status <> 'Completed'
);

-- Course-wise Average Score

SELECT 
    c.title,
    ROUND(AVG(p.score), 2) AS average_score
FROM Courses c
JOIN Enrollments e ON c.id = e.course_id
JOIN Progress p ON e.id = p.enrollment_id
WHERE p.score IS NOT NULL
GROUP BY c.id, c.title;

-- Students Enrolled but with No Scores Assigned
SELECT DISTINCT u.name
FROM Users u
JOIN Enrollments e ON u.id = e.user_id
JOIN Progress p ON e.id = p.enrollment_id
WHERE p.score IS NULL;


-- Course Duration vs Student Performance
SELECT 
    c.title,
    c.duration,
    ROUND(AVG(p.score), 2) AS average_score
FROM Courses c
JOIN Enrollments e ON c.id = e.course_id
JOIN Progress p ON e.id = p.enrollment_id
WHERE p.score IS NOT NULL
GROUP BY c.id, c.title, c.duration;

-- Recently Enrolled Students (Last 30 Days)
SELECT 
    u.name,
    e.date_enrolled
FROM Users u
JOIN Enrollments e ON u.id = e.user_id
WHERE e.date_enrolled >= CURDATE() - INTERVAL 30 DAY;




