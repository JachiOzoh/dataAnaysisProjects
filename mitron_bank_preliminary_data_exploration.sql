--NO DUPLICATES FOUND
--NO NULLS FOUND

--What customer has the highest spend?
select SUM(spend) AS spend,customer_id
from fact_spends
group by customer_id
order by spend desc;
-- Answer: customer_id=ATQCUS0918

--What month has the highest spend?
select SUM(spend) AS spend,month
from fact_spends
group by month
order by spend desc;
-- Answer: SEPTEMBER

--What category has the highest spend?
select SUM(spend) AS spend,category
from fact_spends
group by category
order by spend desc;
-- Answer: BILLS

--What payment_type has the highest spend?
select SUM(spend) AS spend,payment_type
from fact_spends
group by payment_type
order by spend desc;
-- Answer: CREDIT CARD

--What age group has the highest spend?
select SUM(spend) AS spend,c.age_group
from fact_spends s
inner join dim_customers c on s.customer_id=c.customer_id
group by c.age_group
order by spend desc;
-- Answer: 25-34

--What city has the highest spend?
select SUM(spend) AS spend,c.city
from fact_spends s
inner join dim_customers c on s.customer_id=c.customer_id
group by c.city
order by spend desc;
-- Answer: MUMBAI

--What occupation has the highest spend?
select SUM(spend) AS spend,c.occupation
from fact_spends s
inner join dim_customers c on s.customer_id=c.customer_id
group by c.occupation
order by spend desc;
-- Answer: SALARIED IT EMPLOYEE

--What gender has the highest spend?
select SUM(spend) AS spend,c.gender
from fact_spends s
inner join dim_customers c on s.customer_id=c.customer_id
group by c.gender
order by spend desc;
-- Answer: MALE

--What marital status has the highest spend?
select SUM(spend) AS spend,c.marital_status
from fact_spends s
inner join dim_customers c on s.customer_id=c.customer_id
group by c.marital_status
order by spend desc;
-- Answer: MARRIED
