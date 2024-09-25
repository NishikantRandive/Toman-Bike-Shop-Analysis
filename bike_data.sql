use bike_data;
with cte as (
select * from bike_share_0
union 
select * from bike_share_1
)

select 
	dteday,
	season,
	a.yr,
	weekday,
	hr,
	rider_type,
	riders, 
	round(price,2) price,
	round(cogs,2) cogs,
	round(riders*price,2) as revenue,
	round(riders*price-cogs,2) as profit
from cte a
join cost_table c
on a.yr=c.yr
;