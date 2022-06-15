-- States with most H-2A workers (by crop) vs. states with most yields (by crop)
-- Crops (7): Citrus, strawberries, sheep, lettuce, potato, tobacco, tomato

-- Which states request the most H-2A workers?

-- Overall? FL, NC, WA, GA, CA, LA, KY, NY, VA, MS
SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
ORDER BY sum DESC;

-- For citrus? FL, MS, CA, AZ
SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
WHERE job_title ILIKE '%citrus%'
ORDER BY sum DESC;

-- For strawberries? CA, FL, NC, AZ
SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
WHERE job_title ILIKE '%strawberr%'
ORDER BY sum DESC;

-- For sheep? UT, ID, CA, CO, WY, NV, MT, AZ, OR, TX
SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
WHERE job_title ILIKE '%sheep%'
ORDER BY sum DESC;

-- For lettuce? CA, AZ
SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
WHERE job_title ILIKE '%lettuce%'
ORDER BY sum DESC;

-- For potato? FL, NC, MI, ID, GA, AR, NE, MN, CO, LA
SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
WHERE job_title ILIKE '%potato%'
ORDER BY sum DESC;

-- For tobacco? KY, CT, NC, TN, MA, GA, VA
SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
WHERE job_title ILIKE '%tobacco%'
ORDER BY sum DESC;

-- For tomato? FL, AR, NC, CA, AK, TN, IL, OH
SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
WHERE job_title ILIKE '%tomato%'
ORDER BY sum DESC;

-- How does this compare to states with the highest crop yields?

-- Citrus: CA, FL, TX, AZ
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'CITRUS'
GROUP BY state, value
ORDER BY sum DESC;

-- Strawberry: CA, FL, OR, NC, WA, MI, NY, WI, OH, PA
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'STRAWBERRIES'
GROUP BY state, value
ORDER BY sum DESC;

-- SHEEP: TX, MT, CA, WY, ID, IA, OR, CO, SD, UT
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'SHEEP'
GROUP BY state, value
ORDER BY sum DESC;

-- LETTUCE: CA, AZ
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'LETTUCE'
GROUP BY state, value
ORDER BY sum DESC;

-- POTATO: CA, WA, TX, OR, ID, CO, WI, NE, MN, ND
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'POTATOES'
GROUP BY state, value
ORDER BY sum DESC;

-- TOBACCO: TN, VA, PA, KY, NC, GA, SC, OTHER, OH, MA, CT
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'TOBACCO'
GROUP BY state, value
ORDER BY sum DESC;

-- TOMATO: CA, MI, OH, TN, IN, NC, SC, VA, FL, NJ
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'TOMATOES'
GROUP BY state, value
ORDER BY sum DESC;