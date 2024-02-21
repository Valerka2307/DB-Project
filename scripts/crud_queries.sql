INSERT запрос для таблицы "mp.market":
-- Вставляем новую запись с информацией о магазине
INSERT INTO mp.market (market_id, location_market, market_name)
VALUES (1, 'Москва', 'Перекресток');

SELECT запрос для таблицы "mp.market":
-- Выбираем все записи из таблицы "mp.market"
SELECT * FROM mp.market;

UPDATE запрос для таблицы "mp.worker":
-- Обновляем информацию о должности работника с id=1
UPDATE mp.worker
SET job_title = 'Менеджер по продажам'
WHERE worker_id = 1;

DELETE запрос для таблицы "mp.worker":
-- Удаляем запись о работнике с id=3
DELETE FROM mp.worker
WHERE worker_id = 3;

INSERT запрос для таблицы "mp.worker":
-- Вставляем новую запись с информацией о работнике
INSERT INTO mp.worker (worker_id, market_id, first_name, second_name, salary, job_title, start_date, end_date)
VALUES (4, 1, 'Иван', 'Иванов', 50000, 'Менеджер по закупкам', '2022-01-01', '2022-12-31');

SELECT запрос для таблицы "mp.worker":
-- Выбираем всех работников из магазина с id=1
SELECT * FROM mp.worker
WHERE market_id = 1;

UPDATE запрос для таблицы "mp.market":
-- Обновляем название магазина с id=1
UPDATE mp.market
SET market_name = 'Пятерочка'
WHERE market_id = 1;

DELETE запрос для таблицы "mp.market":
-- Удаляем магазин с id=2 и всех его работников
DELETE FROM mp.worker
WHERE market_id = 2;

DELETE FROM mp.market
WHERE market_id = 2;
