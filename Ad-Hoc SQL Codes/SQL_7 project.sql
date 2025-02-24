-- Q7. Create a table of the Gross sales amount for the customer “Atliq Exclusive” for each 
-- month. This analysis helps to get an idea of low and high-performing months and take 
-- strategic decisions. The final table  contains these columns:  
-- • Month  
-- • Year  
-- • Gross sales 
WITH gross_sales AS 
(
    SELECT 
        YEAR(s.date) AS year,
        MONTHNAME(s.date) AS month,
        SUM(g.gross_price * s.sold_quantity) / 1000000 AS gross_sales_million
    FROM fact_sales_monthly s
    JOIN dim_customer c
        ON s.customer_code = c.customer_code
    JOIN fact_gross_price g
        USING (product_code, fiscal_year)  
    WHERE c.customer = 'Atliq Exclusive'  
    GROUP BY YEAR(s.date), MONTHNAME(s.date)
)
SELECT 
    month,
    year,
    CONCAT(ROUND(gross_sales_million, 2), " M") AS gross_sales
FROM gross_sales
ORDER BY year asc;  
