DROP DATABASE IF EXISTS relation_practice;
CREATE DATABASE relation_practice;
USE relation_practice;


-- 실습1 : 코드로 1 : 1 관계 만들어 보기.
CREATE TABLE tb_PERSON(
	PERSON_ID INT AUTO_INCREMENT ,
        NAME VARCHAR(50) NOT NULL ,
        PRIMARY KEY (PERSON_ID)
);

CREATE TABLE tb_PASSPORT(
	PASSPORT_ID INT AUTO_INCREMENT ,
        PASSPORT_NUMBER VARCHAR(20) NOT NULL ,
        PERSON_ID INT UNIQUE , -- UNIQUE가 1:1 관계를 만들어줌.
        PRIMARY KEY(PASSPORT_ID) ,
        FOREIGN KEY(PERSON_ID) REFERENCES tb_PERSON(PERSON_ID)
);

INSERT INTO tb_PERSON(NAME) VALUES('홍길동') ,
			          ('김영희'),
                                  ('이철수');
                                  
INSERT INTO tb_PASSPORT(PASSPORT_NUMBER , PERSON_ID) 
VALUES('p123' , 1) , ('p456' , 2) , ( 'p789' , 3);

-- FK에 UK가 설정되어 있어 1:1관계 보장.
-- FK(실제 존재하는 값을 참조) + UK(이 참조하는 값이 중복되지 못하게) ---> 1:1관계
INSERT INTO tb_PASSPORT(PASSPORT_NUMBER , PERSON_ID) 
VALUES('p1231111' , 1);


-- 1 : N 관계를 코드로 만들어 보기.
CREATE TABLE TB_CUSTOMER (
	CUSTOMER_ID INT AUTO_INCREMENT ,
        NAME VARCHAR(50) NOT NULL ,
        PRIMARY KEY(CUSTOMER_ID)
);

CREATE TABLE TB_ORDER (
	ORDER_ID INT auto_increment ,
        PRODUCT_NAME VARCHAR(50) NOT NULL ,
        CUSTOMER_ID INT , -- UNIQUE 안씀.
        PRIMARY KEY(ORDER_ID) , 
        FOREIGN KEY (CUSTOMER_ID) REFERENCES TB_CUSTOMER(CUSTOMER_ID)
);

INSERT INTO TB_CUSTOMER(CUSTOMER_ID , NAME) VALUES (1 , '박민지') ,
						   (2 , '최재영');
                                                   
INSERT INTO TB_ORDER(ORDER_ID , PRODUCT_NAME , CUSTOMER_ID) VALUES (201 , '노트북' , 1) ,
								   (202 , '마우스' , 1) ,
								   (203 , '키보드' , 2);

SELECT * FROM TB_PERSON;
SELECT * FROM TB_PASSPORT;
SELECT * FROM TB_CUSTOMER;
SELECT * FROM TB_ORDER;


-- ------------------------------------------------
-- N : M 관계를 코드로 만들어 보기.
-- ------------------------------------------------
CREATE TABLE TB_STUDENT (
	STUDENT_ID INT AUTO_INCREMENT ,
        NAME VARCHAR(50) NOT NULL ,
        PRIMARY KEY(STUDENT_ID)
);

CREATE TABLE TB_COURSE (
	COURSE_ID INT AUTO_INCREMENT ,
        TITLE VARCHAR(50) NOT NULL ,
        PRIMARY KEY(COURSE_ID)
);

CREATE TABLE TB_STUDENT_COURSE (
	STUDENT_ID INT ,
        COURSE_ID INT ,
        PRIMARY KEY(STUDENT_ID , COURSE_ID) ,
        FOREIGN KEY(STUDENT_ID) REFERENCES TB_STUDENT(STUDENT_ID) ,
        FOREIGN KEY(COURSE_ID) REFERENCES TB_COURSE(COURSE_ID) 
);

-- TB_STUDENT
INSERT INTO TB_STUDENT(NAME) VALUES ('홍길동') ,
				    ('김영희'),
                                    ('박민지');

-- TB_COURSE
INSERT INTO TB_COURSE(COURSE_ID , TITLE) VALUES (101 , '자바') ,
						(102 , '데이터베이스'),
                                                (103 , '웹개발 입문');
-- TB_STUDENT_COURSE
INSERT INTO TB_STUDENT_COURSE(STUDENT_ID , COURSE_ID) VALUES (1 , 101) ,
							     (1 , 102),
                                                             (2 , 102) ,
                                                             (2 , 103) ,
                                                             (3 , 101);
                                                                       
-- 잘못된 데이터 입력해보기.
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`relation_practice`.`tb_student_course`, CONSTRAINT `tb_student_course_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `tb_student` (`STUDENT_ID`))
INSERT INTO TB_STUDENT_COURSE(STUDENT_ID , COURSE_ID) VALUES (7 , 101); 

-- Error Code: 1062. Duplicate entry '3-101' for key 'tb_student_course.PRIMARY'
INSERT INTO TB_STUDENT_COURSE(STUDENT_ID , COURSE_ID) VALUES (3 , 101); 
              
              
              
              
              
-- -----------------------------------------
-- 1:1 , 1:N , N : M 관계 형성.
-- -----------------------------------------              
CREATE TABLE  TB_ACCOUNT (	
	ACCOUNT_ID INT AUTO_INCREMENT ,
        PERSON_ID INT UNIQUE,
        PRIMARY KEY (ACCOUNT_ID) ,
        FOREIGN KEY (PERSON_ID) REFERENCES TB_PERSON(PERSON_ID)
);					
		
INSERT INTO TB_ACCOUNT(ACCOUNT_ID , PERSON_ID) VALUES (111 , 1) , 
						      (222 , 2) ;

-- -----------------------------------------


CREATE TABLE TB_PRODUCT (
	PRODUCT_ID INT AUTO_INCREMENT ,
        PERSON_ID INT , 
        PRODUCT_NAME VARCHAR(50) ,
        PRIMARY KEY (PRODUCT_ID) , 
        FOREIGN KEY (PERSON_ID) REFERENCES TB_PERSON(PERSON_ID)
);

INSERT INTO TB_PRODUCT (PRODUCT_ID , PERSON_ID , PRODUCT_NAME) VALUES (101 , 1 , '컴퓨터') ,
								      (102 , 1 , '마우스') , 
                                                                      (103 , 2 , '헤드셋');
                 
-- -----------------------------------------
                 

CREATE TABLE TB_MOVIE(
	MOVIE_CODE INT AUTO_INCREMENT ,
        NAME VARCHAR(50) , 
        PRIMARY KEY (MOVIE_CODE)
);

INSERT INTO TB_MOVIE(MOVIE_CODE , NAME) VALUES (1111 , 'A') , 
					       (2222 , 'B') ;
   
CREATE TABLE TB_PERSON_MOVIE (
	PERSON_ID INT ,
        MOVIE_CODE INT ,
        PRIMARY KEY (PERSON_ID , MOVIE_CODE) ,
        FOREIGN KEY (PERSON_ID) REFERENCES TB_PERSON(PERSON_ID) ,
        FOREIGN KEY (MOVIE_CODE) REFERENCES TB_MOVIE(MOVIE_CODE) 
);								


SELECT * FROM TB_PERSON;
SELECT * FROM TB_ACCOUNT;
SELECT * FROM TB_PRODUCT;
SELECT * FROM TB_MOVIE;
SELECT * FROM TB_PERSON_MOVIE;
