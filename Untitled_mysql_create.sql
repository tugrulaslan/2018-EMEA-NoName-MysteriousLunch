CREATE TABLE `User` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Username` varchar(255) NOT NULL UNIQUE,
	`Name` varchar(100) NOT NULL,
	`Surname` varchar(100) NOT NULL,
	`Bio` varchar(500),
	`Frequency` enum,
	`Rating` INT,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Interest` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Definition` varchar(255) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Cuisine` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Definition` varchar(255) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `User_Interest` (
	`User_id` INT NOT NULL,
	`Interest_id` INT NOT NULL
);

CREATE TABLE `User_Cuisine` (
	`User_id` INT NOT NULL,
	`Cuisine_id` INT NOT NULL
);

ALTER TABLE `User_Interest` ADD CONSTRAINT `User_Interest_fk0` FOREIGN KEY (`User_id`) REFERENCES `User`(`ID`);

ALTER TABLE `User_Interest` ADD CONSTRAINT `User_Interest_fk1` FOREIGN KEY (`Interest_id`) REFERENCES `Interest`(`ID`);

ALTER TABLE `User_Cuisine` ADD CONSTRAINT `User_Cuisine_fk0` FOREIGN KEY (`User_id`) REFERENCES `User`(`ID`);

ALTER TABLE `User_Cuisine` ADD CONSTRAINT `User_Cuisine_fk1` FOREIGN KEY (`Cuisine_id`) REFERENCES `Cuisine`(`ID`);

