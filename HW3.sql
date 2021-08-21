DROP TABLE IF EXISTS `login_info`;
CREATE TABLE `login_info` (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    device VARCHAR(100),
    ip_adress VARCHAR(15),
    login_date DATETIME DEFAULT NOW(),
    
	PRIMARY KEY (user_id, ip_adress),
	FOREIGN KEY (user_id) REFERENCES users(id)

	
);
DROP TABLE IF EXISTS `user_subscribers`;
CREATE TABLE `user_subscribers` (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	user_subscriber_id BIGINT UNSIGNED NOT NULL,
    `status` ENUM('subscribed', 'unsubscribed'), # DEFAULT 'subscribed',
	subscribed_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (user_subscriber_id) REFERENCES users(id)-- ,
    -- CHECK (initiator_user_id <> target_user_id)
);

DROP TABLE IF EXISTS `password_log`;
CREATE TABLE `password_log` (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	new_password_hash VARCHAR(100),
    changed_at DATETIME DEFAULT NOW(),
	`mode` ENUM('direct', 'via email', 'via phone'),
    
	FOREIGN KEY (user_id) REFERENCES users(id)
    

);