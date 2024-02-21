--Вывести количество продаж каждого продукта в каждом магазине, но только тех продуктов, которые проданы более 1000 раз:
SELECT mp.market.market_name, mp.product.product_name, COUNT(*) AS sales_count
FROM mp.payment_product
JOIN mp.payment ON mp.payment_product.payment_id = mp.payment.payment_id
JOIN mp.product ON mp.payment_product.product_id = mp.product.product_id
JOIN mp.market ON mp.product.market_id = mp.market.market_id
GROUP BY mp.market.market_name, mp.product.product_name
HAVING COUNT(*) > 1000;

--Вывести информацию о работниках магазина, отсортированную по зарплате в порядке убывания:
SELECT *
FROM mp.worker
ORDER BY salary DESC;

--Вывести суммарную стоимость каждого товара, отсортированных по убыванию,
--с учетом скидки, находящихся на всех магазинах:
SELECT 
    p.product_id,
    p.product_name,
    SUM(p.price * pp.count * (100 - p.discount) / 100) OVER (ORDER BY p.price * pp.count * (100 - p.discount) / 100 DESC) AS total_price
FROM 
    mp.product p
    JOIN mp.payment_product pp ON p.product_id = pp.product_id;
    
--Вывести количество проданных единиц каждого товара в каждом магазине,
--отсортированных по убыванию:
SELECT 
    p.market_id, 
    p.product_id,
    p.product_name,
    SUM(pp.count) OVER (PARTITION BY p.market_id, p.product_id) AS total_count
FROM 
    mp.product p 
    JOIN mp.payment_product pp ON p.product_id = pp.product_id
ORDER BY 
    total_count DESC;
    
--Вывести зарплату каждого сотрудника, отсортированных по возрастанию зарплаты,
--с указанием средней зарплаты по его должности:
SELECT 
    w.worker_id, 
    w.first_name, 
    w.second_name, 
    w.salary, 
    AVG(w.salary) OVER (PARTITION BY w.job_title) AS avg_salary
FROM 
    mp.worker w
ORDER BY 
    w.salary;
    
--Вывести номера заказов, сумму каждого заказа и процент от общей суммы заказов по клиенту,
--упорядоченные по убыванию процента:
SELECT 
    p.payment_id,
    p.sum_price,
    100 * p.sum_price / SUM(p.sum_price) OVER (PARTITION BY p.customer_id) AS percent
FROM 
    mp.payment p
ORDER BY 
    percent DESC;

--Вывести дату каждого платежа, а также сумму всех платежей, произведенных в этот день,
--отсортированных по дате:
SELECT 
    p.date_payment, 
    SUM(p.sum_price) OVER (PARTITION BY p.date_payment) AS total_sum
FROM 
    mp.payment p
ORDER BY 
    p.date_payment;

