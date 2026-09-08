-- 3. 주요함수 사용.

-- 3.1 집계 함수.
-- 문제 1: 전체 직원 수와 부서가 정해진 직원 수
select * from employees;

select count(*) as 전체 , count(department) as 부서있음 from employees;

-- count(컬럼) 그 컬럼이 null이 아닌 행만 셈.

-- 문제2 : 평균 급여 , 최고 급여 , 최저 급여
SELECT ROUND(AVG(SALARY)) AS 평균 , MAX(SALARY) , MIN(SALARY) , SUM(SALARY)
FROM EMPLOYEES;

-- 집계함수 주의 : 집계 결과는 1행인데 NAME은 6행이라서 어느것을 보여줄지 사실 정할 수 없음.

SELECT ROUND(AVG(SALARY)) AS 평균 , MAX(SALARY) , MIN(SALARY) , SUM(SALARY) , NAME
FROM EMPLOYEES;

-- 2. 문자열 함수
-- 문제3 : 이름뒤에 '님'을 붙이고 성씨만 뽑기.
-- SUBSTRING -- 자바와 다르게 1이 첫번째 글자. 뒤 1은 1글자만
SELECT NAME , CONCAT(NAME , ' 님') AS 호칭 , substring(NAME , 1 , 1)  AS 성씨 ,
	CONCAT(substring(NAME , 1 , 1) , ' **') AS 성씨
FROM EMPLOYEES;

-- 이메일을 대문자로 바꾸고 앞 4글자만 뽑기.
SELECT EMAIL , UPPER(EMAIL) as 대문자 , lower(email) as 소문자 , substring(email , 1 , 4) as 4글자
FROM EMPLOYEES;
-- 단, 한글에는 대소문자 개념 없어서 아무 변화 없음.

-- 3. 논리 및 조건 함수.
-- 문제 5 : 급여에 따라서 등급 나누기.(case)
-- 주의(조건에 쓴 컬럼에 값이 SALARY NULL 이라면 바로 WHEN에 걸리지 않고 ELSE로 바로 떨어짐.)
select name , salary ,
	CASE
        WHEN SALARY >= 3500000 THEN '상'
        WHEN SALARY >= 3000000 THEN '중'
        ELSE '하'
        END AS 등급
from employees
ORDER BY 등급 ASC;

SELECT * , CASE
		WHEN DEPARTMENT IS NULL THEN '미배정'
		ELSE DEPARTMENT
                END AS '부서'
FROM EMPLOYEES;

-- 문제 6 : 부서가 없으면 '미배정'으로 표시 (COALCASE)
-- 첫번째 인자값이 NULL이면 두번째 인자값으로 반환.
SELECT NAME , DAPARTMENT , COALCASE(DEPARTMENT , '미배정') AS 표시부서
FROM EMPLOYEES;

-- 4. 날짜 및 시간함수
-- 문제 7 : 오늘 날짜와 현재 시각 표시.
-- 문제 7 : 오늘 날짜와 현재 시각 표시.
SELECT CURRENT_DATE AS 오늘 , 
	CURRENT_TIME() AS '현재 시각' ,
        CURRENT_TIMESTAMP() AS '현재 일시' ;
        
-- 문제 8. 입사연도와 월 추출 또는 입사일 추출.
-- EXTRACT(단위 FROM 날짜) 단위에는 YEAR , MONTH , DAY , HOUR 등이 들어갈 수 있습니다.
SELECT NAME , HIRE_DATE , EXTRACT(YEAR FROM HIRE_DATE) AS 입사연도 , 
	EXTRACT(MONTH FROM HIRE_DATE) AS 입사월 , EXTRACT(DAY FROM HIRE_DATE) AS 입사일
FROM EMPLOYEES LIMIT 3;

-- 문제 9 : 근속 연수 계산(DATEDIFF) --> MYSQL 전용함수.
-- 두 날짜의 일수 차이를 반환.
SELECT NAME , HIRE_DATE , DATEDIFF(CURRENT_DATE , HIRE_DATE) AS 근무일수
FROM EMPLOYEES;

SELECT NAME , HIRE_DATE , DATEDIFF(CURRENT_DATE , HIRE_DATE) AS 근무일수 ,
	DATEDIFF(CURRENT_DATE , HIRE_DATE) / 365.0 AS 근속연수
FROM EMPLOYEES;

SELECT NAME , HIRE_DATE , DATEDIFF(CURRENT_DATE , HIRE_DATE) AS 근무일수 ,
	FLOOR(DATEDIFF(CURRENT_DATE , HIRE_DATE) / 365.0) AS 근속연수
FROM EMPLOYEES;

-- 5. 형변환 함수
-- SIGNED : 부호있는 정수. 즉, 음수를 담을 수 있음.
-- UNSIGNED : 부호없는 정수. 0 이상만 담을 수 있음.
SELECT CAST('123' AS SIGNED) AS 숫자변환;
SELECT CAST('-123' AS SIGNED) AS 숫자변환;

SELECT CAST('123' AS UNSIGNED) AS 숫자변환;
SELECT CAST('-123' AS UNSIGNED) AS 숫자변환;

-- MYSQL에서는 문자열 + 숫자는 숫자로 계산됨.
SELECT '123' + 3 AS 문자열덧셈;

-- 만약 위 결과를 1233으로 표시하고 싶다면 ?
-- MYSQL에서는 문자열을 이으려면 반드시 CONCAT 사용.
SELECT CONCAT('123' , 3) AS 문자열;


-- 문자열로 형변환시 VARCHAR가 아니라 CHAR 사용.
SELECT CAST(123 AS CHAR(3)) AS 확인;


select * from salaries;

select c.* , s.salary , case when s.salary > 60000 then 'A'
		else 'B'
                end as 부서
from employee_copy3 c left join salaries s on c.emp_no = s.emp_no
where c.emp_no < 10010;
                

select * , case when s.salary > 60000 then 'A'
		else 'B'
                end as 부서
from salaries;


SELECT * FROM EMPLOYEES;
