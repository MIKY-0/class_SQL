-- -------------------DCL-------------------
-- -------------------권한 부여-------------------
-- 사용자 생성(사람 , 시스템에게 줄 수 있음)
-- LOCALHOST는 내 컴퓨터 안에서 접근하는 계정.
-- 외부에서 접근하려면 * , 192.168.4.12 처럼 ip 주소를 명시할 수 도 있음.
-- CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';
 
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';

-- 새로 생성한 user1에 조회 권한 부여 -> SCHOOL.STUDENT 테이블로의 조회 권한만 부여.
GRANT SELECT ON SCHOOL.STUDENT TO 'user1'@'localhost';

-- INSERT 권한 부여.
-- 확인 개념 : GRANT는 권한을 덮어쓰는게 아닌 추가가 됨.
GRANT INSERT ON STUDENT TO 'user1'@'localhost'; 
-- ',' 사용해서 한번에 추가 가능.
GRANT UPDATE , DELETE ON STUDENT TO 'user1'@'localhost'; 

-- 외부에서 접근할 수 있는 계정 생성.
CREATE USER 'user1'@'%' IDENTIFIED BY 'password123';

GRANT SELECT ON SCHOOL.STUDENT TO 'user1'@'%';

-- --------------------권한 회수------------
REVOKE INSERT , UPDATE , DELETE ON SCHOOL.STUDENT FROM 'user1'@'localhost';

-- -------------------- 계정 삭제 ------------
DROP USER 'user1'@'localhost';

 SELECT USER();
 
 -- 현재 USER 목록 확인.
 SELECT CURRENT_USER();

-- 도전과제(외부에서 접근할 수 있는 계정 생성하고 권한 관리해서 테스트)
CREATE USER 'team'@'%';

GRANT SELECT ON SCHOOL.STUDENT TO 'user1'@'%';
GRANT  update ON SCHOOL.STUDENT TO 'user1'@'%';


-- 권한 확인 
SHOW GRANTS FOR 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'%';
SHOW GRANTS FOR 'team'@'%';
