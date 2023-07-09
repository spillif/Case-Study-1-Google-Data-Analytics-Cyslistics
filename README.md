# Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction

In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. To answer the key business questions, I will follow the steps of the data analysis process:

- [Ask](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/tree/main#ask)
- [Prepare](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/tree/main#prepare)
- [Process](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/tree/main#process)
- [Analyze](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/tree/main#analyze-and-share)
- [Share](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/tree/main#analyze-and-share)
- [Act](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/tree/main#act)

### Quick links

Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 06/30/23]  
  
SQL Queries:  
[01. Data Combining](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/01.%20Combining%20Data.sql)  
[02. Data Exploration](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/02.%20Exploring%20Data.sql)  
[03. Data Cleaning](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/03.%20Cleaning%20Data.sql)  
[04. Data Analysis](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/04.%20Analyzing%20Data.sql)  

Data Visualizations: [Tableau](https://public.tableau.com/app/profile/fillips.bui/viz/CyclisticsCaseStudy_16887412022800/CyclisticsStats2022)  

## Background

### Cyclistic

A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.
  
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.  
  
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.  

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. To do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.  

### Scenario

I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into yearly members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## [Ask](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/Ask.md#i-ask)

### Business Task

Devise marketing strategies to convert casual riders to members.

### Analysis Questions

Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

## [Prepare](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/Prepare.md#ii-prepare)

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

## [Process](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/Process.md#iii-process)

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

1. Find if can replace the null values.
2. Removed all the missing subjects.
3. Created new table with:
   - **ride_length**: duration of the trip
   - **day_of_week**: day starting the trip
   - **month**: month extract from trip starting day

## [Analyze](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/Analyze.md#iv-analyze) and [Share](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/Share.md#v-share)

SQL Query: [Data Analysis](https://github.com/spillif/Case-Study-1-Google-Data-Analytics-Cyslistics/blob/main/04.%20Analyzing%20Data.sql)  
Data Visualization: [Tableau](https://public.tableau.com/app/profile/fillips.bui/viz/CyclisticsCaseStudy_16887412022800/CyclisticsStats2022)  
The data is stored in [share drive](<https://drive.google.com/drive/u/1/folders/12HO3jPFuwnwtFzn6vmG3d3gok1IlBVEb>) and visualize in Tableau.  

```Question for analysis
How do annual members and casual riders use Cyclistic bikes differently?  
```

First, we compare the vehicle types among member and casual riders.  

![image](https://user-images.githubusercontent.com/126408630/252130539-4180dd36-b242-402b-9e3f-192dc753ff2a.png)
  
Member users made up 60% of the total trips for the year of 2022. Among the vehicle types, classic and eletric bicycle are mostly used by Member. Member cyclists using classical bikes are almost double than casual. Casual bikers using all types of vehicle including Docked bike, which is not a favourable for the member.
  
![image](https://user-images.githubusercontent.com/126408630/252131142-15a10ddb-0170-46a6-ad49-b72e4e83e6ef.png)

The total of trips per each bicycle types in 2022.

Next, the distributed of membership per month, day of week, and hours of day are being deeply scanned (using total trips and average travel duration in 2022).
  
1. **Months:**
   - Total trips: both membership types are sharing their behaviour, while their usage focus more during the nice weather (Spring and Summer) and decreasing when the winter starts. The number of casual riders using Cylistics increased when the travel season start (April) and decreased right after it (July - August). The trends for member riders is stretched up to October (before the winter time). Both of riders are share their favourable time in July.

   - Average duration: Casual riders (travellers and tourist) spent more time for Cyclistics than member riders (residents, citizens, students, etc.)

![image](https://user-images.githubusercontent.com/126408630/252132144-5a444c41-a7e1-4685-b58e-93e781420c5d.png)

2. **Days of Week:**
   - Total trips: Member riders tended to prefer using Cyclistics on weekdays. On the other hand, travellers and tourists began their trip on the weekends.

   - Average duration: Casual bikers spent daily 25 minutes meanwhile members are only 13 minutes.

![image](https://user-images.githubusercontent.com/126408630/252135693-a1531ad8-dc8b-4031-a720-e49506bf79cc.png)

3. **Hours of the Day:**
   - Members travels more often in early morning and evening (typical business hour). Early in the morning from 6 to 8 am when they go to work and evening from 4 to 7 pm when they head back home. The number of trips surges over the day and start to drops later of the day.

   - The average trip duration for member throughout the day is consistency. For casual users, their favour travel time from 10 to 3 pm and 22 pm to 1 am.
  
![image](https://user-images.githubusercontent.com/126408630/252136907-7eda09b1-b6b5-4b1d-bae7-d9eb5c4926e8.png)

-> We can assume that both member and casual are prefer using Cyclistics in Spring and Summer. Members tend to using the bike from their space to work and vice versa. Casual spends their leisure time using different types of bikes to enjoy the weekends. Casual user cycle double the usage duration than members. Casual trasients also having a greater variation from their journeys, they travel more on spring and summer, and on the weekends from 10 am to 2 pm. Their duration tails off in the evening (5 to 8 pm).

For further understand the difference between casual and member commuters, we may have to dig down into their start and end location.

- Member riders began their trips between the stations that they are often visit: Universities, schools, parks, residential areas, public/ priveate instituations, their workplace, etc.
- Casual riders is in the opposite side while they tend to pick up and drop off their vehicles from the station close to city monuments (museums, parks, etc.) Their favorite location was habour coasts.
  
![image](https://user-images.githubusercontent.com/126408630/252148532-0e2f8e6c-fb9d-4c1b-96cb-7a299ebc8efe.png)  
  
Top 50 start and end locations.

![image](https://user-images.githubusercontent.com/126408630/252150642-f9e245bf-b2f3-4622-8cdd-49094ed56b75.png)

Casual riders have frequently started their trips from the stations in the vicinity of museums, parks, beaches, harbour points and aquariums while members have begun their journeys from stations close to universities, residential areas, restaurants, hospitals, grocery stores, theatre, schools, banks, factories, train stations, parks and plazas.  

Summary:
  
|Casual|Member|
|------|------|
|Using the program during the daytime and on the weekend.|Mostly riding during the business hours time (8 am - 5pm)|
|Both prefer travel in Spring and Summer.|They rarely cycling in the winter.|
|Travel longer than members (double the time than members) and less frequently.|Consistenly using the vehicle to and from their workplace|
|Recreational areas.|Start and end location around their familiar areas (home, workplace, etc.)|  
  
## Act

After identifying the differences between casual and member riders, marketing strategies to target casual riders can be developed to persuade them to become members.  

**Recommendations:**  

1. The marketing campaigns must focus on the casual inclinations and along side their favourable racreational areas. The campaigns should begin before/ during Spring and Summer (their most favourite seasons), and on the weekend daytime (10 am to 2pm).
2. Since the casual riders mostly using program on seasonal and weekend basis, we may introduce the new membership type: seasonal pass, days pass (24/ 48/ 72 hours pass).
3. We can offer the cashback/ loyalty program, the more they use Cyclistics, the less they have to pay. We can giving them a bundle when purchasing the pass with the same ID.
