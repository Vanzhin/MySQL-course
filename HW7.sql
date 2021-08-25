/* HW7
1
Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/
SELECT name FROM users WHERE id IN (SELECT DISTINCT user_id FROM orders);

/* 
2
Выведите список товаров products и разделов catalogs, который соответствует товару.
*/
SELECT products.name, catalogs.name  FROM products JOIN catalogs ON catalog_id = catalogs.id;

/* 
3
(по желанию) Пусть имеется таблица рейсов flights (id, from, to) 
и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, 
поле name — русское. Выведите список рейсов flights с русскими названиями городов.
*/
/* DROP DATABASE IF EXISTS test_for_HW7;
CREATE DATABASE test_for_HW7;
USE test_for_HW7;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `from` VARCHAR(50),
    `to` VARCHAR(50),
     INDEX from_idx(`from`)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `label` VARCHAR(50) UNIQUE,
    `name` VARCHAR(50)
);
INSERT INTO `flights` (`id`,`from`,`to`) VALUES (1,"moscow","omsk"),(2,"novgorod","kazan"),(3,"irkutsk","moscow"), (4,"omsk","irkutsk"),(5,"moscow","kazan") ;
INSERT INTO `cities` (`id`,`label`,`name`) VALUES (1,"moscow","москва"),(2,"irkutsk","иркутск"),(3,"novgorod","новгород"), (4,"kazan","казань"),(5,"omsk","омск") ;
*/

SELECT t1.from_rus, cities.name AS to_rus FROM (SELECT flights.from AS from_eng, flights.to AS to_eng,cities.name AS from_rus FROM flights 
JOIN cities ON (flights.from = cities.label) 
ORDER BY flights.id) AS t1 JOIN cities ON t1.to_eng = cities.label;



