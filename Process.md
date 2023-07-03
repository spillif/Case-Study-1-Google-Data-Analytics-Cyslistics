# **III. Process**

 Microsoft Excel and Spreadsheet are limited to use because the worksheet only contains 1,048,576 rows. Cyclistics data set has over the maximum of Ex and Spreadsheet.  
-> We chose to use BigQuery platforms to support huge data.

1. Uploading data  
Create dataset and loading raw data from share drive.

2. Combining data  
    - Combine 12 (2022 data) files into one single new table named "2022-divvy-tripdata." FY 2022 contains 5,667,717 rows.
    - Combine 5 (2023 data) files into one single new table named "2023-divvy-tripdata." 2023 contains 1,670,841 rows.

3. Exporing data integrity
