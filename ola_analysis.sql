-- Creating Database --
CREATE DATABASE OLA
USE OLA

-- Showing all the databases on MySQL Sever --
SHOW DATABASES

-- Showing all the data
SELECT * FROM bookings

-- Retrieve all successful bookings --
CREATE VIEW Successful_Bookings AS
SELECT *
FROM bookings
WHERE Booking_Status="Success"

SELECT * FROM Successful_Bookings

-- Find the average ride distance for each vehicle type --
CREATE VIEW Avg_Ride_Distance_Vehicle_Type AS
SELECT Vehicle_Type, AVG(Ride_Distance) as Avg_Distance
FROM bookings
GROUP BY Vehicle_Type
ORDER BY Vehicle_Type

SELECT * FROM Avg_Ride_Distance_Vehicle_Type

-- Get the total number of cancelled rides by customers -- 
SELECT count(*) as Total_Cancelled_Rides
FROM bookings
WHERE Booking_Status="Canceled by Customer"

-- List the top 5 customers who booked the highest number of rides -- 
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) as Total_Rides
FROM bookings
GROUP BY Customer_ID
ORDER BY Total_Rides DESC
LIMIT 5

SELECT * FROM Top_5_Customers

-- Get the number of rides cancelled by drivers due to personal and car-related issues --
SELECT COUNT(*) 
FROM bookings
WHERE Canceled_Rides_by_Driver="Personal & Car related issue"

-- Find the maximum and minimum driver ratings for Prime Sedan bookings --
SELECT MAX(Driver_Ratings), MIN(Driver_Ratings)
FROM bookings
WHERE Vehicle_Type="Prime Sedan"

-- Retrieve all rides where payment was made using UPI --
SELECT *
FROM bookings
WHERE Payment_Method ="UPI"

-- Find the average customer rating per vehicle type --
SELECT Vehicle_Type, AVG(Customer_Rating) as Customer_Rating
FROM bookings
GROUP BY Vehicle_Type

-- Calculate the total booking value of rides completed successfully --
SELECT SUM(Booking_Value)
FROM bookings
WHERE Booking_Status="Success"

-- List all incomplete rides along with the reason -- 
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides="Yes"



