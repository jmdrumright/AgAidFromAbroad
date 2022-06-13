-- Crop yields 2010-2020

-- Which states request the most H-2A workers?

SELECT DISTINCT employer_state,
   SUM((workers_req::float)) OVER(PARTITION BY employer_state)
FROM main
ORDER BY sum DESC;

-- How does this compare to states with the highest crop yields?

-- Citrus (grapefruit, lemon, orange):
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'CITRUS'
GROUP BY state, value
ORDER BY sum DESC;

-- Strawberry:
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'STRAWBERRIES'
GROUP BY state, value
ORDER BY sum DESC;

-- SHEEP:
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'SHEEP'
GROUP BY state, value
ORDER BY sum DESC;

-- LETTUCE:
SELECT DISTINCT state,
	SUM(value) OVER(PARTITION BY state)
FROM cy
WHERE commodity LIKE 'LETTUCE'
GROUP BY state, value
ORDER BY sum DESC;