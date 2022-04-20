EXPLAIN
-- max duration of a trip
SELECT MAX(end_date - start_date)
FROM all_trips;