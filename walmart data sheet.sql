select * from walmart;
select date, monthname(date), dayname(date) from walmart;

alter table walmart add column month varchar(20);
update walmart 
set month = ( monthname(date));

alter table walmart add column dayname varchar(20);
update walmart 
set dayname = ( dayname(date));

alter table walmart add column purchase_time varchar(15);
update walmart
set purchase_time = (
				 case when time between '00:00:00' and '11:59:00' then 'Morning'
                 when time between '12:00:00' and '16:00:00' then 'Afternoon'
                 else 'Evening'
                 end);
                 
select distinct city from walmart;
select distinct city, branch from walmart;
select distinct Product_line from walmart;

select count(payment), payment from walmart
group by payment;

select count(product_line), Product_line from walmart
group by Product_line
order by count(Product_line);

select sum(total), city from walmart
group by city;

select sum(total), product_line from walmart
group by Product_line
order by sum(total);


select sum(cogs), month from walmart
group by month;

select * from walmart;
ALTER TABLE walmart
CHANGE COLUMN Tax_5% tax5percent varchar(15) not null;

select product_line, total from walmart;
select avg(total) from walmart;

select product_line , total,
 case when total >= (select avg(total) from walmart) then 'Good'
 else 'bad'
 end as 'Product_rating_by_avg_sales'
 from walmart;
 
 alter table walmart add column product_rating_by_avg_sales varchar(10);
 update walmart
set product_rating_by_avg_sales = ( case when total >= 323 then 'Good'
 else 'bad'
 end );
 
 select gender, count(gender), Product_line from walmart
 group by gender, Product_line
 order by count(Gender);
 
 select product_line, avg(rating) from walmart
 group by Product_line
 order by avg(Rating) desc; 