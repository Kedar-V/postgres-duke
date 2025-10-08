-- 1. Insert a new row that provides values for only a few columns. These columns must represent at least two different data types.
INSERT INTO sales_data (brand_name, price, ratings)
VALUES ('TestBrand', 1234.5, 4.5);

-- 2. Find the number of rows where the values in one numeric column fall between its mean and maximum.
WITH stats AS (
  SELECT AVG(price) AS avg_price, MAX(price) AS max_price
  FROM sales_data
)
SELECT COUNT(*)
FROM sales_data, stats
WHERE price > stats.avg_price
  AND price < stats.max_price;

-- 3. Update one of your string columns by replacing any entries where the second letter is ‘a’  with the value Data Engineering.
UPDATE sales_data
SET brand_name = 'Data Engineering'
WHERE SUBSTR(brand_name, 2, 1) = 'a';

-- 4. Delete the row that you inserted in step 1.
DELETE FROM sales_data
WHERE brand_name = 'TestBrand';
