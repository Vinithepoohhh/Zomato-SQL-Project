CREATE TABLE zomato(
	OrderID	INT PRIMARY KEY,
	OrderDate DATE,
	Restaurant VARCHAR(50),
	City VARCHAR(50),
	Cuisine VARCHAR(50),
	Item VARCHAR(50),	
	Quantity INT,
	UnitPrice FLOAT,
	Discount FLOAT,
	DeliveryTimeMins FLOAT,
	CustomerRating FLOAT,
	TotalAmount FLOAT
);


SELECT * FROM zomato



--1. Find the top 3 restaurants per city based on total revenue
--2. Find the most ordered item for each cuisine
--3. Find restaurants with an average customer rating below the overall average 
--4. Calculate revenue contribution of each city (as a % of total)
--5. Find customers who placed multiple high-value orders (₹1000+)
--6. Calculate average delivery time by discount level
--7. Find the most profitable cuisine in each city
--8. Calculate the average rating per unit price range
--9. Which items had the highest average discount and were ordered over 100 times?





--1. Find the top 3 restaurants per city based on total revenue

SELECT 
	* 
	FROM
			(SELECT 
		restaurant,
		city,
		ROUND(SUM(totalamount)::NUMERIC,2) as Revenue,
		RANK() OVER(PARTITION BY city ORDER BY ROUND(SUM(totalamount)::NUMERIC,2) desc) as top_ranking
	FROM zomato
	GROUP BY 1,2) AS T1
	WHERE top_ranking<=3



--2. Find the most ordered item for each cuisine

SELECT 
	*
		FROM
			(SELECT
				cuisine,
				item,
				SUM(quantity),
				RANK()OVER(PARTITION BY cuisine ORDER BY SUM(quantity) DESC) AS top_item_from_each_cuisine
				FROM zomato
				GROUP BY 1,2
				) AS T1
WHERE  top_item_from_each_cuisine = 1

	
--3. Find restaurants with an average customer rating below the overall average

 SELECT 
	restaurant,
	city,
	ROUND(AVG(customerrating)::NUMERIC,2)
	FROM zomato
	GROUP BY 1,2
	HAVING ROUND(AVG(customerrating)::NUMERIC,2)<(SELECT AVG(customerrating)from zomato)



--4. Calculate revenue contribution of each city (as a % of total)

SELECT 
	city,
	ROUND(SUM(totalamount)::NUMERIC,2) AS total_revenue,
	ROUND(SUM(totalamount::NUMERIC)*100 /(SELECT SUM(totalamount) FROM zomato)::NUMERIC,2) AS percentage
	FROM zomato
	group by 1
	ORDER BY 3 DESC
	
 --5. Find customers who placed multiple high-value orders (₹1000+)
 
 SELECT
	orderid,
	city,
	SUM(totalamount) AS order_value
	FROM zomato
	WHERE totalamount>=1000
	GROUP BY 1,2
	ORDER BY 3 DESC


--6. Calculate average delivery time by discount level

SELECT * FROM ZOMATO
SELECT 
	discount,
	ROUND(AVG(deliverytimemins)::NUMERIC,0) AS Avg_delivery_time_in_mins
FROM zomato
GROUP BY 1
ORDER BY 1


--7. Find the most profitable cuisine in each city

SELECT 
	*
	FROM
		(SELECT 
			city,
			cuisine,
			SUM(totalamount)-SUM(DISCOUNT) AS TOTAL_PROFIT,
			RANK() OVER(PARTITION BY city ORDER BY ROUND(SUM(totalamount)::NUMERIC,2)DESC ) as PROFITABLE
			FROM zomato
			GROUP BY 1,2) AS T1
WHERE PROFITABLE=1

--8. Calculate the average rating per unit price range

SELECT 
	CASE
		WHEN unitprice<150 THEN'low'
		WHEN unitprice BETWEEN 150 AND 300 THEN 'medium'
		ELSE 'high'
		END AS pricerange,
	ROUND(AVG(customerrating)::NUMERIC,1)
	FROM zomato
	GROUP BY 1
			

--9. Which items had the highest average discount and were ordered over 100 times?
SELECT * FROM zomato

SELECT 
	item,
	ROUND(AVG(discount)::NUMERIC,2) AS avg_discount,
	SUM(quantity) AS total_quantity
	FROM zomato
	GROUP BY 1
	HAVING 
	 	   SUM(quantity)>=100
	ORDER BY 2 desc




	