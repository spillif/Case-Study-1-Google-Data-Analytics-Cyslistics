-- No user type per vehicle types

select member_casual, rideable_type, count(*) as total_trip_rideable
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual, rideable_type
order by member_casual, total_trip_rideable;

-- No of user type per month

select member_casual, month, count(*) as total_trip_month
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual, month, day_of_week
order by member_casual;

-- No of user type per day

select member_casual, day_of_week, count(ride_id) as total_trip_day
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual, day_of_week
order by member_casual, total_trip_day;

-- No of user type per hour of day

select member_casual, day_of_week, extract(HOUR from started_at) as hour_of_day, count(ride_id) as total_trip_hour
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual, day_of_week, hour_of_day
order by member_casual, day_of_week, total_trip_hour;

-- avg ride length per vehicle

select member_casual, rideable_type, avg(ride_length) as avg_travel_duration_vehicle
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual,rideable_type
order by member_casual;

-- avg ride length per user type per month

select member_casual, month, avg(ride_length) as avg_travel_duration_month
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual,month
order by member_casual;

-- avg ride length per user type per day

select member_casual, day_of_week, avg(ride_length) as avg_travel_duration_day
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual,day_of_week
order by member_casual;

-- avg ride length per user type per hour

select member_casual, day_of_week, avg(extract(HOUR from started_at)) as avg_travel_duration_hour
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual, day_of_week
order by member_casual;

-- avg ride start

select start_station_name, member_casual, avg(extract(HOUR from ended_at)) as avg_started_at
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual, start_station_name
order by start_station_name;

-- avg ride end

select end_station_name, member_casual, avg(extract(HOUR from ended_at)) as avg_ended_at
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by member_casual, end_station_name
order by end_station_name;

-- start location

select start_station_name, member_casual, avg(start_lat) as start_lat,
  avg(start_lng) as start_lng, count (ride_id) as total_trip
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by start_station_name, member_casual;

-- end location

select end_station_name, member_casual, avg(end_lat) as end_lat,
  avg(end_lng) as end_lng, count (ride_id) as total_trip
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
group by end_station_name, member_casual;

-- mode day of week

select rnk, day_of_week, cnt
from
(
  select day_of_week, cnt,dense_rank() 
  over(order by cnt DESC) as rnk
    from
    (
      select day_of_week, count(*) as cnt
      from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
      group by day_of_week
    )
)
order by rnk;

-- mode hour of day

select rnk, day_of_week, hour_of_day, cnt
from
( 
  select day_of_week, hour_of_day, cnt, dense_rank()
  over(order by cnt desc) as rnk
    from
    (
      select day_of_week, extract(HOUR from started_at) as hour_of_day, count (*) as cnt
      from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
      group by day_of_week, hour_of_day
    )
);
