-- drop table if exists and create new table

drop table if exists `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`;

create table Cyclistics.clean_divvy_tripdata as
  select * , (
    extract(HOUR from (ended_at - started_at)) * 60 +
    extract(MINUTE from (ended_at - started_at)) +
    extract(SECOND from (ended_at - started_at)) / 60) as ride_length
   from `my-project-dana-390116.Cyclistics.2022-divvy-tripdata`
  ;

-- check new table data set

select *
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`;

-- cleaning data

select *, 
  case
    extract (DAYOFWEEK from started_at)
      when 1 then 'SUN'
      when 2 then 'MON'
      when 3 then 'TUE'
      when 4 then 'WED'
      when 5 then 'THU'
      when 6 then 'FRI'
      when 7 then 'SAT'
    end as day_of_week,
   case 
    extract (MONTH from started_at)
      when 1 then 'Jan'
      when 2 then 'Feb'
      when 3 then 'Mar'
      when 4 then 'Apr'
      when 5 then 'May'
      when 6 then 'Jun'
      when 7 then 'Jul'
      when 8 then 'Aug'
      when 9 then 'Sep'
      when 10 then 'Oct'
      when 11 then 'Nov'
      when 12 then 'Dec'
    end as month
from `my-project-dana-390116.Cyclistics.clean-divvy-tripdata`
where
start_station_name is not null and
end_station_name is not null and
end_lat is not null and
ride_length > 1 AND ride_length < 1440
order by ride_length desc; -- total 4,291,805 rows

--
