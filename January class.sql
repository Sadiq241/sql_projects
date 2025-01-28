-- Commenting : To prevent a code from executing or to explain line(s) of code  
-- Single line
-- multi line

-- DATABASE
-- TABLE NAME
-- COLUMNS
-- VALUES

-- DML: DATA MANIPULATING LANGUAGE
-- SELECT
-- INSERT 
-- DELETE 
-- UPDATE

-- DDL: DATA DEFINING LANGUAGE
-- CREATE 
-- ALTER
-- DROP

-- USE: To pick a database
-- SELECT : To pick column(s) from a table
-- SELECT column1, column2, column3, column....
-- SELECT *: Return all the columns in a table
-- FROM : Table to get the columns from
-- FROM database.table_name
-- LIMIT: To restrict the number of rowsor records
-- LIMIT number of rows n 
-- OFFSET to skip the number of record
-- OFFSET n
-- ORDER BY: To sort column(s) either in ASC or DESC 
-- ORDER BY column 1
-- ORDER BY using column position
-- WHERE: To filter column(s) based on a set condition
-- WHERE column 1 condition 1 (AND/OR) column 2 condition 2

-- Return ALL COLUMNS(fields) FROM actor table
SELECT *
FROM sakila.actor;

SELECT ACTOR_ID, fIrsT_name, last_name
FROM sakila.actor;


SELECT ACTOR_ID, fIrsT_name, last_name
FROM sakila.actor
LIMIT 100;

SELECT ACTOR_ID, fIrsT_name, last_name
FROM sakila.actor
LIMIT 20
OFFSET 40;

SELECT ACTOR_ID, fIrsT_name, last_name
FROM actor;

SELECT *
FROM actor;

SELECT *
FROM sakila.actor
ORDER BY last_name ASC;

SELECT first_name, last_name, actor_id
FROM sakila.actor
ORDER BY actor_id DESC
LIMIT 1
OFFSET 2;

SELECT first_name, last_name, actor_id
FROM sakila.actor
ORDER BY actor_id ASC
LIMIT 10;


SELECT *
FROM sakila.actor
ORDER BY first_name ASC, last_name DESC;

SELECT first_name, actor_id, last_name, first_name
FROM sakila.actor
ORDER BY first_name;

-- FILTER
-- Numeric filter (Value)
-- Non Numerics (Label/Text)
-- comparism operator >,<,>=,<=,=,!=
-- Logical operator: AND, OR, NOT
-- Membership operator: IN, BETWEEN

-- Numerics filter
SELECT *
FROM sakila.actor
WHERE actor_id = 10;

SELECT *
FROM sakila.actor
WHERE actor_id != 1;

-- Range of values
SELECT *
FROM sakila.actor
WHERE actor_id >20 AND actor_id <40;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 20 AND 40;

SELECT *
FROM sakila.actor
WHERE actor_id NOT BETWEEN 20 AND 40;

-- Random number
SELECT *
FROM sakila.actor
WHERE actor_id = 1 OR actor_id = 5 OR actor_id = 20;


SELECT *
FROM sakila.actor
WHERE actor_id IN (1,4,7,10,36,46,67,89,20);

SELECT *
FROM sakila.actor
WHERE actor_id NOT IN (1,4,7,10,36,46,67,89,20);

-- 20-40   60 -80
SELECT *
FROM sakila.actor
WHERE (actor_id BETWEEN 20 AND 40) OR (actor_id BETWEEN 60 AND 80);

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 20 AND 80 AND actor_id NOT BETWEEN 41 AND 59;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 20 AND 40
UNION
SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 60 AND 80;

-- Non Numerics filter
SELECT *
FROM sakila.actor
WHERE first_name = "penelope";

SELECT *
FROM sakila.actor
WHERE first_name = "Adam";

SELECT *
FROM sakila.actor
WHERE first_name = "Adam" AND last_name = "Grant";

SELECT *
FROM sakila.actor
WHERE first_name IN ("Adam", "Al", "Penelope", "Grace");

-- Wildcards
-- start with : character % eg  a%, b%, ade%
SELECT *
FROM sakila.actor
WHERE first_name LIKE "a%";

SELECT *
FROM sakila.actor
WHERE first_name NOT LIKE "a%";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "ca%";

-- Ends with: % character eg %ion, %ed, 
SELECT *
FROM sakila.actor
WHERE first_name LIKE "%ry";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "%e";

-- start with and ends with Character%Character
SELECT *
FROM sakila.actor
WHERE first_name LIKE "m%" AND first_name LIKE "%y";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "m%y";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "a%a";

-- Contains: %character% eg %a%, %s%
SELECT *
FROM sakila.actor
WHERE first_name LIKE "%a%";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "%ra%";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "%r%" AND first_name LIKE "%a%";


SELECT *
FROM sakila.actor
WHERE first_name LIKE "m____";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "_a%";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "a%" AND actor_id > 100;

SELECT *
FROM sakila.actor
WHERE first_name LIKE "a%" AND last_name LIKE "a%";


-- JOIN 
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN 


-- INNER JOIN
-- SELECT *
-- FROM left_table
-- INNER JOIN right_table
-- ON left_table.key = right_table.key

SELECT *
FROM sakila.customer
INNER JOIN sakila.address
ON sakila.customer.address_id = sakila.address.address_id;



SELECT *
FROM sakila.address
INNER JOIN sakila.customer
ON sakila.customer.address_id = sakila.address.address_id;

SELECT address, district, phone, first_name, last_name, email, customer.address_id
FROM sakila.address
INNER JOIN sakila.customer
ON sakila.customer.address_id = sakila.address.address_id;


SELECT *
FROM sakila.address
INNER JOIN sakila.city
ON sakila.address.city_id = sakila.city.city_id;

SELECT address, district, address.city_id, phone, city
FROM sakila.address
INNER JOIN sakila.city
ON sakila.address.city_id = sakila.city.city_id;

SELECT address, district, sa.city_id, phone, city
FROM sakila.address AS sa
INNER JOIN sakila.city AS sc
ON sa.city_id = sc.city_id;


SELECT *
FROM sakila.address
INNER JOIN sakila.city
USING (city_id);

SELECT *
FROM sakila.address
INNER JOIN sakila.customer
USING (address_id)
INNER JOIN sakila.city
USING(city_id)
INnER JOIN sakila.country
USING(country_id);


SELECT *
FROM sakila.address
LEFT JOIN sakila.customer
USING (address_id)
WHERE customer_id IS NULL;


SELECT *
FROM sakila.customer AS sc
RIGHT JOIN sakila.address AS sa
ON sc.address_id = sa.address_id
WHERE customer_id IS NULL;

SELECT *
FROM sakila.customer
LEFT JOIN sakila.address
USING (address_id);

SELECT *
FROM sakila.address
RIGHT JOIN sakila.customer
USING(address_id);

-- UNION 
-- UNION ALL
-- EXCEPT
-- INTERSECT

-- AGGREGRATES
-- SUM, AVERAGE, MIN, MAX, COUNT, DISTINCT COUNT
SELECT SUM(population), AVG(population), MAX(population), MIN(population), COUNT(*), COUNT(name)
FROM world.city;

SELECT SUM(population) AS total_population
FROM world.city;


SELECT ROUND(AVG(population),2) AS avg_pop
FROM world.city;

SELECT COUNT(DISTINCT countrycode), COUNT(countrycode)
FROM world.city;

SELECT COUNT(DISTINCT district)
FROM world.city;

SELECT SUM(population)AS total_pop, COUNT(name)AS city_count, AVG(population) AS avg_pop
FROM world.city
WHERE countrycode = "NGA";

SELECT countrycode, SUM(population) AS total_population
FROM world.city
GROUP BY countrycode
ORDER BY total_population DESC;

SELECT countrycode, COUNT(name) AS city_count
FROM world.city
GROUP BY CountryCode
ORDER BY city_count DESC;

SELECT  countrycode, district, COUNT(name)
FROM world.city
GROUP BY  countrycode, district;

-- filtering an aggregrate column
SELECT district, COUNT(name) AS city_count
FROM world.city
GROUP BY district
HAVING city_count >10;

SELECT district, COUNT(name) AS city_count
FROM world.city
WHERE countrycode IN ("USA", "ESP")
GROUP BY district
HAVING city_count >10;

SELECT district, COUNT(name) AS city_count
FROM world.city
GROUP BY district 
HAVING district IN ("England", "Florida", "Texas") AND city_count > 10;

SELECT COUNT(DISTINCT district), COUNT(DISTINCT countrycode)
FROM world.city;

-- logical function
-- CASE 
-- WHEN column 1 condition 1 THEN result 1
-- WHEN column 2 condition 2 THEN result 2
-- WHEN column N condition N then result N
-- ELSE result
-- END 

SELECT *, 
CASE
WHEN actor_id <=50 THEN "1-50"
WHEN actor_id <=100 THEN "51-100"
WHEN actor_id <=150 THEN "101-150"
WHEN actor_id <=200 THEN "151-200"
END AS category
FROM sakila.actor;

SELECT *, 
CASE
WHEN actor_id >150 AND actor_id <=200  THEN "151-200"
WHEN actor_id >100 THEN "101-150"
WHEN actor_id >50  THEN "51-100"
WHEN actor_id >=1 THEN "1-50"
END AS category
FROM sakila.actor
HAVING category = "101-150";

-- Text function
-- upper, ucase
-- lower, lcase
-- trim
-- concat
-- WS Concat
-- replace
-- LEFT
-- RIGHT
-- MID
-- length

SELECT UCASE(name), name, UPPER(name)
FROM world.city;

SELECT first_name, LOWER(first_name), LCASE(first_name)
FROM sakila.actor;

SELECT TRIM("    United States");

SELECT first_name, last_name, LOWER(CONCAT(first_name, " ", last_name)) AS full_name
FROM sakila.actor;

SELECT first_name, last_name, CONCAT_WS("-",first_name, last_name, actor_id, first_name)
FROM sakila.actor;

SELECT first_name, LEFT(first_name, 3), RIGHT(first_name, 2), MID(first_name, 3,4)
FROM sakila.actor;

SELECT first_name, REPLACE(first_name, "PENELOPE", " ")
FROM sakila.actor;

SELECT first_name, CASE WHEN actor_id BETWEEN 1 AND 3 THEN REPLACE(first_name, first_name, " ") else first_name END AS new_column
FROM sakila.actor;

-- DATE FUNCTIONS
SELECT last_update, YEAR(last_update), MONTH(last_update), MONTHNAME(last_update)
FROM sakila.actor;

SELECT last_update, WEEK(last_update), WEEKDAY(last_update),DAYNAME(last_update), dayofweek(last_update)
FROM sakila.actor;

SELECT DATE_PART("Year",last_update);

SELECT EXTRACT(MONTH FROM last_update), EXTRACT(YEAR FROM last_update)
FROM sakila.actor;

-- DATA DEFINING LANGUAGE
-- CREATE
-- ALTER
-- DROP
CREATE DATABASE october_cohort;
USE october_cohort;

CREATE TABLE student(student_id INT NOT NULL,
					 student_name VARCHAR(40) NOT NULL,
                     gender VARCHAR(20)
                     );
-- To add a new column to an existing table
ALTER TABLE student
ADD COLUMN email VARCHAR(100) NOT NULL,
ADD COLUMN address VARCHAR(100);

-- Remove columns from an existing table
ALTER TABLE student
DROP COLUMN email,
DROP COLUMN address;

-- Rename columns in an existing table
ALTER TABLE student
RENAME COLUMN gender TO sex;

-- Change column datetype
ALTER TABLE student
MODIFY sex VARCHAR(20);


-- DML: DATA MANIPULATING LANGUAGE
-- SELECT
-- INSERT 
-- DELETE 
-- UPDATE

INSERT INTO student(student_id, student_name, sex, email, address)
VALUES(241351, "Mujeeb", "M", "Mujeeb@sqi.com", "Ibadan"),
	  (241377, "Molayo", "F", "Molayo@sqi.com", "Osun"),
      (241528, "Julius", "M", "Julius@sqi.com", "Edo"),
      (210459, "Omolola", "F", "Omolola@sqi.com", "Ogun");

UPDATE student
SET sex = "Female"
WHERE address LIKE "o%";

UPDATE student
SET sex = "Male"
WHERE sex = "M";

DELETE 
FROM student
WHERE student_id = 210459;

DROP DATABASE october_cohort;

DROP TABLE student;

CREATE DATABASE superstore_;

SELECT YEAR(order_date) AS yr, CONCAT("$ ", ROUND(SUM(sales),2)) AS total_sales, CONCAT("₦ ", ROUND(SUM(sales)*1600),2) AS naira
FROM superstore.orders
GROUP BY yr
ORDER BY 1;

SELECT MONTHNAME(order_date) AS mn, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY mn
ORDER BY MONTH(order_date);

SELECT YEAR(order_date) AS yr, MONTHNAME(order_date) AS mn, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY yr, mn
ORDER BY yr, MONTH(order_date);

SELECT QUARTER(order_date) AS qtr, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY qtr;

SELECT YEAR(order_date) AS yr, CONCAT("Qtr",QUARTER(order_date)) AS qtr, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY yr, qtr
ORDER BY yr,qtr;

SELECT DAYNAME(order_date) AS dn, SUM(sales)
FROM superstore.orders
GROUP BY dn
ORDER BY WEEKDAY(order_date);

SELECT ship_mode, AVG(DATEDIFF(ship_date,order_date)), COUNT(DISTINCT customer_id), COUNT(DISTINCT order_id)
FROM superstore.orders
GROUP BY ship_mode;


-- SUBQUERY
-- SELECT
-- FROM CTE
-- WHERE 

SELECT category ,SUM(sales) AS cat_sales, (SELECT SUM(sales) FROM superstore.orders) AS total_sales
FROM superstore.orders
GROUP BY category;

SELECT SUM(population), (SELECT SUM(population) FROM world.country)
FROM world.city;

SELECT category, SUM(sales) AS total_sales,ROUND((SUM(sales)/(SELECT SUM(sales) FROM superstore.orders))*100,2) AS perc
FROM superstore.orders
GROUP BY category;

SELECT category, SUM(sales),  (SELECT SUM(sales) FROM superstore.orders WHERE category = "Furniture") AS furniture_sales
FROM superstore.orders
GROUP BY category;

SELECT SUM(sales) AS gross_sales, (SELECT SUM(sales) 
								  FROM superstore.orders 
								  LEFT JOIN superstore.returns 
								  USING(order_id) 
								  WHERE returned IS NULL) AS net_sales																	
FROM superstore.orders
LEFT JOIN superstore.returns
USING(order_id);

SELECT SUM(sales)
FROM superstore.orders
INNER JOIN superstore.returns
USING (order_id);

SELECT sub_category, SUM(sales) AS total_sales,ROUND((SUM(sales)/(SELECT SUM(sales) FROM superstore.orders))*100,2) AS perc
FROM superstore.orders
GROUP BY sub_category;

SELECT category, cat_sales, total_sales, ROUND((cat_sales/total_sales) *100,2) AS perc
FROM(
	SELECT category, ROUND(SUM(sales),2) AS cat_sales, ROUND((SELECT SUM(sales) FROM superstore.orders),2) AS total_sales
	FROM superstore.orders
	GROUP BY category) AS sub;
    
SELECT gross_sales, net_sales, gross_sales-net_sales
FROM(
	SELECT SUM(sales) AS gross_sales, (SELECT SUM(sales) 
									  FROM superstore.orders 
									  LEFT JOIN superstore.returns 
									  USING(order_id) 
									  WHERE returned IS NULL) AS net_sales																	
	FROM superstore.orders
	LEFT JOIN superstore.returns
	USING(order_id))  AS sub;
    
    
-- CTE common table expression

WITH new_table AS (
SELECT category, ROUND(SUM(sales),2) AS cat_sales, ROUND((SELECT SUM(sales) FROM superstore.orders),2) AS total_sales
FROM superstore.orders
GROUP BY category)

SELECT category, cat_sales, total_sales, (cat_sales/total_sales) * 100
FROM new_table;

-- gross sales, net sales, 
-- USING FROM SUB QUERY

SELECT gross, net, gross-net AS diff
FROM(
SELECT ROUND(SUM(sales),2) AS gross, (SELECT ROUND(SUM(sales),2)
							FROM superstore.orders
                            LEFT JOIN superstore.returns
                            USING(order_id)
                            WHERE returned IS NULL) AS net
FROM superstore.orders
LEFT JOIN superstore.returns
USING (order_id)
				) AS sub;

-- USING CTE
WITH new_table AS (
SELECT ROUND(SUM(sales),2) AS gross, (SELECT ROUND(SUM(sales),2) 
									 FROM superstore.orders
                                     LEFT JOIN superstore.returns
                                     USING(order_id)
                                     WHERE returned IS NULL) AS net
FROM superstore.orders
LEFT JOIN superstore.returns
USING(order_id)
)

SELECT gross, net, gross-net
FROM new_table;


SELECT *
FROM superstore.orders
WHERE order_id NOT IN (SELECT order_id FROM superstore.returns);

SELECT *
FROM world.city
WHERE population  > (SELECT population FROM world.country WHERE name = "Armenia");

SELECT district, SUM(population)
FROM world.city
GROUP BY district
HAVING SUM(population) > (SELECT population FROM world.country WHERE name = "Armenia");

SELECT SUM(total_pop)
FROM(
SELECT district, SUM(population) AS total_pop
FROM world.city
GROUP BY district) AS new_;

WITH new_table AS(
SELECT district, SUM(population) AS total_pop
FROM world.city
GROUP BY district)

SELECT total_pop
FROM new_table;

CREATE VIEW world.district_population AS 
SELECT district, SUM(population) AS total_pop
FROM world.city
GROUP BY district;


-- WINDOW FUNCTION
-- RANK
-- DENSE RANK
-- ROW NUMBER
-- LAG
-- LEAD


SELECT product_name, SUM(sales) AS total_sales, RANK()OVER(ORDER BY ROUND(SUM(sales))DESC)
FROM superstore.orders
GROUP BY product_name;

SELECT product_name, SUM(quantity) AS total_sales, RANK()OVER(ORDER BY SUM(quantity)DESC)AS rank_,
												   DENSE_RANK()OVER(ORDER BY SUM(quantity)DESC)AS denserank,
                                                   ROW_NUMBER()OVER(ORDER BY SUM(quantity)DESC)AS rownumber
FROM superstore.orders
GROUP BY product_name;

SELECT category,sub_category, SUM(quantity) AS total_qty, RANK()OVER(PARTITION BY category ORDER BY SUM(quantity)DESC)AS rank_
FROM superstore.orders
GROUP BY category, sub_category;

SELECT category, product_name, total_sales
FROM(
SELECT category, product_name, SUM(sales)AS total_sales, RANK()OVER(PARTITION BY category ORDER BY SUM(sales) DESC) AS rank_
FROM superstore.orders
GROUP BY category, 	product_name) AS sub
WHERE rank_ <=10;

-- 6.	Product that has the highest number of return.
SELECT category,product_name, COUNT(returned), DENSE_RANK()OVER(PARTITION BY category ORDER BY COUNT(returned) DESC) AS rank_
FROM superstore.orders
INNER JOIN superstore.returns
USING(order_id)
GROUP BY category, product_name;


-- LAG (before)
SELECT category, SUM(sales), LAG(SUM(sales)) OVER(ORDER BY category DESC)
FROM superstore.orders
GROUP BY category;

SELECT category, sub_category,SUM(sales), LAG(SUM(sales)) OVER(PARTITION BY category ORDER BY sub_category) AS prev_
FROM superstore.orders
GROUP BY sub_category;

-- PREVIOUS YEAR SALES
SELECT YEAR(order_date) AS yr, SUM(sales), LAG(SUM(sales)) OVER(ORDER BY YEAR(order_date))
FROM superstore.orders
GROUP BY yr;

SELECT YEAR(order_date) AS yr,MONTHNAME(order_date) AS mn, SUM(sales), LAG(SUM(sales)) OVER(ORDER BY YEAR(order_date), MONTH(order_date))
FROM superstore.orders
GROUP BY yr,mn;

SELECT *,
CASE
WHEN actor_id <=10 AND first_name LIKE"B%" THEN actor_id * 0.1
WHEN actor_id BETWEEN 11 AND 20 THEN actor_id * 0.2 
END AS perc
FROM sakila.actor;

SELECT customer_name,COUNT(DISTINCT order_id)
FROM superstore.orders
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) >=10;

WITH new_ AS(
SELECT customer_name, order_date, sales, 
CASE
WHEN rank_ = 10 THEN sales * 0.1
ELSE ""
END AS discount_purchase
FROM(
SELECT customer_name, order_date,order_id, product_name,sales, DENSE_RANK() OVER(PARTITION BY customer_name ORDER BY order_date, order_id) AS rank_
FROM superstore.orders ) AS sub )

SELECT customer_name, order_date,sales, discount_purchase, sales-discount_purchase
FROM new_;

WITH point_table AS(
SELECT customer_name, SUM(sales) AS total_sales, 
CASE
WHEN SUM(sales) BETWEEN 100 AND 2000 THEN 1
WHEN SUM(sales) BETWEEN 2000 AND 5000 THEN 2
WHEN SUM(sales) >5000 THEN 3
ELSE "" END AS sales_point
FROM superstore.orders
GROUP BY customer_name, order_id)

SELECT customer_name, SUM(total_sales), SUM(sales_point)
FROM point_table
GROUP BY customer_name;

SELECT yr, c_sales, p_sales, (c_sales- p_sales)/p_sales*100,
CASE WHEN c_sales- p_sales < 0 THEN "▼"
WHEN c_sales- p_sales > 1 THEN "▲" 
ELSE "" END AS direction 
FROM(
SELECT YEAR(order_date) AS yr, SUM(sales) AS c_sales, LAG(SUM(sales)) OVER(ORDER BY YEAR(order_date)) AS p_sales
FROM superstore.orders
GROUP BY yr) AS sub;























