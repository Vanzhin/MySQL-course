/*
HW4
i. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
v. Написать название темы курсового проекта (в комментарии)
*/
-- i. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
INSERT INTO `users` (`id`,`firstname`,`lastname`,`email`,`password_hash`,`phone`) VALUES (1,"Hector","Frederick","elementum.purus.accumsan@Nullamsuscipit.co.uk","-0.3705596202",79991827486),(2,"Kirk","Rios","neque@temporlorem.edu","0.2811425208",79991856344),(3,"Damian","Peterson","Mauris@quis.edu","-0.3359333904",79992322305),(4,"Cairo","Kemp","facilisis@tacitisociosqu.org","0.0626461216",79993156826),(5,"Yael","Frank","neque.sed.dictum@mattis.com","0.1749376519",79991208730),(6,"Merrill","Moran","ornare.egestas@mollis.net","0.2087485166",79991365249),(7,"Sacha","Craft","egestas.a.scelerisque@Inscelerisque.co.uk","-0.038419763",79992470463),(8,"Zeph","Bean","vitae@convallisantelectus.co.uk","-0.1420279559",79992683322),(9,"Juliet","Watson","id.blandit@quis.org","-0.0126404341",79992108701),(10,"Nina","Chambers","non.arcu@arcu.com","-0.3145267504",79991266645);
INSERT INTO `profiles` (`user_id`,`gender`,`birthday`,`photo_id`,`hometown`) VALUES (1,"F","2001-05-07",NULL,"Newark"),(2,"F","2007-04-30",NULL,"Pointe-Claire"),(3,"M","2000-12-23",NULL,"Foz do Iguaçu"),(4,"F","2009-11-15",NULL,"Diamer"),(5,"F","2010-08-03",NULL,"Pak Pattan"),(6,"F","2001-02-10",NULL,"Illkirch-Graffenstaden"),(7,"M","2009-04-30",NULL,"Binjai"),(8,"F","2003-01-12",NULL,"Colli a Volturno"),(9,"M","2015-10-03",NULL,"Wichita"),(10,"M","2002-01-23",NULL,"Charlottetown");
INSERT INTO `messages` (`id`,`from_user_id`,`to_user_id`,`body`) VALUES (1,4,10,"massa. Mauris vestibulum, neque sed dictum eleifend,"),(2,8,2,"Ut nec urna et arcu imperdiet ullamcorper. Duis at"),(3,3,4,"ornare egestas ligula. Nullam feugiat placerat velit."),(4,2,3,"Fusce aliquet magna a neque. Nullam ut"),(5,8,2,"Donec egestas. Aliquam nec enim. Nunc"),(6,8,1,"eu elit. Nulla facilisi. Sed neque. Sed"),(7,2,3,"nisi sem semper"),(8,10,2,"molestie. Sed id risus quis diam luctus"),(9,4,3,"id nunc interdum"),(10,1,2,"venenatis lacus. Etiam bibendum fermentum");
INSERT INTO `friend_requests` (`initiator_user_id`,`target_user_id`,`status`) VALUES (3,5,"requested"),(8,4,"requested"),(4,5,"requested"),(1,6,"requested"),(8,1,"requested"),(3,2,"requested"),(4,10,"requested"),(8,3,"requested"),(9,1,"requested"),(1,10,"requested");
INSERT INTO `communities` (`id`,`name`,`admin_user_id`) VALUES (1,"Nullam ut nisi a",6),(2,"Donec feugiat metus sit",4),(3,"nisi. Aenean eget metus. In nec orci. Donec nibh.",7),(4,"natoque",6),(5,"Donec tempor, est ac mattis semper, dui lectus",7),(6,"dui. Cras pellentesque. Sed dictum.",2),(7,"adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl",5),(8,"purus, accumsan interdum libero dui",4),(9,"felis orci, adipiscing non,",8),(10,"sapien imperdiet ornare.",3);
INSERT INTO `users_communities` (`user_id`,`community_id`) VALUES (5,5),(8,4),(5,3),(9,6),(5,1),(9,2),(1,5),(1,9),(8,3),(10,8);
INSERT INTO `media_types` (`id`,`name`) VALUES (1,"video"),(2,"audio");
INSERT INTO `media` (`id`,`media_type_id`,`user_id`,`body`,`filename`,`size`,`metadata`) VALUES (1,1,4,"ullamcorper.","Curae; Donec",49,'[{"test":"test"}]'),(2,1,9,"amet","Quisque imperdiet,",16,'[{"test":"test"}]'),(3,2,9,"semper","tempus eu,",249,'[{"test":"test"}]'),(4,2,9,"magna","Sed auctor",25,'[{"test":"test"}]'),(5,2,3,"elementum purus, accumsan interdum libero dui nec","erat volutpat.",257,'[{"test":"test"}]'),(6,2,9,"In lorem. Donec elementum, lorem ut aliquam","sem semper",161,'[{"test":"test"}]'),(7,1,6,"orci","et risus.",99,'[{"test":"test"}]'),(8,2,2,"scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est.","bibendum. Donec",247,'[{"test":"test"}]'),(9,1,7,"luctus. Curabitur egestas nunc","turpis nec",90,'[{"test":"test"}]'),(10,1,5,"placerat, orci lacus vestibulum","Ut nec",258,'[{"test":"test"}]');
INSERT INTO `likes` (`id`,`user_id`,`media_id`) VALUES (1,5,1),(2,2,1),(3,7,1),(4,9,2),(5,4,2),(6,6,2),(7,10,1),(8,7,2),(9,10,1),(10,2,2);
INSERT INTO `photo_albums` (`id`,`name`,`user_id`) VALUES (1,"arcu",2),(2,"Quisque",10),(3,"Aliquam vulputate",1),(4,"Ut tincidunt",3),(5,"pellentesque.",3),(6,"ipsum primis",3),(7,"non,",3),(8,"leo. Morbi",6),(9,"accumsan convallis,",2),(10,"sagittis lobortis",6);
INSERT INTO `photos` (`id`,`album_id`,`media_id`) VALUES (1,8,1),(2,5,1),(3,9,2),(4,9,1),(5,8,1),(6,1,2),(7,3,1),(8,4,2),(9,6,2),(10,9,2);
INSERT INTO `login_info` (`user_id`,`device`,`ip_adress`) VALUES (6,"tablet",716917430572),(9,"desktop",502897801597),(2,"mobile",783190069311),(9,"mobile",653238321182),(1,"tablet",525613095145),(3,"desktop",166684175266),(8,"tablet",735914175186),(8,"desktop",787902385360),(10,"tablet",798908020015),(1,"desktop",135744430045);
INSERT INTO `user_subscribers` (`user_id`,`user_subscriber_id`,`status`) VALUES (1,7,"unsubscribed"),(9,8,"unsubscribed"),(9,7,"subscribed"),(6,9,"unsubscribed"),(8,7,"subscribed"),(2,5,"subscribed"),(5,3,"subscribed"),(9,8,"unsubscribed"),(3,8,"unsubscribed"),(6,7,"subscribed");
INSERT INTO `password_log` (`user_id`,`new_password_hash`,`mode`) VALUES (4,3965700128556109,"via phone"),(8,7870888428003086,"via email"),(6,3781839455721108,"direct"),(7,914360860041911,"via phone"),(9,352415949025765,"via email"),(9,9608530077516705,"via email"),(8,1241007101078884,"via email"),(3,4868700841219771,"via email"),(2,1572248463148584,"direct"),(9,9536621136363580,"via phone");

-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT DISTINCT firstname from users ORDER BY firstname ASC;

-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
UPDATE profiles 
SET is_active = 0
WHERE ((YEAR(CURDATE()) - YEAR(birthday)) - (RIGHT(CURDATE(),5)<RIGHT(birthday,5)))<18;
select * from profiles;
-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
DELETE FROM messages
WHERE 	created_at > NOW();




















