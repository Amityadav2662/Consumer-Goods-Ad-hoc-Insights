-- 10. Identify the top 3 products in each division based on total sold quantities for the fiscal 
-- year 2021. Rank them and provide the findings. 
with top_n_product as 
(
	select 
			p.division,
			p.product,
			Sum(s.sold_quantity) as total_sold_quantity
	from fact_sales_monthly s
	join dim_product p
		on s.product_code = p.product_code
	where s.fiscal_year = 2021
	group by p.division, p.product, p.product_code
)
select 
	division,
	product,
    total_sold_quantity,
    Rankw
from
(
select 
	*,
    Rank() over(partition by division order by total_sold_quantity desc) as Rankw
from top_n_product
) t
where Rankw <= 3
order by division, Rankw