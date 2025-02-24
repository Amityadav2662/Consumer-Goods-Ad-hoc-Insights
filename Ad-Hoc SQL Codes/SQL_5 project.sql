-- Q5.Identify the products with the highest and lowest manufacturing costs. Include their 
-- respective details and highlight the findings. 
(
SELECT 
	p.product_code,
    p.product,
    Round(MIN(m.manufacturing_cost),2) as manufacturing_cost
FROM gdb023.dim_product p
join fact_manufacturing_cost m
on p.product_code = m.product_code
group by p.product_code, p.product
order by manufacturing_cost asc
limit 1
)
union all
(
SELECT 
	p.product_code,
    p.product,
    Round(MAX(m.manufacturing_cost),2) as manufacturing_cost
FROM gdb023.dim_product p
join fact_manufacturing_cost m
on p.product_code = m.product_code
group by p.product_code, p.product
order by manufacturing_cost desc
limit 1
)

