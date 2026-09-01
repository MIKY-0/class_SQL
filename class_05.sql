CREATE DATABASE SCHOOL;

USE  SCHOOL;
-- 테이블 생성
CREATE TABLE STUDENT(
	STUDENT_ID INT PRIMARY KEY,
    NAME  VARCHAR(50) NOT NULL,
    GRADE INT NOT NULL,
    MAJOR VARCHAR(50) NOT NULL,
    PHONE VARCHAR(20)
);

-- -----------------DML-----------------
-- 데이터 '한 건' 추가 (INSERT).
INSERT INTO STUDENT (STUDENT_ID , NAME , GRADE , MAJOR , PHONE) VALUES(1001 , '김철수' , 2 , '컴퓨터공학' , '010-1234-1234');

-- 데이터 '여러 건' 추가.
INSERT INTO STUDENT (STUDENT_ID , NAME , GRADE , MAJOR , PHONE) VALUES(1002 , '이영희' , 1 , '경영학' , '010-1234-1234') ,
																	  (1003 , '박민죽' , 2 , '전자공학' , '010-1234-1234') ,
                                                                      (1004 , '홍길동' , 4 , '생명공학' , '010-1234-1234');
                                                                      
   -- 데이터 조회 (SELECT).
   SELECT NAME , MAJOR FROM STUDENT ;
   
   SELECT NAME , MAJOR , GRADE FROM STUDENT 
   WHERE GRADE = 2;

-- 데이터 수정 (UPDATE).
-- WHERE로 MAJOR컬럼중 어떤 튜플을 변경할지 명시해줘야됨.
UPDATE STUDENT SET MAJOR = '컴공과';

UPDATE STUDENT SET GRADE = 4
WHERE STUDENT_ID = '1001';

-- 데이터 삭제(DELETE).
-- 삭제 질의어를 사용할 때도 반드시 WHERE절로 명시해주자. 그렇지 않으면 테이블 전체데이터 삭제됨.
-- 특이사항 - 삭제쿼리는 없는 데이터 삭제 요청을 하더라도 오류가 아님.
DELETE FROM STUDENT;

DELETE FROM STUDENT 
WHERE STUDENT_ID = 1004;

DELETE FROM STUDENT 
WHERE GRADE = 2;

 

 -- ---------------------------------------테이블 구조 확인---------------------------------------
DESC STUDENT;
SELECT * FROM STUDENT;