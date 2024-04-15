--1. Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов (проекция: название_компании, ко-во заказов)--

SELECT Shippers.ShipperName,  COUNT(*) AS total_orders
FROM Orders
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY Shippers.ShipperID
HAVING total_orders > 250
ORDER BY total_orders ASC 

--2. Вывести заказы, где ко-во товаров 3 и более (проекция: номерзаказа, ко-вотовароввзаказе)--

SELECT OrderID, COUNT(*) AS orders_with_three_products
FROM OrderDetails 
GROUP BY OrderID
HAVING orders_with_three_products >=3
ORDER BY orders_with_three_products ASC

--3. Вывести минимальную стоимость товара для каждой категории, кроме категории 2 (проекция: названиекатегории, минстоимость_товара)--

SELECT Categories.CategoryName, MIN(Price) AS min_cost
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE
NOT Categories.CategoryID = 2
GROUP BY Categories.CategoryID

--4. Вывести менеджера, который находится на 4 месте по ко-ву созданных заказов (проекция: фамилияменеджера, к-восозданных_заказов)--

SELECT Employees.LastName, COUNT(*) AS total_orders
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID 
GROUP BY Employees.EmployeeID 
ORDER BY total_orders ASC
LIMIT 1 OFFSET 3

--5. Вывести данные о товарах от поставщиков 4 и 8 (проекция: всеимеющиесяполя, ценасоскидкой1.5процента, ценаснаценкой0.5процента)--

SELECT *,
Price * .985 AS Price_reduced,
Price * 1.005 AS Price_increased
FROM Products
WHERE SupplierID IN (4, 8)
