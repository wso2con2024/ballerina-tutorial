-- AUTO-GENERATED FILE.

-- This file is an auto-generated file by Ballerina persistence layer for model.
-- Please verify the generated scripts and execute them against the target DB server.

DROP TABLE IF EXISTS `OrderedItem`;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS `Item`;
DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
	`customerID` VARCHAR(191) NOT NULL,
	`firstName` VARCHAR(191) NOT NULL,
	`lastName` VARCHAR(191) NOT NULL,
	`email` VARCHAR(191) NOT NULL,
	`optInEmail` BOOLEAN NOT NULL,
	`premiumCustomer` BOOLEAN NOT NULL,
	PRIMARY KEY(`customerID`)
);

CREATE TABLE `Item` (
	`itemId` VARCHAR(191) NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	`manufacturer_code` VARCHAR(191) NOT NULL,
	`unit_price` DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(`itemId`)
);

CREATE TABLE `Order` (
	`orderID` VARCHAR(191) NOT NULL,
	`date` VARCHAR(191) NOT NULL,
	`customerCustomerID` VARCHAR(191) NOT NULL,
	FOREIGN KEY(`customerCustomerID`) REFERENCES `Customer`(`customerID`),
	PRIMARY KEY(`orderID`)
);

CREATE TABLE `OrderedItem` (
	`quantity` DECIMAL(10,2) NOT NULL,
	`orderID` VARCHAR(191) NOT NULL,
	FOREIGN KEY(`orderID`) REFERENCES `Order`(`orderID`),
	`itemId` VARCHAR(191) NOT NULL,
	FOREIGN KEY(`itemId`) REFERENCES `Item`(`itemId`),
	PRIMARY KEY(`orderID`,`itemId`)
);


