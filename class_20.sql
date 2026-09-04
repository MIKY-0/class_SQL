-- INNER JOIN 특수한 형태(CORSS JOIN)
-- INNER JOIN.  ON 조건식. 현재는 ON 조건절이 없음. --> CROSS JOIN. 모든 튜플을 매칭.
SELECT COUNT(*) FROM TB_STUDENT JOIN TB_GRADE; -- 36
SELECT * FROM TB_STUDENT JOIN TB_GRADE;

SELECT COUNT(*) FROM TB_GRADE; -- 6
SELECT * FROM TB_GRADE;

SELECT COUNT(*) FROM TB_STUDENT; -- 6
SELECT * FROM TB_STUDENT;

-- 위 JOIN은 의미없음. ON을 사용해서 추출하자.
SELECT TB_STUDENT.NO , TB_STUDENT.NAME , TB_STUDENT.GRADE , TB_GRADE.GRADE , TB_GRADE.SCORE 
FROM TB_STUDENT INNER JOIN tb_grade ON TB_GRADE.GRADE = TB_STUDENT.GRADE; 

SELECT S.NO , S.NAME , S.GRADE , G.GRADE , G.SCORE 
FROM TB_STUDENT S INNER JOIN tb_grade G ON G.GRADE = S.GRADE; 




-- -----------------------------------------------------------------------------
-- 실습2. OUTER JOIN
-- -----------------------------------------------------------------------------
SELECT s.name, g.score 
FROM tb_student s LEFT JOIN tb_grade g ON s.grade = g.grade;

SELECT g.score, s.name 
FROM tb_student s LEFT JOIN tb_grade g ON s.grade = g.grade;


-- 추가 테이블 생성 및 데이터 수정.
CREATE TABLE tb_club (
    club_id   INT PRIMARY KEY,
    club_name VARCHAR(20)
);

INSERT INTO tb_club VALUES (1, '축구부'), (2, '밴드부');

ALTER TABLE tb_student ADD COLUMN club_id INT;
ALTER TABLE tb_student ADD FOREIGN KEY (club_id) REFERENCES tb_club(club_id);

UPDATE tb_student SET club_id = 1 WHERE no = 20170001;  -- 조이
UPDATE tb_student SET club_id = 2 WHERE no = 20170020;  -- 앤드류
UPDATE tb_student SET club_id = 1 WHERE no = 20180800;  -- 데이지
-- 다나, 스카이, 제임스는 동아리 없음 (club_id 가 NULL)

SELECT * FROM tb_student;
SELECT * FROM tb_CLUB;

-- 학생 정보 + 등급 점수 + 동아리 이름
SELECT S.* , G.SCORE , C.CLUB_NAME
FROM TB_STUDENT S LEFT JOIN TB_GRADE G ON S.GRADE = G.GRADE
		  LEFT JOIN TB_CLUB C ON S.CLUB_ID = C.CLUB_ID;

-- LEFT JOIN 연습 : 상황 - 학생 명단이 전부 나와야함.
SELECT * 
FROM TB_STUDENT S LEFT JOIN TB_GRADE G ON S.GRADE = G.GRADE; 


-- RIGHT JOIN 연습 : 상황 - 모든 등급이 나와야함.
SELECT * 
FROM TB_STUDENT S RIGHT JOIN TB_GRADE G ON S.GRADE = G.GRADE;



-- ---------------------------------
SELECT S.NAME , S.AGE , S.GRADE , G.SCORE
FROM TB_STUDENT S INNER JOIN TB_GRADE G ON S.GRADE = G.GRADE
WHERE S.GRADE = 'A' OR S.GRADE = 'B';

SELECT S.NAME , S.GRADE , G.SCORE 
FROM TB_STUDENT S LEFT JOIN TB_GRADE G ON S.GRADE = G.GRADE 
WHERE S.GENDER = 'M';








