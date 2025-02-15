use project;

-- 1. Retrieve all successful bookings:
create view successful_booking as 
select * from bookings2
where Booking_status = "success";

select *from successful_booking;

-- 2. Find the average ride distance for each vehicle type:

create view avg_ride_distance_for_each_vehicle as 
select vehicle_type , avg(Ride_distance) as avgerage_distance
from bookings2
group by vehicle_type ;

select *from avg_ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
create view total_customers_cancel_rides as 
select count(*)
from bookings2
where booking_status = "canceled by customer";

select *from total_customers_cancel_rides;

-- 4. List the top 5 customers who booked the highest number of rides:

create view customer_highest_rides as 
select customer_id , count(booking_id) as total_rides
from bookings2
group by customer_id
order by  count(booking_id) desc
limit 5;

select *from customer_highest_rides;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view rides_canceled_due_to_personal_and_car_related_issues as 
select count(*) as rides_canceled
from bookings2
where canceled_rides_by_driver = "Personal & Car related issue";

select *from rides_canceled_due_to_personal_and_car_related_issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_and_min_driver_rating as 
select max(Driver_ratings) as max_rating , min(Driver_ratings) as min_rating
from bookings2
where vehicle_type = "Prime Sedan";

select *from max_and_min_driver_rating ;

-- 7. Retrieve all rides where payment was made using UPI:

create view UPI_payments as 
select *from bookings2
where payment_method = 'UPI';

select *from UPI_payments;


-- 8. Find the average customer rating per vehicle type:

create view average_cust_rating as 
select vehicle_type , round(avg(Customer_Rating),4) as avg_cust_rating
from bookings2
group by vehicle_type;

select *from average_cust_rating;

-- 9. Calculate the total booking value of rides completed successfully:

create view  totalrides_completed_successfully as 
select sum(Booking_value ) as total_booking_value 
from bookings2
where booking_status = "success";

select *from totalrides_completed_successfully ;


-- 10. List all incomplete rides along with the reason:

create view incomplete_rides_with_the_reason as 
select booking_id , Incomplete_rides_reason 
from bookings2
where Incomplete_rides = "Yes";

select *from incomplete_rides_with_the_reason;

