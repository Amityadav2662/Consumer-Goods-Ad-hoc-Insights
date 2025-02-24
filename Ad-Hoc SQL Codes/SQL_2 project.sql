-- 2. Compare the unique product counts between 2020 and 2021. Calculate the percentage 
-- change and present the analysis. 
with unique_cnt as 
(
	SELECT 
		s.fiscal_year,
		count(distinct s.product_code) as unique_product_cnt
	FROM gdb023.dim_product p
	join fact_sales_monthly s
	on p.product_code = s.product_code
    where s.fiscal_year in (2020,2021)
    group by s.fiscal_year
)

SELECT 
	up_2020.unique_product_cnt as unique_product_2020,
    up_2021.unique_product_cnt as unique_product_2021,
    round((up_2021.unique_product_cnt - up_2020.unique_product_cnt)/up_2020.unique_product_cnt * 100,2) as percentage_change
from unique_cnt up_2020
join unique_cnt up_2021
where up_2020.fiscal_year = 2020 
	AND up_2021.fiscal_year = 2021;