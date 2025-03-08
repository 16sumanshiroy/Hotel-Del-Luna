-- Database: hotel_del_luna
CREATE DATABASE hotel_del_luna;
USE hotel_del_luna;

-- Table for Customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Rooms
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    status ENUM('available', 'booked', 'maintenance') DEFAULT 'available'
);

-- Table for Bookings
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    total_amount DECIMAL(10,2),
    booking_status ENUM('confirmed', 'cancelled', 'completed') DEFAULT 'confirmed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- Table for Billing
CREATE TABLE billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_status ENUM('paid', 'pending') DEFAULT 'pending',
    payment_method ENUM('credit_card', 'debit_card', 'cash', 'online') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Sample Data Insertion
INSERT INTO customers (name, email, phone, address) VALUES 
('Alice Johnson', 'alice@example.com', '9876543210', '123 Main St'),
('Bob Smith', 'bob@example.com', '8765432109', '456 Oak St');

INSERT INTO rooms (room_number, room_type, price, status) VALUES
('101', 'Deluxe', 150.00, 'available'),
('102', 'Suite', 250.00, 'available');

INSERT INTO bookings (customer_id, room_id, check_in, check_out, total_amount) VALUES
(1, 1, '2025-03-10', '2025-03-15', 750.00),
(2, 2, '2025-03-12', '2025-03-16', 1000.00);

INSERT INTO billing (booking_id, total_amount, payment_status, payment_method) VALUES
(1, 750.00, 'paid', 'credit_card'),
(2, 1000.00, 'pending', 'cash');
