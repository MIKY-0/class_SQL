DROP DATABASE IF EXISTS select_practice;
CREATE DATABASE select_practice;
USE select_practice;

CREATE TABLE customer (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  email VARCHAR(50),
  address VARCHAR(100)
);

INSERT INTO customer (name, email, address) VALUES('김철수', 'kim@example.com', '서울시 강남구'),
						  ('박영희', 'park@example.com', '서울시 서초구'),
                                                  ('이민수', NULL, '경기도 성남시'),
                                                  ('최영진', 'choi@example.com', '서울시 송파구'),
                                                  ('한미영', 'han@example.com', '경기도 수원시'),
                                                  ('강종현', 'kang@example.com', '서울시 강서구') ,
                                                  ('홍길동' , 'kim@example.com' , '부산시 진구');

-- SELECT , WHERE 절 연습.
-- 1. 서울시 강남구에 거주하는 고객의 ID와 이름 조회.
  SELECT ID , NAME , ADDRESS FROM CUSTOMER
  WHERE ADDRESS = '서울시 강남구';

-- 2. 이메일이 NULL인 고객 조회.
-- 이민수의 이메일이 NULL 입니다. NULL은 값이 없다가 아니라 값을 모른다에 가까움. 그래서 .EMAIL = NULL 을 찾고자 하면 찾아지지 않는다. '=' 등호는 값을 비교하는데 NULL은 값이 아니기 때문.
-- 이럴때는 IS NULL이라는 구문을 사용해야함.
SELECT * FROM CUSTOMER
WHERE EMAIL = NULL;

SELECT * FROM CUSTOMER
WHERE EMAIL IS NULL;

-- 3. 이름이 '박영희'인 고객 조회.
SELECT * FROM CUSTOMER WHERE NAME = '박영희';

-- 4. 복합 조건
-- 서울시에 사는 ID가 3이하인 고객 조회.
SELECT * FROM CUSTOMER
WHERE ADDRESS LIKE '서울시%' AND ID <= 3;

-- 5. 서울시에 사는 고객이 아닌 고객들만 조회.
SELECT * FROM CUSTOMER
WHERE ADDRESS NOT LIKE '서울시%';

-- 6. 서울시 또는 경기도에 사는 고객 조회.
SELECT * FROM CUSTOMER
WHERE ADDRESS LIKE '서울시%' OR ADDRESS LIKE '경기도%';

-- 7. 특수 연산자
-- ID가 2 ~ 5인 고객 조회. - BETWEEN은 양쪽 값들도 포함.
SELECT * FROM CUSTOMER
WHERE ID BETWEEN 2 AND 5; 

-- 8. 강남구 , 서초구 , 송파구에 사는 고객들만 조회.
SELECT * FROM CUSTOMER
WHERE ADDRESS IN('서울시 강남구' , '서울시 서초구' , '서울시 송파구' );



SELECT * FROM customer;

-- --------------------------------------------
-- 샘플데이터2
-- --------------------------------------------
CREATE TABLE student (
    student_id INT PRIMARY KEY COMMENT '학번',
    name VARCHAR(50) NOT NULL COMMENT '이름',
    grade INT NOT NULL COMMENT '학년',
    major VARCHAR(100) NOT NULL COMMENT '학과'
) COMMENT = '학생 정보 테이블';

SELECT * FROM STUDENT;

-- COMMENT는 컬럼과 테이블에 설명을 달아두는 기능.(주석과 유사) 동작에는 영향을 끼치지 않지만 다른사람이 테이블을 볼때 도움이 됨.
SHOW FULL COLUMNS FROM STUDENT;

-- student 샘플 데이터
INSERT INTO student (student_id, name, grade, major)
VALUES
  (1,  '김철수', 1, '컴퓨터공학과'),
  (2,  '박영희', 2, '경영학과'),
  (3,  '이민수', 4, '전자공학과'),
  (4,  '홍길동', 1, '디자인학과'),
  (5,  '임성민', 3, '컴퓨터공학과'),
  (6,  '한지원', 2, '경영학과'),
  (7,  '박준형', 4, '전자공학과'),
  (8,  '김민지', 1, '디자인학과'),
  (9,  '이현수', 3, '컴퓨터공학과'),
  (10, '정미경', 2, '경영학과'),
  (11, '김성진', 4, '전자공학과'),
  (12, '임승환', 1, '디자인학과'),
  (13, '최수빈', 2, '컴퓨터공학과'),
  (14, '오지훈', 3, '경영학과'),
  (15, '윤서아', 2, '전자공학과'),
  (16, '장도윤', 4, '디자인학과');

-- 테이블에서 학과가 '컴퓨터공학과'인 학생들의 이름과 학번 조회.
SELECT NAME , STUDENT_ID FROM STUDENT
WHERE MAJOR = '컴퓨터공학과';


-- student 테이블에서 학과가 '컴퓨터공학과'인 학생들의 이름과 학번을 조회 하시오. 
select name, student_id
from student
where major = '컴퓨터공학과';

-- 1. grade가 3인 학생들 조회하기 (컬럼을 지정하지 않으면 전부 출력)
SELECT * FROM STUDENT
WHERE GRADE = 3;

-- 2. 이름이 홍길동인 학생 조회하기
SELECT * FROM STUDENT
WHERE NAME = '홍길동';

-- 3. 학번이 1부터 10까지인 학생들 조회하기 (BETWEEN)
SELECT * FROM STUDENT
WHERE STUDENT_ID BETWEEN 1 AND 10;

-- 4. 학과가 컴퓨터공학과이면서 학년이 2학년인 학생들만 조회하기
SELECT * FROM STUDENT
WHERE MAJOR = '컴퓨터공학과' AND GRADE = 2;

-- 5. 학과가 컴퓨터공학과이거나 학년이 2학년인 학생들 조회하기
SELECT * FROM STUDENT
WHERE MAJOR = '컴퓨터공학과' OR GRADE = 2;

-- 6. 학생 이름이 홍길동이 아닌 학생들 조회하기
SELECT * FROM STUDENT
WHERE NAME != '홍길동';

-- 7. 학년이 2학년 이상인 학생들 조회하기
SELECT * FROM STUDENT
WHERE GRADE >= 2;

-- 8. 학년이 2학년 미만인 학생들 조회하기
SELECT * FROM STUDENT
WHERE GRADE < 2;

-- 9. 학년이 1학년, 3학년, 4학년인 학생들 조회하기 (IN 사용)
SELECT * FROM STUDENT
WHERE GRADE IN(1 , 3 , 4);

-- 10. 이름이 김씨인 학생들 조회하기 (LIKE 사용)
SELECT * FROM STUDENT
WHERE NAME LIKE '김%';

-- 11. 컴퓨터공학과이거나 경영학과이면서, 2학년인 학생들 조회하기 (괄호 주의)
SELECT * FROM STUDENT 
WHERE (MAJOR = '컴퓨터공학과' OR MAJOR = '경영학과') AND (GRADE = 2);


SELECT * FROM student;