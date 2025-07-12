SELECT * FROM zepto;

set sql_safe_updates=0;

# creating an inventory_value column(available quantity*discounted selling price)
alter table zepto
add column inventory_value decimal(10,2);


update zepto
set inventory_value =availablequantity*discountedsellingprice;



update zepto
set mrp= mrp/100;
 
alter table zepto
modify column mrp decimal(10,2);



update zepto
set discountedSellingPrice=discountedSellingPrice/100;

alter table zepto
modify column discountedSellingPrice decimal(10,2);






-- BASIC INVENTORY HEALTH METRICS

#1  total products per category

select category ,count(*) as total_product
from zepto
group by Category
order by count(*) desc;


#2 total availabl quantity per category

select category,sum(availableQuantity) as available_quantity
from zepto
group by Category
order by sum(quantity) desc;



#3  average discount per category 

select  category,avg(discountpercent) as avg_discount
from zepto
group by Category
order by avg(discountpercent) desc;



-- DEAD STOCK DETECTION

#1 Products which is out of stock

select *
from zepto
where outofstock=1;

#2 number of out of stock products from each actegory

select Category, count(name)
from zepto
where outofstock=1
group by  Category;





#3 Products with non-zero stock but low or no discount (indicates poor sales)

select *from zepto
where	availableQuantity>0 and
discountPercent=0;



-- INVENTORY VALUE CALCULATION




	select category, sum(inventory_value)
    from zepto
    group by Category
    order by  sum(inventory_value) desc;


-- PRODUCTS WITH HIGH DISCOUNT LOW STOCK--FAST MOVING

select*from zepto
where discountPercent>30 and availableQuantity <10 ;


-- ABC cLASSIFICATION 
-- Classify SKUs as A (top 70%), B (next 20%), C (last 10%) based on inventory value

select *,
case ntile(3) over (order by inventory_value desc)
when 1 then 'A'
when 2 then 'B'
else 'C'
end as ABC_CLASS
from zepto;





--  . Which products are in the top 20% by inventory value within their category?


select*from zepto;






with rankd as (
select* ,
percent_rank()over(partition by category order by inventory_value) as pd_rank
from zepto)

select category,name,inventory_value
from rankd
where pd_rank >0.8;



-- Which products have higher discount % than the category average?

select*from zepto;


with avgcateper as(
select category,avg(discountpercent) as avg_disc_categ
from zepto
group by Category)

select z.name,
z.category,
z.discountPercent,
a.avg_disc_categ
from zepto z
join avgcateper a on z.Category=a.category
where z.discountPercent>=a.avg_disc_categ;


--  Which categories have the highest % of out-of-stock products?


SELECT category,
       ROUND(100 * SUM(CASE WHEN outofstock = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS out_of_stock_rate
FROM zepto
GROUP BY category
ORDER BY out_of_stock_rate DESC;


select*from zepto;