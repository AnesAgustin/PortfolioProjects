SELECT 
    *
FROM
    ecommerce
LIMIT 1000;

-- To view data type information for each column
SHOW COLUMNS FROM ecommerce;

-- Replace column name
ALTER TABLE ecommerce
CHANGE COLUMN Deatils Details INT;
ALTER TABLE ecommerce
CHANGE COLUMN MRP max_retail_price INT;

-- max_retail_price
UPDATE ecommerce 
SET 
    MRP = REPLACE(MRP, 'Rs', ''); 
    
-- Discount
UPDATE ecommerce 
SET 
    Discount = REPLACE(Discount, 'off', ''),
	Discount = REPLACE(Discount, '%', '');  
    
-- Category 
UPDATE ecommerce 
SET 
    Category = REPLACE(Category, '-Women', '');
    
-- Converting data type
ALTER TABLE ecommerce
MODIFY COLUMN Sell_Price int,
MODIFY COLUMN max_retail_price int,
MODIFY COLUMN Discount int;

-- Check for missing values
SELECT COUNT(*) AS missing_sell_price
FROM ecommerce
WHERE SellPrice IS NULL OR SellPrice = '';
-- Result : There are 1183 missing values

-- Delete 1183 missing values
DELETE FROM ecommerce 
WHERE
    Sell_Price IS NULL OR Sell_Price = '';

-- Create Color & Clothe_Type columns
ALTER TABLE ecommerce
ADD COLUMN Color text;
ALTER TABLE ecommerce
ADD COLUMN Clothe_Type text;

-- Extracts the Details column
UPDATE ecommerce
SET Color = SUBSTRING_INDEX(Details, ' ', -1);
UPDATE ecommerce
SET Clothe_Type = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Details, 'womens', -1), '-', 1));

UPDATE ecommerce
SET Clothe_Type = 't-shirt'
WHERE Clothe_Type = 't';

UPDATE ecommerce
SET Clothe_Type = 'a-line dress'
WHERE Clothe_Type = 'a';


