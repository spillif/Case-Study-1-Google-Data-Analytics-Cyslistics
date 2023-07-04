-- combining data.

drop table if exists `my-project-dana-390116.Cyclistics.2022_divvy_tripdata`;

-- combining 12 months data into single table containing all data from Jan 2022 to Dec 2022 and Jan 2023 to May 2023

create table `my-project-dana-390116.Cyclistics.2022_divvy_tripdata` as (
  select * from `my-project-dana-390116.Cyclistics.202201-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202202-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202203-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202204-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202205-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202206-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202207-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202208-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202209-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202210-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202211-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202212-divvy-tripdata`
  );
  
-- checking no of rows 5667717 and export as the new table data
select * from `my-project-dana-390116.Cyclistics.2022_divvy_tripdata`;

-- combining data

drop table if exists `my-project-dana-390116.Cyclistics.2023_divvy_tripdata`;

-- combining 5 months data into single table containing all data from Jan 2023 to Dec 2023

create table `my-project-dana-390116.Cyclistics.2023_divvy_tripdata` as (
  select * from `my-project-dana-390116.Cyclistics.202301-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202302-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202303-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202304-divvy-tripdata`
  union all
  select * from `my-project-dana-390116.Cyclistics.202305-divvy-tripdata`
  );

 -- checking no of rows 1,670,841 rows and export as a new table data
select * from `my-project-dana-390116.Cyclistics.2023_divvy_tripdata` ;
