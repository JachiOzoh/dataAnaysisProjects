--NO DUPLICATES FOUND
--NO NULLS FOUND

--STEP 1: ANALYSE DATA BY DEMOGRAPHICS
--What customer has the highest spend?
SELECT SUM(spend) AS spend,customer_id
FROM fact_spends
GROUP BY customer_id
ORDER BY spend DESC;
-- Answer: customer_id=ATQCUS0918

--What month has the highest spend?
SELECT SUM(spend) AS spend,month
FROM fact_spends
GROUP BY month
ORDER BY spend DESC;
-- Answer: SEPTEMBER

--1 SPENDING INSIGHTS
--What category has the highest spend?
SELECT SUM(spend) AS spend,category
FROM fact_spends
GROUP BY category
ORDER BY spend DESC;
-- Answer: BILLS

--What payment_type has the highest spend?
SELECT SUM(spend) AS spend,payment_type
FROM fact_spends
GROUP BY payment_type
ORDER BY spend DESC;
-- Answer: CREDIT CARD

--What age group has the highest spend?
SELECT SUM(spend) AS spend,c.age_group
FROM fact_spends s
INNER JOIN dim_customers c ON s.customer_id=c.customer_id
GROUP BY c.age_group
ORDER BY spend DESC;
-- Answer: 25-34

--What city has the highest spend?
SELECT SUM(spend) AS spend,c.city
FROM fact_spends s
INNER JOIN dim_customers c ON s.customer_id=c.customer_id
GROUP BY c.city
ORDER BY spend DESC;
-- Answer: MUMBAI

--What occupation has the highest spend?
SELECT SUM(spend) AS spend,c.occupation
FROM fact_spends s
INNER JOIN dim_customers c ON s.customer_id=c.customer_id
GROUP BY c.occupation
ORDER BY spend DESC;
-- Answer: SALARIED IT EMPLOYEE

--What gender has the highest spend?
SELECT SUM(spend) AS spend,c.gender
from fact_spends s
inner join dim_customers c ON s.customer_id=c.customer_id
group by c.gender
order by spend DESC;
-- Answer: MALE

--What marital status has the highest spend?
SELECT SUM(spend) AS spend,c.marital_status
FROM fact_spends s
INNER JOIN dim_customers c ON s.customer_id=c.customer_id
GROUP BY c.marital_status
ORDER BY spend DESC;
-- Answer: MARRIED

--Average income utilization. What are the gender frequently uses more of their income?
SELECT TOP 20 avg_income/AVG(spend) AS avg_utilization,
gender
FROM fact_spends s
INNER JOIN dim_customers c ON s.customer_id=c.customer_id
GROUP BY avg_income,
gender
ORDER BY avg_utilization DESC;
--The top 20 people with high income utilization are females. This is odd considering male total spend is greater than female
--To investigate

SELECT TOP 20 avg_income/AVG(spend) AS avg_utilization,
gender
FROM fact_spends s
INNER JOIN dim_customers c ON s.customer_id=c.customer_id
GROUP BY avg_income,
gender
ORDER BY avg_utilization DESC;