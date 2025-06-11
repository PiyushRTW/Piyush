CREATE DATABASE DEMO
use DEMO

Hotel (Hotel_No, Name, Address)
Room (Room_No, Hotel_No, Type, Price)
Booking (Hotel_No, Guest_No, Date_From,
Date_To, Room_No)
Guest (Guest_No, Name, Address)

CREATE TABLE hotel
( hotel_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

CREATE TABLE room (
    room_no VARCHAR(4) NOT NULL,
    hotel_no CHAR(4) NOT NULL,
    type CHAR(1) NOT NULL,
    price DECIMAL(5 , 2 ) NOT NULL
);

CREATE TABLE booking (
    hotel_no CHAR(4) NOT NULL,
    guest_no CHAR(4) NOT NULL,
    date_from DATETIME NOT NULL,
    date_to DATETIME NULL,
    room_no CHAR(4) NOT NULL
);

CREATE TABLE guest (
    guest_no CHAR(4) NOT NULL,
    name VARCHAR(20) NOT NULL,
    address VARCHAR(50) NOT NULL
);

INSERT INTO hotel
VALUES ('H111', 'Grosvenor Hotel', 'London');
INSERT INTO room
VALUES ('1', 'H111', 'S', 72.00);
INSERT INTO guest
VALUES ('G111', 'John Smith', 'London');
INSERT INTO booking
VALUES ('H111', 'G111', '1999-01-01',
'1999-01-02', '1');

UPDATE room 
SET 
    price = price * 1.05;

CREATE TABLE booking_archive (
    hotel_no CHAR(4) NOT NULL,
    guest_no CHAR(4) NOT NULL,
    date_from DATETIME NOT NULL,
    date_to DATETIME NULL,
    room_no CHAR(4) NOT NULL
);

CREATE TABLE booking_old (
    hotel_no CHAR(4) NOT NULL,
    guest_no CHAR(4) NOT NULL,
    date_from DATETIME NOT NULL,
    date_to DATETIME NULL,
    room_no VARCHAR(4) NOT NULL
);

INSERT INTO booking_old 
SELECT * FROM booking
WHERE date_to < '2000-01-01';

DELETE FROM booking 
WHERE
    date_to < '2000-01-01';

-- 1. List full details of all hotels.
SElECT * FROM hotel 

-- 2. List full details of all hotels in London.
SElECT * FROM hotel WHERE address='London'

-- 3. List the names and addresses of all guests in London, alphabetically ordered by name.
SELECT name, address FROM guest 
WHERE address = 'London' 
ORDER BY name;

-- 4. List all double or family rooms with a price below £40.00 per night, in ascending order of price.
SELECT * FROM room 
WHERE type IN ('D', 'F') AND price < 40.00 
ORDER BY price ASC;

-- 5. List the bookings for which no date_to has been specified.
SELECT * FROM booking 
WHERE date_to IS NULL;


--Aggregate Functions

--1. How many hotels are there?
SELECT COUNT(*) AS total_hotels FROM hotel;

--2. What is the average price of a room?
SELECT AVG(price) AS avg_price FROM room;

--3. What is the total revenue per night from all double rooms?
SELECT SUM(price) AS total_revenue FROM room 
WHERE type = 'D';

--4. How many different guests have madebookings for August?
SELECT COUNT(DISTINCT guest_no) AS unique_guests FROM booking
WHERE MONTH(date_from) = 8;

--Subqueries and Joins

--1. List the price and type of all rooms at the Grosvenor Hotel.
SELECT r.price, r.type FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel';

--2. List all guests currently staying at the Grosvenor Hotel.
SELECT DISTINCT g.guest_no, g.name, g.address
FROM guest g
JOIN booking b ON g.guest_no = b.guest_no
JOIN hotel h ON b.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel' 
AND b.date_to IS NULL OR b.date_to >= 

--3. List the details of all rooms at the Grosvenor Hotel,including the name of the guest staying in the room, if the room is occupied.
SELECT r.room_no, r.type, r.price, g.name AS guest_name FROM room r
LEFT JOIN booking b ON r.room_no = b.room_no 
LEFT JOIN guest g ON b.guest_no = g.guest_no
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel';


--4. What is the total income from bookings for the Grosvenor Hotel today?
SELECT SUM(r.price) AS total_income FROM booking b
JOIN room r ON b.room_no = r.room_no AND b.hotel_no = r.hotel_no
JOIN hotel h ON b.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel' 
AND CAST(GETDATE() AS DATE) BETWEEN b.date_from AND b.date_to;

--5. List the rooms that are currently unoccupied at the Grosvenor Hotel.
SELECT r.room_no, r.type, r.price FROM room r
LEFT JOIN booking b ON r.room_no = b.room_no AND r.hotel_no = b.hotel_no
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel'
AND (b.guest_no IS NULL OR b.date_to < CAST(GETDATE() AS DATE));

--6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?
SELECT SUM(r.price) AS lost_income
FROM room r
LEFT JOIN booking b ON r.room_no = b.room_no AND r.hotel_no = b.hotel_no
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel'
AND (b.guest_no IS NULL OR b.date_to < CAST(GETDATE() AS DATE));


--  Grouping

--1. List the number of rooms in each hotel.
SELECT hotel_no, COUNT(*) AS total_rooms FROM room
GROUP BY hotel_no;


-- 2. List the number of rooms in each hotel in London.
SELECT r.hotel_no, COUNT(*) AS total_rooms FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.address = 'London'
GROUP BY r.hotel_no;


-- 3. What is the average number of bookings for each hotel in August?
-- 4. What is the most commonly booked room type for each hotel in London?
-- 5. What is the lost income from unoccupied rooms at each hotel today?