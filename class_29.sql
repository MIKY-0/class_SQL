select distinct department from tb_employees
order by department;

-- 컬럼이 여러개면 조합 기준이 됨.(department , salary) --> 이 순서쌍의 조합 중복을 봄.
select distinct department , salary from tb_employees
order by department;

select * from tb_employees
LIMIT 3 OFFSET 3;

-- 15개 로우. 1페이지에 5개씩.
-- 총 15개 로우 중 5개씩 한 화면에 출력한다면 페이지 블록은 3개 나와야함.
select * from tb_employees
LIMIT 5 OFFSET 0;

select * from tb_employees
LIMIT 5 OFFSET 5;

select * from tb_employees
LIMIT 5 OFFSET 10;