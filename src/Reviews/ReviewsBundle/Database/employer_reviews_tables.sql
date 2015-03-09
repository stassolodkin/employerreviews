USE employerreviews;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS employer;
CREATE TABLE employer (
   employer_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name             VARCHAR(40) NOT NULL,
   type             VARCHAR(40) NOT NULL,
   sector           VARCHAR(40) NOT NULL,
   average_rating   FLOAT(2,1),
   PRIMARY KEY (employer_id)
) ENGINE = INNODB;
ALTER TABLE employer AUTO_INCREMENT=1582792;

DROP TABLE IF EXISTS employer_type;
CREATE TABLE employer_type (
	employer_type_id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
	employer_type_name        VARCHAR(40),
	employer_type_description VARCHAR(255),
	PRIMARY KEY (employer_type_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS employer_sector;
CREATE TABLE employer_sector (
	employer_sector_id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
	employer_sector_name         VARCHAR(40),
	employer_sector_description  VARCHAR(255),
	PRIMARY KEY (employer_sector_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	user_id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
	username        VARCHAR(40) NOT NULL,
	first           VARCHAR(40) NOT NULL,
	last            VARCHAR(40) NOT NULL,
	PRIMARY KEY (user_id)
) ENGINE = INNODB;
ALTER TABLE users AUTO_INCREMENT=12792;

DROP TABLE IF EXISTS review;
CREATE TABLE review (
	review_id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
	employer_id     INT UNSIGNED NOT NULL,
	user_id         INT UNSIGNED DEFAULT NULL,
	review_positive ENUM('T','F'),
	position        VARCHAR(40),
	review_rating   TINYINT,
	review_story    TEXT,    
	PRIMARY KEY (review_id),
	FOREIGN KEY(employer_id) REFERENCES employer(employer_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id)
) ENGINE = INNODB;
ALTER TABLE users AUTO_INCREMENT=123745;


DROP TABLE IF EXISTS employer_contact;
CREATE TABLE employer_contact (
	employer_id     INT UNSIGNED NOT NULL,
	contact_id      INT UNSIGNED NOT NULL,
	UNIQUE KEY(employer_id, contact_id),
	FOREIGN KEY(employer_id) REFERENCES employer(employer_id),
	FOREIGN KEY(contact_id) REFERENCES contact_details(contact_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS user_contact;
CREATE TABLE user_contact (
	user_id         INT UNSIGNED NOT NULL,
	contact_id      INT UNSIGNED NOT NULL,
	UNIQUE KEY(user_id, contact_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(contact_id) REFERENCES contact_details(contact_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS contact_details;
CREATE TABLE contact_details (
	contact_id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
	address          VARCHAR(40),
	phone            VARCHAR(40),
	fax              VARCHAR(40),
	email            VARCHAR(40),
	PRIMARY KEY(contact_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS zip;
CREATE TABLE zip (
	zip_id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
	city             VARCHAR(40),
	country          VARCHAR(40),
	state            VARCHAR(40),
	post_code        VARCHAR(40),
	PRIMARY KEY(zip_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS contact_details_zip;
CREATE TABLE contact_details_zip (
	contact_id       INT UNSIGNED NOT NULL,
	zip_id           INT UNSIGNED NOT NULL,
	FOREIGN KEY(contact_id) REFERENCES contact_details(contact_id),
	FOREIGN KEY(zip_id) REFERENCES zip(zip_id)
) ENGINE = INNODB;

SET foreign_key_checks = 1;
