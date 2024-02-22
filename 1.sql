-- 1. Приведите десять типовых бизнес-процессов для предметной области ВИДЕО-ХОСТИНГ (Youtube), а также их соответствие по CRUD --

1. Searching the video: Read
2. Uploading the video:Create
3. Watching the video: Read
4. Writing a comment on the video: Create
5. Editing the comment: Update
6. Delete a comment: Delete
7. Subscribe to the channel: Create
8. Unsubscribe to the channel: Delete
9. Set a 'Like': Create
10. Delete 'Like': Delete


-- 2. Вывести название и стоимость товаров от 20 до 150 EUR --
SELECT ProductName, Price FROM Products
WHERE 
Price >=20
AND
Price <= 150

-- 3. Вывести телефоны поставщиков из Japan и Spain --
SELECT Phone FROM Suppliers
WHERE 
Country = 'Japan'
OR
Country = 'Spain'

-- 4.Вывести название и стоимость товаров от всех поставщиков, кроме поставщика 1--
SELECT ProductName, Price FROM Products
WHERE
NOT SupplierID = 1

-- 5.Вывести контактные имена клиентов, кроме тех, что из Germany и Brazil--
SELECT CustomerName FROM Customers
WHERE 
NOT Country = 'Germany'
AND
NOT Country = 'Brazil'

