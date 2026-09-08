DROP DATABASE IF EXISTS group_practice;
CREATE DATABASE group_practice;
USE group_practice;

DROP TABLE IF EXISTS tb_student;
-- IF EXISTS : 해당 테이블이 존재할 경우에만 삭제하도록 조건을 거는 옵션

CREATE TABLE tb_student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class CHAR(1) NOT NULL,
    score INT NOT NULL
);

INSERT INTO tb_student (name, class, score) VALUES
('김민수', 'A', 85),
('이서연', 'B', 75),
('박지훈', 'A', 65),
('최예린', 'A', 70),
('정하윤', 'B', 95),
('강동현', 'C', 88),
('오소연', 'C', 92),
('한지민', 'B', 78),
('윤태양', 'A', 85),
('문채원', 'C', 90);

SELECT * FROM TB_STUDENT
ORDER BY CLASS;

-- 1. CLASS별 평균을 구해보자.
SELECT CLASS , ROUND(AVG(SCORE) , 2) AS 평균 FROM TB_STUDENT
GROUP BY CLASS;

-- 2. GROUP BY 이후에 80점 이상인 CLASS만 조회.
SELECT CLASS , ROUND(AVG(SCORE) , 2) AS 평균 FROM TB_STUDENT
GROUP BY CLASS
HAVING AVG(SCORE) >= 80;

-- 3. CLASS별 최고 및 최저 점수
SELECT CLASS , MAX(SCORE) AS '최고 점수' , MIN(SCORE) AS '최저 점수'
FROM TB_STUDENT
GROUP BY CLASS;

-- 4. 비집계 컬럼을 넣어보자. --> 오류 : NAME과 앞의 컬럼들이 매핑이 되지 않음.
-- Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'group_practice.TB_STUDENT.class'; this is incompatible with sql_mode=only_full_group_by
SELECT CLASS , MAX(SCORE) AS '최고 점수' , MIN(SCORE) AS '최저 점수' , NAME
FROM TB_STUDENT
GROUP BY CLASS;
