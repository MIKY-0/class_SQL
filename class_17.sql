-- 앞 차시에서 만든 shop 이 남아있으면 지우고 시작
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

-- 회원 테이블 생성 (PRIMARY KEY, UNIQUE KEY 사용)
CREATE TABLE member (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) UNIQUE,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  join_date DATE NOT NULL
);

-- 상품 테이블 생성 (PRIMARY KEY 사용)
CREATE TABLE product (
  product_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  stock INT NOT NULL
);

-- 주문 테이블 생성 (FOREIGN KEY 사용)
CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT,
  product_id INT,
  quantity INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (member_id) REFERENCES member(id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE USER (
	ID INT AUTO_INCREMENT PRIMARY KEY ,
        USERNAME VARCHAR(20) UNIQUE ,
        EMAIL VARCHAR(50) UNIQUE ,
        PASSWORD VARCHAR(20) NOT NULL ,
        CREATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP()
);

-- 회원 데이터 삽입
INSERT INTO member (email, name, phone, join_date) VALUES
('hong@test.com', '홍길동', '010-1234-5678', '2023-01-15'),
('kim@test.com', '김영희', '010-2345-6789', '2023-02-20'),
('lee@test.com', '이철수', '010-3456-7890', '2023-03-10');

-- 상품 데이터 삽입
INSERT INTO product (product_id, name, price, stock) VALUES
(1, '노트북', 1500000, 50),
(2, '스마트폰', 800000, 100),
(3, '헤드폰', 200000, 200);

-- 주문 데이터 삽입
INSERT INTO orders (member_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2023-03-25'),
(2, 2, 2, '2023-04-02'),
(3, 3, 3, '2023-04-03');

-- 정상 데이터
INSERT INTO user (username, email, password)
VALUES ('gildong', 'gildong@test.com', 'pass123');

-- 중복된 username
INSERT INTO user (username, email, password)
VALUES ('gildong', 'gildong2@test.com', 'pass234');
-- ERROR 1062 (23000): Duplicate entry 'gildong' for key 'username'

-- 중복된 email
INSERT INTO user (username, email, password)
VALUES ('hong', 'gildong@test.com', 'pass345');
-- ERROR 1062 (23000): Duplicate entry 'gildong@test.com' for key 'email'

-- 2.1 새로운 테이블 CATEGORY 생성.
CREATE TABLE CATEGORY (
	CATEGORY_ID INT PRIMARY KEY ,
        NAME VARCHAR(20) NOT NULL
);

-- 2.1.2 PRODUCT 테이블에 CATEGORY_ID 컬럼 추가 및 외래키 설정.
ALTER TABLE PRODUCT ADD COLUMN CATEGORY_ID INT;
ALTER TABLE PRODUCT ADD CONSTRAINT FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID);

-- 2.1.3. **orders 테이블에 인덱스 추가. order_date 컬럼에 idx_order_date 인덱스 생성
ALTER TABLE ORDERS ADD INDEX IDX_ORDER_DATE(ORDER_DATE);

-- 2.2.1 category 테이블에 데이터 삽입
INSERT INTO CATEGORY(CATEGORY_ID , NAME ) VALUES (1 , '전자제품') , 
						 (2 , '가전제품');
-- 2.2.2. product 테이블의 category_id 업데이트
UPDATE PRODUCT SET CATEGORY_ID = 1;

-- 2.2.3. 새로운 회원 추가
INSERT INTO MEMBER(EMAIL , NAME , PHONE , JOIN_DATE) VALUES('park@test.com' , '박민지' , '010-4567-8901' , '20230405');


SELECT * FROM MEMBER
WHERE JOIN_DATE >= '2023-04-01';


SELECT * FROM PRODUCT
WHERE PRICE >= 500000;


UPDATE MEMBER SET PHONE = '010-9999-0000'
WHERE NAME = '이철수';


UPDATE PRODUCT SET PRICE = PRICE * 1.1
WHERE STOCK < 100; 


SELECT * FROM ORDERS;


DELETE FROM ORDERS 
WHERE ORDER_DATE < '20230401';


DELETE FROM ORDERS
WHERE QUANTITY = 0;


INSERT INTO user (username, email, password)
VALUES ('hong', 'gildong@test.com', 'pass345');


CREATE INDEX IDX_MEMBERID_ORDERDATE ON ORDERS(MEMBER_ID , ORDER_DATE);


SELECT * FROM ORDERS
WHERE (MEMBER_ID BETWEEN 1 AND 10) AND ORDER_DATE > '20230401';


CREATE USER 'test_user'@'localhost';


GRANT SELECT ON ORDERS TO  'test_user@localhost';


SHOW GRANTS FOR 'test_user@localhost';
 
 
REVOKE SELECT ON ORDERS FROM  'test_user@localhost';


SHOW GRANTS FOR 'test_user@localhost';


DROP TABLE MOVIES;
CREATE TABLE MOVIES (
	ID INT AUTO_INCREMENT PRIMARY KEY ,
        TITLE VARCHAR(50) NOT NULL ,
        DIRECTOR VARCHAR(10) NOT NULL ,
        RELEASE_DATE DATE NOT NULL ,
        GENRE VARCHAR(20) NOT NULL ,
        RATING DECIMAL(3 , 2)
);

INSERT INTO MOVIES(TITLE , DIRECTOR , RELEASE_DATE , GENRE , RATING) 
		   VALUES ('괴물' , '봉준호' , '20060727' , '드라마' , 8.2) ,
			  ('극한직업' , '이병헌' , '20190123' , '코미디' , 9.20) ,
                          ('명량' , '김한민' , '20140730' , '사극' , 9.17) ,
                          ('신과함께-죄와벌' , '김용화' , '20171220' , '판타지' , 7.56) ,
                          ('밀양' , '임권택' , '20160907' , '드라마' , 7.76) ,
                          ('반도' , '연상호' , '20200715' , '액션' , 6.71) ,
                          ('베테랑' , '류승완' , '20150805' , '액션' , 8.49) ,
                          ('변호인' , '양우석' , '20131218' , '드라마' , 8.41) ,
                          ('군함도' , '류승완' , '20170726' , '사극' , 8.01) ,
                          ('암살' , '최동훈' , '20150722' , '액션' , 8.37) ;
                          

SELECT * FROM MOVIES;








CREATE USER 'test'@'localhost' identified by '1234 ';
SHOW GRANTS FOR 'test'@'localhost';
grant select on orders to 'test'@'localhost';
revoke select on orders from 'test'@'localhost';
drop user 'test'@'localhost';






