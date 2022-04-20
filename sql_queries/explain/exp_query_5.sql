EXPLAIN
--total trips and term of usage per bike decreased by the trips amount
SELECT COUNT(all_trips_id) AS trips, SUM(end_date - start_date), bike_id 
FROM all_trips
GROUP BY bike_id
ORDER BY trips DESC;

