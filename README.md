# Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction

In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. To answer the key business questions, I will follow the steps of the data analysis process:

- [Ask](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/Ask.md#i-ask)
- [Prepare](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/Prepare.md#ii-prepare)
- [Process](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/Process.md#iii-process)
- [Analyze]()
- [Share]()
- [Act]()

### Quick links

Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 06/30/23]  
  
SQL Queries:  
[01. Data Combining](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/01.%20Combining%20Data.sql)  
[02. Data Exploration](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/02.%20Exploring%20Data.sql)  
[03. Data Cleaning](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/03.%20Cleaning%20Data.sql)  
[04. Data Analysis]()  

Data Visualizations: [Tableau]()  

## Background

### Cyclistic

A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.
  
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.  
  
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.  

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. To do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.  

### Scenario

I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into yearly members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask

### Business Task

Devise marketing strategies to convert casual riders to members.

### Analysis Questions

Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

## Prepare

### Data Source

Cyclistic’s historical trip data trends from Jan 2022 to Dec 2022 from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). **Motivate International Inc.** has made the data available under this [license](https://www.divvybikes.com/data-license-agreement).

This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

### Data Organization

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

## Process

We use BigQuery to combine the mothly data into single table from Jan to Dec 2022.

We could not process in Excel or Spreadsheet because the maximum that these systems can handle only up to 1,048,576 rows.

### Combining the Data

SQL Query: [Data Combining](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/01.%20Combining%20Data.sql)  
12 CSV files are uploaded as tables in the dataset '2022_tripdata'. Another table named "combined_data" is created, containing 5,667,717 rows of data for the entire year.

### Data Exploration

SQL Query: [Data Exploration](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/02.%20Exploring%20Data.sql)  
Get through the dataset to recognize the unusual and unidentify values.

1. The **ride_id** column show no duplicate, no null value, and have a concrete character length.
-> **ride_id** is the primary id.

   ![image](https://user-images.githubusercontent.com/126408630/251006408-2ff3e09b-9336-47b7-a85d-26be61269e83.PNG)

   ![image](https://user-images.githubusercontent.com/126408630/251006568-2a885cf6-9fae-4d25-882e-67b94def732d.PNG)

   ![image](https://user-images.githubusercontent.com/126408630/251007253-6f919973-784a-42c5-bb6e-7ffd06f6ef35.PNG)

   ![image](https://user-images.githubusercontent.com/126408630/251007609-50ff9aaa-547d-4345-958e-7b531d8e0e01.PNG)  

2. Checking duplication values for each fields.

   ![image](https://user-images.githubusercontent.com/126408630/251007429-2b8afec5-0e10-41d5-b2eb-7db04b55e11d.PNG)

3. There are 3 unique types of bikes **rideable_type** in our data.

   ![image](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/assets/126408630/9a9ff571-9440-46cc-a58d-78b29d77e43b)

4. **started_at** and **ended_at** follow TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC.

5. These fields need to be cleaned up.

   ![image](https://user-images.githubusercontent.com/126408630/251008679-81204158-794f-4399-bd8c-023475436fd6.PNG)

   - **start_sation_name**, **end_station_name**, **start_station_id**, and **end_station_id** contribute no value to the analysis.
   - **lat** and **lng** use to visualize mapping.

6. **member_casual** column has 2 unique values as a member or casual rider.

    ![image](https://user-images.githubusercontent.com/126408630/251009309-c01449ba-dc95-4228-b145-d4a961d55a72.PNG)

### Data Cleaning

SQL Query: [Data Cleaning](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/03.%20Cleaning%20Data.sql)  


  
## Analyze and Share

SQL Query: [Data Analysis]()  
Data Visualization: [Tableau]()  
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.  
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?  

First of all, member and casual riders are compared by the type of bikes they are using.  

![image]()
  
The members make up 59.7% of the total while the remaining 40.3% constitute casual riders. Each bike-type chart shows a percentage of the total. The most used bike is the classic bike followed by the electric bike. Docked bikes are used the least by only casual riders.
  
Next the number of trips distributed by the months, days of the week and hours of the day are examined.  
  
![image]()
![image]()
  
__Months:__ When it comes to monthly trips, both casual and members exhibit comparable behaviour, with more trips in the spring and summer and fewer in the winter. The gap between casuals and members is closest in the month of July in summer.  

__Days of Week:__ When the days of the week are compared, it is discovered that casual riders make more journeys on the weekends while members show a decline over the weekend in contrast to the other days of the week.  

__Hours of the Day:__ The members show 2 peaks throughout the day in terms of number of trips. One is early in the morning at around 6 am to 8 am and the other is in the evening at around 4 pm to 8 pm while the number of trips for casual riders increases consistently over the day till evening and then decreases afterwards.  
  
We can infer from the previous observations that member may be using bikes for commuting to and from work on the weekdays while casual riders are using bikes throughout the day, more frequently over the weekends for leisure purposes. Both are most active in summer and spring.  
  
The ride duration of the trips is compared to find the differences in the behaviour of casual and member riders.  
  
![image]()  
![image]()
  
Take note that casual riders tend to cycle longer than members do on average. The length of the average journey for members doesn't change throughout the year, week, or day. However, there are variations in how long casual riders cycle. In the spring and summer, on weekends, and from 10 am to 2 pm during the day, they travel greater distances. Between five and eight in the morning, they have brief trips.
  
These findings lead to the conclusion that casual commuters travel longer (approximately 2x more) but less frequently than members. They make long journeys on weekends and during the day outside of commuting hours and in spring and summer seasons, so they might be doing so for recreation purposes.  
  
To further understand the differences between casual and member riders, the locations of starting and ending stations can be analyzed. Stations with the most trips are considered using filters to draw out the following conclusions.  
  
![image]()  
  
Casual riders have frequently started their trips from the stations in the vicinity of museums, parks, beaches, harbour points and aquariums while members have begun their journeys from stations close to universities, residential areas, restaurants, hospitals, grocery stores, theatre, schools, banks, factories, train stations, parks and plazas.  
  
![image]()
  
A similar trend can be observed in ending station locations. Casual riders end their journey near parks, museums and other recreational sites whereas members end their trips close to universities, and residential and commercial areas. So this proves that casual riders use bikes for leisure activities while members extensively rely on them for daily commutes.  
  
Summary:
  
|Casual|Member|
|------|------|
|Prefer using bikes throughout the day, more frequently over the weekends in summer and spring for leisure activities.|Prefer riding bikes on weekdays during commute hours (8 am / 5 pm) in summer and spring.|
|Travel 2 times longer but less frequently than members.|Travel more frequently but with shorter rides (approximately half of the casual riders' trip duration).|
|Start and end their journeys near parks, museums, along the coast and other recreational sites.|Start and end their trips close to universities, residential and commercial areas.|  
  
## Act

After identifying the differences between casual and member riders, marketing strategies to target casual riders can be developed to persuade them to become members.  

**Recommendations:**  

1. Marketing campaigns might be conducted in spring and summer at tourist/recreational locations popular among casual riders.
2. Casual riders are most active on weekends and during the summer and spring, thus they may be offered seasonal or weekend-only memberships.
3. Casual riders use their bikes for longer durations than members. Offering discounts for longer rides may incentivize casual riders and entice members to ride for longer periods of time.
