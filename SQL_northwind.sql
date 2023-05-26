--If you want to also practice below code, please download 'northwind' csv file 
--and change the path of pd.read_csv underneath.
--Q1 What is the range of order_dates?
SELECT 
	MAX(order_date), 
	MIN(order_date)
FROM northwind AS n; 

--Q2 What is the total sale_amount? Please round this value appropriately.
SELECT 
	ROUND(SUM(n.sale_amount), 2)
FROM northwind AS n; 

--Q3 How many orders are there?
SELECT COUNT (DISTINCT n.order_id)
FROM northwind AS n;

select * from northwind n 

--Q4 How many countries did we ship our products to? Please list them.
SELECT 
	DISTINCT(n.ship_country) AS country_list, 
FROM northwind AS n; 

SELECT 
	COUNT(DISTINCT n.ship_country) AS country_number
FROM northwind AS n; 

--Q5 To which country did we ship the most orders?
SELECT 
		n.ship_country, 
	    COUNT(DISTINCT n.order_id)
FROM northwind AS n 
GROUP BY n.ship_country 
ORDER BY COUNT(DISTINCT n.order_id) DESC;
-- LIMIT 1 (comment this out if like to see the whole order)

--Q6 Create a new column called unit_price, using sale_amount and quantity
ALTER TABLE northwind 
ADD unit_price AS (sale_amount/quantity);

--Q6 Another way avoiding changing the original dataset
SELECT 
	n.product_name,
	sale_amount, 
	quantity, 
	ROUND(sale_amount/quantity) AS unit_price_rounded 
FROM northwind AS n 	

--Q7 (revised) What is the most expensive item by unit_price?
SELECT 
	n.product_name, 
	ROUND(n.unit_price, 1)
FROM northwind AS n 
GROUP BY n.product_name 
ORDER BY n.unit_price DESC 
--LIMIT 1

--Q8 (orginal answer) What category generated the least in sale_amount?
 --the aggregated sale_amount for each category and the category with the greatest sale_amount. 
SELECT 
	n.category_name,
	MIN(n.sale_amount) 
FROM northwind AS n 

--Q8 (revised)

SELECT 
	n.category_name, 
	SUM(n.sale_amount) AS sum_sale 
FROM northwind AS n 
GROUP BY n.category_name 
ORDER BY sum_sale ASC
--LIMIT 1 (OPTIONAL)

--Q9 What is the most popular product by quantity sold?
SELECT 
	n.product_name, 
	SUM(n.quantity) AS quantity_sold
FROM northwind AS n 
GROUP BY n.product_name
ORDER BY quantity_sold DESC
LIMIT 1

--Q10 Which country ordered the greatest quantity of the most popular product (from #9)?
SELECT n.product_name, SUM(n.quantity) AS total_quantity, n.ship_country  
FROM northwind AS n 
WHERE n.product_name = 'Camembert Pierrot'
GROUP BY n.ship_country 
ORDER BY total_quantity DESC
--LIMIT 1
































