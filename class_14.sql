-- 앞 차시에서 만든 테이블이 남아있으면 지우고 시작
-- orders 가 member 를 참조하므로 자식 테이블을 먼저 지웁니다
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS member;

CREATE TABLE member (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) UNIQUE,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20)
);

INSERT INTO member (email, name, phone) VALUES
('hong@test.com', '홍길동', '010-1234-5678'),
('kim@test.com', '김영희', '010-2345-6789'),
('lee@test.com', '이철수', '010-3456-7890');

CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT,
  order_date DATE,
  amount INT,
  FOREIGN KEY (member_id) REFERENCES member(id)
);

INSERT INTO orders (member_id, order_date, amount) VALUES
(1, '2023-10-01', 50000),
(2, '2023-10-02', 75000),
(3, '2023-10-03', 30000);

-- 실습.
SELECT * FROM MEMBER;
SELECT * FROM ORDERS;

-- 1. 중복 이메일 삽입 시도.
INSERT INTO MEMBER(EMAIL , NAME , PHONE) VALUES('kim@test.com' , '홍길동2' , '123123123');

-- 2. 존재하지 않는 회원의 주문 삽입.
INSERT INTO ORDERS(MEMBER_ID , ORDER_DATE , AMOUNT) VALUES(1000 , '20260901' , 10);

-- COPY RESPONSE
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`type_practice`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`))


-- 3. 회원 삭제 시도(참조된 데이터)
DELETE FROM MEMBER 
WHERE ID = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`type_practice`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`))


-- 4. 외래키 삭제하는 방법.
ALTER TABLE ORDERS DROP FOREIGN KEY orders_ibfk_1; 


-- 5. 테이블 생성 이후에 외래키를 추가하는 방법.
ALTER TABLE ORDERS ADD CONSTRAINT FK_MEMBER FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(ID);

ALTER TABLE ORDERS DROP FOREIGN KEY FK_MEMBER;

-- CASCADE 설정됨. 부모 테이블에 참조된 대상이 삭제된다면 관련된 데이터 자동으로 전부 삭제.
ALTER TABLE ORDERS ADD CONSTRAINT FK_MEMBER
FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 오류없이 잘 삭제됨.
DELETE FROM MEMBER
WHERE ID = 1;

SELECT * FROM MEMBER;
SELECT * FROM ORDERS;