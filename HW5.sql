-- HW5 Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”
/* 1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.*/

UPDATE  users
SET created_at = NOW(); -- поскольку в updated_at  имеет схему DATETIME ON UPDATE CURRENT_TIMESTAMP, то запись автоматически вставляется при обновлении

/*
2 Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время 
помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, 
сохранив введеные ранее значения.

*/

UPDATE users
SET created_at =  STR_TO_DATE(created_at,'%d.%m.%Y %h:%i');
ALTER TABLE users
MODIFY COLUMN created_at DATETIME DEFAULT NOW(),
MODIFY COLUMN updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP;
/* 3
В таблице складских запасов storehouses_products в поле value могут 
встречаться самые разные цифры: 0, если товар закончился и выше нуля, 
если на складе имеются запасы. Необходимо отсортировать записи таким образом,
 чтобы они выводились в порядке увеличения значения value. 
 Однако, нулевые запасы должны выводиться в конце, после всех записей.

*/
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `value` INT,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO `storehouses_products` (`id`,`value`) VALUES (1,31),(2,41),(3,31),(4,11),(5,15),(6,15),(7,19),(8,12),(9,0),(10,0);
SELECT id, value,
IF(
	value > 0,
	TRUE,
	FALSE
  ) AS in_stock from storehouses_products
 
ORDER BY in_stock DESC, value ASC;-- ввел новый столбец для того, чтобы сделать вторую сортировку по нему

/* 4
(по желанию) Из таблицы users необходимо извлечь пользователей, 
родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')
*/
SELECT (SELECT CONCAT(firstname, ' ', lastname) FROM users WHERE id = user_id) AS name,
MONTHNAME(birthday) AS month_of_birth 
FROM profiles 
HAVING month_of_birth IN ('May', 'August');

/* 5 (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

*/
SELECT * FROM users WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5,1,2);

/*
Практическое задание теме “Агрегация данных”
1 Подсчитайте средний возраст пользователей в таблице users
*/
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS age -- поскольку дата рождения в таблице profiles, использовал ее для подстчета
FROM profiles;
/*

2 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
SELECT GROUP_CONCAT(user_id),
COUNT(*), 
DAYNAME(CONCAT(YEAR(NOW()), '-', MONTH(birthday), '-',DAY(birthday))) AS birthday_in_this_year
 FROM profiles GROUP BY birthday_in_this_year;

/*

3 (по желанию) Подсчитайте произведение чисел в столбце таблицы
*/
DROP TABLE IF EXISTS test3;
CREATE TABLE test3 (
    `value` INT
);
INSERT INTO `test3` (`value`) VALUES (1),(2),(3),(4),(5);

SELECT ROUND(EXP(SUM(LOG(value)))) FROM test3; -- взял формулу в интернете.