-- checking null value for each columns

select 
  count(*) - count(ride_id) ride_id,
  count(*) - count(rideable_type) rideable_type,
  count(*) - count(started_at) started_at,
  count(*) - count(ended_at) ended_at,
  count(*) - count(start_station_name) start_station_name,
  count(*) - count(start_station_id) start_station_id,
  count(*) - count(end_station_name) end_station_name,
  count(*) - count(end_station_id) end_station_id,
  count(*) - count(start_lat) start_lat,
  count(*) - count(start_lng) start_lng,
  count(*) - count(end_lat) end_lat,
  count(*) - count(end_lng) end_lng,
  count(*) - count(member_casual) member_casual
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`;

-- checking duplicate rows - no duplicate

select count(ride_id) - count (distinct ride_id) as duplicate_rows
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`;

-- checking length of ride_id - all value contains 16 chars

select length(ride_id) as length_ride_id
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
group by length_ride_id;


-- checking rideable_type - 3 unique values and number of vehicle

select distinct rideable_type, count(rideable_type) as no_vehicle
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
group by rideable_type;

-- started/ ended at present TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC - min/ max of ride_length

select max (
  extract(HOUR from (ended_at - started_at)) * 60 +
  extract(MINUTE from (ended_at - started_at)) +
  extract(SECOND from (ended_at - started_at)) / 60) as longest_ride_length,
  min (extract(HOUR from (ended_at - started_at)) * 60 +
  extract(MINUTE from (ended_at - started_at)) +
  extract(SECOND from (ended_at - started_at)) / 60) as shortest_ride_length
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`;

-- calculate usage time of bike more than a day

select count(*) AS longer_than_a_day
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where (
  extract(HOUR from (ended_at - started_at)) * 60 +
  extract(MINUTE from (ended_at - started_at)) +
  extract(SECOND from (ended_at - started_at)) / 60) >= 1440;   -- longer than a day - total rows = 5360

select count(*) AS less_than_a_minute
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where (
  extract(HOUR from (ended_at - started_at)) * 60 +
  extract(MINUTE from (ended_at - started_at)) +
  extract(SECOND from (ended_at - started_at)) / 60) <= 1;      -- less than a minute - total rows = 122283

-- explore start_stastion_name start_station_id end_station_name end_station_id

select count (distinct start_station_name) as number_unique_station
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`; -- return = 1674

select count (distinct start_station_id) as number_unique_station_id
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`; -- return = 1313

select count(ride_id) as rows_missing_station_value
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where start_station_name is null or start_station_id is null; -- return = 833064

select count (distinct end_station_name) as number_of_end_unique_station
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`; -- return = 1692

select count (distinct end_station_id) as number_end_unique_station_id
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`; -- return = 1317

select count(ride_id) as rows_missing_start_station_value
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where end_station_name is null or end_station_id is null; -- return = 892742

-- check if start_station_name / start_station_id / end_station_name / end_station_id is null  but have value in each of the table

select distinct start_station_name,start_station_id
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where start_station_name is not null and start_station_id is null
order by start_station_id desc;

select distinct start_station_name,start_station_id
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where start_station_name is null and start_station_id is not null
order by start_station_id desc;

select distinct end_station_name,end_station_id
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where end_station_name is not null and end_station_id is null
order by end_station_id desc;

select distinct end_station_name,end_station_id
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where end_station_name is null and end_station_id is not null
order by end_station_id desc;

-- check start_lat / start_lng / end_lat / end_lng

select count(ride_id) as null_lat_lng
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where start_lat is null or start_lng is null; -- return = 0

select count(ride_id) as null_lat_lng
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where start_lat is null and start_lng is null; -- return = 0

select count(ride_id) as null_lat_lng
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where end_lat is null or end_lng is null; -- return = 5858

select count(ride_id) as null_lat_lng
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
where end_lat is null and end_lng is null; -- return = 5858

-- check member_casual - 2 unique values

select distinct member_casual, count(member_casual) as no_of_trips
from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
group by member_casual;
