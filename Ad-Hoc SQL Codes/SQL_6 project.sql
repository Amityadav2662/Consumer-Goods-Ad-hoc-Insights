-- Q6. Analyze the top 5 customers who received the highest average pre-invoice discount 
-- percentage for the fiscal year 2021 and in the Indian market.  
select
    c.customer,
    round(avg(pi.pre_invoice_discount_pct),3) as avg_pre_invoice_discount_pct
from dim_customer c
join 
	fact_pre_invoice_deductions pi
		on c.customer_code = pi.customer_code
where pi.fiscal_year = 2021 and 
	  c.market = "India"
group by 
		c.customer_code,c.customer,c.market
order by
		avg_pre_invoice_discount_pct desc
limit 5