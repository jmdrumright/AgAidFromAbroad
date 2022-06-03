-- H-2A Temporary Labor Certification (TLC) data, 2010-2020
-- Source: https://www.dol.gov/agencies/eta/foreign-labor/performance
-- 119,851 rows

SELECT COUNT(*)
FROM main

-- View entire data set (by year)

SELECT case_status,
	begin_date,
	RIGHT(begin_date,2) AS year,
	job_title,
	employer_name,
	employer_state,
	atty_state,
	workers_req,
	worksite_state,
	primary_crop
FROM main
WHERE RIGHT(begin_date,2) = '10' -- Year filter, omit for all years


-- Count of all withdrawn or denied cases (3961)

SELECT COUNT(case_status) as dw_total,
FROM main
WHERE case_status ILIKE '%deni%'
	OR case_status ILIKE '%withdr%'


----------------------------------------
-- FRUITS
----------------------------------------

-- Apples, total workers (no 11)

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as apple_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%apple%' AND job_title NOT ILIKE '%grapple%'
-- 	AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Blueberries, total workers (no 10-11)

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as blueberry_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%blueberr%'
-- 	AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Grapes, total workers (no 11)

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as grape_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%grape%' AND job_title NOT ILIKE 'grapefruit'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Melons, total workers (no 10-11)

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as melon_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%melon%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Oranges, total workers (no 10-11)

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as orange_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%orange%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Strawberries, total workers

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as strawberry_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%strawberr%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Sugarcane, total workers (no 11)

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as sugarcane_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%sugarcane%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Raspberries, total workers (no 10, 12)

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as raspberry_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%raspberr%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


----------------------------------------
-- VEGETABLES
----------------------------------------

-- Corn, total workers (no 11-12)

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as corn_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%corn%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Lettuce, total workers

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as lettuce_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%lettuce%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Potato, total workers

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as potato_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%potato%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Tobacco, total workers

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as tobacco_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%tobacco%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year


-- Tomato, total workers

SELECT RIGHT(begin_date,2) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as test_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%tomato%' AND job_title NOT ILIKE '%cherry%'
-- AND RIGHT(begin_date,2) = '10'
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year