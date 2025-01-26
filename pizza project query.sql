CREATE TABLE pizza_sales
				(pizza_id INT PRIMARY KEY,	
				order_id INT,	
				pizza_name_id	VARCHAR(50),
				quantity	INT,
				order_date	DATE,
				order_time	TIME,	
				unit_price	FLOAT,
				total_price	FLOAT,
				pizza_size	VARCHAR(50),
				pizza_category	VARCHAR(50),
				pizza_ingredients	VARCHAR(100),
				pizza_name VARCHAR (50)
				)


SELECT * FROM pizza_sales


-- DATA ANALYSIS --->

-- TASK 1: TOTAL REVENUE: THE SUM OF THE TOTAL PRICE OF ALL PIZZA ORDERS.

SELECT SUM(total_price) AS total_revenue
FROM pizza_sales

-- TASK 2: AVERAGE ORDER VALUE: THE AVG AMOUNT SPENT PER ORDER, CALCULATED BY 
-- DIVIDING THE TOTAL REVENUE BY THE TOTAL NUMBER OF ORDERS.

SELECT * FROM pizza_sales

SELECT 
	SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_order_value
FROM pizza_sales



-- TASK 3: TOTAL PIZZAS SOLD: THE SUM OF THE QUANTITIES OF ALL PIZZAS SOLD.

SELECT 
	SUM(quantity) AS total_pizza_sold
FROM pizza_sales


-- TASK 4: TOTAL ORDERS PLACED

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales


-- TASK 5: AVERAGE PIZZA PER ORDER: THE AVERAGE NUMBER OF PIZZAS SOLD PER ORDER,
-- CALCULATED BY DIVIDING THE TOTAL NUMBER OF PIZZAS SOLD BY THE TOTAL NUMBER OF ORDER.

SELECT
	CAST(CAST(COUNT(quantity) AS DECIMAL(10,2))/
	CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS avg_pizza_per_order
FROM pizza_sales

SELECT * FROM pizza_sales

-- TASK 6: DAILY TREND FOR TOTAL ORDERS: CREATE A BAR CHART THAT DISPLAYS THE DAILY TREND OF TOTAL ORDERS OVER A SPECIFIC
-- TIME PERIOD. THIS CHART WILL HELP US IDENTIFY PEAK HOURS OR PERIODS OF HIGH ORDER ACTIVITY.

SELECT 
	TO_CHAR(order_date, 'DAY') AS order_day,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC


-- TASK 7: MONTHLY TREND FOR TOTAL ORDERS: CREATE A  LINE CHART THAT ILLUSTRATES THE HOURLY TREND OF TOTAL ORDERS
-- THROUGHOUT THE DAY. THIS CHART WILL ALLOW US TO IDENTIFY PEAK HOURS OR PERIODS OF HIGH ORDER ACTIVITY.

SELECT 
		TO_CHAR(order_date, 'MONTH') AS month_name, 
		COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC

-- TASK 8: PERCENTAGE OF SALES BY PIZZA CATEGORY: CREATE A PIE CHART THAT SHOWS THE DISTRIBUTION OF SALES ACROSS
--  DIFFERENT PIZZA CATEGORIES. THIS CHART WILL PROVIDE INSIGHTS INTO  THE POPULARITY OF VARIOUS PIZZA CATEGORIES 
-- AND THEIR CONTRIBUTION TO OVERALL SALES.

SELECT 
	pizza_category, 
	SUM(total_price)/
	(SELECT SUM(total_price) FROM pizza_sales)*100
		AS perc_of_pizza_sales_by_category
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC


-- TASK 9: PERCENTAGE OF SALES BY PIZZA SIZE:

SELECT 
	pizza_size, 
	SUM(total_price)/
	(SELECT SUM(total_price) FROM pizza_sales)*100
		AS perc_of_pizza_sales_by_category
FROM pizza_sales
GROUP BY 1 
ORDER BY 2 DESC

-- TASK 10: TOP 5 BEST SELLERS BY REVENUE, TOTAL QUANTITY AND TOTAL ORDERS:

-- BY REVENUE --->

SELECT 
	pizza_name_id,
	SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- BY QUANTITY---->
SELECT 
	pizza_name_id,
	SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- BY ORDERS ------>

SELECT 
	pizza_name_id,
	SUM(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5



