# Agricultural Aid From Abroad: The H-2A Visa and US Crop Yields, 2010-2020


## Summary

This capstone project examines the H-2A visa program in relation to domestic crop yields. Data from 2010-2020 (inclusive) was used to identify trends across the decade, including 2020 to see how the COVID-19 pandemic affected data from that year.


## Quick Links

- [Presentation slides (PDF)](https://github.com/jmdrumright/AgAidFromAbroad/blob/main/dashboard/PresentationSlidesAgAid.pdf)
- [Dashboard (Tableau)](https://public.tableau.com/views/tableau_agaid/DASH?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)


## What *is* the H-2A visa?

The H-2A visa program allows nonimmigrant foreign workers to come to the US to perform temporary agricultural work for a US employer. Employers hire H-2A workers when they are short on domestic agricultural workers for a specific season.

The process begins when the employer files a temporary labor certification (TLC) with the Department of Labor. Once approved, the employer files Form I-129 with USCIS. If both filings are approved, foreign workers can then apply for jobs offered by the employer through an online portal.

Upon being hired, foreign workers can apply for the H-2A visa with USCIS and must pass an interview at their local US consulate before coming to the US. H-2A workers can stay for up to a year depending on the job and must return home by the end of their authorized period of stay.


## Motivation

I've always had an interest in immigration related topics, having gone through the immigration process myself without legal assistance. This topic came about after researching different ways foreigners come to be in the US. Since the H-2A program accounts for the largest number of temporary foreign workers in the US, I wanted to show how they contribute to the economy through their limited stay.


## Data Questions

**How does the H-2A program relate to crop yields?**

To answer this, I focused on five crops in particular: citrus (including grapefruits, lemons, and oranges), strawberries, lettuce, potatoes (including potatoes and sweet potatoes), and tomatoes.

The following questions were also considered:

- Where do H-2A workers come from?
- What are the most common job titles?
- How do employer approvals compare to H-2A approvals?
- Who are the top employers?
- How do workers relate to crop yields?


## Data Tools

- `Excel` - Data cleaning
- `SQL` - Filtering and analysis
- `Python` - Filtering, analysis, and preliminary data visualization
- `Tableau` - Interactive dashboard to present key findings


## Known Issues and Challenges

The TLC data required significant cleaning due to the form being changed almost every year. The headers, which represented fillable fields on the TLC, were inconsistent for each annual data set. I used Excel and Python to figure out which fields were identical in value and imported the cleaned data into SQL for ease of querying over 100k records. Then I used SQLAlchemy to replicate the query results in Python and create static visualizations. Ultimately I decided to use Tableau to display these visualizations for interactivity reasons so I "translated" these static charts into Tableau.

The H-2A data was the easiest to work with because all the files were in exactly the same format for all years. Only Excel and Python were used to eliminate irrelevant fields and I made a methodology mistake in determining the top 5 countries by filtering the top 5 for each year and concatenating, instead of concatenating every year together first then filtering the top 5 for each year. The mistake led to an awful-looking plot with missing values for certain years. Fortunately I figured it out but kept that mistake in the code for funsies. Leave it to me to complicate analysis on simple data!

The crop data from USDA did not always contain data for all eleven years I wanted -- in fact, this is why I had to limit my initial selection of crops. I had to reduce the number of crops again because of varying yield rates (eg. cwt/acre vs. lb/acre) with the exception of citrus (boxes/acre) because it has one of the highest crop yields year after year. I also pulled in the same data from FAO in order to calculate the total crop amount yielded using the same unit across all five crops.


## Data Sources

- [US Department of State](https://travel.state.gov/content/travel/en/legal/visa-law0/visa-statistics/nonimmigrant-visa-statistics.html)
- [US Department of Labor](https://www.dol.gov/agencies/eta/foreign-labor/performance)
- [USDA National Agricultural Statistics Service](https://quickstats.nass.usda.gov/)
- [Food and Agriculture Organization](https://www.fao.org/faostat/en/#data/QCL)
- [The World Bank](https://data.worldbank.org/indicator/SP.POP.TOTL)