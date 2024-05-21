<?php
// Database connection parameters
$servername = "localhost"; // Change this if your database server is on a different host
$username = "root"; // Change this to your database username
$password = ""; // Change this to your database password
$database = "ecommerce"; // Change this to your desired database name

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL statements to create tables
$sql_create_customer = "CREATE TABLE IF NOT EXISTS Customer (
    Cust_ID INT PRIMARY KEY,
    Cust_Name VARCHAR(255),
    Cust_Ph VARCHAR(20),
    Cust_Email VARCHAR(255),
    Cust_Address VARCHAR(255)
)";

$sql_create_product = "CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Category VARCHAR(100)
)";

$sql_create_seller = "CREATE TABLE IF NOT EXISTS Seller (
    Seller_ID INT PRIMARY KEY,
    Seller_Name VARCHAR(255),
    Seller_Emailid VARCHAR(255),
    Seller_Address VARCHAR(255)
)";

$sql_create_order = "CREATE TABLE IF NOT EXISTS `Order` (
    Order_ID INT PRIMARY KEY,
    Product_ID INT,
    Cust_ID INT,
    Product_Name VARCHAR(255),
    Cust_Address VARCHAR(255),
    Status VARCHAR(50),
    Return_Status VARCHAR(50),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID)
)";

$sql_create_review = "CREATE TABLE IF NOT EXISTS Review (
    Cust_ID INT,
    Cust_Name VARCHAR(255),
    Rating INT,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID)
)";

// Execute SQL queries to create tables
if ($conn->query($sql_create_customer) === TRUE) {
    echo "Customer table created successfully<br>";
} else {
    echo "Error creating Customer table: " . $conn->error . "<br>";
}

if ($conn->query($sql_create_product) === TRUE) {
    echo "Product table created successfully<br>";
} else {
    echo "Error creating Product table: " . $conn->error . "<br>";
}

if ($conn->query($sql_create_seller) === TRUE) {
    echo "Seller table created successfully<br>";
} else {
    echo "Error creating Seller table: " . $conn->error . "<br>";
}

if ($conn->query($sql_create_order) === TRUE) {
    echo "Order table created successfully<br>";
} else {
    echo "Error creating Order table: " . $conn->error . "<br>";
}

if ($conn->query($sql_create_review) === TRUE) {
    echo "Review table created successfully<br>";
} else {
    echo "Error creating Review table: " . $conn->error . "<br>";
}

// Close connection
$conn->close();
?>
