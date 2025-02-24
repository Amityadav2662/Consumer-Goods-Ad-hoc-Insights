-- Identify the markets in which the customer "Atliq Exclusive" operates its business in 
-- the APAC region. Present the findings in an insightful way. 
use gdb023;
Select 
	distinct Market
from dim_customer 
where customer = "Atliq Exclusive" and region = "APAC" 


