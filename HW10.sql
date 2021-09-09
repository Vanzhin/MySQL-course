DROP DATABASE IF EXISTS coatings;
CREATE DATABASE coatings;
USE coatings;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `name` VARCHAR(50)
) COMMENT 'материалы';

DROP TABLE IF EXISTS binders; -- смолы, из которых состоят материалы
CREATE TABLE binders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	`type` ENUM ('epoxy', 'polyurethane', 'ESI', 'phenolic'),
    UNIQUE unique_type(type)
    ) COMMENT 'смолы';
    
DROP TABLE IF EXISTS coat_type; -- последовательность покрытия в системе покрытий
CREATE TABLE coat_seq (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	sequence ENUM ('primer', 'midcoat', 'topcoat'),
    UNIQUE unique_seq(sequence)
    ) COMMENT 'очередность покрытия в системе';    

DROP TABLE IF EXISTS main_data; -- основные тех характеристики
CREATE TABLE main_data (
	product_id INT UNSIGNED NOT NULL UNIQUE,
    binder_id INT UNSIGNED NOT NULL,
    volume_solid TINYINT UNSIGNED,
	standard_dft INT UNSIGNED,
    dry_to_touch DECIMAL(3,1) UNSIGNED,
	seq_id INT UNSIGNED NOT NULL,
    tolerance BIT DEFAULT 0,
	FOREIGN KEY (product_id) REFERENCES products(id),
	CHECK (volume_solid <= 100),
    FOREIGN KEY (binder_id) REFERENCES binders(id),
    FOREIGN KEY (seq_id) REFERENCES coat_seq(id)
    
) COMMENT 'основные технические данные';

DROP TABLE IF EXISTS pds; -- product data sheet (ссылка на файл с описанием материала)
CREATE TABLE pds (
	product_id INT UNSIGNED NOT NULL UNIQUE,
    filename VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

     FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT 'технические данные';

DROP TABLE IF EXISTS sds; -- safety data sheet (ссылка на файл паспорта безопасности материала)
CREATE TABLE sds (
	product_id INT UNSIGNED NOT NULL UNIQUE,
    filename VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

     FOREIGN KEY (product_id) REFERENCES products(id)
)COMMENT 'паспорт безопасности';

DROP TABLE IF EXISTS approved_tests; -- тесты и испытания для системы покрытий
CREATE TABLE approved_tests (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
	primer_id INT UNSIGNED NOT NULL, -- id грунтовочного покрытия
    primer_dft TINYINT, -- толщина пленки грунтовочного покрытия
    midcoat_id INT UNSIGNED DEFAULT NULL, 
    midcoat_dft TINYINT DEFAULT NULL,
    topcoat_id INT UNSIGNED DEFAULT NULL,
    topcoat_dft TINYINT DEFAULT NULL,
    `comments` TEXT DEFAULT NULL,    
    filename VARCHAR(255),
    issued_at DATE,
    expires_at DATE,

	FOREIGN KEY (primer_id) REFERENCES products(id),
    FOREIGN KEY (midcoat_id) REFERENCES products(id),
	FOREIGN KEY (topcoat_id) REFERENCES products(id)
) COMMENT 'сертификаты истытаний систем покрытий';

DROP TABLE IF EXISTS customers; -- заказчики
CREATE TABLE customers (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `name` VARCHAR(255)
) COMMENT 'заказчики';

DROP TABLE IF EXISTS contractors; -- подрядчики
CREATE TABLE contractors (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `name` VARCHAR(255)
) COMMENT 'подрядчики';

DROP TABLE IF EXISTS projects; -- проекты, где применялись покрытия
CREATE TABLE projects (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
	customer_id INT UNSIGNED NOT NULL,
    contractor_id INT UNSIGNED DEFAULT NULL,
    primer_id INT UNSIGNED NOT NULL, -- id грунтовочного покрытия
    primer_dft TINYINT, -- толщина пленки грунтовочного покрытия
    midcoat_id INT UNSIGNED DEFAULT NULL, 
    midcoat_dft TINYINT DEFAULT NULL,
    topcoat_id INT UNSIGNED DEFAULT NULL,
    topcoat_dft TINYINT DEFAULT NULL,
    `comments` TEXT DEFAULT NULL,
    started_at DATE,
    finished_at DATE,

	FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (contractor_id) REFERENCES contractors(id),
	FOREIGN KEY (primer_id) REFERENCES products(id),
    FOREIGN KEY (midcoat_id) REFERENCES products(id),
	FOREIGN KEY (topcoat_id) REFERENCES products(id)

) COMMENT 'проекты';
DROP TABLE IF EXISTS tsr; -- technical service representatives
CREATE TABLE tsr (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50)
) COMMENT 'технические специалисты';

DROP TABLE IF EXISTS reports; -- ссылки на отчеты по проектам
CREATE TABLE reports (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `name` VARCHAR(50),
    project_id INT UNSIGNED NOT NULL,
	filename VARCHAR(255),
	tsr_id INT UNSIGNED NOT NULL,
    started_at DATE,
    finished_at DATE,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (tsr_id) REFERENCES tsr(id)
    
) COMMENT 'отчеты инспекций';

