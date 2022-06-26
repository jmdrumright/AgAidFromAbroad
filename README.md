# Agricultural Aid From Abroad: The H-2A Visa and US Crop Yields, 2010-2020


## Summary

This capstone project examines the H-2A visa program in relation to domestic crop yields. Data from 2010-2020 (inclusive) was used to identify trends across the decade, including 2020 to see how the COVID-19 pandemic affected data from that year.


## Quick Links

- [Presentation slides (PDF)](https://github.com/jmdrumright/AgAidFromAbroad/blob/main/dashboard/PresentationSlidesAgAid.pdf)
- [Dashboard (Tableau)](https://public.tableau.com/app/profile/jasmine.drumright/viz/tableau_agaid/DASH?publish=yes)


## What *is* the H-2A visa?

The H-2A visa program allows nonimmigrant foreign workers to come to the US to perform temporary agricultural work for a US employer. Employers hire H-2A workers when they are short on domestic agricultural workers for a specific season.

The process begins when the employer files a temporary labor certification (TLC) with the Department of Labor. Once approved, foreign workers can then apply for jobs offered by the employer through an online portal.

Upon being hired, foreign workers can apply for the H-2A visa with USCIS and must pass an interview at their local US consulate before coming to the US. H-2A workers can stay for up to a year depending on the job and must return home by the end of their authorized period of stay.


## Motivation

This is a rather niche subject not many people know about. I've always had an interest in immigration related topics, having gone through the immigration process myself without legal assistance. I remember how exciting it was to research and go through the visa process a few years ago and I guess I missed that madness! This topic came about after researching other ways foreigners come to be in the US. Since the H-2A program accounts for the largest number of temporary foreign workers in the US, I wanted to show how they contribute to the economy through their limited stay.


## Data Questions

**How does the H-2A program relate to crop yields?**

To answer this, I focused on five crops in particular: citrus (including grapefruits, lemons, and oranges), strawberries, lettuce, potatoes (including potatoes and sweet potatoes), and tomatoes. I also used TLC data from the Dept of Labor and H-2A visa data from USCIS.

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

The H-2A data was the easiest to work with because all the files were in exactly the same format for all years. Only Excel and Python were used to eliminate irrelevant fields. I made a methodology mistake in determining the top 5 countries by filtering the top 5 for each year and concatenating, instead of concatenating every year together first then filtering the top 5 for each year. The mistake led to an awful-looking plot with missing values for certain years. Fortunately I figured it out but kept that mistake in the code for funsies. Leave it to me to complicate analysis on simple data!

The crop data from USDA did not always contain data for all eleven years I wanted -- in fact, this is why I had to limit my initial selection of crops. USDA had inconsistent yield units (eg. cwt/acre vs. boxes/acre) but provided state level data while FAO only provided yield data under the same unit of measure. I called out the difference in yield units on my dashboard as a workaround when I used the USDA data and kept the FAO data for non-state level related analysis.


## Conclusions

My analysis shows that the number of H-2A workers does not appear to correlate with crop yields on an annual basis, based on workers with job titles that contain the name of the corresponding crop. This may be due to limitations from my interpretation of a worker. For example, the most common job title is `farm worker` and even though it is not specified in the title, some of these workers may very well be lettuce or strawberry workers, which means my analysis may be undercounting the actual amount. I decided to do this instead of considering the `Primary Crop` column from the TLC, which was only present in some years of the form. Had this column been present in all the TLCs I used, I would have used it. I would encourage the Dept of Labor to keep `Primary Crop` as a fillable field on the TLC because it provides more insight into which commodity the workers are assisting.

There does appear to be a slight correlation between **states** that have the most workers (normalized and not) and **states** that have the most crop yield. 3 of the 5 states in the top five states by worker count are the same as 3 states in the top five states by total crop yield -- namely North Carolina, Washington, and California. This would suggest that H-2A workers *are* assisting in places that harvest a lot of crop, though more research is required to see if that match in rank is consistent beyond the top five states for both criteria.


## Data Sources

- [US Department of State](https://travel.state.gov/content/travel/en/legal/visa-law0/visa-statistics/nonimmigrant-visa-statistics.html)
- [US Department of Labor](https://www.dol.gov/agencies/eta/foreign-labor/performance)
- [USDA National Agricultural Statistics Service](https://quickstats.nass.usda.gov/)
- [Food and Agriculture Organization](https://www.fao.org/faostat/en/#data/QCL)
- [The World Bank](https://data.worldbank.org/indicator/SP.POP.TOTL)
- [US Census Bureau](https://www.census.gov/programs-surveys/popest/technical-documentation/research/evaluation-estimates/2020-evaluation-estimates/2010s-state-total.html)