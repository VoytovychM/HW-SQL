--1.Создать таблицу друзей с использованием механизма валидации данных в SQL--

create table friends (
    id int primary key auto_increment,
    user_id int,
    friend_id int,
    created_at timestamp not null default current_timestamp, 
    foreign key (user_id) references users(user_id),
    foreign key (friend_id) references users(user_id),
    unique key unique_friendship (user_id, friend_id),
    is_deactivated bool default false);

--2. Добавить в таблицу друзей несколько записей--
insert into friends (user_id, friend_id) values (1, 2), (3, 4), (4, 1), (3, 2);

--3.Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)--

select accounts.currency, SUM(amount) as total_amount
from transactions
join accounts on accounts.id = transactions.id
group by currency
order by currency;
