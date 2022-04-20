create table trip_data(
	duration integer,
	start_date timestamp,
	end_date timestamp,
	st_station_num integer,
	start_station varchar(100),
	end_station_num integer,
	end_station varchar(100),
	bike_num varchar(7),
	member_type varchar(7)
);

select * from trip_data;

 --------------------------- importing daata from files --------------------------------------------------------------------------
copy trip_data (duration, start_date, end_date, st_station_num, start_station, end_station_num, end_station, bike_num, member_type) 
from 'D:\CityBike\data\input_data\2014Q4-capitalbikeshare-tripdata.csv'
delimiter ','
csv header;

copy trip_data (duration, start_date, end_date, st_station_num, start_station, end_station_num, end_station, bike_num, member_type) 
from 'D:\CityBike\data\input_data\2014Q3-capitalbikeshare-tripdata.csv'
delimiter ','
csv header;

copy trip_data (duration, start_date, end_date, st_station_num, start_station, end_station_num, end_station, bike_num, member_type) 
from 'D:\CityBike\data\input_data\2014Q2-capitalbikeshare-tripdata.csv'
delimiter ','
csv header;

copy trip_data (duration, start_date, end_date, st_station_num, start_station, end_station_num, end_station, bike_num, member_type) 
from 'D:\CityBike\data\input_data\2014Q1-capitalbikeshare-tripdata.csv'
delimiter ','
csv header;

copy trip_data (duration, start_date, end_date, st_station_num, start_station, end_station_num, end_station, bike_num, member_type) 
from 'D:\CityBike\data\input_data\202003-capitalbikeshare-tripdata.csv'
delimiter ','
csv header;
-----------------------------------------------------------------------------------------------------------------------------------

--creating new structure for DB
create table stations(
	station_id integer PRIMARY KEY,
	station_name varchar(100)
);

create table bikes(
	bike_id varchar(7) PRIMARY KEY, -- format: W------
	bike_model varchar(25) NULL
);

create table member_types(
	mem_type_id serial PRIMARY KEY,
	mem_type varchar(7)
);

create table all_trips(
	all_trips_id serial PRIMARY KEY,
	duration integer,
	start_date timestamp,
	end_date timestamp,
	st_station integer REFERENCES stations(station_id),
	end_station integer REFERENCES stations(station_id),
	bike_id varchar(7) REFERENCES bikes(bike_id),
	member_type serial References member_types(mem_type_id)
);


