USE EMPLOYEES;

-- DB 파악 , 어떤 테이블이 존재하고 어떤의미인지 파악.
-- 1일1쿼리 진행(스스로 문제 만들기) -- 디스코드 SQL 연습문제 채널에 올리기.
-- 단, EMPLYEES DB 안에서 문제만들기(진도 기준으로 1문제씩 올리기. 어렵지 않게.)

-- 1. employees 테입에서 홍길동이란 사람을 검색하시오

-- 2.titles 테이블에서 title이 'Senior'로 시작하고, from_date가 1990-01-01 이전인 레코드를 출력하시오.
SELECT * FROM TITLES
WHERE TITLE LIKE 'SENIOR%' AND FROM_DATE < '19900101';

-- 3.employees 테이블에서 emp_no가 10010인 사람을 검색하세요
SELECT * FROM EMPLOYEES
WHERE EMP_NO = 10010;
-- 4.Salaries 테이블에서 salary가 100000 이상인 사람 조회
SELECT * FROM SALARIES
WHERE SALARY >= 100000;

-- 5.dept_emp 테이블에서 to_date가 9999-01-01이 아닌 값을 출력하세요
SELECT * FROM DEPT_EMP
WHERE TO_DATE != '9999-01-01';

-- 6.EMPLOYEES 테이블에서 남자 직원들을 조회하세요
SELECT * FROM EMPLOYEES
WHERE BIRTH_DATE LIKE '1953%' AND GENDER = 'M';

-- 7.employees 테이블에서 birth_date 가 9월인 사람을 출력하시오.
SELECT * FROM EMPLOYEES
WHERE BIRTH_DATE LIKE '%-09-%';

-- 8.employees 테이블에서 gender가 M인 first_name과 last_name만 출력하시오.
SELECT FIRST_NAME , LAST_NAME FROM EMPLOYEES
WHERE GENDER = 'M';

-- 9.employees 테이블에서 emp_n가 10111인 사람을 검색하시오.


-- 10.salaries 테이블에서 from_date가 2000-01-01 이전이고 to_date가 2000-01-01 이후인 salary만 출력해주세요.


-- 11. titles 테이블에서 from_date가  2001-10-11 일부터  2001-10-15 일 까지  인  titles  조회.


-- 12.employees의 departments 테이블을 활용하여 부서번호 d001에서 d009까지만 조회하세요.


-- 13.employees 테이블에서 여자 직원들중 birth_date가 3월인 사람을 조회하시오.


-- 14.employees 테이블에서 emp_no가 10000~10050인것중에 성별이M인것을 조회하시오.


-- 15.employees 테이블에서 과장인 사람을 모두 조회.



SELECT * FROM DEPARTMENTS;
SELECT * FROM DEPT_MANAGER;
SELECT * FROM DEPT_EMP;
SELECT * FROM EMPLOYEES;
SELECT * FROM SALARIES;
SELECT * FROM TITLES;