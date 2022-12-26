-- Created a Database 
CREATE database cohort;

USE cohort;

-- Created table to receive .CSV data
CREATE TABLE superstore(row_id INT, order_id VARCHAR(50), Order_date DATE,	
						Ship_date DATE, Ship_mode VARCHAR(20),	Customer_id VARCHAR(50), Customer_name VARCHAR(50),	
						Segment VARCHAR(50), Country VARCHAR(20), City VARCHAR(50), State VARCHAR(50), Postal_code INT, 
						Region VARCHAR(50),	Product_id VARCHAR(50),	Category VARCHAR(50), Sub_Category VARCHAR(50), 
						Product_name VARCHAR(100), Sales FLOAT, Quantity INT, Discount FLOAT, Profit FLOAT);

-- The method  I used to import data from CSV is the Load Data infile. Before I proceeded,  I needed to be sure global variable is enabled 
show global variables like 'local_infile';

-- Since it was not enabled, I used the suntax below to enable it 
set global local_infile=true;

-- Proceeded to load data 
LOAD DATA LOCAL INFILE 'C:/Users/User/Desktop/Sample_Superstore.csv'
INTO TABLE superstore
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Data was preveiewed to understand fields in the data
-- NB: I worked on analysing branches in the Central region 
SELECT * FROM superstore WHERE Region = 'Central';

-- Grouped customers into Cohots according to Month of first order
SELECT customer_name, MIN(month(order_date)) as first_Order_month
FROM	superstore
WHERE 	Region = 'Central'
GROUP BY customer_name
ORDER BY first_Order_month;


-- Retention analysis 
SELECT customer_name, year(order_date) as Year, MIN(quarter(order_date)) as first_quarter from superstore
group by customer_name, order_date;

WITH main as(
	SELECT t0.customer_name, t0.year, t0.Months, 
		   first_Order_month, 
           months - first_Order_month AS month_no
	FROM 
		   (SELECT customer_name, year(order_date) as year, month(order_date) as Months from superstore where Order_date like '%2022%') t0

	JOIN

	(SELECT customer_name, Year, first_Order_month 
	FROM 
		  (SELECT customer_name, year(order_date) as Year, MIN(month(order_date)) as first_Order_month from superstore  where Order_date like '%2022%' group by customer_name, order_date) t1
		  GROUP BY customer_name, first_Order_month) t2
	ON t0.customer_name = t2.customer_name
    GROUP BY customer_name, months)             

-- End of CTE

SELECT first_Order_month, COUNT(DISTINCT customer_name) as First_customer_count, 
-- ROUND((SUM( CASE when month_no = 0 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Month_0,
ROUND((SUM( CASE when month_no = 1 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_1,
ROUND((SUM( CASE when month_no = 2 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_2,
ROUND((SUM( CASE when month_no = 3 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_3,
ROUND((SUM( CASE when month_no = 4 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_4,
ROUND((SUM( CASE when month_no = 5 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_5,
ROUND((SUM( CASE when month_no = 6 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_6,
ROUND((SUM( CASE when month_no = 7 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_7,
ROUND((SUM( CASE when month_no = 8 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_8,
ROUND((SUM( CASE when month_no = 9 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_9,
ROUND((SUM( CASE when month_no = 10 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_10,
ROUND((SUM( CASE when month_no = 11 THEN 1 ELSE 0 END) / SUM( CASE when month_no = 0 THEN 1 ELSE 0 END)) * 100, 1) as   Ret_Month_11
from main
GROUP BY first_Order_month;


