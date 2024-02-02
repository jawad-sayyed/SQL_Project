
CREATE DATABASE railway_management;
USE railway_management;

CREATE TABLE stations (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL
);

CREATE TABLE trains (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL,
    capacity INT
);

CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_name VARCHAR(100) NOT NULL,
    ticket_number VARCHAR(20) NOT NULL UNIQUE,
    station_id INT,
    FOREIGN KEY (station_id) REFERENCES stations(station_id)
);

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    train_id INT,
    booking_date DATE,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);


-- Stations
INSERT INTO stations (station_name) VALUES ('Lokmanya tilak terminus');
INSERT INTO stations (station_name) VALUES ('CST');
INSERT INTO stations (station_name) VALUES ('DELHI');
INSERT INTO stations (station_name) VALUES ('Howrah');
INSERT INTO stations (station_name) VALUES ('Chennai Central');
INSERT INTO stations (station_name) VALUES ('Mumbai Central');
INSERT INTO stations (station_name) VALUES ('New Delhi');
INSERT INTO stations (station_name) VALUES ('Kolkata');
INSERT INTO stations (station_name) VALUES ('Bengaluru City');
INSERT INTO stations (station_name) VALUES ('Secunderabad');
INSERT INTO stations (station_name) VALUES ('Chhatrapati Shivaji Maharaj Terminus');
INSERT INTO stations (station_name) VALUES ('Chennai Egmore');
INSERT INTO stations (station_name) VALUES ('Hazrat Nizamuddin');
INSERT INTO stations (station_name) VALUES ('Ahmedabad Junction');
INSERT INTO stations (station_name) VALUES ('Pune Junction');
INSERT INTO stations (station_name) VALUES ('Jaipur Junction');
INSERT INTO stations (station_name) VALUES ('Patna Junction');
INSERT INTO stations (station_name) VALUES ('Hyderabad Deccan');
INSERT INTO stations (station_name) VALUES ('Guwahati');
INSERT INTO stations (station_name) VALUES ('Lucknow Junction');
INSERT INTO stations (station_name) VALUES ('Thiruvananthapuram Central');
INSERT INTO stations (station_name) VALUES ('Bhopal Junction');
INSERT INTO stations (station_name) VALUES ('Indore Junction');


-- Trains
INSERT INTO trains (train_name, capacity) VALUES ('PRAYAGRAJ DURONTO', 200);
INSERT INTO trains (train_name, capacity) VALUES ('RAJDHANI', 150);
INSERT INTO trains (train_name, capacity) VALUES ('SHATABDI', 120);
INSERT INTO trains (train_name, capacity) VALUES ('DURONTO', 180);
INSERT INTO trains (train_name, capacity) VALUES ('GATIMAAN EXPRESS', 160);
INSERT INTO trains (train_name, capacity) VALUES ('SAMPARK KRANTI', 180);
INSERT INTO trains (train_name, capacity) VALUES ('TEJAS EXPRESS', 140);
INSERT INTO trains (train_name, capacity) VALUES ('HUMSAFAR EXPRESS', 200);
INSERT INTO trains (train_name, capacity) VALUES ('GARIB RATH', 250);
INSERT INTO trains (train_name, capacity) VALUES ('UDAY EXPRESS', 120);
INSERT INTO trains (train_name, capacity) VALUES ('VANDE BHARAT EXPRESS', 180);
INSERT INTO trains (train_name, capacity) VALUES ('JAN SHATABDI', 160);


-- Passengers
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Jawad', 'T12345', 1);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Rohit', 'T54321', 2);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Suman', 'T67890', 3);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Priya', 'T09876', 4);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Anil', 'T45678', 5);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Neha', 'T98765', 6);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Vikas', 'T23456', 7);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Arun', 'T87654', 8);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Sneha', 'T54367', 9);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Raj', 'T78654', 10);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Pooja', 'T23451', 11);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Ravi', 'T87543', 12);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Amit', 'T65432', 13);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Deepa', 'T34567', 14);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Karan', 'T76543', 15);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Meena', 'T23456', 16);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Vinay', 'T87654', 17);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Sangeeta', 'T43256', 18);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Ajay', 'T87654', 19);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Aarti', 'T23456', 20);
INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Manoj', 'T98765', 21);


-- Bookings
-- Bookings
INSERT INTO bookings (passenger_id, train_id, booking_date)
VALUES (
    (SELECT passenger_id FROM passengers WHERE passenger_name = 'Jawad'),
    (SELECT train_id FROM trains WHERE train_name = 'PRAYAGRAJ DURONTO'),
    '2023-09-10'
);
INSERT INTO bookings (passenger_id, train_id, booking_date)
VALUES (
    (SELECT passenger_id FROM passengers WHERE passenger_name = 'Rohit'),
    (SELECT train_id FROM trains WHERE train_name = 'RAJDHANI'),
    '2023-09-12'
);

INSERT INTO bookings (passenger_id, train_id, booking_date)
VALUES (
    (SELECT passenger_id FROM passengers WHERE passenger_name = 'Suman'),
    (SELECT train_id FROM trains WHERE train_name = 'SHATABDI'),
    '2023-09-14'
);

INSERT INTO bookings (passenger_id, train_id, booking_date)
VALUES (
    (SELECT passenger_id FROM passengers WHERE passenger_name = 'Priya'),
    (SELECT train_id FROM trains WHERE train_name = 'DURONTO'),
    '2023-09-16'
);


#Data Manipulation Language (DML) Operations:

INSERT INTO passengers (passenger_name, ticket_number, station_id) 
VALUES ('Sharukh', 'T67890', 3);


-- 2.) Update passenger table:
UPDATE passengers
SET station_id = 2
WHERE passenger_id = 1;

-- 3.) Delete data:
DELETE FROM passengers
WHERE passenger_id = 3;

-- 4.) List all the passenger name :
SELECT passenger_name FROM passengers;

-- 5.) Find passengers at 'CST':
SELECT passenger_name
FROM passengers
WHERE station_id = (SELECT station_id FROM stations WHERE 
station_name = 'CST');

-- 6.) List all passengers who booked tickets for 'Rajdhani':
SELECT passengers.passenger_name
FROM passengers
INNER JOIN bookings ON passengers.passenger_id = 
bookings.passenger_id
INNER JOIN trains ON bookings.train_id = trains.train_id
WHERE trains.train_name = 'Rajdhani';

-- 7.) Calculate the total salary of all passengers:
SELECT SUM(salary) AS total_salary
FROM passengers;

-- 8.) Find the station with the most bookings:
SELECT stations.station_name, COUNT(bookings.booking_id) AS 
booking_count
FROM stations
LEFT JOIN passengers ON stations.station_id = passengers.station_id
LEFT JOIN bookings ON passengers.passenger_id = 
bookings.passenger_id
GROUP BY stations.station_name
ORDER BY booking_count DESC
LIMIT 1;

-- 9.) List all stations:
SELECT * FROM stations;

-- 10.) List all trains:
SELECT * FROM trains;

-- 11.) List all passengers:
SELECT * FROM passengers;

-- 12.) List all bookings:
SELECT * FROM bookings;

-- 13.) List passengers and their corresponding bookings:
SELECT passengers.passenger_name, bookings.booking_id
FROM passengers
LEFT JOIN bookings ON passengers.passenger_id =
bookings.passenger_id;

-- 14.) Add a new column 'arrival_time' to the 'trains' table:
ALTER TABLE trains
ADD COLUMN arrival_time TIME;

-- 15.) Modify the data type of the 'ticket_number' column in
-- the 'passengers' table:
-- ALTER TABLE passengers
-- MODIFY COLUMN ticket_number VARCHAR(30);

-- 16.) Create a new table 'routes':
CREATE TABLE routes (
 route_id INT AUTO_INCREMENT PRIMARY KEY,
 route_name VARCHAR(100) NOT NULL
);

-- 17.) Add a foreign key constraint to the 'bookings' table:
ALTER TABLE bookings
ADD FOREIGN KEY (passenger_id) REFERENCES 
passengers(passenger_id);

-- 18.) Filter the data where station_id=2:
SELECT * FROM passengers WHERE station_id = 2;

-- 19.) Filter the data where booking_date>=’2023-09-11:
SELECT * FROM bookings WHERE booking_date >= '2023-09-11';

-- 20.) Sort the passenger_name in ascending order:
SELECT * FROM passengers ORDER BY passenger_name ASC;

-- 21.) Sort the train in descending order:
SELECT * FROM trains ORDER BY capacity DESC;

-- 22.) Use aggregate function Count on passenger:
SELECT COUNT(*) AS passenger_count FROM passengers;

-- 23.) Use aggregate function Average on passenger:
SELECT AVG(capacity) AS average_capacity FROM trains;

-- 24.) Use aggregate function Max on booking_date:
SELECT MAX(booking_date) AS latest_booking FROM bookings;

-- 25.) Use aggregate function Min on booking_date:
SELECT MIN(booking_date) AS latest_booking FROM bookings;

-- 26.) Grouping data:
SELECT station_id, COUNT(*) AS passenger_count
FROM passengers
GROUP BY station_id;

-- Functions:
-- 27.) Use string function concat on passengers:
-- SELECT CONCAT(passenger_name, ' - ', ticket_number) AS 
-- passenger_info FROM passengers;

-- 28.) Use string function Upper on trains:
SELECT UPPER(train_name) AS uppercase_train_name FROM trains;

-- 29.) Use string function Lower on trains:
SELECT LOWER(train_name) AS uppercase_train_name FROM trains;

-- 30.) Use Date function current date:
SELECT CURDATE() AS current_date;

-- 31.) Use Date format on bookings:
SELECT DATE_FORMAT(booking_date, '%Y-%m-%d') AS 
formatted_date FROM bookings;

-- 32.) Use math function sqrt on capacity:
SELECT SQRT(capacity) AS square_root_capacity FROM trains;

-- 33.) Use math function round on capacity:
SELECT ROUND(AVG(capacity), 2) AS rounded_average_capacity
FROM trains;

-- 34.) Use conditional function on passengers:
SELECT passenger_name, CASE WHEN station_id = 1 THEN 'At Station 
A' ELSE 'Not at Station A' END AS location_info
FROM passengers;

-- 38.) Find passengers and their booked train names using 
-- inner join:
SELECT passengers.passenger_name, trains.train_name
FROM passengers
INNER JOIN bookings ON passengers.passenger_id = 
bookings.passenger_id
INNER JOIN trains ON bookings.train_id = trains.train_id;

-- 39.) List all station and passengers at each station using left 
-- join:
SELECT stations.station_name, passengers.passenger_name
FROM stations
LEFT JOIN passengers ON stations.station_id = passengers.station_id;

-- 40.) List all train names and their booked passengers:
SELECT trains.train_name, passengers.passenger_name
FROM trains
RIGHT JOIN bookings ON trains.train_id = bookings.train_id
RIGHT JOIN passengers ON bookings.passenger_id = 
passengers.passenger_id;

-- 41.) Find the average salary of passengers who booked 
-- Garib Rath using subquery:
SELECT train_name,
 (SELECT AVG(salary) FROM passengers WHERE 
passengers.train_id = trains.train_id) AS avg_salary
FROM trains;

-- 42.) Find passengers who have booked tickets for trains with 
-- query:
SELECT passenger_name
FROM passengers p
WHERE EXISTS (
 SELECT 1
 FROM trains t
 WHERE t.train_id = p.train_id
 AND t.capacity > (SELECT AVG(capacity) FROM trains ));

-- 43.) List stations with the count of passengers who booked 
-- tickets for each station using from clause:
SELECT s.station_name, IFNULL(b.passenger_count, 0) AS 
passenger_count
FROM stations s
LEFT JOIN (
 SELECT station_id, COUNT(*) AS passenger_count
 FROM passengers
 GROUP BY station_id
) b ON s.station_id = b.station_id;

-- 44.) Find passengers who booked tickets for Prayagraj 
-- Duronto using IN operator:
SELECT passenger_name
FROM passengers
WHERE train_id IN (
 SELECT train_id
 FROM trains
 WHERE train_name = 'Prayagraj Duronto'
);

-- 45.) Remove the foreign key constraint on the 
-- 'passenger_id' column in the 'bookings' table
ALTER TABLE bookings
DROP FOREIGN KEY FK_bookings_passengers;

-- 46.) Remove the foreign key constraint on the 'train_id' 
-- column in the 'bookings' table
ALTER TABLE bookings
DROP FOREIGN KEY FK_bookings_trains;

-- 47.) Remove the foreign key constraint on the 'station_id' 
-- column in the 'passengers' table
ALTER TABLE passengers
DROP FOREIGN KEY FK_passengers_stations;

-- 48.) Delete all the records of station table:
Truncate table stations;

-- 49.) Delete all the records of trains table:
Truncate table trains;

-- 50.) Delete all the records of Passengers table:
Truncate table passengers;

-- 51.) Delete all the records of Bookings table:
Truncate table bookings;

-- 52.) Add a foreign key constraint to the 'passengers' table:
ALTER TABLE passengers
ADD CONSTRAINT FK_passengers_stations
FOREIGN KEY (station_id)
REFERENCES stations(station_id);

-- 53.) Add foreign key constraints to the 'bookings' table:
-- Add a foreign key constraint for 'passenger_id'
ALTER TABLE bookings
ADD CONSTRAINT FK_bookings_passengers
FOREIGN KEY (passenger_id)
REFERENCES passengers(passenger_id);

-- 54.) Add a foreign key constraint for 'train_id'
ALTER TABLE bookings
ADD CONSTRAINT FK_bookings_trains
FOREIGN KEY (train_id)
REFERENCES trains(train_id);

-- 55.) Add a new column to the 'passengers' table:
ALTER TABLE passengers
ADD COLUMN phone_number VARCHAR(15);

-- 56.) Modify the data type of an existing column:
ALTER TABLE passengers
MODIFY COLUMN phone_number INT;

-- 57.) Rename a table:
ALTER TABLE stations
RENAME TO railway_stations;

-- 58.) Add a new table:
CREATE TABLE routes (
 route_id INT AUTO_INCREMENT PRIMARY KEY,
 route_name VARCHAR(100) NOT NULL
);

-- 59.) delete table bookings:
Drop table bookings;

-- 60.) delete table trains:
Drop table trains;

-- 61.) delete table stations:
Drop table stations;

-- 62.) delete table passengers using IF EXISTS:
Drop table IF EXISTS passengers;

-- 63.) delete database Railway management:
Drop database Railway_management;






