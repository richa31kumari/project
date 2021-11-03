SELECT * FROM
[Ecommerce].[dbo].Sheet1$


SELECT MAX([Total Sales Amount]), Item
FROM [Ecommerce].[dbo].[Sheet1$]
GROUP BY Item


SELECT round(sum([Total Sales Amount]),0)
FROM [Ecommerce].[dbo].[Sheet1$]-- 18618769

SELECT ROUND(SUM([Sales Margin Amount(Profit)]),0)
FROM [Ecommerce].[dbo].[Sheet1$] -- 77749723

SELECT DISTINCT([Item])
FROM [Ecommerce].[dbo].[Sheet1$]-- 657

SELECT DISTINCT([CustKey])
FROM [Ecommerce].[dbo].Sheet1$--615

SELECT AVG([Discount Amount(M-L)])
FROM [Ecommerce].[dbo].Sheet1$--1855.54025458864

SELECT SUM([Sales Quantity])
FROM [Ecommerce].[dbo].Sheet1$ --2943195
 

--Bottom 10 Products in terms of Loss
SELECT sum([Sales Margin Amount(Profit)]),item
FROM [Ecommerce].[dbo].[Sheet1$]
group by  Item
order by sum([Sales Margin Amount(Profit)]) 
OFFSET 0 ROWS
FETCH  NEXT 10 ROWS ONLY;
-- Fast Lemon Cookies, Best Choice Fondue Mix, Just Right Chicken soup, Carlson Blueberry Ypgurt, Landslide Low Fat  Apple Butter,Good Chablis Wine, Blue Label Rice Soup, Landslide Salt,Carlson Mild Cheddae Cheese, Carlson Sharp Cheddar Cheese

--Top 10 Products in terms of profit
SELECT sum([Sales Margin Amount(Profit)]),item
FROM [Ecommerce].[dbo].[Sheet1$]
group by  Item
order by sum([Sales Margin Amount(Profit)]) DESC
OFFSET 0 ROWS
FETCH  NEXT 10 ROWS ONLY;
--Better Large Canned Shrimp,High Top Dried Mushrooms,Big Time Frozen Cheese Pizza,Fast Mini Donuts,Discover Manicotti, Ebony Squash,Better Fancy Canned Sardines,Landslide White Sugar,Tell Tale Red Delcious Apples,Better Canned Tuna in Oil  

--Top 5 Productsin terms of Sales
SELECT (SUM([Sales Quantity])),ITEM
FROM [Ecommerce].[dbo].Sheet1$
GROUP BY  Item
ORDER BY (SUM([Sales Quantity])) DESC
OFFSET 0 ROWS
FETCH  NEXT 10 ROWS ONLY;
--Better Large Canned Shrimp, High Top Dried Mushrooms, Better Canned Tuna in Oil, Walrus Chardonnay, Red Spade Pimento Loaf 

SELECT COUNT([Item]),ITEM
FROM [Ecommerce].[dbo].Sheet1$
GROUP BY  Item
ORDER BY COUNT([Item]) DESC
OFFSET 0 ROWS
FETCH  NEXT 10 ROWS ONLY;

--Better Fancy Canned Sardines, Ebony Prepared Salad, Moms Sliced Turkey,Imagine Popsicles, Discover Manicotti, Red Spade Foot-Long Hot Dogs, High Top Dried Mushrooms, Big Time Frozen Cheese Pizza, Cutting Edge Foot-Long Hot Dogs, Bravo Large Canned Shrimp, 










