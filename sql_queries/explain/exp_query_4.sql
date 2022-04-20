EXPLAIN
-- monthly trips amount
SELECT EXTRACT(MONTH FROM start_date) as months,
COUNT(all_trips_id)
FROM all_trips
GROUP BY months;