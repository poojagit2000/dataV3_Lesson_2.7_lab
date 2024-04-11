USE sakila;
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select * from sakila.film;
select * from sakila.film_category;
select COUNT(fc.film_id) as num_of_films, c.name as category_name
FROM sakila.category c
INNER JOIN sakila.film_category fc
ON c.category_id = fc.category_id
group by c.name
order by num_of_films DESC;
-- Display the total amount rung up by each staff member in August of 2005.
select * from staff;
select * from payment;
select  s.first_name,s.last_name,SUM(p.Amount) as total_amount
FROM sakila.payment p
INNER JOIN sakila.staff s
ON s.staff_id = p.staff_id
where YEAR(p.payment_date)= 2005 and MONTH(p.payment_date) = 08
group by s.staff_id
order by s.first_name ASC;
-- Which actor has appeared in the most films?
select a.actor_id,a.first_name,a.last_name, COUNT(a.actor_id) as count_films
FROM sakila.actor a
INNER JOIN sakila.film_actor fa
ON a.actor_id = fa.actor_id
group by fa.actor_id
order by count_films DESC
LIMIT 1;
-- Most active customer (the customer that has rented the most number of films)
select c.customer_id,c.first_name,c.last_name,COUNT(r.rental_id) as num_films
FROM sakila.customer c
INNER JOIN sakila.rental r
ON c.customer_id = r.customer_id
group by c.customer_id
order by num_films DESC
LIMIT 1;
-- Display the first and last names, as well as the address, of each staff member.
select * from staff;
select s.first_name,s.last_name,ad.address
FROM sakila.staff s
LEFT JOIN sakila.address ad
ON s.address_id = ad.address_id;
-- List each film and the number of actors who are listed for that film.
select f.title, COUNT(fa.actor_id) as num_actors
FROM sakila.film f
INNER JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
group by f.title
order by f.title;
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.first_name,c.last_name,SUM(p.amount) as total_amount
FROM sakila.customer c
INNER JOIN sakila.payment p
ON c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name ASC;
-- List the titles of films per category.
select c.name as category_name,f.title
FROM sakila.category c
INNER JOIN sakila.film_category fc
ON c.category_id = fc.category_id
INNER JOIN film f 
ON fc.film_id = f.film_id;