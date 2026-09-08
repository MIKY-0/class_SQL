-- MySQL Workbench 에서 실행

CREATE DATABASE IF NOT EXISTS shop2;
USE shop2;

CREATE TABLE IF NOT EXISTS product (
    id    INT          PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(100) NOT NULL,
    price INT          NOT NULL,
    stock INT          DEFAULT 0
);

INSERT INTO product (name, price, stock) VALUES
('삼성 갤럭시 S24', 1200000, 50),
('자바 완전정복' ,     35000, 80),
('요가 매트',         45000, 150);

select *  , name as abc from product;

select *  from customer;
select *  from `order`;
select *   from product;
select *   from employee_copy3;
select *   from employees;
select *   from dept_manager;
select *   from salaries;

select e.gender , avg(salary) from employees e join salaries s on e.emp_no = s.emp_no 
where hire_date < '19900101'
group by gender;

select distinct hire_date   from employees
where hire_date between '19860101' and '19861231'
group by hire_date;


delete from product
where name = '애플 에어팟 프로';

select * from product ;
