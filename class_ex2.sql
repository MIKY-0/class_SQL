-- 1.dept_emp 테이블에서 from_date가 2000년도 이상 이면서 to_date가 '9999-01-01'가 아닌 값을 출력하세요 (employees 데이터베이스 기준입니다)
SELECT * FROM DEPT_EMP
WHERE FROM_DATE >= '20000101' AND TO_DATE != '99990101';

-- 2.employees의 dept_emp를 활용하여 emp_no가 10604이고 dept-no가 d005인 사원의 from_date를 1990-04-07에서 1990-04-08으로 수정해주세요.:)
UPDATE DEPT_EMP SET FROM_DATE = '19900408'
WHERE EMP_NO = 10604 AND DEPT_NO = 'D005';

-- 3.employees 데이터베이스의 employees_copy 테이블에 데이터를 실제로 삭제하지 않고 삭제 여부만 표시하는 기능(Soft Delete)을 추가하려고 합니다.
-- 삭제 여부를 저장할 is_deleted 컬럼을 추가하세요.
-- 데이터 타입은 BOOLEAN입니다.
-- 기본값은 FALSE입니다.
-- ALTER TABLE employees_copy
-- ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;
-- hire_date가 1985-01-31 이하인 행의 is_deleted 값을 TRUE로 변경하세요.
ALTER TABLE EMPLOYEE_COPY ADD COLUMN IS_DELETED BOOLEAN DEFAULT FALSE;
UPDATE EMPLOYEE_COPY SET IS_DELETED = TRUE
WHERE HIRE_DATE <= '19850131';


-- 4.1996-01-03일에 매니저가 된 사람의 사원번호를 10998로 변경한뒤 변경된 사원번호에  매니저이름만 찾아주세요
SELECT FIRST_NAME , LAST_NAME FROM EMPLOYEES;

UPDATE EMPLOYEES SET EMP_NO = 10998
WHERE HIRE_DATE = '19960103';

-- 5.employees_copy DB에 email을 추가해주세요. (길이 50)
ALTER TABLE EMPLOYEE_COPY ADD COLUMN EMAIL VARCHAR(50);

-- 6.email이 null인 사원은 '이메일이 등록되지 않았습니다.'를 채워주세요.
UPDATE EMPLOYEE_COPY SET EMAIL = '이메일이 등록되지 않았습니다.'
WHERE EMAIL IS NULL;

-- 7.employees에서 hire_date가 1990-01-01 이하인 사원 중 gender가 'F' 인 사원들의  hire_date를 1990-10-31로 변경해주세요.
UPDATE EMPLOYEES SET HIRE_DATE = '19901031'
WHERE HIRE_DATE <= '19900101' AND GENDER = 'F';

-- 8.employees DB에 있는 titles 테이블을 복사하고, to_date가 9999로 시작하는 값 삭제하세요.(titles에서 삭제 하지 않게 주의!)
CREATE TABLE TITLES_COPY LIKE TITLES;
INSERT INTO TITLES_COPY SELECT * FROM TITLES;

DELETE FROM TITLES_COPY
WHERE TO_DATE LIKE '9999%';


-- 9. employees_copy 테이블에 fired_date 추가하고 디폴트값 null 넣어주세요.
ALTER TABLE EMPLOYEE_COPY ADD COLUMN FIRED_DATE DATE  DEFAULT NULL;

-- 10. employees에서 emp_no 10001~10012이면서  first_name이 P로 시작하는 사원의 gender를 F로 수정해주세요
UPDATE EMPLOYEES SET GENDER = 'F'
WHERE (EMP_NO BETWEEN 10001 AND 10012 ) AND (FIRST_NAME LIKE 'P%');


SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM DEPT_EMP;
SELECT * FROM EMPLOYEE_COPY;
SELECT * FROM dept_manager;
SELECT * FROM TITLES_COPY;
