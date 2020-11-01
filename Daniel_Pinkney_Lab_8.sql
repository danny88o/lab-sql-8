-- Lab 8
 use sakila;
 
 -- Rank films by length.

select title, length, 
dense_rank() over(order by length) as "Rank"
from film;

-- Rank films by length within the rating category.
select title, length, rating, 
dense_rank() over(partition by rating order by length) as "Rank"
from film;

-- Rank languages by the number of films (as original language).
select title, language_id,  
dense_rank() over(order by language_id) as "Rank"
from film;

-- Rank categories by the number of films.
select  rating, count(rating),  
dense_rank() over(order by count(*) desc) as "Rank"
from film
group by rating;

-- Which actor has appeared in the most films?
select concat(first_name, " ", last_name) as "Name", count(f.film_id) as "Number of films actor has been in"
from film f
left join film_actor fa on f.film_id = fa.film_id
left join actor a on a.actor_id = fa.actor_id
group by fa.actor_id
order by count(f.film_id) desc
limit 1



