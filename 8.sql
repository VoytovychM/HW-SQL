--Создать таблицу друзей с использованием механизма валидации данных в SQL--
--3.Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)--
SELECT accounts.currency, SUM(amount) AS total_amount
FROM transactions
JOIN accounts ON accounts.id = transactions.id
GROUP BY currency
ORDER BY currency;
