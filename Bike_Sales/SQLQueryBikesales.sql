--Let's answer the following
--What is the most common age group among bicycle buyers?
--Which specific bike model had the highest sales each year from 2011 to 2016?
--In which month do bicycle sales peak?
--During which month do bicycle sales decline?
--Which gender accounted for the highest number of bicycle purchases from 2011 to 2016, broken down by each year?
--Which state within each country had the highest number of bicycle purchases?
--What is the most common age group among bicycle buyers?

Select Age_Group, SUM(Revenue) as "Revenue per age_group", SUM(Revenue) * 100.0 / (Select SUM(Revenue) from Sales) AS "Percentage", SUM(Order_Quantity) as Total_Order_quantity
FROM Sales
Group By Age_Group
ORDER BY SUM(Revenue) DESC

Select Age_Group, SUM(Profit) as "Profit per age_group", SUM(Profit) * 100.0 / (Select SUM(Profit) from Sales) AS "Percentage", SUM(Cost) as Cost
FROM Sales
Group By Age_Group
ORDER BY SUM(PROFIT) DESC

Select Age_Group, Count(*) as "Number of Sales per age_group", Count(*) * 100.0 / (Select Count(*) from Sales) As "percentage"
FROM Sales
Group by Age_group
ORDER BY Count(*) DESC
--Which specific Product_category had the highest sales  from 2011 to 2016?

Select Year, Product_Category, COUNT(*) AS "Number of Sales", SUM(Revenue) AS Revenue, SUM(Profit) as Profit, SUM(Profit) * 100.0 /(Select SUM(Profit) From sales) AS "Percentage of Sales"
FROM Sales
GROUP BY Product_Category, Year
Order By Year,SUM(Profit) DESC
--The "bike" category maintains consistent profitability, revenue, and sales volume from 2011 and 2013

Select Product_Category, COUNT(*) AS "Number of Sales", SUM(Revenue) AS Revenue, SUM(Profit) as Profit, SUM(Profit) * 100.0 /(Select SUM(Profit) From sales) AS "Percentage of Sales"
FROM Sales
GROUP BY Product_Category
Order By SUM(Profit) DESC
-- Bikes got the highest, lowest is clothing



Select Sub_Category, COUNT(*) AS "Number of Sales", SUM(Revenue) AS Revenue , SUM(Profit) as Profit
FROM Sales
WHERE Product_Category = 'Bikes'
GROUP BY Sub_Category
ORDER by SUM(Profit) DESC
--We have 3 bikes products, Road bikes are the most selling product.

Select Sub_Category, COUNT(*) AS "Number of Sales", SUM(Revenue) AS Revenue, SUM(Profit) * 100.0/ (Select SUM(Profit) FROM sales) AS "Percentage of Profit"
FROM Sales
WHERE Product_Category = 'Clothing'
GROUP BY Sub_Category
ORDER by COUNT(*) ASC
-- In the clothing category, when looking at the subcategories, vests have the lowest sales numbers but rank third in terms of profit. 
--Interestingly, caps come in second place in sales but have the lowest profit share.

Select Sub_Category, COUNT(*) AS "Number of Sales", SUM(Revenue) AS Revenue, SUM(profit) as Profit, SUM(Profit) * 100.0/ (Select SUM(Profit) FROM sales) AS "Percentage of Profit"
FROM Sales
WHERE Product_Category = 'Accessories'
GROUP BY Sub_Category
ORDER by SUM(profit) ASC
--In the accessories category, helmets contribute to 11 percent of the profit in the clothing category. 
--Tires and tubes, despite having the highest number of sales, rank second in terms of profit share.




Select Product_Category, COUNT(*) as "Number of Sales", SUM(revenue) as "Revenue", SUM(cost) as "cost", SUM(Profit) as "Profit"
FROM Sales
Where Year = '2011'
GROUP BY Product_Category

Select Product_Category, COUNT(*) as "Number of Sales",  SUM(revenue) as "Revenue", SUM(cost) as "cost", SUM(Profit) as "Profit"
FROM Sales
Where Year = '2012'
GROUP BY Product_Category

Select Product_Category, COUNT(*) as "Number of Sales", SUM(revenue) as "Revenue", SUM(cost) as "Cost", SUM(Profit) as "Profit"
FROM Sales
Where Year = '2013'
GROUP BY Product_Category
ORDER BY  SUM(Profit) DESC

Select Product_Category, COUNT(*) as "Number of Sales", SUM(revenue) as "Revenue", SUM(cost) as "cost", SUM(Profit) as "Profit"
FROM Sales
Where Year = '2014'
GROUP BY Product_Category
ORDER BY  SUM(Profit) DESC

Select Product_Category, COUNT(*) as "Number of Sales", SUM(revenue) as "Revenue", SUM(cost) as "cost", SUM(Profit) as "Profit"
FROM Sales
Where Year = '2015'
GROUP BY Product_Category
ORDER BY  SUM(Profit) DESC

Select Product_Category, COUNT(*) as "Number of Sales", SUM(revenue) as "Revenue", SUM(cost) as "cost", SUM(Profit) as "Profit"
FROM Sales
Where Year = '2016'
GROUP BY Product_Category
ORDER BY  SUM(Profit) DESC
--Since 2011, bikes have consistently held the top position. 
--However, the business expanded its offerings to include accessories and clothing starting in 2013.



Select  Month, Count(*) as total, SUM(Profit) as profit, SUM(Revenue) as Revenue
FROM Sales
WHERE Year = '2011'
GROUP BY MONTH
ORDER BY SUM(Revenue) DESC
--Dec is the peak followed by July 

Select  Month, Count(*) as total, SUM(Profit) as profit, SUM(Revenue) as Revenue
FROM Sales
WHERE Year = '2012'
GROUP BY MONTH
ORDER BY SUM(Profit) DESC
--Dec is the peak, followed by Augusut

Select  Month, Count(*) as total, SUM(Profit) as profit, SUM(Revenue) as Revenue
FROM Sales
WHERE Year = '2013'
GROUP BY MONTH
ORDER BY SUM(Profit) DESC
--December then November

Select  Month, Count(*) as total, SUM(Profit) as profit, SUM(Revenue) as Revenue
FROM Sales
WHERE Year = '2014'
GROUP BY MONTH
ORDER BY SUM(Profit) DESC
-- No sales in other months 
--June is the highest

Select  Month, Count(*) as total, SUM(Profit) as profit, SUM(Revenue) as Revenue
FROM Sales
WHERE Year = '2015'
GROUP BY MONTH
ORDER BY SUM(Profit) DESC

Select  Month, Count(*) as total, SUM(Profit) as profit, SUM(Revenue) as Revenue
FROM Sales
WHERE Year = '2016'
GROUP BY MONTH
ORDER BY SUM(Profit) DESC
--December and June are the peak months in terms of sales and customer activity. 


-- my work 

Select s1.Age_Group, s1.Country, s2.Profit_Country, s2.Percentage as "Profit_Country%", s1.Profit as "Profit per age_group", s1.Percentage
FROM
(
	Select Age_Group, Country, SUM(Profit) as "Profit", SUM(Profit) * 100.0/ (Select SUM(Profit) FROM Sales) AS "Percentage"
	FROM SALES
	GROUP BY Age_Group, Country
) s1
JOIN
(
	Select  Country, SUM(Profit) AS "Profit_Country", SUM(Profit) * 100.0 / (SELECT SUM(Profit) FROM Sales) AS "Percentage"
	FROM Sales
	Group by  Country
) s2
ON s1.Country = s2.Country
ORDER by s2.Profit_Country DESC
--The USA shows higher profitability among adults aged 35-64.
--Australia experiences greater profit potential with youth under 25 years old.
--The UK sees promising profit margins with young adults aged 25-34.
--Canada's profit growth is driven by the senior population aged 64 and above.
--In Germany, adults aged 35-64 contribute significantly to overall profitability.
--France's profit gains come primarily from young adults aged 25-34.

--In terms of location, the USA has the highest profit, while France has the lowest.

--In terms of gender, males have a higher sales.
Select Customer_Gender, SUM(Order_Quantity) as SALES
FROM Sales
GROUP BY Customer_Gender
ORDER BY SUM(Order_Quantity)  DESC


Select Customer_Gender, Country, SUM(Order_Quantity) as Sales , SUM(Profit) as Profit
FROM Sales
GROUP BY Country, Customer_Gender
ORDER BY SUM(Profit) DESC


Select s1.Country, s1. Customer_Gender, s2."Profit_Gender", s1."Order_Quantity", s1."Profit"
FROM
(
	Select Customer_Gender, Country, SUM(Order_Quantity) AS "Order_Quantity", SUM(Profit) AS "Profit"
	FROM Sales
	GROUP BY Customer_Gender, Country
) s1
JOIN
(  Select Customer_Gender, SUM(Profit) AS "Profit_Gender"
	FROM Sales
	GROUP BY Customer_Gender
) s2
ON s1.Customer_Gender = s2.Customer_Gender
ORDER by s1.Profit Desc

When considering gender by country, the distribution is as follows:

--USA: More males
--Australia: More females
--United Kingdom: More females
--Canada: More males
--Germany: More females
--France: More males

Select Country, State, SUM(Profit) as "Profit"
FROM Sales
GROUP BY State, Country
Having Country = 'United States'
ORDER BY SUM(Profit) DESC
--In the USA, California has the highest profit, while Alabama has the lowest.

Select Country, State, SUM(Profit) as "Profit", COUNT(*)
FROM Sales
GROUP BY State, Country
Having Country = 'Australia'
ORDER BY SUM(Profit) DESC
--In Australia , New South Waleshas the highest profit, while Tasmania has the lowest.

Select Country, State, SUM(Profit) as "Profit", COUNT(*)
FROM Sales
GROUP BY State, Country
Having Country = 'Canada'
ORDER BY SUM(Profit) DESC
--In Canada, British Columbia the highest profit, while Ontario has the lowest.


Select Country, State, SUM(Profit) as "Profit", COUNT(*)
FROM Sales
GROUP BY State, Country
Having Country = 'Germany'
ORDER BY SUM(Profit) DESC
--In Germany , Hessen the highest profit, while Brandenburg has the lowest.


Select Country, State, SUM(Profit) as "Profit", COUNT(*)
FROM Sales
GROUP BY State, Country
Having Country = 'France'
ORDER BY SUM(Profit) DESC
--In France , Seine (Paris) the highest profit, while Pas de Calais has the lowest.


--What is the most selling product in each country
Select Country, Product,  Product_Category, SUM(Profit) as Profit_by_Product
FROM Sales
GROUP BY Country, Product,  Product_Category
Having Country = 'United States'
ORDER BY  SUM(Profit) DESC 
--In the US, top 2 most selling products are "Mountain-200 Silver, 42" and "Road-150 Red, 52". Both Bikes category.

Select Country, Product,  Product_Category, SUM(Profit)
FROM Sales
GROUP BY Country, Product,  Product_Category
Having Country = 'Canada'
ORDER BY  SUM(Profit) DESC
--In Canada, top 2 most selling products are "Mountain-200 Silver, 42" and "Sport-100 Helmet, Blue". Bikes and Accessories categories


Select Country, Product,  Product_Category, SUM(Profit)
FROM Sales
GROUP BY Country, Product,  Product_Category
Having Country = 'Australia'
ORDER BY  SUM(Profit) DESC
--In Australia, the best-selling bike is the Road-150 Red, 62, while the Mountain-200 Black, 38 takes the second position.

Select Country, Product, Product_Category, SUM(Profit) as Profit
FROM Sales
GROUP BY Country, Product, Product_Category
Having Country = 'Germany'
ORDER BY SUM(Profit) DESC
--In Germany, the top two selling bikes are the Mountain-200 Silver, 46 and the Mountain-200 Silver, 42.


Select Country, Product, Product_Category, SUM(Profit) as Profit
FROM Sales
GROUP BY Country, Product, Product_Category
Having Country = 'France'
ORDER BY  SUM(Profit) DESC
--In France, Sport-100 Helmet, Red is the best selling which is an accessory. 

Select Product, SUM(Profit) as Profit
FROm Sales
Group BY Product
Order By SUM(Profit) Desc
--Among all the products, the Mountain-200 Black, 38 contributes the highest to profits.


Select Product, SUM(Order_Quantity) as Total_Order_quantity
FROm Sales
Group BY Product
Order By SUM(Order_Quantity) DESC
--When it comes to the number of sales, the Water Bottle - 30 oz. ranks the highest.
