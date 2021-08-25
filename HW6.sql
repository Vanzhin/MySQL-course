/* HW6
1 Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).
*/
-- пусть некоторым юзером будет id = 2
SELECT CONCAT(firstname, ' ',lastname) AS name 
FROM users 
WHERE id = (SELECT from_user_id FROM messages WHERE to_user_id = 2 GROUP BY from_user_id ORDER BY COUNT(*) DESC LIMIT 1) ;

/* 
2 Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/
SELECT COUNT(*), GROUP_CONCAT(user_id) 
FROM likes 
WHERE user_id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW())<10);

/* 
3 Определить, кто больше поставил лайков (всего): мужчины или женщины.
*/
-- выбираю количество лайков у мужчин и у женщин, соединняю в одну таблицу, затем выбираю строчку с максимальным значением, в моем случае ничья, выводится две строчки
SELECT like_quantity, quantity_for
FROM (SELECT COUNT(*) AS like_quantity, 'men' AS quantity_for -- количество лайков поставили мужчины
		FROM likes 
		WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'M')
		UNION
		SELECT COUNT(*) AS like_quantity, 'women' AS quantity_for -- количество лайков поставили женщины
		FROM likes 
		WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'F')) likes_m_f 
WHERE like_quantity = (
	SELECT MAX(like_quantity) -- максимальное значение лайков
	FROM (SELECT COUNT(*) AS like_quantity, 'men' AS quantity_for -- количество лайков поставили мужчины
			FROM likes 
			WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'M')
			UNION
			SELECT COUNT(*) AS like_quantity, 'women' AS quantity_for -- количество лайков поставили женщины
			FROM likes 
			WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'F')) max_likes_m_f);