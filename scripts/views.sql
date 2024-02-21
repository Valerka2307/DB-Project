--Представление, скрывающее поля с персональными данными клиентов из таблицы mp.customer
CREATE VIEW mp.customer_view AS
SELECT customer_id, '***' AS first_name, '***' AS second_name
FROM mp.customer;

--Представление, скрывающее технические поля из таблицы mp.payment
CREATE VIEW mp.payment_view AS
SELECT payment_id, casier_id, customer_id, date_payment, sum_price, '***' AS loyality_card_id
FROM mp.payment;

--Представление, скрывающее поля с персональными данными клиентов и технические поля из таблицы mp.payment
CREATE VIEW mp.payment_customer_view AS
SELECT payment_id, casier_id, '***' AS customer_id, date_payment, sum_price
FROM mp.payment;

--Представление, соединяющее таблицы mp.payment и mp.payment_product
--для получения информации о продажах продуктов по датам
CREATE VIEW mp.sales_by_date AS
SELECT p.date_payment, SUM(pp.count) AS total_count, SUM(p.sum_price) AS total_price
FROM mp.payment p
JOIN mp.payment_product pp ON p.payment_id = pp.payment_id
GROUP BY p.date_payment;

--Представление для получения статистики продаж каждого работника
CREATE VIEW mp.worker_sales_stats AS
SELECT
    w.worker_id,
    CONCAT(w.first_name, ' ', w.second_name) AS full_name,
    m.market_name,
    COUNT(DISTINCT p.payment_id) AS total_orders,
    SUM(p.sum_price) AS total_sales
FROM
    mp.worker w
    JOIN mp.payment p ON w.worker_id = p.casier_id
    JOIN mp.market m ON m.market_id = w.market_id
GROUP BY
    w.worker_id,
    full_name,
    m.market_name;

--Представление для получения списка продуктов каждого магазина
CREATE VIEW mp.market_products AS
SELECT
    m.market_name,
    p.product_id,
    p.product_name,
    p.price,
    p.discount,
    p.count_product
FROM
    mp.market m
    JOIN mp.product p ON m.market_id = p.market_id;
