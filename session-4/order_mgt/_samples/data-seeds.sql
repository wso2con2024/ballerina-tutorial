-- Inserting data into the Customer table
INSERT INTO `Customer` (`customerID`, `firstName`, `lastName`, `email`, `optInEmail`, `premiumCustomer`) VALUES
('CUST001', 'John', 'Doe', 'john.doe@example.com', TRUE, TRUE),
('CUST002', 'Jane', 'Smith', 'jane.smith@example.com', FALSE, FALSE),
('CUST003', 'Alice', 'Johnson', 'alice.johnson@example.com', TRUE, FALSE),
('CUST004', 'Bob', 'Lee', 'bob.lee@example.com', TRUE, TRUE),
('CUST005', 'Charlie', 'Brown', 'charlie.brown@example.com', FALSE, TRUE);

-- Inserting data into the Item table
INSERT INTO `Item` (`itemId`, `name`, `manufacturer_code`, `unit_price`) VALUES
('ITEM001', 'Widget A', 'WGT-001', 19.99),
('ITEM002', 'Gadget B', 'GDT-002', 25.00),
('ITEM003', 'Tool C', 'TLC-003', 35.50),
('ITEM004', 'Appliance D', 'APD-004', 45.75),
('ITEM005', 'Accessory E', 'ACC-005', 9.95);

-- Inserting data into the Order table
INSERT INTO `Order` (`orderID`, `date`, `customerCustomerID`) VALUES
('ORD001', '2024-03-21', 'CUST001'),
('ORD002', '2024-03-22', 'CUST002'),
('ORD003', '2024-03-23', 'CUST003'),
('ORD004', '2024-03-24', 'CUST004'),
('ORD005', '2024-03-25', 'CUST005');

-- Inserting data into the OrderedItem table with float quantities
INSERT INTO `OrderedItem` (`orderedItemId`, `quantity`, `orderOrderID`, `itemItemId`) VALUES
('OI001', 2.0, 'ORD001', 'ITEM001'),
('OI002', 1.5, 'ORD001', 'ITEM002'),
('OI003', 3.0, 'ORD002', 'ITEM002'),
('OI004', 2.5, 'ORD002', 'ITEM003'),
('OI005', 1.0, 'ORD003', 'ITEM003'),
('OI006', 4.25, 'ORD003', 'ITEM004'),
('OI007', 1.75, 'ORD004', 'ITEM004'),
('OI008', 2.0, 'ORD004', 'ITEM005'),
('OI009', 3.5, 'ORD005', 'ITEM005'),
('OI010', 2.0, 'ORD005', 'ITEM001'),
('OI011', 1.0, 'ORD001', 'ITEM003'),
('OI012', 1.5, 'ORD002', 'ITEM001'),
('OI013', 2.0, 'ORD003', 'ITEM002'),
('OI014', 2.5, 'ORD004', 'ITEM001'),
('OI015', 2.0, 'ORD005', 'ITEM004');
