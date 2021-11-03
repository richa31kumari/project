SELECT * FROM
[Ecommerce].[dbo].Sheet1$
--STEP 1) CHECKING THE NO OF ROWS AND COLUMNS:

SELECT COUNT(*) AS number_of_columns
FROM INFORMATION_SCHEMA.COLUMNS

SELECT COUNT(*) as number_of_rows
FROM [Ecommerce].[dbo].Sheet1$

--STEP2) CHECKING THE DATA TYPE OF THE COLUMNS

SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS

--**** All numerical columns are of 'float' datatype, the categorical columns are of nvarchar tupe and the date columns are of datetime type.****

  -- STEP 3) CHECKING MIN VALUES IN EVERY COLUMNS TO CHECK ANY OUTLIERS
  SELECT MIN([list Price per item]) as min_List_price
  FROM [Ecommerce].[dbo].Sheet1$-- 0

  SELECT MIN([Total Sales Amount]) as min_Total_Sales
  FROM [Ecommerce].[dbo].Sheet1$--200

  SELECT MIN([Total Sales Amount Based on List Price(MSRP)]) AS MIN_Total_sales_amount
   FROM [Ecommerce].[dbo].Sheet1$--0

   SELECT MIN([Discount Amount(M-L)]) AS MIN_Discount
   FROM [Ecommerce].[dbo].Sheet1$ --255820

   SELECT min([Sales Cost Amount(C#P)]) AS MIN_PRICE
   FROM [Ecommerce].[dbo].Sheet1$ --0


  SELECT min([Sales Price per item]) AS MIN_PRICE
  FROM [Ecommerce].[dbo].Sheet1$ -- -5000


  SELECT min([Sales Quantity]) AS MIN_PRICE
  FROM [Ecommerce].[dbo].Sheet1$ -- -1

  SELECT min([Sales Margin Amount(Profit)]) AS MIN_PRICE
  FROM [Ecommerce].[dbo].Sheet1$  --3932.93

  -- i) LOOKING AT THE ROWS WHERE SP=-5000 AND QTY=-1
  SELECT *
  FROM [Ecommerce].[dbo].Sheet1$
  WHERE [Sales Price per item]=-5000

--**** The sales price of -5000 corresponds to the sales qty of -1, which means that the item was returned and hence it is to be deleted from the sold stock.
--**** Negative Profit actually means loss.****

  SELECT max([List Price per item]) AS Max_PRICE
  FROM [Ecommerce].[dbo].Sheet1$ -- 2760.7

  SELECT max([Sales Cost Amount(C#P)]) AS Max_PRICE
  FROM [Ecommerce].[dbo].Sheet1$ -- 366576 

  SELECT max([Sales Price per item]) AS Max_PRICE
  FROM [Ecommerce].[dbo].Sheet1$ -- 6035

  SELECT max([Sales Quantity]) AS Max_PRICE
  FROM [Ecommerce].[dbo].Sheet1$-- 16000

  SELECT max([Sales Margin Amount(Profit)]) AS Max_PRICE
  FROM [Ecommerce].[dbo].Sheet1$-- 188800

  SELECT max([Total Sales Amount]) AS Max_PRICE
  FROM [Ecommerce].[dbo].Sheet1$-- 555376

  SELECT max([Total Sales Amount Based on List Price(MSRP)]) AS Max_PRICE
 FROM [Ecommerce].[dbo].Sheet1$-- 632610.16

  SELECT max([Discount Amount(M-L)]) AS Max_PRICE
  FROM [Ecommerce].[dbo].Sheet1$-- 343532.66
 

-- ii) DELETING THE ROW CORR TO SP PER ITEM =-5000 AND QTY=-1

  DELETE 
  FROM [Ecommerce].[dbo].Sheet1$
  WHERE [Sales Price per item]=-5000

  select min([Sales Price per item]) AS MIN_PRICE
  FROM [Ecommerce].[dbo].Sheet1$-- 0.337

  select min([Sales Quantity]) AS MIN_QTY
  FROM [Ecommerce].[dbo].Sheet1$-- 0

   --STEP 4) HANDLING MISSING VALUES - IN EXCEL FORMAT, WE COME TO KNOW THAT THE COLUMNS ITEM CLASS, ITEM NUMBER, DISCOUNT AND SALES PRICE PER ITEM HAS NULL VALUES
  -- SINCE ITEM NUMBER AND ITEM CLASS ARE NOT NECESSARY AFFECTING THE PROFIT OR SALES Amount, WE CAN IGNORE IT.
  SELECT *
  FROM  [Ecommerce].[dbo].Sheet1$
  WHERE [Sales Price per item] IS NULL;

  SELECT *
   FROM  [Ecommerce].[dbo].Sheet1$
  WHERE [Discount Amount(M-L)] IS NULL;

  --SO CHECKING SP AND DISCOUNT OF ITEM='MONARCH MANICOTTI'
  SELECT *
  FROM  [Ecommerce].[dbo].Sheet1$
  WHERE ITEM='Monarch Manicotti'

   --SINCE WE HAVE SALES PRICE ROW AS NULL, UPDATING THE SALES PRICE COLUMN WITH THE AVERAGE SP OF MONARCH MANICOTTI

  SELECT AVG([Sales Price per item])
  FROM  [Ecommerce].[dbo].Sheet1$
  WHERE ITEM= 'Monarch Manicotti';

  UPDATE [Ecommerce].[dbo].Sheet1$
  SET [Sales Price per item]= 19.85
  WHERE [Sales Price per item] IS NULL;

  UPDATE [Ecommerce].[dbo].Sheet1$
  SET [Discount Amount(M-L)]= [Total Sales Amount Based on List Price(MSRP)]-[Total Sales Amount]
  WHERE [Discount Amount(M-L)] IS NULL;

  
  --STEP 5) FINDING THE NO OF CUSTOMERS USING CUSTKEY

  SELECT COUNT(DISTINCT(CustKey))
  FROM  [Ecommerce].[dbo].Sheet1$
  --***WE HAVE TOTAL 615 CUSTOMERS ***---

   --STEP 6) CHECKING THE NO OF RECORDS WITH 0 SALES QTY
  SELECT *
 FROM  [Ecommerce].[dbo].Sheet1$
  WHERE [Sales Quantity]=0

  --**** JUST 1, HENCE WE CAN IGNORE IT.****

  --STEP 7) CHECKING IF DATEKEY AND INVOICE DATE ARE IDENTICAL

SELECT *
FROM [Ecommerce].[dbo].Sheet1$
WHERE DateKey NOT IN ([Invoice Date])

--**** THIS SHOWS THAT DATEKEY AND INVOICE DATE COLUMNS ARE IDENTICAL AND HENCE ONE COLUMN CAN BE DROPPED.

-- STEP 8) DROPPING THE UNECESSARY COLUMNS

ALTER TABLE [Ecommerce].[dbo].Sheet1$
DROP COLUMN DateKey;

ALTER TABLE [Ecommerce].[dbo].Sheet1$
DROP COLUMN [Item Class];

ALTER TABLE [Ecommerce].[dbo].Sheet1$
DROP COLUMN [Item Number];

ALTER TABLE [Ecommerce].[dbo].Sheet1$
DROP COLUMN [U/M];

SELECT * FROM [Ecommerce].[dbo].Sheet1$

--STEP 10) CHECKING THE FINAL NO OF ROWS AND COLUMNS

SELECT COUNT(*) AS NO_OF_ROWS 
FROM [Ecommerce].[dbo].Sheet1$
--65281 ROWS
SELECT COUNT(*) AS NO_OF_COLUMNS
  FROM INFORMATION_SCHEMA.COLUMNS;--16 COLUMNS










