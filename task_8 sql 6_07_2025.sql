create database student;
use student ;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    marks1 INT,
    marks2 INT
);

INSERT INTO students VALUES 
(1, 'Riya', 80, 90),
(2, 'Aman', 70, 60),
(3, 'Neha', 85, 75);

 DELIMITER $$

CREATE PROCEDURE AddStudent(
    IN p_id INT,
    IN p_name VARCHAR(50),
    IN p_marks1 INT,
    IN p_marks2 INT
)
BEGIN
    INSERT INTO students VALUES (p_id, p_name, p_marks1, p_marks2);
END $$

DELIMITER ;
CALL AddStudent(4, 'Kunal', 88, 92);
CALL AddStudent(5, 'priyal',78,90);

 DELIMITER $$

CREATE FUNCTION GetTotalMarks(s_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT marks1 + marks2 INTO total
    FROM students
    WHERE student_id = s_id;
    RETURN total;
END $$
DELIMITER ;
SELECT GetTotalMarks(5) AS total;


 
 
 
 
 
 
 
 

