-- 앞 차시에서 만든 student 테이블이 남아있으면 지우고 시작
DROP TABLE IF EXISTS student;

CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  grade INT NOT NULL,
  major VARCHAR(50) NOT NULL,
  english_score INT NOT NULL
);

INSERT INTO student (id, name, grade, major, english_score) VALUES
(1, '홍길동', 1, '컴퓨터공학과', 85),
(2, '김영희', 2, '경영학과', 90),
(3, '이철수', 3, '컴퓨터공학과', 78),
(4, '박민지', 1, '디자인학과', 92),
(5, '최재영', 4, '전자공학과', 88),
(6, '강영식', 2, '컴퓨터공학과', 95);

CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  grade INT NOT NULL,
  major VARCHAR(50) NOT NULL,
  english_score INT NOT NULL ,
  INDEX IDX_MAJOR(MAJOR) -- MAJOR 열에 인덱스 생성.
);

-- 1. 기존 테이블에 인덱스 추가하는 방법.(중간에 추가)
ALTER TABLE STUDENT ADD INDEX IDX_GRADE(GRADE);

-- 2. 인덱스 확인 명령어
SHOW INDEX FROM STUDENT;

-- 3. 복합 인덱스 생성.(여러 열을 조합한 인덱스)
CREATE INDEX IDX_GRADE_MAJOR ON STUDENT(GRADE , MAJOR);

-- 4. 인덱스 삭제.
DROP INDEX IDX_GRADE ON STUDENT;

SELECT * FROM STUDENT;