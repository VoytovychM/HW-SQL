--1.Задание. Вывести данные о товарах (проекция: названиетовара, цена, название категории, название компании поставщика)--

Select Products.ProductName, Products.Price, Categories.CategoryName, Suppliers.SupplierName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

--2.Задание. Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента)--

SELECT Orders.OrderID, Customers.CustomerName, Customers.Country  
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
NOT Country = 'France'

--3.Задание. Вывести название и стоимость в USD одного самого дорогого проданного товара --

SELECT Products.ProductName, Products.Price 
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORDER BY Products.Price DESC
LIMIT 1

--4.Задание. Вывести список стран, которые поставляют морепродукты --

SELECT Suppliers.Country FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID 
WHERE
Categories.CategoryName = 'Seafood'

--5.Задание. Вывести два самых дорогих товара из категории Beverages из USA --

SELECT *
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID  
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID 
WHERE
Categories.CategoryName = 'Beverages'
AND
Suppliers.Country = 'USA'
ORDER BY Products.Price DESC
LIMIT 2


