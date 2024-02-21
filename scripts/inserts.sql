INSERT INTO mp.market (market_id, location_market, market_name) VALUES
(1, 'Moscow', 'Auchan'),
(2, 'Saint-Petersburg', 'Okey'),
(3, 'Kazan', 'Metro'),
(4, 'Nizhny Novgorod', 'Lenta'),
(5, 'Novosibirsk', 'Azbuka Vkusa'),
(6, 'Rostov-on-Don', 'Magnit'),
(7, 'Ekaterinburg', 'Perekrestok'),
(8, 'Samara', 'Leroy Merlin'),
(9, 'Krasnoyarsk', 'Ozon'),
(10, 'Voronezh', 'Globus');

INSERT INTO mp.worker (worker_id, market_id, first_name, second_name, salary, job_title, start_date, end_date) VALUES
(1, 1, 'Иван', 'Иванов', 50000, 'Кассир', '2021-01-01', NULL),
(2, 1, 'Петр', 'Петров', 60000, 'Менеджер по продажам', '2020-03-15', NULL),
(3, 2, 'Анна', 'Сидорова', 45000, 'Продавец', '2021-02-01', '2022-05-15'),
(4, 2, 'Михаил', 'Кузнецов', 70000, 'Директор магазина', '2020-01-01', NULL),
(5, 3, 'Елена', 'Смирнова', 55000, 'Кассир', '2021-03-01', NULL),
(6, 3, 'Дмитрий', 'Иванов', 45000, 'Продавец', '2020-05-01', NULL),
(7, 4, 'Сергей', 'Ковалев', 65000, 'Менеджер по закупкам', '2020-02-01', '2022-04-30'),
(8, 4, 'Наталья', 'Петрова', 50000, 'Кассир', '2021-04-01', NULL),
(9, 5, 'Ольга', 'Иванова', 55000, 'Продавец', '2020-12-01', NULL),
(10, 5, 'Владимир', 'Смирнов', 60000, 'Директор магазина', '2021-01-01', NULL);

INSERT INTO mp.customer(customer_id, first_name, second_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Doe'),
(3, 'Bob', 'Smith'),
(4, 'Alice', 'Johnson'),
(5, 'David', 'Brown'),
(6, 'Sarah', 'Lee'),
(7, 'Michael', 'Wang'),
(8, 'Emily', 'Davis'),
(9, 'Alex', 'Taylor'),
(10, 'Olivia', 'Garcia');

INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (1, 100);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (2, 50);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (3, 75);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (4, 200);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (5, 25);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (6, 150);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (7, 80);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (8, 120);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (9, 90);
INSERT INTO mp.card_loyality (loyality_card_id, bonus) VALUES (10, 60);

INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (1, 1, 2);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (1, 2, 1);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (2, 3, 4);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (2, 4, 2);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (3, 1, 1);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (3, 5, 3);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (4, 2, 3);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (4, 6, 1);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (5, 3, 1);
INSERT INTO mp.payment_product(payment_id, product_id, count) VALUES (5, 4, 1);

INSERT INTO mp.payment(payment_id, casier_id, customer_id, date_payment, sum_price, loyality_card_id) VALUES
(1, 2, 3, '2022-04-01', 25.99, NULL),
(2, 4, 5, '2022-04-02', 10.50, NULL),
(3, 1, 3, '2022-04-03', 19.99, 1),
(4, 2, 6, '2022-04-04', 50.00, 2),
(5, 5, 8, '2022-04-05', 12.99, NULL),
(6, 1, 2, '2022-04-06', 35.75, 3),
(7, 3, 4, '2022-04-07', 7.99, NULL),
(8, 4, 6, '2022-04-08', 23.50, NULL),
(9, 2, 9, '2022-04-09', 18.00, 4),
(10, 1, 7, '2022-04-10', 5.99, NULL);

INSERT INTO mp.product(product_id, market_id, product_name, price, discount, count_product) VALUES
(1, 1, 'Banana', 20, 0, 100),
(2, 1, 'Apple', 30, 0, 50),
(3, 1, 'Orange', 25, 5, 75),
(4, 2, 'Milk', 50, 0, 40),
(5, 2, 'Eggs', 15, 0, 100),
(6, 2, 'Cheese', 100, 10, 20),
(7, 3, 'Bread', 25, 0, 60),
(8, 3, 'Butter', 70, 5, 30),
(9, 3, 'Yogurt', 40, 0, 50),
(10, 4, 'Water', 10, 0, 120);
