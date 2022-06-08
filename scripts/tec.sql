-- H-2A Temporary Labor Certification (TLC) data, 2010-2020
-- Source: https://www.dol.gov/agencies/eta/foreign-labor/performance
-- NOTE: This file was accidentally named tec.sql when it should have been tlc.sql, leaving it as is

SELECT COUNT(*)
FROM main
-- 119,851 rows

-- CROPS (8): Citrus, strawberries, sheep, cattle, lettuce, potato, tobacco, tomato

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


-- Count of all withdrawn or denied cases (3961 = 3.3%)

SELECT COUNT(case_status) as dw_total
FROM main
WHERE case_status ILIKE '%deni%'
	OR case_status ILIKE '%withdr%'


----------------------------------------
-- ALL CROPS (8)
----------------------------------------

-- Citrus (grapefruit, lemon, orange), total workers

WITH cit AS (
SELECT
	(RIGHT(begin_date,2)::int) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as wr_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%citrus%'
	AND (RIGHT(begin_date,2)::int) >= 10
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year)

SELECT year,
	job_title,
	workers_req,
	wr_total,
	SUM(workers_req::FLOAT) OVER(PARTITION BY year) AS wr_total_year,
	employer_state,
	worksite_state
FROM cit


-- Strawberries, total workers

WITH str AS (
SELECT
	(RIGHT(begin_date,2)::int) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as wr_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%strawberr%'
	AND (RIGHT(begin_date,2)::int) >= 10
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year)

SELECT year,
	job_title,
	workers_req,
	wr_total,
	SUM(workers_req::FLOAT) OVER(PARTITION BY year) AS wr_total_year,
	employer_state,
	worksite_state
FROM str


-- Sheep, total workers

WITH she AS (
SELECT
	(RIGHT(begin_date,2)::int) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as wr_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%sheep%'
	AND (RIGHT(begin_date,2)::int) >= 10
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year)

SELECT year,
	job_title,
	workers_req,
	wr_total,
	SUM(workers_req::FLOAT) OVER(PARTITION BY year) AS wr_total_year,
	employer_state,
	worksite_state
FROM she


-- Cattle, total workers

WITH cat AS (
SELECT
	(RIGHT(begin_date,2)::int) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as wr_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%cattle%'
	AND (RIGHT(begin_date,2)::int) >= 10
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year)

SELECT year,
	job_title,
	workers_req,
	wr_total,
	SUM(workers_req::FLOAT) OVER(PARTITION BY year) AS wr_total_year,
	employer_state,
	worksite_state
FROM cat


-- Lettuce, total workers

WITH let AS (
SELECT
	(RIGHT(begin_date,2)::int) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as wr_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%lettuce%'
	AND (RIGHT(begin_date,2)::int) >= 10
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year)

SELECT year,
	job_title,
	workers_req,
	wr_total,
	SUM(workers_req::FLOAT) OVER(PARTITION BY year) AS wr_total_year,
	employer_state,
	worksite_state
FROM let


-- Potato (potato, sweet potato), total workers

WITH pot AS (
SELECT
	(RIGHT(begin_date,2)::int) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as wr_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%potato%'
	AND (RIGHT(begin_date,2)::int) >= 10
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year)

SELECT year,
	job_title,
	workers_req,
	wr_total,
	SUM(workers_req::FLOAT) OVER(PARTITION BY year) AS wr_total_year,
	employer_state,
	worksite_state
FROM pot


-- Tobacco, total workers

WITH tob AS (
SELECT
	(RIGHT(begin_date,2)::int) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as wr_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%tobacco%'
	AND (RIGHT(begin_date,2)::int) >= 10
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year)

SELECT year,
	job_title,
	workers_req,
	wr_total,
	SUM(workers_req::FLOAT) OVER(PARTITION BY year) AS wr_total_year,
	employer_state,
	worksite_state
FROM tob


-- Tomato, total workers

WITH tom AS (
SELECT
	(RIGHT(begin_date,2)::int) AS year,
	job_title,
	workers_req,
	SUM(workers_req::FLOAT) OVER() as wr_total,
	employer_state,
	worksite_state
FROM main
WHERE job_title ILIKE '%tomato%'
	AND (RIGHT(begin_date,2)::int) >= 10
GROUP BY year, job_title, employer_state, workers_req, worksite_state
ORDER BY year)

SELECT year,
	job_title,
	workers_req,
	wr_total,
	SUM(workers_req::FLOAT) OVER(PARTITION BY year) AS wr_total_year,
	employer_state,
	worksite_state
FROM tom