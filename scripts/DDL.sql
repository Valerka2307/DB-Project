CREATE SCHEMA IF NOT EXISTS mp;

CREATE TABLE IF NOT EXISTS mp.market(
market_id INT,
location_market VARCHAR(256),
market_name VARCHAR(32),
PRIMARY KEY (market_id)
);

CREATE TABLE IF NOT EXISTS mp.worker(
worker_id INT,
market_id INT,
first_name VARCHAR(128),
second_name VARCHAR(128),
salary INT,
job_title VARCHAR(128),
start_date DATE,
end_date DATE,
PRIMARY KEY (worker_id),
FOREIGN KEY(market_id)
REFERENCES mp.market(market_id)
);

CREATE TABLE IF NOT EXISTS mp.customer(
customer_id INT,
first_name VARCHAR(128),
second_name VARCHAR(128),
PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS mp.product(
product_id INT,
market_id INT,
product_name VARCHAR(128),
price INT,
discount INT,
count_product INT,
PRIMARY KEY (product_id),
FOREIGN KEY(market_id)
REFERENCES mp.market(market_id)
);

CREATE TABLE IF NOT EXISTS mp.card_loyality(
loyality_card_id INT,
bonus INT,
PRIMARY KEY (loyality_card_id)
);

CREATE TABLE IF NOT EXISTS mp.payment(
payment_id INT,
casier_id INT,
customer_id INT,
date_payment VARCHAR(10),
sum_price DOUBLE PRECISION,
loyality_card_id INT,
PRIMARY KEY (payment_id),
FOREIGN KEY(customer_id)
REFERENCES mp.customer(customer_id),
FOREIGN KEY(casier_id)
REFERENCES mp.worker(worker_id),
FOREIGN KEY(loyality_card_id)
REFERENCES mp.card_loyality(loyality_card_id)
);

CREATE TABLE IF NOT EXISTS mp.payment_product(
payment_id INT,
product_id INT,
count INT,
PRIMARY KEY (payment_id, product_id),
FOREIGN KEY(payment_id)
REFERENCES mp.payment(payment_id),
FOREIGN KEY(product_id)
REFERENCES mp.product(product_id)
);

