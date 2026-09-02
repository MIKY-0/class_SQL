DROP DATABASE IF EXISTS type_practice;
CREATE DATABASE type_practice;
USE type_practice;

CREATE TABLE STUDENT (
	STUDENT_ID INT auto_increment PRIMARY KEY ,
        NAME VARCHAR(20) NOT NULL ,
        GRADE TINYINT NOT NULL ,
        MAJOR VARCHAR(20) NOT NULL ,
        ADMISSION_DATE DATE NOT NULL , 
        NOTES TEXT
);

INSERT INTO student (student_id, name, grade, major, admission_date, notes)
VALUES
    (1001, '김지영', 1, '컴퓨터공학', '2026-03-02', '프로그래밍에 뛰어남'),
    (1002, '이민수', 2, '수학', '2025-03-02', NULL),
    (1003, '박소연', 3, '물리학', '2024-03-02', '양자역학에 관심 많음');

SELECT * FROM student;



CREATE TABLE SUBJECT (
	SUBJECT_ID INT AUTO_INCREMENT PRIMARY KEY ,
        SUBJECT_CODE CHAR(20) NOT NULL ,
        SUBJECT_NAME VARCHAR(50) NOT NULL ,
        CREDIT TINYINT NOT NULL ,
        DEPARTMENT_CODE CHAR(20) NOT NULL ,
        PROFESSOR VARCHAR(20) NOT NULL ,
        CREATED_AT DATE 
);

INSERT INTO subject (subject_id, subject_code, subject_name, credit, department_code, professor, created_at)
VALUES
    (1, 'CS01', '데이터베이스 시스템', 3, 'CS', '김영희', '2026-03-02 10:00:00'),
    (2, 'MA01', '미적분학', 4, 'MA', '이철수', '2026-03-02 09:00:00'),
    (3, 'PH01', '양자물리학', 3, 'PH', '박민준', '2026-03-02 11:00:00');
    
SELECT * FROM subject;



CREATE TABLE ENROLLMENT (
	ENROLLMENT_ID INT AUTO_INCREMENT PRIMARY KEY ,
        STUDENT_ID INT NOT NULL ,
        SUBJECT_ID INT NOT NULL ,
        SCORE DECIMAL(5,2) NOT NULL ,
        ENROLLED_AT DATE
);



INSERT INTO enrollment (enrollment_id, student_id, subject_id, score, enrolled_at)
VALUES
    (1, 1001, 1, 85.50, '2026-03-02 12:00:00'),
    (2, 1002, 2, 92.00, '2026-03-02 12:30:00'),
    (3, 1003, 3, 78.75, '2026-03-02 13:00:00');

SELECT * FROM enrollment;