# Agricultural Aid From Abroad: The H-2A Visa and US Crop Yields, 2010-2020

Note: This README is a work in progress and will be updated periodically.


## Summary

This capstone project examines the H-2A visa program in relation to domestic crop yields to assess the effect of H-2A workers on American agriculture.


## General Info

The H-2A visa program allows nonimmigrant foreign workers to come to the US to perform temporary agricultural work for a US employer. Employers hire H-2A workers when they are short on domestic agricultural workers for a specific season.

The process begins when the employer files a temporary labor certification (TLC) with the Department of Labor. Once approved, the employer files Form I-129 with USCIS. If both filings are approved, foreign workers can then apply for jobs offered by the employer through an online portal.

Upon being hired, foreign workers can apply for the H-2A visa with USCIS and must pass an interview at their local US consulate before coming to the US. H-2A workers can stay for up to a year depending on the job and must return home by the end of their authorized period of stay.

## Motivation

I've always had an interest in immigration related topics, having gone through the immigration process myself without legal assistance. This topic came about after researching different ways foreigners come to be in the US. Since the H-2A program accounts for the largest number of temporary foreign workers in the US, I wanted to show potential ways they affect the food system through their limited stay.


## Data Questions

**How do H-2A workers relate to US crop yields?**

I will focus on 5 crops in particular because they have data from 2010-2020 (inclusive): citrus (grapefruits, lemons, oranges), strawberries, lettuce, potatoes (sweet potatoes, potatoes), and tomatoes.

This project also considers the following questions:

- Where do most H-2A workers come from?
- What are the most common jobs for H-2A workers?
- How does the number of TLC approvals compare to the number of H-2A visas issued?
- Is there a correlation between the number and job titles of H-2A workers and crop yields, based on job titles including those crops?
- Which states request the most H-2A workers?

6/20 UPDATE: MVP mostly done, may add a year filter on the maps dash. Working on stretch goals -- got AEWR data, analyzing YoY wage changes for crop states in SQL. Still getting NOAA data for crop states.


## Data Tools

- `Excel` - Data cleaning
- `SQL` - Filtering and analysis
- `Python` - Filtering, analysis, and data visualization
- `Tableau` - Interactive dashboard to present key findings


## Data Sources

- [US Department of Labor - Temporary Labor Certifications 2010-2020](https://www.dol.gov/agencies/eta/foreign-labor/performance)
- [USDA National Agricultural Statistics Service - Crop Yields, boxes/acre + cwt/acre](https://quickstats.nass.usda.gov/)
- [Food and Agriculture Organization - Crop Yields, hg/ha](https://www.fao.org/faostat/en/#data/QCL)
- [US Department of State - H-2A Visa Statistics](https://travel.state.gov/content/travel/en/legal/visa-law0/visa-statistics/nonimmigrant-visa-statistics.html)
- [The World Bank - Country Population](https://data.worldbank.org/indicator/SP.POP.TOTL)