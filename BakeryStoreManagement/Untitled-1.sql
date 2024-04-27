-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    ShippingAddress VARCHAR(255),
    BillingAddress VARCHAR(255),
    Phone VARCHAR(20),
    LoyaltyPoints INT DEFAULT 0,
    RegistrationDate DATE,
    LastLoginDate DATE
);

-- Create Order table
CREATE TABLE "Order" (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalPrice DECIMAL(10, 2),
    OrderStatus VARCHAR(20),
    DeliveryMethod VARCHAR(20),
    DeliveryDate DATE,
    PaymentStatus VARCHAR(20),
    SpecialInstructions VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create Product table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Type VARCHAR(50),
    Weight DECIMAL(10, 2),
    ExpiryDate DATE,
    Ingredients TEXT,
    ImageURL VARCHAR(255),
    AvailabilityStatus VARCHAR(20)
);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    ExpiryStatus VARCHAR(20),
    PurchaseDate DATE,
    SupplierBatchNumber VARCHAR(50),
    StorageLocation VARCHAR(50),
    UnitCost DECIMAL(10, 2),
    StockAvailability BOOLEAN,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    Shift VARCHAR(20),
    ContactNumber VARCHAR(20),
    EmergencyContact VARCHAR(100),
    Certification VARCHAR(100)
);

-- Create Supplier table
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    PaymentTerms VARCHAR(50),
    LeadTime INT,
    ContactPerson VARCHAR(100),
    Website VARCHAR(255),
    PreferredCommunicationMethod VARCHAR(50)
);

-- Create Delivery table
CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT,
    DeliveryPersonID INT,
    DeliveryDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID),
    FOREIGN KEY (DeliveryPersonID) REFERENCES Employee(EmployeeID)
);

-- Insert sample data into Customer table
INSERT INTO Customer (CustomerID, Username, Password, Email, Phone, RegistrationDate)
VALUES (1, 'john_doe', 'password123', 'john@example.com', '+1234567890', '2024-01-01'),
       (2, 'jane_smith', 'qwerty456', 'jane@example.com', '+9876543210', '2024-01-05'),
       (3, 'alice123', 'abc123', 'alice@example.com', '+1122334455', '2024-01-10');

-- Insert sample data into Order table
INSERT INTO "Order" (OrderID, CustomerID, OrderDate, TotalPrice, OrderStatus, PaymentStatus)
VALUES (101, 1, '2024-01-02', 25.50, 'Pending', 'Paid'),
       (102, 2, '2024-01-06', 35.75, 'Processing', 'Pending'),
       (103, 3, '2024-01-10', 50.00, 'Shipped', 'Paid');

-- Insert sample data into Product table
INSERT INTO Product (ProductID, Name, Price, Type, AvailabilityStatus)
VALUES (201, 'Chocolate Cake', 20.00, 'Cake', 'Available'),
       (202, 'French Bread', 3.50, 'Bread', 'Available'),
       (203, 'Sugar Cookie', 1.50, 'Cookie', 'Available');

-- Insert sample data into Inventory table
INSERT INTO Inventory (InventoryID, ProductID, Quantity, ExpiryStatus, PurchaseDate, StockAvailability)
VALUES (301, 201, 10, 'Not Expired', '2024-01-01', TRUE),
       (302, 202, 20, 'Not Expired', '2024-01-01', TRUE),
       (303, 203, 30, 'Not Expired', '2024-01-01', TRUE);

-- Insert sample data into Employee table
INSERT INTO Employee (EmployeeID, Name, Position, Salary, HireDate)
VALUES (401, 'Alice Johnson', 'Baker', 2500.00, '2023-12-15'),
       (402, 'Bob Smith', 'Cashier', 2000.00, '2024-01-10'),
       (403, 'Charlie Brown', 'Delivery Person', 1800.00, '2024-01-15');

-- Insert sample data into Supplier table
INSERT INTO Supplier (SupplierID, Name, Address, Phone, Email)
VALUES (501, 'Fresh Ingredients Inc.', '123 Main St, Cityville', '+1122334455', 'info@freshingredients.com'),
       (502, 'Bakery Supply Co.', '456 Elm St, Townsville', '+9988776655', 'sales@bakerysupply.com'),
       (503, 'Flour Mills Ltd.', '789 Oak St, Villagetown', '+4455667788', 'contact@flourmills.com');

-- Insert sample data into Delivery table
INSERT INTO Delivery (DeliveryID, OrderID, DeliveryPersonID, DeliveryDate, Status)
VALUES (601, 101, 401, '2024-01-04', 'Delivered'),
       (602, 102, 402, '2024-01-08', 'In Transit'),
       (603, 103, 403, '2024-01-12', 'Delivered');
