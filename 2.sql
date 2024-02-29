-- Задание 1. Вывести данные о товарах (название, цена со скидкой в 0.5%) --
SELECT ProductName, 
Price * .995 AS Discount_price
FROM Products

-- Задание 2. Вывести самый дорогой товар в диапазоне от 1 до 100 EUR. --
SELECT * FROM Products
WHERE Price BETWEEN 1 AND 100
ORDER BY PRICE DESC
LIMIT 1

-- Задание 3. Вывести два самых дешевых товара из категории 4. --
SELECT * FROM Products
WHERE CategoryID = 4
ORDER BY PRICE ASC
LIMIT 2

-- Задание 4. Вывести один товар, который находится на пятом месте среди самых дорогих. --
SELECT * FROM Products
ORDER BY PRICE DESC
LIMIT 1 OFFSET 4

-- Задание 5. Вывести товары, названия которых заканчиваются на букву a. --
SELECT * FROM Products
WHERE 
ProductName LIKE '%a'
