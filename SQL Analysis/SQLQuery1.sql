
--1. Retrieve all successful bookings.
create view booking_success as
SELECT * FROM bookings
WHERE Booking_status = 'Success';
Select * from booking_success;

--2. Find the average ride distance for each vehicle type.
CREATE VIEW ride_distance_for_each_vehicle as 
SELECT
    Vehicle_Type,
    AVG(Ride_Distance) AS Avg_Distance
FROM Bookings
GROUP BY Vehicle_Type;

Select * from ride_distance_for_each_vehicle

--3.Get the total number of canceled rides by customers.
CREATE view canceled_rides_by_customers as
Select count(*) as canceled_rides 
from bookings 
where Booking_Status='Canceled by Customer';
Select * from canceled_rides_by_customers

--4. List the top 5 customers who booked the highest number of rides.
CREATE VIEW Top_5_Customers as
SELECT TOP 5
    Customer_ID,
    COUNT(*) AS Total_Rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY Total_Rides DESC;

SELECT * from Top_5_Customers;

--5. Get the number of rides canceled by drivers due to personal and car-related issues.
CREATE VIEW Rides_canceled_by_drivers_P_C_Issues as
SELECT COUNT(*) AS Total_Cancelled_Rides
FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

--6. Find the minimum and maximum drivers ratings for prime sedan bookings:
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

--7.Retrieve all rides where payment was made using UPI.
Select * from bookings 
where payment_method='UPI';

--8. Find the average customer rating per vehicle type 
Select Vehicle_type,AVG(Customer_Rating) as avg_customer_rating
from bookings 
group by vehicle_type;

--9.Calculate the total booking value of rides completed successfully.
Select SUM(booking_value) as Total_Booking_Value from bookings
where Booking_status='Success';

--10.List all incomplete rides along with the reason : 
Select booking_id,Incomplete_Rides_Reason 
FROM bookings 
where Incomplete_Rides=1;