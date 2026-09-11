DROP DATABASE IF EXISTS convenience_store;
CREATE DATABASE convenience_store;
USE convenience_store;

-- ========================================
-- 1. 상품 테이블
-- ========================================
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    barcode VARCHAR(50) NOT NULL UNIQUE,
    expiration_date DATE,
    stock INT NOT NULL DEFAULT 0,
    category VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE
);


-- ========================================
-- 2. 주문 테이블
-- ========================================
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_type VARCHAR(20) NOT NULL,
    total_price INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- ========================================
-- 3. 주문 상품 테이블
-- ========================================
CREATE TABLE order_item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_price INT NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);


-- ========================================
-- 4. 입고/발주 테이블
-- ========================================
CREATE TABLE purchase (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price INT NOT NULL,
    total_price INT NOT NULL,

    FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);


-- ========================================
-- 5. 관리자 테이블
-- ========================================
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    login_id VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- 관리자
INSERT INTO admin
(login_id, password, name)
VALUES
('admin01', '1234', '김관리');


-- 상품
INSERT INTO product
(product_name, price, barcode, expiration_date, stock, category, status)
VALUES
('삼각김밥', 1500, '880100000001', '2026-09-15', 20, '식품', TRUE),
('콜라', 2000, '880100000002', '2027-03-10', 30, '음료', TRUE),
('생수', 1000, '880100000003', '2028-01-20', 50, '음료', TRUE),
('감자칩', 1800, '880100000004', '2027-06-15', 15, '과자', TRUE),
('초코바', 1200, '880100000005', '2027-08-10', 25, '과자', TRUE),
('샌드위치', 3500, '880100000006', '2026-09-13', 8, '식품', TRUE),
('캔커피', 2500, '880100000007', '2027-02-20', 12, '음료', TRUE),
('컵라면', 1500, '880100000008', '2027-05-30', 3, '식품', TRUE),
('초콜릿', 2000, '880100000009', '2027-11-20', 18, '과자', TRUE),
('우유', 2200, '880100000010', '2026-09-14', 10, '음료', TRUE),
('젤리', 1200, '880100000011', '2021-05-14', 0, '과자', FALSE);


-- 주문
INSERT INTO orders
(payment_type, total_price)
VALUES
('CARD', 5500),
('CARD', 4000),
('CASH', 3600),
('CARD', 6200),
('CARD', 3700);


-- 주문 상품
INSERT INTO order_item
(order_id, product_id, quantity, order_price)
VALUES
(1, 2, 2, 2000),
(1, 1, 1, 1500),

(2, 3, 2, 1000),
(2, 4, 1, 1800),

(3, 4, 2, 1800),

(4, 5, 2, 1200),
(4, 6, 1, 3500),

(5, 7, 1, 2500),
(5, 8, 1, 1500);


-- 발주
INSERT INTO purchase
(product_id, quantity, unit_price, total_price)
VALUES
(8, 20, 1000, 20000),
(6, 10, 2500, 25000),
(4, 120, 1200, 144000),
(3, 30, 500, 15000),
(1, 20, 1000, 20000),
(10, 20, 1500, 30000);


start transaction;

update purchase set quantity = quantity - 10  , total_price = quantity * unit_price
where product_id = 1;

insert into purchase(product_id , quantity , unit_price , total_price)
values(2 , 22 , 2000 ,  22 * 2000);


select p.product_id ,  pr.product_name  , p.quantity , p.unit_price
from purchase p join product pr on p.product_id = pr.product_id;      

select p.product_id , p.quantity , p.unit_price , pr.product_name from purchase p join product pr 
on p.product_id = pr.product_id;

update purchase set quantity = 20 , total_price = quantity * unit_price
where product_id = 1;

rollback;

select p.product_id , pr.product_name ,  p.quantity , p.total_price  
                            from purchase p join product pr on p.product_id = pr.product_id
                            where pr.product_id = 1;     
                            
select price from product 
where product_id = 1;

select * from admin;
select * from order_item;
select * from orders;
select * from product;
select * from purchase;

select * , pr.product_name
                    from purchase p join product pr on p.product_id = pr.product_id
                    where p.product_id = 1;

delete from purchase where purchase_id = 11;
