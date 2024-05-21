CREATE DATABASE ECOMMERCE;
USE ECOMMERCE;

--create tables
CREATE TABLE Customer (
    Cust_ID INT PRIMARY KEY,
    Cust_Name VARCHAR(255),
    Cust_Ph VARCHAR(20),
    Cust_Email VARCHAR(255),
    Cust_Address VARCHAR(255)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Category VARCHAR(100)
);

CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY,
    Seller_Name VARCHAR(255),
    Seller_Emailid VARCHAR(255),
    Seller_Address VARCHAR(255)
);

CREATE TABLE Cart (
    Order_ID INT PRIMARY KEY,
    Product_ID INT,
    Cust_ID INT,
    Product_Name VARCHAR(255),
    Cust_Address VARCHAR(255),
    Status VARCHAR(50),
    Return_Status VARCHAR(50),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID)
);

CREATE TABLE Review (
    Cust_ID INT,
    Cust_Name VARCHAR(255),
    Rating INT,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID)
);

-- Inserting sample values into Customer table
INSERT INTO Customer (Cust_ID, Cust_Name, Cust_Ph, Cust_Email, Cust_Address)
VALUES 
    (1, 'ADITHI', '1234567890', 'adithi@mail.com', '123 Main St'),
    (2, 'AISHWARYA', '9876543210', 'aishwarya@mail.com', '456 Elm St'),
    (3, 'BHAVANA', '5551234567', 'bhavana@mail.com', '789 Broadway'),
    (4, 'RAMYA', '5559876543', 'ramya@mail.com', '101 Park Ave'),
    (5, 'ANURAG', '5552223333', 'anurag@mail.com', '222 Pine St');

-- To display the table
SELECT*FROM Customer;
-- Inserting sample values into Product table
INSERT INTO Product (Product_ID, Product_Name, Price, Category)
VALUES 
    (101, 'Laptop', 45000, 'Electronics'),
    (102, 'Smartphone', 21000, 'Electronics'),
    (103, 'Tablet', 10000, 'Electronics'),
    (104, 'Headphones', 999, 'Electronics'),
    (105, 'T-shirt', 599, 'Fashion');

-- To display the table
SELECT*FROM Product;
-- Inserting sample values into Seller table
INSERT INTO Seller (Seller_ID, Seller_Name, Seller_Emailid, Seller_Address)
VALUES 
    (201, 'ElectroTech', 'info@electrotech.com', '789 Oak St'),
    (202, 'GadgetZone', 'support@gadgetzone.com', '321 Pine St'),
    (203, 'ElectroMart', 'info@electromart.com', '456 Oak St'),
    (204, 'FashionWorld', 'support@fashionworld.com', '789 Maple St'),
    (205, 'TechGurus', 'sales@techgurus.com', '123 Cedar St');

-- To display the table
SELECT*FROM Seller;
-- Inserting sample values into Order table
INSERT INTO Cart (Order_ID, Product_ID, Cust_ID, Product_Name, Cust_Address, Status, Return_Status)
VALUES 
    (1, 101, 1, 'Laptop', '123 Main St', 'Delivered', 'No'),
    (2, 102, 2, 'Smartphone', '456 Elm St', 'Processing', 'No'),
    (3, 103, 3, 'Tablet', '789 Broadway', 'Delivered', 'No'),
    (4, 104, 4, 'Headphones', '101 Park Ave', 'Shipped', 'No'),
    (5, 105, 5, 'T-shirt', '222 Pine St', 'Processing', 'No');

-- To display the table
SELECT*FROM Cart;
-- Inserting sample values into Review table
INSERT INTO Review (Cust_ID, Cust_Name, Rating)
VALUES 
    (1, 'ADITHI', 5),
    (2, 'AISHWARYA', 4),
    (3, 'BHAVANA', 4),
    (4, 'RAMYA', 3),
    (5, 'ANURAG', 5);
-- To display the table
SELECT*FROM Review;
