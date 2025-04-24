/*
Land Registry Case Study
This uses public data of property sales in England from the Land Registry at https://www.gov.uk/government/statistical-data-sets/price-paid-data-downloads
The data has been filtered to properties in the London SW12 postcode  
*/
 
-- How many sales?
 SELECT * FROM PricePaidSW12

 
/*
How many sales in each property type?
Order the rows in the result set by number of sales (highest first)


*/
 SELECT
    pps.PropertyType
 ,COUNT (*) AS numberofsales
FROM
    PricePaidSW12 AS pps
GROUP BY PropertyType
ORDER BY numberofsales DESC
/*
How many sales in each year?
Since the year of the sales is not a column in the table, calculate it with the YEAR() function
Order the rows in the result set by Year (earliest first)
*/

SELECT
    YEAR(pps.TransactionDate) AS TheYear
 ,COUNT (*) AS numberofsales
 ,SUM(pps.Price)/1000000.00 As TotalPriceMillion
FROM
    PricePaidSW12 pps
GROUP BY 
YEAR (pps.TransactionDate)
ORDER BY 
YEAR(pps.TransactionDate) 

select
MIN(pps.TransactionDate)
FROM
    PricePaidSW12 pps

SELECT YEAR('2022-09-21') AS TheYear;


SELECT TOP 5 YEAR(P.TransactionDate) YearSold FROM PricePaidSW12 p;


select
MIN(pps.TransactionDate)
FROM
    PricePaidSW12 pps

 

 select
max(pps.TransactionDate)
FROM
    PricePaidSW12 pps


-- What was the total market value in £ Millions of all the sales each year?
 
-- What are the earliest and latest dates of a sale?
 
-- How many different property types are there?
 
-- List all the sales in 2018 between £400,000 and £500,000 in Cambray Road (a street in SW12)

SELECT
    *
FROM
    PricePaidSW12 pps
WHERE
 YEAR(pps.TransactionDate) = 2018
 -- year(pps.TransactionDate) like '2018%'
--WHERE pps.TransactionDate BETWEEN '2018-01-01' AND '2018-12-31'
AND
price BETWEEN 400000 AND 500000
AND
pps.Street = 'Cambray Road'




 
/*
1.  List the 25 latest sales in Ormeley Road with the following fields: TransactionDate, Price, PostCode, PAON






2. Join on PropertyTypeLookup to get the PropertyTypeName
3.  Use a CASE statement for PropertyTypeName column
*/