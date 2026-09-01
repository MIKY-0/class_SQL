-- 데이터 집합 생성(DB생성)
CREATE DATABASE db_tenco_market;

-- 어떤 DB를 사용할지 선택.
USE db_tenco_market;

-- 데이터 집합 삭제.
DROP DATABASE db_tenco_market;

-- 대소문자 주의
-- 키워드 (SELECT,CREATE 등) 컬럼명은 대소문자를 구분하지 않는다.
-- 하지만 주의! 데이터베이스명과 테이블명은 운영체제에 따라 다를 수 있음.(즉, 대소문자 구분 할 수도 있음.)
-- 윈도우즈 : 구별하지 않음.   리눅스 : 구별함.    그래서 만들때 쓴 이름 그대로 쓰는 습관을 들여야 함.


-- 도전과제 
CREATE DATABASE DB_TB;

USE  DB_TB;

DROP DATABASE DB_TB;

-- 실습 코드1(테이블 설계)
CREATE TABLE userTBL(
	userName VARCHAR(10) NOT NULL PRIMARY KEY,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile VARCHAR(12)
);


CREATE TABLE buyTBL(
	userNAME VARCHAR(10) NOT NULL ,
    prodName VARCHAR(10) NOT NULL,
    price INT NOT NULL,
    amount INT NOT  NULL,
    FOREIGN KEY (userName) REFERENCES userTBL(userName)
);

SHOW TABLES;
DESC userTBL;
DESC buyTBL;

-- --------------테이블 정보 조회 -----------------------------------------------------------------------
SELECT * FROM usertbl;
SELECT * FROM BUYTBL;

-- 고객 테이블에 데이터 삽입.
INSERT INTO USERTBL VALUES ('김철수' , 1995 , '서울' , '010-1234-1234');

-- 컬럼에 대한 제약을 수정.
ALTER TABLE USERTBL MODIFY COLUMN mobile VARCHAR(13);

-- 고객 테이블에 데이터 삽입 다시 시도.
INSERT INTO USERTBL VALUES ('김철수' , 1995 , '서울' , '010-1234-1234');

-- 테이블 조회.
SELECT * FROM usertbl;

-- 추가 고객 등록.(컬럼명을 직접 명시해서 삽입)
INSERT INTO USERTBL(userName , birthYear , addr) VALUES ('이영희' , 1998 , '부산');

-- 중복된 이름 저장해보기 (현재 userName PK임)
INSERT INTO USERTBL(userName , birthYear , addr) VALUES ('이영희' , 1998 , '부산');

-- 구매 테이블에 데이터 조회.
SELECT * FROM  BUYTBL;
SELECT USERNAME,PRODNAME,PRICE,AMOUNT FROM BUYTBL;

-- 구매 테이블에 데이터 삽입.
INSERT INTO BUYTBL VALUES('김철수' , '운동화' , 30000 , 1);

-- 고객테이블과 구매테이블은 현재 FK로 제약설정되어있음.(USERNAME) <-- 구매테이블 컬럼 이름.
INSERT INTO BUYTBL VALUES('홍길동' , '컴퓨터' , 1300000 , 1);

-- 고객테이블에 없는 사람은 구매기록을 남길 수 없음 (왜? 현재 FK로 제약되어있어서)
INSERT INTO BUYTBL (USERNAME , PRODNAME , PRICE , AMOUNT) VALUES('이영희' , '컴퓨터' , 1450000 , 1);