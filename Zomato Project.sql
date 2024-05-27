create schema Zomato;
describe main;

#Total Restaurants#
create view 1_Total_Restaurants as
select count(restaurantname1) as Total_Restaurants from main;

#Avg Rating#
Create view 2_avg_rating as
select avg(rating) as Avg_Rating from main;

#Total Citites#
Create view 3_Total_Citites as
select count(distinct(city)) as Total_Cities from main;

#Total Cusines#
create view 4_Total_Cuisines as
select count(distinct(cuisines)) as Total_Cuisines from main;

#Avg Cost for Two based on City#
create view 5_Citywise_Avg_cost_for_two as
Select city, avg(average_cost_for_two) from main
group by city 
order by avg(Average_Cost_for_two) desc 
limit 10 ;

#% of Restaurants having table booking#
create view 6_Restaurants_with_table_booking as
select has_table_booking, concat(round(count(Restaurantid)/(select count(restaurantid) from main)*100,2),"%") as `%` from main
group by has_table_booking;

#Restaurants based on avg Rating#
create view 7_Restaurants_based_on_avg_rating as
Select year(date) as Year,count(restaurantname1) as Restaurant,avg(rating) as Ratings from main
group by year(date)
order by year(date) ;

#Weekend & Weekday wise online_Delivery#   
create view 8_Weekend_Weekday_wise_online_Delivery as 
   SELECT
    CASE 
        WHEN days IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') THEN 'Weekday'
        WHEN days IN ('Saturday', 'Sunday') THEN 'Weekend'
    END AS Day_Category,
    Has_Online_delivery,
concat(round(count(Restaurantid)/(select count(restaurantid) from main)*100,2),"%") as `%` from main
   
GROUP BY
    Day_Category, Has_Online_delivery
    order by Has_Online_delivery;
