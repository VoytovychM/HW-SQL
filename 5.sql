 1. -- Вывести ко-во поставщиков не из UK и не из China --
SELECT
	COUNT(*) AS total
FROM Suppliers

WHERE
	NOT Country IN ('UK', 'China')

2. -- Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5 --

SELECT
  AVG(Price) AS avg_price,
  MAX(Price) AS max_price,
  MIN(Price) AS min_price,
  COUNT(*) AS total_products
FROM Products

WHERE
	CategoryID IN (3, 5)

3. -- Вывести общую сумму проданных товаров --
   
SELECT SUM (Products.Price * OrderDetails.Quantity) AS total_sold_products 
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID

4. -- Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика) --

SELECT Orders.OrderID, Customers.CustomerName, Customers.Country, Employees.LastName, Shippers.ShipperName 
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

5. -- Вывести сумму, на которую было отправлено товаров клиентам в Germany --

SELECT 
	SUM(OrderDetails.Quantity * Products.Price) AS Sales_to_Germany
FROM OrderDetails
	
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID

WHERE
	 Customers.Country = 'Germany'
