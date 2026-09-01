-- 실습 준비
-- insert_practice DB 이미 있으면 통째로 삭제.
-- IF EXISTS : "존재한다면"
-- 만약 insert_practice DB가 없다면 여기서 바로 스크립트 오류가 나서 멈춤.
DROP DATABASE IF EXISTS insert_practice;

CREATE DATABASE INSERT_PRACTICE;

USE INSERT_PRACTICE;

-- STUDENT TBL 생성.
CREATE TABLE STUDENT(
	STUDENT_ID INT PRIMARY KEY ,
    NAME VARCHAR(50) NOT NULL ,
    GRADE INT NOT NULL ,
    MAJOR VARCHAR(50) NOT NULL DEFAULT '미정'
);

-- 1. 한건씩 넣기.
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE , MAJOR) VALUES (1 , '홍길동' , 3 , '컴퓨터공학과');
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE , MAJOR) VALUES (2 , '김철수' , 4 , '전자공학과');
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE , MAJOR) VALUES (3 , '이영희' , 2 , '경영학과');

-- 2. 다건 한번에 넣기.
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE , MAJOR) VALUES (4 , '박민준' , 1 , '전자공학과') , 
							      (5 , '최지안' , 2 , '컴퓨터공학과') , 
                                                              (6 , '한수연' , 3 , '경영학과');

-- 3. 제약조건 확인.(PRIMARY KEY)
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE , MAJOR) VALUES (3 , '티모' , 12 , '경영학과');

-- 다건 삽입을 할때도 하나라도 PK제약을 어기는 속성이 있다면 그 코드 전부 실행 안됨.
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE , MAJOR) VALUES (7 , '야스오' , 1 , '전자공학과') , 
							      (1 , '애쉬' , 2 , '컴퓨터공학과') , 
							      (8 , '티모' , 3 , '경영학과');
								
-- 4. 제약조건(NOT NULL)
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE) VALUES(0 ,  NULL , 1);
INSERT INTO STUDENT(STUDENT_ID , GRADE) VALUES(0 , 1);
					
-- 5. 제약조건(DEFAULT)
-- DEFAULT에 값을 넣는 방법1.
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE , MAJOR) VALUES(10 , '이순신' , 1 , DEFAULT) ,
							     (11 , '유관순' , 3 , '전자 공학과');                                                             
INSERT INTO STUDENT(STUDENT_ID , NAME , GRADE) VALUES(12 , '김길동' , 1) ,
						     (13 , '박길동' , 3);

SELECT * FROM STUDENT;


-- ----------------------------------
-- DATE 타입에 값 넣기.
-- ----------------------------------
-- ORDER BY에서 쓰는 예약어를 이름으로 쓰려면 백틱으로 감싸야함. 하지만 가능한 예약어 사용하지말자.
CREATE TABLE `ORDER`(
	ID INT PRIMARY KEY ,
        CUSTOMER_NOTE VARCHAR(50) ,
        PRODUCT_NAME VARCHAR(20) NOT NULL ,
        QUANTITY INT NOT NULL ,
        ORDER_DATE DATE NOT NULL
);

-- 날짜를 넣는 2가지 방식.
-- 방법1. : 작은따옴표로 감싼다.
INSERT INTO `ORDER`(ID , CUSTOMER_NOTE , PRODUCT_NAME , QUANTITY , ORDER_DATE) VALUES(1 , '빠른 배송' , '신라면' , 2 , '2026-09-01');

-- 방법2 : 하이픈 없는 숫자
INSERT INTO `ORDER`(ID , CUSTOMER_NOTE , PRODUCT_NAME , QUANTITY , ORDER_DATE) VALUES(2 , '문앞 배송' , '신라면' , 3 , '20260901');

-- 잘못된 날짜는 필터링됨. 만약 22월을 넣는다면?
INSERT INTO `ORDER`(ID , CUSTOMER_NOTE , PRODUCT_NAME , QUANTITY , ORDER_DATE) VALUES(3 , '테스트' , '신라면' , 3 , '20262201');
INSERT INTO `ORDER`(ID , CUSTOMER_NOTE , PRODUCT_NAME , QUANTITY , ORDER_DATE) VALUES(4 , '테스트' , '신라면' , 3 , '2026-22-01');


SELECT * FROM `ORDER`;


-- ----------------------------------
-- AUTO_INCREMENT(새 행을 넣을 때 마다 자동으로 숫자를 증가시켜서 넣음.)
-- ----------------------------------
CREATE TABLE CUSTOMER(
	ID INT AUTO_INCREMENT PRIMARY KEY,
        NAME VARCHAR(50) NOT NULL ,
        EMAIL VARCHAR(50) ,
        ADDRESS VARCHAR(100) NOT NULL
);

-- ID컬럼 적지 않아도됨.
INSERT INTO CUSTOMER(NAME , EMAIL , ADDRESS) VALUES('김철수' , 'A@NAVER.COM' , '부산시 진구') ,
						   ('박영희' , 'B@NAVER.COM' , '부산시 동구') ,
                                                   ('김철수' , 'C@NAVER.COM' , '부산시 북구');

-- 직접 값을 지정하면 그 값부터 증가시킴.
INSERT INTO CUSTOMER(ID , NAME , EMAIL , ADDRESS) VALUES(10 , '홍아랑' , 'A@NAVER.COM' , '부산시 진구');
INSERT INTO CUSTOMER(NAME , EMAIL , ADDRESS) VALUES('김아랑' , 'A@NAVER.COM' , '부산시 진구');

-- 삭제된 번호는 재사용되지 않음.
DELETE FROM CUSTOMER 
WHERE ID = 11;

INSERT INTO CUSTOMER(NAME , EMAIL , ADDRESS) VALUES('이아랑' , 'A@NAVER.COM' , '부산시 진구');


SELECT * FROM CUSTOMER;







CREATE TABLE POST (
	ID INT AUTO_INCREMENT PRIMARY KEY ,
	TITLE VARCHAR(100) NOT NULL ,
	CONTENT TEXT ,
	WRITER VARCHAR(20) NOT NULL ,
	VIEW_CNT INT DEFAULT 0 ,
        EMAIL VARCHAR(20) ,
	TODAY DATETIME DEFAULT NOW()
);


SELECT * FROM POST;

