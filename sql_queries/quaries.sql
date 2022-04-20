SELECT * FROM all_trips;

--number of all trips
SELECT COUNT(all_trips) FROM all_trips;

-- max duration of a trip
SELECT MAX(end_date - start_date)
FROM all_trips;

--total bikes amount, which were used during the period
SELECT COUNT(bike_id) FROM bikes;

-- monthly trips amount
SELECT EXTRACT(MONTH FROM start_date) as months,
COUNT(all_trips_id)
FROM all_trips
GROUP BY months;

--total trips and term of usage per bike decreased by the trips amount
SELECT COUNT(all_trips_id) AS trips, SUM(end_date - start_date), bike_id 
FROM all_trips
GROUP BY bike_id
ORDER BY trips DESC;




