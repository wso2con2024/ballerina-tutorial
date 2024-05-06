-- AUTO-GENERATED FILE.

-- This file is an auto-generated file by Ballerina persistence layer for model.
-- Please verify the generated scripts and execute them against the target DB server.

USE reviewed_db;

DROP TABLE IF EXISTS `Review`;
DROP TABLE IF EXISTS `Author`;
DROP TABLE IF EXISTS `Place`;

CREATE TABLE `Place` (
	`id` INT NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	`city` VARCHAR(191) NOT NULL,
	`country` VARCHAR(191) NOT NULL,
	`entryFee` DECIMAL(65,30) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `Author` (
	`id` INT NOT NULL,
	`username` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `Review` (
	`id` INT NOT NULL,
	`rating` INT NOT NULL,
	`content` VARCHAR(191) NOT NULL,
	`placeId` INT NOT NULL,
	FOREIGN KEY(`placeId`) REFERENCES `Place`(`id`),
	`authorId` INT NOT NULL,
	FOREIGN KEY(`authorId`) REFERENCES `Author`(`id`),
	PRIMARY KEY(`id`)
);

INSERT INTO Place(id, name, city, country, entryFee) VALUES (8000, "Tower Vista", "Colombo", "Sri Lanka", 0);
INSERT INTO Place(id, name, city, country, entryFee) VALUES (8001, "TechTrail", "Miami", "United States", 10);
INSERT INTO Author(id, username) VALUES (5000, "John");
INSERT INTO Author(id, username) VALUES (5001, "Raya");
INSERT INTO Author(id, username) VALUES (5002, "Liyana");
INSERT INTO Author(id, username) VALUES (5003, "Shri");
INSERT INTO Review(id, placeId, authorId, content, rating) VALUES (1001, 8000, 5001, "Wonderful place, would recommend!", 5);
INSERT INTO Review(id, placeId, authorId, content, rating) VALUES (1002, 8001, 5001, "Long queues, not worth the wait.", 1);
INSERT INTO Review(id, placeId, authorId, content, rating) VALUES (1003, 8000, 5002, "Tends to get crowded in the evening, other than that, great experience.", 4);
INSERT INTO Review(id, placeId, authorId, content, rating) VALUES (1004, 8001, 5000, "Getting in is a challenge, but if you can sort out transport, a must visit!", 4);
INSERT INTO Review(id, placeId, authorId, content, rating) VALUES (1005, 8001, 5002, "An absolute must-visit for a tech enthusiast", 5);
INSERT INTO Review(id, placeId, authorId, content, rating) VALUES (1006, 8000, 5000, "Would definitely visit again.", 5);
