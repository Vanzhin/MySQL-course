/* HW8
1 Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).
*/
-- пусть некоторым юзером будет id = 2

SELECT count(*) cnt, CONCAT(firstname, ' ',lastname) AS name 
FROM users JOIN messages
ON users.id = from_user_id
WHERE to_user_id = 2
GROUP BY users.id
ORDER BY cnt DESC
LIMIT 1;

/* 
2 Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/

SELECT COUNT(*) AS cnt, GROUP_CONCAT(likes.user_id) AS user_ids
FROM likes JOIN profiles ON likes.user_id = profiles.user_id 
WHERE TIMESTAMPDIFF(YEAR, profiles.birthday, NOW())<10;

/* 
3 Определить, кто больше поставил лайков (всего): мужчины или женщины.
*/
-- выбираю количество лайков у мужчин и у женщин, соединняю в одну таблицу, затем выбираю строчку с максимальным значением, в моем случае ничья, выводится две строчки
SELECT gender, MAX(cnt) FROM 
(SELECT gender, COUNT(*) AS cnt  FROM likes 
JOIN profiles ON likes.user_id = profiles.user_id
GROUP BY gender) AS t1
GROUP BY gender;
