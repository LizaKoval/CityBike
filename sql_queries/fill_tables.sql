-- filling tables with the data
INSERT INTO stations (station_id, station_name)
select *
from (select st_station_num, start_station from trip_data
union
select end_station_num, end_station from trip_data) as temp_stations;
------------------------------------------------------
insert into member_types(mem_type)
select distinct member_type
from trip_data;
------------------------------------------------------
insert into bikes(bike_id)
select distinct bike_num
from trip_data;
------------------------------------------------------

insert into all_trips(duration, start_date, end_date, st_station, end_station, bike_id, member_type)
select duration, start_date, end_date, st_station_num, end_station_num, bike_num, mem_type_id
from trip_data
inner join member_types on trip_data.member_type = member_types.mem_type
; 

select * from all_trips;
