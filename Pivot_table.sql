--- Customer's First Rental
DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental
SELECT
	customer_id, MIN(rental_date) AS first_time
FROM
	rental
GROUP BY 1;

# Cohort Size
DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size
SELECT
	left(first_time,7) AS month, COUNT(customer_id) AS num
FROM
	first_rental
GROUP BY 1;

# Join rental table with the above two temporary tables and payment table
SELECT 
	r.*, left(f.first_time,7) AS cohort, c.num AS cohort_size, p.amount
FROM 
	rental r JOIN first_rental f ON r.customer_id = f.customer_id
	JOIN cohort_size c ON c.month = left(f.first_time,7)
	JOIN payment p ON p.rental_id = r.rental_id
;

# Revenue Per User for each cohort and month
DROP TEMPORARY TABLE IF EXISTS cohort;
CREATE TEMPORARY TABLE cohort
SELECT
	date_format(f.first_time, '%Y%m') AS cohort_formatted,
	date_format(r.rental_date, '%Y%m') AS rental_date_formatted,
	cs.num AS cohort_size,
	SUM(p.amount) AS month_rev,
	SUM(p.amount)/cs.num AS RPU
FROM 
	rental r 
	JOIN first_rental f ON r.customer_id = f.customer_id
	JOIN cohort_size cs ON cs.month = left(f.first_time,7)
	JOIN payment p ON p.rental_id = r.rental_id
GROUP BY 1,2;

# Beautify the query
SELECT
	left(STR_TO_DATE(cohort_formatted,'%Y%m'),7) AS 'First Rental Month',
	period_diff(rental_date_formatted,cohort_formatted) AS 'Months After Join',
	cohort_size,
	RPU
FROM
	cohort
GROUP BY 1,2;

