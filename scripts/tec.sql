-- H-2A Temporary Labor Certification (TLC) data, 2010-2020
-- Source: https://www.dol.gov/agencies/eta/foreign-labor/performance
-- NOTE: This file was accidentally named tec.sql when it should have been tlc.sql, leaving it as is

SELECT COUNT(*)
FROM main
-- 119,851 rows

-- CROPS (8): Citrus, strawberries, sheep, lettuce, potato, tobacco, tomato

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
	

-- Count of annual TLC approvals (115,215 / 119,851 approved = 96.1%)
-- Count of neither approved nor denied (675 / 119,851 = 0.6%)

WITH cte AS (
SELECT begin_date,
	(RIGHT(begin_date,2)::int) AS year,
	case_no,
	case_status
FROM main
WHERE (RIGHT(begin_date,2)::int) BETWEEN 10 AND 20)

SELECT DISTINCT year,
	COUNT(case_status) OVER(PARTITION BY year) AS ann_app
FROM cte
WHERE case_status ILIKE '%certifi%'
ORDER BY year

-- Most common jobs

SELECT DISTINCT job_title_clean,
	SUM(num_wkrs) OVER(PARTITION BY job_title_clean) as total_wkrs
FROM jobs
GROUP BY job_title_clean, num_wkrs
HAVING SUM(num_wkrs) IS NOT null
ORDER BY total_wkrs DESC
LIMIT 50;

----------------------------------------
-- ALL CROPS (5)
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


-- Top employer states

SELECT DISTINCT employer_state,
	SUM(workers_req::float) OVER(PARTITION BY employer_state) AS wkr_count,
	COUNT(*) OVER(PARTITION BY employer_state) AS TLC_count
FROM main
WHERE employer_state NOT IN ('', 'AB', 'SK', 'MB', 'ON', 'NF', 'NU')
	AND case_status ILIKE '%certifi%'
ORDER BY wkr_count DESC;

-- Top employers

WITH cte AS (
SELECT DISTINCT UPPER(employer_name) AS emp,
	SUM(workers_req::float) OVER(PARTITION BY employer_name) AS wkr_by_emp
FROM main
WHERE case_status ILIKE '%certifi%'
ORDER BY wkr_by_emp DESC)

SELECT emp,	wkr_by_emp
FROM cte
WHERE wkr_by_emp IS NOT null