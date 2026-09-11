CREATE DATABASE LIBRARY;
USE LIBRARY;

-- 학생 테이블
CREATE TABLE STUDENTS (
	ID INT AUTO_INCREMENT PRIMARY KEY ,
        NAME VARCHAR(100) NOT NULL ,
        STUDENT_ID VARCHAR(20) NOT NULL UNIQUE
);

DESC STUDENTS;

-- 도서 테이블
CREATE TABLE BOOKS (
	ID INT AUTO_INCREMENT PRIMARY KEY ,
        TITLE VARCHAR(255) NOT NULL ,
        AUTHOR VARCHAR(255) NOT NULL,
        PUBLISHER VARCHAR(255) NOT NULL ,
        PUBLICATION_YEAR INT ,
        ISBN VARCHAR(13) ,
        AVAILABLE BOOLEAN DEFAULT TRUE
);
DESC BOOKS;

-- 대출 테이블
CREATE TABLE BORROWS (
	ID INT AUTO_INCREMENT PRIMARY KEY ,
        BOOK_ID INT ,
        STUDENT_ID INT ,
        BORROW_DATE DATE NOT NULL ,
        RETURN_DATE DATE ,
        FOREIGN KEY(BOOK_ID) REFERENCES BOOKS(ID) ,
        foreign key(STUDENT_ID) REFERENCES STUDENTS(ID)
);
DESC BORROWS;


-- 샘플 데이터
-- 샘플 데이터
INSERT INTO books (title, author, publisher, publication_year, isbn, available) VALUES
('자바 프로그래밍 입문', '김영훈', '한빛미디어', 2023, '9788968481234', TRUE),
('데이터베이스 기초',   '이수진', '길벗',       2022, '9788968485678', TRUE),
('알고리즘 문제 해결', '박민수', '인사이트',    2021, '9788968489012', FALSE),
('웹 개발 입문',       '최지영', '한빛아카데미', 2024, '9788968483456', TRUE),
('소프트웨어 공학',    '정현우', '생능출판사',   2020, '9788970507890', FALSE);

INSERT INTO students (name, student_id) VALUES
('홍길동', '20230001'),
('김민서', '20230002'),
('이준호', '20230003');

INSERT INTO borrows (book_id, student_id, borrow_date, return_date) VALUES
(3, 1, '2025-05-01', NULL),  -- 홍길동 → 알고리즘 문제 해결 대출 중
(5, 2, '2025-05-03', NULL);  -- 김민서 → 소프트웨어 공학 대출 중


select * from students
where student_id = 20230001;

select * from students
where student_id = 9920230001;

-- 제목으로 도서 검색 기능.
select * from books
where title like '%입문%';

-- 도서 전체 검색 기능.
select * from books
order by id;

-- 도서 등록 기능.
INSERT INTO books (title, author, publisher, publication_year, isbn, available) 
VALUES('테스트책', '저자', '한빛미디어', 2026, '9788968481239', TRUE);

-- 현재 대출중인 도서 조회.
select b.id , b.book_id , bk.title , s.name , b.borrow_date , b.return_date
from borrows b join books bk on b.book_id = bk.id
		join students s on b.STUDENT_ID = s.id
where b.RETURN_DATE is null
order by b.BORROW_DATE;

insert into borrows(book_id , student_id , borrow_date) values(? , ? , ?);

select br.book_id , br.student_id , b.title from books b join borrows br on b.id = br.BOOK_ID
 join students s on br.STUDENT_ID = s.id;

select br.book_id , br.student_id from borrows br join students s on br.STUDENT_ID = s.id;


SELECT * FROM BORROWS;
SELECT * FROM BOOKS;
SELECT * FROM students;



