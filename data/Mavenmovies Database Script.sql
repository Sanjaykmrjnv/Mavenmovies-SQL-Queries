-- 1.Write a SQL query to count the number of characters except the spaces for each actor. 
-- Return first 10 actors name length along with their name.
select * from mavenmovies.actor;

select concat(first_name," ",last_name)as Actor_Name,length(concat(first_name,"",last_name)) as Name_Length
from actor limit 10;


-- 2.List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.
select * from mavenmovies.actor_award;

select actor_id as ID,concat(first_name," ",last_name) as Full_Name,length(concat(first_name," ",last_name)) as Name_Length,awards as Award
from actor_award
where awards like '%oscar%';

-- For only Oscar Award
select actor_id as ID,concat(first_name," ",last_name) as Full_Name,length(concat(first_name," ",last_name)) as Name_Length,awards as Award
from actor_award
where awards='oscar';


-- 3.Find the actors who have acted in the film ‘Frost Head’.
select * from actor;
select * from film_actor;
select * from film;

select a.actor_id as Actor_ID,concat(a.first_name," ",a.last_name) as Actors_name
from actor a
inner join film_actor fa
on fa.actor_id=a.actor_id

inner join film f
on f.film_id=fa.film_id
where f.title='Frost Head';


-- 4.Pull all the films acted by the actor ‘Will Wilson’.
select * from film;
select * from film_actor;
select * from actor;

select f.film_id as Film_ID,f.title as Film_Name,concat(a.first_name," ",last_name) as Actor_Name 
from film f
inner join film_actor fa
on fa.film_id=f.film_id

inner join actor a
on a.actor_id=fa.actor_id
where concat(first_name," ",last_name)='Will Wilson';


-- 5.Pull all the films which were rented and return in the month of May.
select * from mavenmovies.film;
SELECT * FROM mavenmovies.inventory;
select * from mavenmovies.rental;

select f.film_id as Film_ID,f.title as Film_Title,r.rental_date as Rental_Date,r.return_date as Return_date
from film f
left join inventory i 
on i.film_id=f.film_id

left join rental r
on r.inventory_id=i.inventory_id
where r.rental_date and r.return_date>='2005-05-01' and r.rental_date and r.return_date <='2005-05-31'
;

select f.film_id as Film_ID,f.title as Film_Title,r.rental_date as Rental_Date,r.return_date as Return_date
from film f
left join inventory i 
on i.film_id=f.film_id

left join rental r
on r.inventory_id=i.inventory_id
where r.rental_date and r.return_date between'2005-04-30' and '2005-06-01'
;


-- 6.Pull all the films with ‘Comedy’ category.
select * from film;
select * from mavenmovies.film_category;
select * from mavenmovies.category;

select f.film_id as Film_ID,f.title as Film_Title,c.name as Category
from film f
left join film_category fc
on fc.film_id=f.film_id

left join category c 
on c.category_id=fc.category_id
where c.name='Comedy'
;