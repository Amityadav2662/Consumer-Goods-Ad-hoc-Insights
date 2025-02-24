-- 3. Analyze the unique product counts for each segment. The results should be sorted in 
-- descending order of their counts. 
select 
	segment,
    count(distinct product_code) as product_cnt
from dim_product
group by segment
order by product_cnt desc