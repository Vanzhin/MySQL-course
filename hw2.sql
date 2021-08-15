/*
Hw2
1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
Создал в нано .my.cnf 
MacBook-Pro-Ksenia:~ ksenia$ cat .my.cnf 
[mysql]
user=root
password=1234

2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/

create database example;
create table users(id INT(4),name VARCHAR(255));
/*
3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
Делаю дамп  example в терминале
mysqldump example > example.sql
*/
create database sample;
use sample;
source example.sql;
/*
4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
Делаю дамп  строк  help_keyword_id  от  0 до 199 таблицы  help_keyword базы данных   mysql в итерминале 
mysqldump mysql help_keyword --where="help_keyword_id <100" > 100row_help_k.sql;

Делаю дамп  первых 100 строк  таблицы  help_keyword базы данных   mysql в итерминале 
mysqldump mysql help_keyword --where="1 limit 100" > 100row_help_k.sql;

*/