-- 4. Determine which segment had the most significant increase in unique products from 
-- 2020 to 2021. 
with unique_product_segment as
(
	select 
		p.segment,
        s.fiscal_year,
		count(distinct p.product_code) as product_cnt
	from dim_product p
	join fact_sales_monthly s
    on p.product_code = s.product_code
    where s.fiscal_year in (2020,2021)
	group by p.segment, s.fiscal_year
)
select
	pc_2020.segment,
	pc_2020.product_cnt as unique_product_2020,
    pc_2021.product_cnt as unique_product_2021,
	round((pc_2021.product_cnt - pc_2020.product_cnt)/pc_2020.product_cnt * 100,2) as percentage_change
FROM unique_product_segment pc_2020
JOIN unique_product_segment pc_2021  
ON pc_2020.segment = pc_2021.segment  
WHERE pc_2020.fiscal_year = 2020  
  AND pc_2021.fiscal_year = 2021
order by percentage_change desc;