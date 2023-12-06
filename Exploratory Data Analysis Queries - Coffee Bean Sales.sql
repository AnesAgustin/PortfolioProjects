SELECT 
    *
FROM
    customers

-- Looking for total sales (revenue) from all orders
SELECT SUM(UnitPrice * Quantity) AS TotalRevenue
FROM orders
JOIN products ON orders.ProductID = products.ProductID;

-- customers who made the highest purchases (based on total order value)?
SELECT 
    c.CustomerID,
    c.CustomerName,
    SUM(p.UnitPrice * o.Quantity) AS TotalPurchase
FROM
    customers c
        JOIN
    orders o ON c.CustomerID = o.CustomerID
        JOIN
    products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerID , c.CustomerName
ORDER BY TotalPurchase DESC
LIMIT 1;

-- number of orders for each type of coffee?
SELECT 
    CoffeeType, COUNT(o.OrderID) AS OrderCount
FROM
    products p
        JOIN
    orders o ON p.ProductID = o.ProductID
GROUP BY CoffeeType;

-- average profit per 100g of each type of coffee?
SELECT 
    CoffeeType, AVG(Profit) AS AvgProfitPer100g
FROM
    products
GROUP BY CoffeeType;

-- total profit from selling each type of coffee?
SELECT 
    CoffeeType, SUM(Profit * o.Quantity) AS TotalProfit
FROM
    products p
        JOIN
    orders o ON p.ProductID = o.ProductID
GROUP BY CoffeeType;

-- number of orders and total purchases for each customer?
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS OrderCount,
    SUM(p.UnitPrice * o.Quantity) AS TotalPurchase
FROM
    customers c
        JOIN
    orders o ON c.CustomerID = o.CustomerID
        JOIN
    products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerID , c.CustomerName
ORDER BY TotalPurchase DESC;


-- the relationship between coffee size and price per 100g?
SELECT 
    Size, AVG(PricePer100g) AS AvgPricePer100g
FROM
    products
GROUP BY Size;

-- sales for each city
SELECT 
    c.City, SUM(p.PricePer100g * o.Quantity) AS TotalCitySales
FROM
    customers c
        JOIN
    orders o ON c.CustomerID = o.CustomerID
        JOIN
    products p ON o.ProductID = p.ProductID
GROUP BY c.City
ORDER BY TotalCitySales DESC;

