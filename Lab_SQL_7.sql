-- 1.
select
	*
from
	sakila.actor
group by
	last_name
having count(last_name) = 1;
-- 2
select
	last_name -- added last name here, just to be more clear.
from
	sakila.actor
group by
	last_name
having count(last_name) > 1;

-- 2.5 Sub-Query!!! :D

select
	cnt, count(cnt)
from
	(select last_name, count(last_name) as cnt
    from sakila.actor
    group by last_name) as grp
group by cnt;

-- 3 Staff #1 Wins lol. Also, Tammy is not here because she just got hired
select 
	staff_id, count(staff_id)
from
	sakila.rental
group by 
	staff_id;

-- 4 (I think there were suppose to be a difference in release years, this has happened with similar question)
select
	release_year, count(release_year) as count_of_release
from
	sakila.film
group by 
	release_year;
    
-- 5
select
	rating, count(rating)
from
	sakila.film
group by
	rating
order by
	count(rating) desc;
-- 6
SELECT 
    rating, concat(floor(AVG(length)/60),':',round((AVG(length)%60),0))
FROM
    sakila.film
GROUP BY 
	rating
order by
	AVG(length) desc;
    
SELECT 
    rating, avg(length)
FROM
    sakila.film
GROUP BY 
	rating
order by
	AVG(length) desc;
    
-- 7 PG-13 Films are the only rating category which have more than an average of 2 hours of runtime
select
	rating, avg(length)
from
	sakila.film
group by 
	rating
having avg(length) > 120


	