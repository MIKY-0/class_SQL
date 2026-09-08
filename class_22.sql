DROP DATABASE IF EXISTS alias_practice;
CREATE DATABASE alias_practice;
USE alias_practice;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    score INT
);

INSERT INTO students VALUES (1, '홍길동', 75), (2, '김철수', 55);
SELECT * FROM students;

-- 1. 별칭
SELECT 100 AS  STUDENT_ID , '반장' AS TITLE;

-- 2. 테이블에 별칭 주기
SELECT S.NAME FROM STUDENTS AS S;

-- 3. 사용자 변수란?
-- MYSQL에서 @기호를 사용하여 사용자 정의 변수를 선언하고 사용할 수 있다.
-- 이 변수는 세션단위로 유지되며 간단한 데이터 저장과 조건확인에 유용하다.

-- 변수에 값 저장
SET @SCORE = 85;

-- 변수 출력
SELECT @SCORE;

-- 주의점!
-- 1. 선언하지 않은 변수를 출력하면 NULL.
SELECT @NEVER_SET; -- --> 오류 발생하지 않음. (변수명 오타 조심)

-- 3. 변수에 쿼리 결과 저장하기.
-- 문법(SELECT 컬럼 INTO 변수  FROM 테이블 WHERE 조건;)
-- SELECT INTO  이 문법은 쿼리 결과를 변수에 저장하는 문법.

-- STUDENTS 테이블에서 점수를 가져와서 변수에 저장 가능.
SELECT SCORE INTO @STUDENT_SCORE FROM STUDENTS
WHERE ID = 1;

-- 확인 
SELECT @STUDENT_SCORE;

-- 단, 컬럼과 변수의 개수가 맞아야 하며, 앞에서부터 순서대로 짝지어짐.
SELECT NAME , SCORE INTO @N , @S FROM STUDENTS
WHERE ID = 2;

SELECT @N AS NAME , @S AS SCORE;

SELECT SCORE INTO @S2 FROM STUDENTS
WHERE ID = 2;
SELECT * FROM STUDENTS;

-- 주의 : 0행일 때  
SET @ZERO = NULL;
SELECT SCORE INTO @ZERO  FROM STUDENTS 
WHERE ID = 99;

SELECT @ZERO;

-- 4. IF 함수 사용하기 
SELECT NAME , SCORE ,
	IF(SCORE >= 60 , 'PASS' , 'FAIL') AS RESULT
FROM STUDENTS;        