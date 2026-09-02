USE TYPE_PRACTICE;
-- 앞 차시에서 만든 테이블이 남아있으면 지우고 시작
-- orders 가 member 를 참조하므로 자식 테이블을 먼저 지웁니다
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS MEMBER;

CREATE TABLE MEMBER (
	ID BIGINT PRIMARY KEY AUTO_INCREMENT ,
        EMAIL VARCHAR(100) UNIQUE ,
        NAME VARCHAR(50) NOT NULL ,
        PHONE VARCHAR(20) 
);

INSERT INTO member (email, name, phone) VALUES
(NULL, '홍길동', '010-1234-5678'),
('kim@test.com', '김영희', '010-2345-6789'),
('lee@test.com', '이철수', '010-3456-7890');

INSERT INTO member (email, name, phone) VALUES
(NULL, '홍길동2', '22222222222222222');

SELECT * FROM MEMBER;


-- ----------------------------
CREATE TABLE ORDERS (
	ID BIGINT PRIMARY KEY AUTO_INCREMENT ,
        MEMBER_ID BIGINT ,
        ORDER_DATE DATE ,
        AMOUNT INT ,
        FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(ID)
);

-- 외래키를 설정했다면 제약사항이 발생. (무결성 , 일관성)
SELECT * FROM MEMBER;

-- 아래 구문은 외래키 조건 위반. --> 6번 ID는 MEMBER테이블에 없는데 참조하려고 하기 때문.
INSERT INTO ORDERS(MEMBER_ID , ORDER_DATE , AMOUNT) VALUES (6 , '2026-09-01' , 1);
INSERT INTO ORDERS(MEMBER_ID , ORDER_DATE , AMOUNT) VALUES (1 , '2026-09-01' , 1);

-- 현재 ORDERS 테이블에 MEMBER_ID가 1인 사람의 데이터가 저장되어있는 상태.
-- 삭제 실패 : ORDERS테이블에 ID1인 유저의 정보가 남아있음. 삭제해버리면 ORDERS 테이블의 ID1인 쓰레기데이터가 남음.
DELETE FROM MEMBER
WHERE ID = 1;

-- 삭제하려면 관련된 데이터를 다 지우고 MEMBER테이블에 ID1번을 삭제할수있음.
DELETE FROM ORDERS
WHERE MEMBER_ID = 1;

DELETE FROM MEMBER
WHERE ID = 1;