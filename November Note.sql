-- DATABASE, TABLE, COLUMNS, VALUES

-- DDL: DATA DEFINING LANGUAGE
-- CREATE
-- ALTER
-- DROP

-- DML: DATA MANIPULATING LANGUAGE
-- SELECT
-- UPDATE 
-- MODIFY
-- DELETE
-- USE:To pick a database
-- SELECT: To pick column(s) from a table
-- SELECT column1, column2, column3, .....columnN
-- SELECT * SELECTING ALL COLUMNS FROM A TABLE
-- FROM: Table to return the columns from
-- FROM database.table_name
-- LIMIT: To restrict the number of records(rows)
-- LIMIT Number of rows
-- OFFSET: To skip number of records
-- OFFSET number of records to skip
-- ORDER BY: To sort column(s) either in ASC or DESC
-- ORDER BY column ASC 
-- WHERE: Filter columns based on set conditions
-- WHERE column 1 condition 1 (AND/OR) column 2 condition 2



-- returning all columns from sakila.actor table
SELECT *
FROM sakila.actor;

SELECT actor_id, first_name
FROM sakila.actor;

SELECT address_id, address, district, phone
FROM sakila.address;

SELECT *
FROM sakila.actor
LIMIT 20;

SELECT *
FROM sakila.actor
LIMIT 1
OFFSET 2;

SELECT *
FROM sakila.actor
ORDER BY first_name ASC;

SELECT *
FROM sakila.actor
ORDER BY first_name ASC, actor_id DESC;

-- FILTERING
-- Numerics/Value Filter 
-- Non Numerics/label/text Filter 
-- Comparism Operator: >, <,>=,<=,=,!=
-- Logical Operator: And, Or, Not
-- Membership Operator: Between, IN

-- Numerics
SELECT *
FROM sakila.actor
WHERE actor_id = 10;

SELECT *
FROM sakila.actor
WHERE actor_id != 10;

SELECT *
FROM sakila.actor
WHERE actor_id >= 100;

SELECT *
FROM sakila.actor
WHERE actor_id = 10 OR actor_id = 20;

SELECT *
FROM sakila.actor
WHERE actor_id IN (10,20,11, 70,44);

-- Range of values
SELECT *
FROM sakila.actor
WHERE actor_id >= 10 AND actor_id <= 20;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 10 AND 20;

SELECT *
FROM sakila.actor
WHERE actor_id NOT IN (10,20,11, 70,44);

SELECT *
FROM sakila.actor
WHERE actor_id NOT BETWEEN 10 AND 20;

-- 40-60
-- 100-120

SELECT *
FROM sakila.actor
WHERE (actor_id BETWEEN 40 AND 60) OR (actor_id BETWEEN 100 AND 120);

SELECT *
FROM sakila.actor
WHERE (actor_id BETWEEN 40 AND 60)
UNION
SELECT *
FROM sakila.actor
WHERE (actor_id BETWEEN 100 AND 120);

SELECT *
FROM sakila.actor
WHERE (actor_id NOT BETWEEN 1 AND 39) AND ACTOR_ID NOT BETWEEN  61 AND 99
AND actor_id <=120;

-- LABEL/TEXT
SELECT *
FROM sakila.actor
WHERE first_name = "adam";

SELECT *
FROM sakila.actor
WHERE first_name IN ("Al", "Ed", "Penelope", "Adam") AND last_name = "Guiness";

SELECT *
FROM sakila.actor
WHERE first_name = "Penelope" OR last_name = "Guiness";

SELECT *
FROM sakila.actor
WHERE first_name < "C";

-- WILDCARD CHARACTERS
-- Start with "Character %" eg "Ade%", "A%"

SELECT *
FROM sakila.actor
WHERE first_name LIKE "a%";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "pa%";

SELECT *
FROM sakila.actor
WHERE actor_id LIKE "1%";


-- End With "% Character" eg "%ed", "%ion"
SELECT *
FROM sakila.actor
WHERE first_name LIKE "%s";

SELECT *
FROM sakila.actor
WHERE actor_id LIKE "%0" OR actor_id LIKE "%5";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "%a";

-- Start with and end with Character % Character eg "a%s", "b%b, "p%e
SELECT *
FROM sakila.actor
WHERE first_name LIKE "a%m" ;

SELECT *
FROM sakila.actor
WHERE actor_id LIKE "1%1";

-- Contain "%Character% eg "%a%, %ar%
SELECT *
FROM sakila.actor
WHERE first_name LIKE "%a%";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "%ar%";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "%a%" AND first_name LIKE "%r%";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "r___e";

SELECT *
FROM sakila.actor
WHERE first_name LIKE "_r%";

-- JOINING IN SQL
-- Inner join
-- Left join
-- Right join
-- Full Join

-- SELECT *
-- FROM table a
-- INNER JOIN table b
-- ON table_a.key = table_b.key;

-- Joining address table with customer table using inner join
SELECT *
FROM sakila.address
INNER JOIN sakila.customer
ON sakila.address.address_id = sakila.customer.address_id;


SELECT city, country
FROM sakila.city
INNER JOIN sakila.country
ON sakila.city.country_id = sakila.country.country_id;

SELECT *
FROM sakila.city AS s
INNER JOIN sakila.country AS c
ON s.country_id = c.country_id;

SELECT city, country
FROM sakila.city 
INNER JOIN sakila.country 
USING(country_id);

SELECT CONCAT_WS(" ",first_name, last_name) full_name, email,  CONCAT_WS(" ",address, district, city, country) AS address
FROM sakila.address
INNER JOIN sakila.customer
USING(address_id)
INNER JOIN sakila.city
USING (city_id)
INNER JOIN sakila.country
USING(country_id);




-- LEFT JOIN
SELECT *
FROM sakila.address AS sa
LEFT JOIN sakila.customer AS sc
ON sa.address_id = sc.address_id;


SELECT *
FROM sakila.address AS sa
RIGHT JOIN sakila.customer AS sc
ON sa.address_id = sc.address_id;

SELECT *
FROM sakila.customer AS sc
LEFT JOIN sakila.address AS sa
ON sc.address_id = sa.address_id;


SELECT *
FROM sakila.address AS sa
LEFT JOIN sakila.customer AS sc
ON sa.address_id = sc.address_id;

SELECT *
FROM sakila.customer AS sc
RIGHT JOIN sakila.address AS sa
ON sc.address_id = sa.address_id;

-- UNION(APPEND)
-- UNION
-- UNION ALL
-- INTERSECT
-- EXCEPT


SELECT address_id
FROM sakila.address
UNION ALL
SELECT address_id
FROM sakila.customer;


SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 10 AND 20
UNION 
SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 40 AND 60;

-- AGGREGRATES
-- SUM, AVG, MIN, MAX, COUNT
SELECT SUM(population) AS total_pop
FROM world.city;

SELECT ROUND(AVG(population),2) AS avg_pop
FROM world.city;

SELECT MIN(population) AS min_pop
FROM world.city;

SELECT MAX(population) AS max_pop
FROM world.city;

SELECT SUM(population) AS total_pop, 
	   AVG(population) AS avg_pop, 
       MIN(population) AS min_pop, 
       MAX(population) AS max_pop
FROM world.city;

SELECT COUNT(name) AS city_count, COUNT(population), COUNT(*)
FROM world.city;

SELECT COUNT(countrycode)
FROM world.city;

SELECT COUNT(DISTINCT countrycode), COUNT(countrycode)
FROM world.city;

SELECT DISTINCT CountryCode 
FROM world.city;

SELECT district, SUM(population)
FROM world.city
GROUP BY district;

SELECT district, COUNT(name) AS city_name
FROM world.city
GROUP BY district;


SELECT district, AVG(population), SUM(population), MIN(population), MAX(population), COUNT(name)
FROM world.city
GROUP BY district;

SELECT countrycode, MIN(population)
FROM world.city
GROUP BY countrycode;

SELECT district, COUNT(name) AS city_count
FROM world.city
GROUP BY district
HAVING city_count >=50;

SELECT district, SUM(population) AS total_population
FROM world.city
GROUP BY district
HAVING SUM(population) <= 1000;


SELECT district, SUM(population) AS total_population
FROM world.city
WHERE district LIKE "a%"
GROUP BY district
HAVING SUM(population) >= 1000000;


SELECT district, SUM(population) AS total_population
FROM world.city
GROUP BY district
HAVING SUM(population) > 1000000 AND district LIKE "a%";


SELECT district, SUM(population) AS total_pop
FROM world.city
GROUP BY district
ORDER BY total_pop DESC
LIMIT 10;

-- Text fuctions
-- Upper 
-- Lower
-- Trim
-- Concatenate
-- WS Concat
-- LEFT
-- RIGHT
-- MID
-- substitute
-- length


SELECT UPPER(name), UCASE(district), population
FROM world.city;

SELECT LOWER(name), LCASE(district), population
FROM world.city;

SELECT TRIM("  This is excess spaces     ");

SELECT first_name, last_name, CONCAT(first_name,",", last_name," ", first_name) AS full_name
FROM sakila.actor;

SELECT first_name, last_name, CONCAT_WS(" ",first_name, last_name, first_name) AS full_name
FROM sakila.actor;


SELECT first_name, LEFT(first_name, 4)
FROM sakila.actor;

SELECT first_name, RIGHT(first_name, 2)
FROM sakila.actor;

SELECT first_name, MID(first_name, 2,3)
FROM sakila.actor;

SELECT first_name, last_name, CONCAT(LEFT(first_name,1), LEFT(last_name, 1)) AS initials
FROM sakila.actor;


SELECT first_name, REPLACE(first_name, "P", "Z")
FROM sakila.actor;

SELECT first_name, REPLACE(first_name, LEFT(first_name, 2), "Dr ")
FROM sakila.actor;

-- DDL: Data Defining laguage
-- CREATE
-- ALTER
-- DROP
USE sqi_db;
CREATE DATABASE sqi_db;
CREATE TABLE sqi_courses(course_id INT PRIMARY KEY AUTO_INCREMENT,
						 course_title VARCHAR(200) NOT NULL
                         );
                         
ALTER TABLE sqi_courses
ADD COLUMN course_unit INT NOT NULL,
ADD COLUMN course_code VARCHAR(10) NOT NULL;

ALTER TABLE sqi_courses
ADD COLUMN HOD VARCHAR(100) NOT NULL;

ALTER TABLE sqi_courses
RENAME COLUMN HOD TO Head_of_Dept,
RENAME COLUMN course_unit TO course_units;

ALTER TABLE sqi_courses
MODIFY Head_of_Dept VARCHAR(50);

ALTER TABLE sqi_courses
DROP COLUMN Head_of_Dept;

CREATE TABLE sqi_students(student_id INT PRIMARY KEY,
						  student_name VARCHAR(100) NOT NULL,
                          gender VARCHAR(10) NOT NULL,
                          course_id INT,
                          FOREIGN KEY(course_id) REFERENCES sqi_courses(course_id)
                          );
                          
CREATE TABLE sqi_instructor(instructor_id INT PRIMARY KEY,
							instructor_name VARCHAR(100) NOT NULL,
                            course_id INT,
                            FOREIGN KEY(course_id) REFERENCES sqi_courses(course_id)
                            );
  
-- DATA MANIPULATING LANGUAGE (DML)
-- SELECT
-- INSERT
-- UPDATE 
-- DELETE						

INSERT INTO sqi_courses(course_id, course_title, course_units, course_code)
VALUES(1, "Data Analysis", 3, "DA");

INSERT INTO sqi_courses(course_title, course_units, course_code)
VALUES("Data Science", 5, "DS"),
	  ("Software Engineering", 3, "SE"),
	  ("Product Design", 3, "PD"),
	  ("Graphics And Multimedia", 5, "G&M"),
      ("Cyber Security", 10, "CS"),
      ("Product Management", 2, "PM");
      
UPDATE sqi_courses
SET course_code = "DS"
WHERE course_id = 3;

ALTER TABLE sqi_courses
MODIFY course_id INT ;

DELETE
FROM sqi_courses
WHERE course_id >7;


INSERT INTO sqi_students(student_id, student_name, gender, course_id)
VALUES(2001, "Dr Shina Brown", "M", 2),
	  (2002, "Samuel Ajagun", "M",2),
      (2005, "Gbemisola Oladipupo", "F", 2),
      (2000, "Taiye Fagbolade", "F", 1),
      (2007, "Oluwatosin Okunola", "F", 1),
      (2006, "Adedolapo Oluwabitan", "M", 1),
      (1000, "Cynthia Akpan", "F", 4);


-- DATE FUNCTIONS
SELECT YEAR(order_date)
FROM superstore.orders;
      
UPDATE superstore.orders
SET order_date = STR_TO_DATE(order_date, "%m-%d-%Y");

ALTER TABLE superstore.orders
ADD COLUMN new_column VARCHAR(100);


SELECT order_date, YEAR(order_date), MONTH(order_date), DAY(order_date), WEEK(order_date),
WEEKDAY(order_date), DAYNAME(order_date), DAYOFWEEK(order_date), weekofyear(order_date),
MONTHNAME(order_date)
FROM superstore.orders;

SELECT DATE_PART('month',order_date);


SELECT EXTRACT(DAY FROM order_date) 
FROM superstore.orders;


SELECT order_date, ship_date, DATEDIFF("2024-11-20", order_date)/365 AS days_diff
FROM superstore.orders;


-- return the total sales by year
SELECT YEAR(order_date) AS yr, SUM(sales) AS total_sales, SUM(quantity), COUNT(DISTINCT order_id)
FROM superstore.orders
GROUP BY yr
ORDER BY total_sales DESC;


SELECT segment, COUNT(DISTINCT customer_id)
FROM superstore.orders
GROUP BY segment;

SELECT ship_mode, AVG(DATEDIFF(ship_date, order_date)),COUNT(DISTINCT customer_id)
FROM superstore.orders
GROUP BY ship_mode;


SELECT segment, category, SUM(sales)
FROM superstore.orders
GROUP BY segment, category
ORDER BY 1 ASC,  3 DESC;


-- ANNUAL SALES
SELECT YEAR(order_date) AS yr, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY yr
ORDER BY 1 ASC;

-- QUARTERLY
SELECT YEAR(order_date) AS yr, QUARTER(order_date) AS qtr, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY yr, qtr
ORDER BY yr;

-- MONTHLY
SELECT YEAR(order_date) AS yr, MONTHNAME(order_date) AS month_name,SUM(sales)
FROM superstore.orders
GROUP BY yr, month_name,MONTH(order_date)
ORDER BY yr, MONTH(order_date) ASC;


SELECT YEAR(order_date) AS yr, MONTH(order_date) AS mn, DAY(order_date) AS dy, SUM(sales)
FROM superstore.orders
GROUP BY yr,mn, dy
ORDER BY yr ASC;

-- CASE
-- WHEN column 1 condition 1 THEN result 1
-- WHEN column 2 condition 2 THEN result 2
-- ELSE result
-- END AS columnname

SELECT customer_name, product_name, quantity,
CASE
WHEN quantity <=5 THEN "Low"
WHEN quantity <=10 THEN "Average"
ELSE "High"
END AS qty_category
FROM superstore.orders;

SELECT order_date, DAYNAME(order_date), WEEKDAY(order_date),
CASE
WHEN DAYNAME(order_date) IN ("Saturday", "Sunday") THEN "Weekend"
ELSE "Weekday"
END AS week_type
FROM superstore.orders
HAVING week_type = "Weekend";


SELECT 
CASE 
WHEN discount = 0 THEN sales
ELSE 0
END AS non_discount_sales
FROM superstore.orders;

SELECT SUM(s_c_sales)
FROM(
SELECT 
CASE WHEN segment = "Consumer" AND city = "Henderson" THEN sales
ELSE 0
END AS s_c_sales
FROM superstore.orders) AS sub;

SELECT SUM(sales)
FROM superstore.orders
WHERE segment = "Consumer" AND city = "Henderson";

-- SUBQUERY
-- SELECT subquery
-- FROM subquery
-- WHERE subquery

SELECT category, ROUND((SUM(sales)/(SELECT SUM(sales) FROM superstore.orders))*100,2)
FROM superstore.orders
GROUP BY category;


SELECT SUM(sales) , (SELECT SUM(sales) 
							FROM superstore.orders
							LEFT JOIN superstore.returns
							USING(order_id)
							WHERE returned IS NULL) AS net_sales
FROM superstore.orders
LEFT JOIN superstore.returns
USING(order_id);


-- FROM SUBQUERY
SELECT SUM(total_sales)
FROM (
SELECT category, SUM(sales) AS total_sales
FROM superstore.orders
WHERE category = "Furniture"
GROUP BY category) AS sub;



SELECT category, cat_sales, total_sales, ROUND((cat_sales/total_sales)*100)
FROM(
SELECT category, ROUND(SUM(sales),2) AS cat_sales, (SELECT ROUND(SUM(sales),2) FROM superstore.orders) AS total_sales
FROM superstore.orders
GROUP BY category) AS temp_table;


SELECT gross, net_sales, gross - net_sales
FROM (
SELECT SUM(sales) AS gross, (SELECT SUM(sales) 
							FROM superstore.orders
							LEFT JOIN superstore.returns
							USING(order_id)
							WHERE returned IS NULL) AS net_sales
FROM superstore.orders
LEFT JOIN superstore.returns
USING(order_id)) AS sub;


-- COMMON TABLE EXPRESSION (CTE)
WITH new_table AS(
SELECT SUM(sales) AS gross, (SELECT SUM(sales) 
							FROM superstore.orders
							LEFT JOIN superstore.returns
							USING(order_id)
							WHERE returned IS NULL) AS net_sales
FROM superstore.orders
LEFT JOIN superstore.returns
USING(order_id))

SELECT gross, net_sales, gross - net_sales
FROM new_table;


-- Segment, sales, total_sales, % of sales
-- Sub Category, sales, total_sales, % of sales
-- Region ,sales, total_sales, % of sales

-- Segment, sales, total_sales, % of sales
-- USING FROM SUBQUERY
SELECT segment, seg_sales ,total_sales, ROUND((seg_sales/total_sales) *100 )
FROM(
SELECT segment, SUM(sales) AS seg_sales, (SELECT SUM(sales) 
										  FROM superstore.orders) AS total_sales
FROM superstore.orders
GROUP BY segment) AS sub;

-- USING CTE
WITH seg_table AS(
SELECT segment, SUM(sales) AS seg_sales, (SELECT SUM(sales) FROM superstore.orders) AS total_sales
FROM superstore.orders
GROUP BY segment)

SELECT segment, seg_sales, total_sales, (seg_sales/total_sales) * 100
FROM seg_table;


-- Sub Category, sales, total_sales, % of sales
-- USING FROM SUBQUERY
SELECT sub_category, sub_sales, total_sales, (sub_sales/total_sales) *100 AS perc
FROM (
SELECT sub_category, SUM(sales) AS sub_sales, (SELECT SUM(sales) FROM superstore.orders) AS total_sales
FROM superstore.orders
GROUP BY sub_category) AS sub;


-- USING CTE
WITH sub_table AS (
SELECT sub_category, SUM(sales) AS sub_sales, (SELECT SUM(sales) FROM superstore.orders) AS total_sales
FROM superstore.orders
GROUP BY sub_category)

SELECT sub_category, sub_sales, total_sales, (sub_sales/total_sales) *100 AS perc
FROM sub_table;


-- WHERE subquery
SELECT *
FROM superstore.orders
WHERE order_id IN(SELECT order_id FROM superstore.returns);

SELECT *
FROM superstore.orders
INNER JOIN superstore.returns
USING(order_id);

SELECT product_name, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY product_name
HAVING total_sales > (SELECT AVG(population) FROM world.city WHERE COUNTRYCODE = "NGA");


SELECT countrycode, SUM(population) AS district_pop
FROM world.city
GROUP BY countrycode
HAVING district_pop > (SELECT AVG(population) FROM world.country);



-- WINDOWS FUNCTIONS (PARTITION BY, ORDER BY)
-- RANK
-- DENSE RANK
-- ROW NUMBER
-- LAG
-- LEAD

SELECT product_name, ROUND(SUM(sales)) AS total_sales, RANK() OVER(ORDER BY ROUND(SUM(sales)) ASC) AS rank_,
													  DENSE_RANK() OVER(ORDER BY ROUND(SUM(sales)) ASC) AS denserank,
                                                      ROW_NUMBER() OVER(ORDER BY ROUND(SUM(sales)) ASC) AS rownumber
FROM superstore.orders
GROUP BY product_name;

WITH product_rank AS(
SELECT category,sub_category, SUM(sales) AS total_sales , RANK() OVER(PARTITION BY category ORDER BY SUM(sales) ASC) AS rank_
FROM superstore.orders
GROUP BY category, sub_category)

SELECT category, sub_category, total_sales
FROM product_rank
WHERE rank_ = 1;

-- BEST SELLING PRODUCT PER YEAR
WITH best_selling AS(
SELECT YEAR(order_date) AS yr, product_name, SUM(sales) AS total_sales, RANK() OVER(PARTITION BY YEAR(order_date) ORDER BY SUM(sales) DESC) AS rank_
FROM superstore.orders
GROUP BY yr, product_name)

SELECT yr, product_name, total_sales
FROM best_selling
WHERE rank_ =1;

SELECT yr, product_name, total_sales
FROM(
SELECT YEAR(order_date) AS yr, product_name, SUM(sales) AS total_sales, RANK() OVER(PARTITION BY YEAR(order_date) ORDER BY SUM(sales) DESC) AS rank_
FROM superstore.orders
GROUP BY yr, product_name) AS sub
WHERE rank_ = 1;



-- LAG: Before
-- Prev year sales
SELECT YEAR(order_date) AS yr, SUM(sales) AS total_sales, LAG(SUM(sales)) OVER(ORDER BY YEAR(order_date) ASC)
FROM superstore.orders
GROUP BY yr;

SELECT yr, total_sales, LAG(total_sales) OVER(ORDER BY yr ASC)
FROM(
SELECT YEAR(order_date) AS yr, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY yr) AS sub;


SELECT YEAR(order_date) AS yr, SUM(sales) AS total_sales
FROM superstore.orders
GROUP BY yr;


SELECT YEAR(order_date) AS yr, MONTH(order_date) AS mn,  SUM(sales) AS total_sales, 
LAG(SUM(sales)) OVER( ORDER BY YEAR(order_date), MONTH(order_date)) AS prev
FROM superstore.orders
GROUP BY yr, mn;
