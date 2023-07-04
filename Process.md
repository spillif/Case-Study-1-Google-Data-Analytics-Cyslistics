# **III. Process**

 Microsoft Excel and Spreadsheet are limited to use because the worksheet only contains 1,048,576 rows. Cyclistics data set has over the maximum of Ex and Spreadsheet.  
-> We chose to use BigQuery platforms to support huge data.

1. Uploading data  
Create dataset and loading raw data from share drive.

2. Combining data  
    - Combine 12 (2022 data) files into one single new table named "2022-divvy-tripdata." FY 2022 contains 5,667,717 rows.
    - Combine 5 (2023 data) files into one single new table named "2023-divvy-tripdata." 2023 contains 1,670,841 rows.

3. Exporing data integrity
    - Checking null for each columns
    - ride_id is the primary key since it dedicated to each travel ride.
        - ride_id length is 16 chars with no value excess the it.
    - rideable_type contains 3 unique values: electric_bike, classic_bike, docked_bike.
    - started_at/ ended_at present TIMESTAMP (YYYY-MM-DD hh:rr:ss UTC).
    - Review the min/ max of ride length.
    - Calculate the time usage: more than a day and less than a minute.
    - Explore start_stastion_name / start_station_id / end_station_name / end_station_id
    - Check if start_station_name / start_station_id / end_station_name / end_station_id is null  but have value in each of the table.
    - Check start_lat / start_lng / end_lat / end_lng.
    - Check member_casual - 2 unique values: member and casual.

4. Cleaning data
    - Find if can replace the null values.
    - Removed all the results (rows) with null values.
    - Created a new table with ride_length, day_of_week, and month.
    - Separate two tables:
        - Duration with ride_length longer than a day (converted to minute 1440 = 1 day) -> 4,291,805 rows.
        - Duration with ride_length longer than a minute and less than a day (> 1 and < 1440>) -> 156 rows -> can be ignored.
