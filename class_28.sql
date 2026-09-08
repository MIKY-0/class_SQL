DROP TABLE IF EXISTS tb_employees;

CREATE TABLE tb_employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

INSERT INTO tb_employees (name, department, salary) VALUES
('김도현', '영업',   48000000),
('이소영', '영업',   55000000),
('박지영', '마케팅', 50000000),
('최민재', '마케팅', 45000000),
('강민호', '인사',   35000000),
('오수진', '인사',   40000000),
('정우성', '개발',   75000000),
('한지은', '개발',   65000000),
('윤서현', '개발',   72000000),
('문태준', '개발',   68000000),
('신동엽', '영업',   52000000),
('장미란', '영업',   51000000),
('황아영', '마케팅', 47000000),
('류현진', '인사',   43000000),
('김나영', '인사',   39000000);

SELECT * FROM TB_EMPLOYEES;

-- 1. 부서별 평균 급여.
SELECT DEPARTMENT , AVG(SALARY) AS 평균급여 FROM TB_EMPLOYEES
GROUP BY DEPARTMENT;

-- 2. 부서별 평균 급여가 5000만원 이상인 부서만 조회.
SELECT DEPARTMENT , AVG(SALARY) AS 평균급여 FROM TB_EMPLOYEES
GROUP BY DEPARTMENT
HAVING AVG(SALARY) >= 50000000;

-- 3. 부서별 최고 급여
SELECT DEPARTMENT , MAX(SALARY) AS 최고급여 FROM TB_EMPLOYEES
GROUP BY DEPARTMENT;

-- 4. 직원 수 4명 이상인 부서
SELECT DEPARTMENT , COUNT(*)  FROM TB_EMPLOYEES
GROUP BY DEPARTMENT
HAVING COUNT(*) >= 4;

-- 5.부서별 평균 급여와 직원 수
SELECT DEPARTMENT , COUNT(*) AS 직원수 , AVG(SALARY)  FROM TB_EMPLOYEES
GROUP BY DEPARTMENT;

-- WHERE절과 HAVING절 차이
-- WHERE : 묶기 전에 걸러냄.
SELECT  department , ROUND(AVG(SALARY)) AS '부서펼 평균' FROM TB_EMPLOYEES
WHERE SALARY >= 50000000
GROUP BY DEPARTMENT;

-- 5000만원 미만인 직원을 먼저 제외한 뒤 부서별 평균을 구함.
-- HAVING : 묶은 뒤 걸러냄.
SELECT  department , ROUND(AVG(SALARY)) AS '부서펼 평균' 
FROM TB_EMPLOYEES
GROUP BY DEPARTMENT
having avg(salary) >= 50000000;

SELECT department , ROUND(AVG(salary), 0) AS AverageSalary
FROM tb_employees
GROUP BY department
HAVING AVG(salary) >= 50000000;
-- Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated
-- column 'group_practice.TB_EMPLOYEES.salary' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by



select class , count(*) as 인원수 , round(avg(score) , 2) as 평균점수
from tb_student
group by class
HAVING COUNT(*) >= 4;

select department , max(salary) as 최고급여 , min(salary) as 최저급여 , max(salary) - min(salary) as 급여차이
from tb_employees
group by department
having max(salary) - min(salary) >= 10000000;

