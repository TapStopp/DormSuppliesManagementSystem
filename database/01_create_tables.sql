CREATE DATABASE dsms;
USE dsms;

-- ADMIN TABLE
CREATE TABLE admin(
    adminID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    passwd VARCHAR(100),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100)
);

-- STUDENT TABLE
CREATE TABLE student(
    studentID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    passwd VARCHAR(100),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    classification VARCHAR(10)
);

-- ITEM TABLE
CREATE TABLE item(
    itemID INT AUTO_INCREMENT PRIMARY KEY,
    itemName VARCHAR(100),
    category ENUM('bed', 'bath', 'kitchen', 'other'),
    price DECIMAL(10,2),
    quantity INT
);

-- STUDENT LIST TABLE
CREATE TABLE studentList(
    listID INT AUTO_INCREMENT PRIMARY KEY,
    studentID INT,
    listName VARCHAR(50),
    dateCreated DATE,
    lastUpdated DATE,
    FOREIGN KEY (studentID) REFERENCES student(studentID)
);

-- DORM BUILDING TABLE
CREATE TABLE dormBuilding(
    dormName VARCHAR(50) PRIMARY KEY,
    location VARCHAR(255),
    numRooms INT,
    roomType ENUM('single', 'double', 'triple'),
    capacity INT
);

-- ROOM TABLE
CREATE TABLE room(
    dormName VARCHAR(50),
    roomNum VARCHAR(10),
    roomType ENUM('traditional', 'suite', 'townhouse'),
    numStudents INT,
    hasKitchen BOOL,
    hasBathroom BOOL,
    PRIMARY KEY (dormName, roomNum),
    FOREIGN KEY (dormName) REFERENCES dormBuilding(dormName)
);

-- SUPPLIER TABLE
CREATE TABLE supplier(
    supplierID INT AUTO_INCREMENT PRIMARY KEY,
    supplierName VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20)
);

-- SUPPLIER LOCATION TABLE (FIXED WITH PRIMARY KEY)
CREATE TABLE supplierLocation(
    supplierID INT,
    location VARCHAR(255),
    PRIMARY KEY (supplierID, location),
    FOREIGN KEY (supplierID) REFERENCES supplier(supplierID)
);

-- ORDERS TABLE
CREATE TABLE orders(
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    orderDate DATE,
    orderStatus ENUM('pending', 'completed', 'cancelled'),
    studentID INT,
    supplierID INT,
    FOREIGN KEY (studentID) REFERENCES student(studentID),
    FOREIGN KEY (supplierID) REFERENCES supplier(supplierID)
);

-- PAYMENTS TABLE
CREATE TABLE payments(
    paymentID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT,
    amount DECIMAL(10,2),
    paymentMethod ENUM('credit', 'debit', 'cash'),
    paymentStatus ENUM('pending', 'completed', 'failed'),
    FOREIGN KEY (orderID) REFERENCES orders(orderID)
);

-- ADMIN LOGS TABLE
CREATE TABLE adminLog(
    logID INT AUTO_INCREMENT PRIMARY KEY,
    adminID INT,
    action TEXT,
    timestamp DATETIME,
    IP_Address VARCHAR(45),
    FOREIGN KEY (adminID) REFERENCES admin(adminID)
);


-- Student Login View
CREATE VIEW view_login AS
SELECT username, passwd
FROM student;

-- Admin Login View
CREATE VIEW view_login_admin AS
SELECT username, passwd
FROM admin;

-- Item Details View
CREATE VIEW view_items AS
SELECT itemID, itemName, category, price, quantity
FROM item;

-- Student Profile View
CREATE VIEW view_students AS
SELECT
    student.studentID,
    student.firstName,
    student.lastName,
    student.classification,
    studentList.listName,
    orders.orderID
FROM student
LEFT JOIN studentList ON student.studentID = studentList.studentID
LEFT JOIN orders ON student.studentID = orders.studentID;


-- Supplier View
CREATE VIEW view_supplier AS
SELECT supplierID, supplierName, email, phone, location
FROM supplier
JOIN supplierlocation ON supplier.supplierID = supplierlocation.supplierID;

-- Current Order View
CREATE VIEW view_orders AS
SELECT
    orders.orderID,
    orders.orderDate,
    orders.orderStatus,
    orders.studentID,
    payments.amount,
    payments.paymentMethod,
    payments.paymentStatus
FROM orders
JOIN payments ON orders.orderID = payments.orderID;


-- Track Order View
CREATE VIEW view_track_orders AS
SELECT orderID, orderDate, orderStatus, supplierID, supplierName, location
FROM orders
JOIN supplier ON orders.supplierID = supplier.supplierID
JOIN supplierlocation ON orders.supplierID = supplierlocation.supplierID;

-- List View
CREATE VIEW view_list AS
SELECT listName, dateCreated, lastUpdated
FROM studentList;



-- dorms
CREATE VIEW view_dorms AS
SELECT dormName, location, numRooms, roomType, capacity
FROM dormBuilding;

-- rooms
CREATE VIEW view_rooms AS
SELECT dormName, roomNum, roomType, numStudents, hasKitchen, hasBathroom
FROM room;


ALTER TABLE student MODIFY passwd VARCHAR(256);
ALTER TABLE supplier MODIFY email VARBINARY(255);
INSERT INTO student (username, passwd, firstName, lastName, classification)
VALUES ('colin', SHA2('mypassword123', 256), 'Colin', 'Boykin', 'FR');


DELIMITER $$
CREATE PROCEDURE verify_login(
    IN userNameInput VARCHAR(50),
    IN passwordInput VARCHAR(100)
)
BEGIN
    DECLARE hashedInput VARCHAR(256);

    SET hashedInput = SHA2(passwordInput, 256);

    IF EXISTS (
        SELECT * FROM student
        WHERE username = userNameInput
        AND passwd = hashedInput
    ) THEN
        SELECT 'STUDENT ACCESS GRANTED' AS result;

    ELSEIF EXISTS (
        SELECT * FROM admin
        WHERE username = userNameInput
        AND passwd = hashedInput
    ) THEN
        SELECT 'ADMIN ACCESS GRANTED' AS result;

    ELSE
        SELECT 'ACCESS DENIED' AS result;
    END IF;

END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER delete_student_items
AFTER DELETE ON student
FOR EACH ROW
BEGIN
    DELETE FROM studentList
    WHERE studentID = OLD.studentID;
END $$
DELIMITER ;


UPDATE supplier
SET email = AES_ENCRYPT(email, 'XXX')
WHERE supplierID = 1;

SELECT AES_DECRYPT(email, 'XXX')
FROM supplier
WHERE supplierID = 1;


