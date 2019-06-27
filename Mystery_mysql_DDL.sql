CREATE TABLE `User` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL UNIQUE,
	`name` varchar(100) NOT NULL,
	`surname` varchar(100) NOT NULL,
	`bio` varchar(500),
	`frequency` varchar(100),
	`rating` INT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Interest` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`definition` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Cuisine` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`definition` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `User_Interest` (
	`user_id` INT NOT NULL,
	`interest_id` INT NOT NULL
);

CREATE TABLE `User_Cuisine` (
	`user_id` INT NOT NULL,
	`cuisine_id` INT NOT NULL
);

ALTER TABLE `User_Interest` ADD CONSTRAINT `User_Interest_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `User_Interest` ADD CONSTRAINT `User_Interest_fk1` FOREIGN KEY (`interest_id`) REFERENCES `Interest`(`id`);

ALTER TABLE `User_Cuisine` ADD CONSTRAINT `User_Cuisine_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `User_Cuisine` ADD CONSTRAINT `User_Cuisine_fk1` FOREIGN KEY (`cuisine_id`) REFERENCES `Cuisine`(`id`);

