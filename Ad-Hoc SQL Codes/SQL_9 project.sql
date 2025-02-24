-- 9. Determine which channel contributed the most to gross sales in FY 2021 and calculate 
-- its percentage contribution.
with channel_contribute as 
(
	select 
		c.channel,
		Sum(s.sold_quantity * g.gross_price) as gross_sales
	from fact_sales_monthly s
	join dim_customer c
		on s.customer_code = c.customer_code
	join fact_gross_price g
		using (fiscal_year, product_code)
	where s.fiscal_year = 2021
	group by c.channel
)
select 
	channel, 
    gross_sales,
    Round(100 * gross_sales / sum(gross_sales) over(),  2) as Percent_contribution
from channel_contribute
order by Percent_contribution desc