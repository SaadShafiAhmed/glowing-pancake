--PROBLEM STATEMENT:
--A CHAIN OF BIKE STORES WANT TO EXPAND THEIR BUSINESS. SO WE ARE ANALYSING THE SALES DATA FROM 2016-18 TO COME UP WITH INSIGHTS TO DRIVE ITS EXPANSION PLAN

--COMPLETE OVERVIEW OF THE DATASET
SELECT * FROM PortfolioProject..BikeStores

--CHANGING THE COLUMN NAME OF F6 TO MONTH
ALTER TABLE BikeStores 
RENAME COLUMN F6 TO month;

--WE WANT TO LOOK AT THE COUNT OF ENTRIES FOR EACH COLUMN
SELECT CONVERT(INT,SUM(revenue)) as Total_Revenue, SUM(total_units) as Total_Units_Sold, COUNT(DISTINCT order_id) as Orders,
COUNT(DISTINCT customers) as Customers,COUNT(DISTINCT sales_rep) as Sales_Reps
FROM PortfolioProject..BikeStores

SELECT COUNT(DISTINCT city) as Cities, COUNT(DISTINCT state) as States, COUNT(DISTINCT product_name) as Products,
COUNT(DISTINCT category_name) as Categories,COUNT(DISTINCT brand_name) as Brands, COUNT(DISTINCT store_name) as Stores
FROM PortfolioProject..BikeStores

--NOW WE LOOK AT REVENUE PER YEAR
SELECT year,CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
GROUP BY year
ORDER BY Total_Revenue DESC

--ALSO THE REVENUE BY EACH MONTH AND RESPECTIVE UNITS SOLD IN THAT MONTH

SELECT TOP 10 month ,SUM(total_units) as Units_Sold, CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
GROUP BY month
ORDER BY Total_Revenue DESC

--TRYING TO LOOK AT REVENUE BY SEASONS

SELECT 
	CASE 
		WHEN month IN ('Jan','Feb','Dec') THEN 'Winter'
		WHEN month IN ('Apr','May','Mar') THEN 'Spring'
		WHEN month IN ('Jul','Aug','Jun') THEN 'Summer'
	    ELSE 'Autumn'
	END AS season,,CONVERT(INT,SUM(revenue)) as Total_Revenue,SUM(total_units) as Units_Sold
FROM PortfolioProject..BikeStores
GROUP BY season
ORDER BY Total_Revenue DESC;

--ONCE WE KNOW THE REVENUE BY SEASONS AND MONtg, WE NOW LOOK TO SEE THE STORES THAT GIVE US THE MOST REVENUE

SELECT store_name,SUM(total_units) as Units_Sold, CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
GROUP BY store_name
ORDER BY Total_Revenue DESC

--WE WANT TO SEE THE TOTAL REVENUE GENERATED IN EACH CITY AND STATE THEY BELONG

SELECT TOP 10 city,state,SUM(total_units) as Units_Sold, CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
GROUP BY city,state
ORDER BY Total_Revenue DESC

--WE WANT TO SEE THE TOTAL REVENUE GENERATED FOR EACH CATEGORY,BRAND,PRODUCT

SELECT TOP 10 category_name,SUM(total_units) as Units_Sold, CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
GROUP BY category_name
ORDER BY Total_Revenue DESC

SELECT TOP 10 brand_name,SUM(total_units) as Units_Sold, CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
GROUP BY brand_name
ORDER BY Total_Revenue DESC

SELECT TOP 10 product_name,SUM(total_units) as Units_Sold, CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
GROUP BY product_name
ORDER BY Total_Revenue DESC

--WE LOOK AT THE REVENUE GENERATED BY EACH SALES REPS AND THE STATE THEY BELONG TO

SELECT state,sales_rep,SUM(total_units) as Units_Sold, CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
GROUP BY sales_rep,state
ORDER BY Total_Revenue DESC

--SINCE NY IS GENERATING MOST REVENUE, WE NOW LOOK INTO THE TOP CATEGORIES SOLD IN NY BY REVENUE

SELECT TOP 10 category_name,SUM(total_units) as Units_Sold, CONVERT(INT,SUM(revenue)) as Total_Revenue
FROM PortfolioProject..BikeStores
WHERE state = 'NY'
GROUP BY category_name
ORDER BY Total_Revenue DESC

--WE CAN MAKE OUR RECOMMENDATIONS TO THE COMPANY BASED ON THESE QUERIES WE RAN AND ALSO MAKE ADDITIONAL QUERIES FOR MORE SPECIFIC INSIGHT THAT THEY WANT FROM THE DATA 