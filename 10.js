--1. Вывести названия двух произвольных треков с тегом mega--
db.videos.aggregate([
    {
        $sample: { size: 2 }},
     {$project: {tags: "mega"}}   
])
​
--2.Вывести имя юзера с самым минимальным балансом--
db.users.aggregate([
    
    { $sort: { balance: 1 } },
    { $limit: 1 },
     { $project: { _id: 0, fullname: 1 } }
])

--3. Используя метод countDocuments(), вывести ко-во заблокированных юзеров с балансом от 10 до 1000 EUR (вкл.)--
db.users.countDocuments({ 
    
    is_blocked: true,
    balance: {$gte: 10, $lte: 1000 }
})

--4. Используя метод aggregate(), вывести ко-во незаблокированных юзеров не из Germany и не из France с балансом до 1000 EUR (не вкл.)--
db.users.aggregate([
    
    {$match: {is_blocked: {$ne: true},
    country: {$nin: ['Germany', 'France']},
    balance: {$lt:1000}}
    },
    {$count:"total_number_of_unblocked_users_out_of_Germany_and_France"}
])

--5. Также очень коротко опишите, как работает агрегация в MongoDB--
--Агрегация обрабатывает данные поэтапно через операторов: фильтр, сортировку и тд--

