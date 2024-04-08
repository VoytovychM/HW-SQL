--1. Вывести стоимость заказа 10258 --
SELECT SUM(OrderDetails.Quantity * Products.Price) AS TotalOderCost
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID

WHERE
OrderDetails.OrderID = 10258

--2. Вывести кол/распределение заказов по клиентам (проекция: имяклиента, ко-во заказов)--
SELECT Customers.CustomerName, COUNT(*) AS total_orders
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID

--3. Вывести кол/распределение заказов по менеджерам (проекция: фамилияменеджера, ко-возаказов) --
SELECT Employees.LastName, COUNT(*) AS total_orders
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID

--4. Вывести минимальную стоимость товаров для каждой категории (проекция: названиекатегории, минстоимость_товаров) --
SELECT Categories.CategoryName, MIN(Price) AS min_price
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID 
GROUP BY Categories.CategoryID

--5. Вывести данные о заказах (проекция: номерзаказа, стоимостьзаказа)--
SELECT OrderDetails.OrderID, SUM(OrderDetails.Quantity * Products.Price) AS TotalOderCost
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY OrderDetails.OrderID

--6. Вывести доход каждого менеджера за весь период, исходя из ставки в 5% от суммы его заказов (проекция: фамилия_менеджера, доход)--
SELECT Employees.LastName, SUM(OrderDetails.Quantity * Products.Price) * .05 AS employee_income
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID
