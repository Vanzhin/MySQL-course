/* HW9
Практическое задание по теме “Транзакции, переменные, представления”
1.1
В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

*/
USE shop;
START TRANSACTION;
DELETE FROM sample.users WHERE id = 1;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

/* 1.2
Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs.*/

DROP VIEW IF EXISTS prod_cat_name;
CREATE VIEW prod_cat_name AS 
SELECT products.name AS product_name, catalogs.name AS catalog_name 
	FROM products 
	JOIN catalogs 
    ON products.catalog_id = catalogs.id;

/* 1.3
по желанию) Пусть имеется таблица с календарным полем created_at. 
В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
если дата присутствует в исходном таблице и 0, если она отсутствует.*/
START TRANSACTION;
DROP PROCEDURE IF EXISTS FillCalendar; -- создаю процедуру, которая заполняет таблицу calendar
DROP TEMPORARY TABLE IF EXISTS calendar;
CREATE TEMPORARY TABLE IF NOT EXISTS calendar(calendar_date DATE NOT NULL);

DELIMITER $$
    CREATE PROCEDURE FillCalendar(start_date DATE, end_date DATE)
    BEGIN
    DECLARE crt_date DATE;
    SET crt_date = start_date;
    WHILE crt_date <= end_date DO
        INSERT IGNORE INTO calendar VALUES(crt_date);
        SET crt_date = ADDDATE(crt_date, INTERVAL 1 DAY);
    END WHILE;
    END$$
DELIMITER ;

CALL FillCalendar('2021-08-01', '2021-08-31');-- вызываю процедуру

SELECT calendar_date, -- выполняю запрос, который сравнивает месяца и число таблице calendar, и заданные в упражнении
CASE
    WHEN DATE_FORMAT(calendar_date,'%m-%d') IN (DATE_FORMAT('2018-08-01','%m-%d'),DATE_FORMAT('2016-08-04','%m-%d'), DATE_FORMAT('2018-08-16','%m-%d'), DATE_FORMAT('2018-08-17','%m-%d'))
        THEN '1'
		ELSE '0'
	END AS is_in
 FROM calendar 
COMMIT;
    
/*
1.4
(по желанию) Пусть имеется любая таблица с календарным полем created_at. 
Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
*/

START TRANSACTION;
DROP TEMPORARY TABLE IF EXISTS test_orders; 
CREATE TEMPORARY TABLE IF NOT EXISTS test_orders SELECT * FROM orders;-- создаю временную таблицу для выполнения задания
CREATE OR REPLACE ALGORITHM = TEMPTABLE VIEW first_5 AS SELECT * FROM orders ORDER BY created_at DESC LIMIT 5;-- создаю представление для 5-ти первых дат
SELECT @last5 := created_at FROM first_5; -- присваиваю переменной последнее значение из 5-ти дат
DELETE FROM test_orders WHERE created_at < @last5;-- удаляю все записи позже @last5
COMMIT;

/*
Практическое задание по теме “Администрирование MySQL” (эта тема изучается по вашему желанию)

2.1
Создайте двух пользователей которые имеют доступ к базе данных shop. 
Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
второму пользователю shop — любые операции в пределах базы данных shop.

*/
DROP USER IF EXISTS shop_read, shop;
CREATE USER shop_read IDENTIFIED WITH sha256_password BY'1234';
CREATE USER shop IDENTIFIED WITH sha256_password BY'1234';
GRANT ALL ON shop.* TO shop;
GRANT SELECT ON shop.* TO shop_read;

/*
Практическое задание по теме “Администрирование MySQL” (эта тема изучается по вашему желанию)

2.2
(по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, 
содержащие первичный ключ, имя пользователя и его пароль. 
Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, 
мог бы извлекать записи из представления username.

*/
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  password VARCHAR(50),
  PRIMARY KEY (id)
);
INSERT INTO accounts VALUES (1,'John', '1234'),(2,'Nick','1234'),(3,'Pete','1234'),(4,'Bob','1234'),(5,'Fedor','1234');
DROP VIEW IF EXISTS username;
CREATE VIEW username AS 
SELECT id, name FROM accounts;

DROP USER IF EXISTS shop_read;
CREATE USER shop_read IDENTIFIED WITH sha256_password BY'1234';
GRANT USAGE, SELECT ON shop.username TO shop_read;

/* 3.1
Практическое задание по теме “Хранимые процедуры и функции, триггеры"
Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", 
с 00:00 до 6:00 — "Доброй ночи".
*/
DROP PROCEDURE IF EXISTS hello;
DELIMITER //
CREATE PROCEDURE hello()
BEGIN
	IF (HOUR(NOW()) >= 6 AND HOUR(NOW()) < 12) THEN
		SELECT 'Доброе утро';
	ELSEIF (HOUR(NOW()) >= 12 AND HOUR(NOW()) < 18) THEN
		SELECT 'Добрый день';
	ELSEIF (HOUR(NOW()) >= 18 AND HOUR(NOW()) <= 23) THEN
		SELECT 'Добрый вечер';
	ELSEIF (HOUR(NOW()) >= 0 AND HOUR(NOW()) < 6) THEN
		SELECT 'Доброй ночи';
	END IF;
END //
DELIMITER ;

CALL hello();

/*3.2
В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL
неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
 При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/

DROP TRIGGER IF EXISTS name_desc_check_insert;
DELIMITER //
CREATE TRIGGER name_desc_check_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF COALESCE(NEW.name, NEW.description) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled. NULL values can not be set for both name and description';
    END IF;
END//
DELIMITER ;
-- проверка триггера на вставку двух значений NULL
-- INSERT INTO products VALUES (14,NULL, NULL,7890.00,1,'2021-08-25 07:31:01','2021-08-25 07:31:01');

DROP TRIGGER IF EXISTS name_desc_check_update;
DELIMITER //
CREATE TRIGGER name_desc_check_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF (COALESCE(NEW.name, NEW.description) OR COALESCE(NEW.name, OLD.description) OR COALESCE(OLD.name, NEW.description)) IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled. NULL values can not be set/update for both name and description';
    END IF;
END//
DELIMITER ;
-- проверка на обновления значений по одиночке и сразу двух
-- UPDATE products SET name = NULL WHERE id=1; 
-- UPDATE products SET description = NULL WHERE id=1; 
-- UPDATE products SET name = NULL, description = NULL WHERE id=1; 
/*
3.3
(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
Вызов функции FIBONACCI(10) должен возвращать число 55.
*/
DROP PROCEDURE IF EXISTS fibonacci;
DELIMITER //
CREATE PROCEDURE fibonacci(IN num INT)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE prev INT DEFAULT 0;
	DECLARE next INT DEFAULT 1;
    IF (num > 0) THEN
		WHILE i < num DO
			SET next = prev + next;
            SET prev = next - prev;
            SET i = i + 1;
		END WHILE;
         SELECT i,prev AS 'число Фибоначчи';
	ELSE
		SELECT 'Ошибочное входного значение';
	END IF;
   
END //
DELIMITER ;

CALL fibonacci(10);


