CREATE TABLE `User` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL UNIQUE,
	`email` varchar(255) NOT NULL UNIQUE,
	`name` varchar(100) NOT NULL,
	`surname` varchar(100) NOT NULL,
	`bio` varchar(500),
	`frequency` enum('weekly', 'monthly') NOT NULL,
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

CREATE TABLE `User_Request` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`requested_time` enum('week', 'month') NOT NULL,
	`lunch_type` enum('pair', 'group') NOT NULL,
	`request_date` DATE NOT NULL,
	`request_status` varchar(32) NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Meeting_History` (
	`meeting_id` INT, 
	`request_id` INT NOT NULL,
	`request_date` DATE NOT NULL,
	`meeting_status` varchar(255)
);

ALTER TABLE `User_Interest` ADD CONSTRAINT `User_Interest_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `User_Interest` ADD CONSTRAINT `User_Interest_fk1` FOREIGN KEY (`interest_id`) REFERENCES `Interest`(`id`);

ALTER TABLE `User_Cuisine` ADD CONSTRAINT `User_Cuisine_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `User_Cuisine` ADD CONSTRAINT `User_Cuisine_fk1` FOREIGN KEY (`cuisine_id`) REFERENCES `Cuisine`(`id`);

ALTER TABLE `User_Request` ADD CONSTRAINT `User_Request_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Meeting_History` ADD CONSTRAINT `Meeting_History_fk0` FOREIGN KEY (`request_id`) REFERENCES `User_Request`(`id`);

