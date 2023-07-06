# **II. Prepare**

1. Data source from [divvy-tripdata].(<https://divvy-tripdata.s3.amazonaws.com/index.html>)
    - Raw data is downloaded to the local folder and uploaded to [share drive](<https://drive.google.com/drive/u/1/folders/12HO3jPFuwnwtFzn6vmG3d3gok1IlBVEb>)

2. Data Organized per month and consolidate to the share folder
3. Credibility of the data

    - Realiability: This data is realiable. The full data set has been used.
    - Originality: The original data has been modified to share publicly to a finction scenario. This data was shared by Coursera Capstone project.
    - Comprehensiveness: Since this is a fiction data based on the real database, so the riders' information is hide for security purposes. The data was collected appropriate and available to answer the questions.
    - Current: This data is up to date. But we only focus on FY 2022 to have a yearly overview. The data can be extended to May 2023.
    - Cited: The data from Google Analytics Capstone and located at Amazon AWS.

4. Data Organization

    - There are 12 files for 2022, 5 files for 2023 with naming YYYYMM-divvy-tripdata and 1 Station file naming divvy_station_YYYY_Q#Q#.

**Trip Data**

|Field Name|Type|Mode|
|------|------|----|
|ride_id|STRING|NULLABLE
|rideable_type|STRING|NULLABLE
|started_at|TIMESTAMP|NULLABLE
|ended_at|TIMESTAMP|NULLABLE
|start_station_name|STRING|NULLABLE
|start_station_id|STRING|NULLABLE
|end_stattion_name|STRING|NULLABLE
|end_station_id|STRING|NULLABLE|
|start_lat|FLOAT|NULLABLE|
|start_lng|FLOAT|NULLABLE|
|end_lat|FLOAT|NULLABLE|
|end_lng|FLOAT|NULLABLE|
|member_casual|STRING|NULLABLE|  

****Station Data****

|Field Name|Type|Mode|
|------|------|----|
|id|INTEGER|NULLABLE
|name|STRING|NULLABLE
|city|STRING|NULLABLE
|latitude|FLOAT|NULLABLE
|longtitude|FLOAT|NULLABLE
|dpcapacity|INTEGER|NULLABLE
|online_date|TIMESTAMP|NULLABLE
