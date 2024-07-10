//1. Вывести среднюю реакцию по всем публикациям

db.post_reactions.aggregate([
    {
        $group: {
            _id: null, 
            averageReaction: { $avg: '$value' }
        }
    }
   
]);
//2. Вывести среднюю реакцию авторов из USA

db.post_reactions.aggregate([
    {
        $lookup: {
            from: 'users',
            localField: 'author_id',
            foreignField: '_id',
            as: 'reaction_author'
        }
    },
    
    {
        $match: {
            'reaction_author.country': 'USA'
        }
    },
    {
        $group: {
            _id: 'USA', 
            averageReaction: { $avg: '$value' }
        }
    },
    {
        $project: {
            _id: 0,
            country: '$_id',
            averageReaction: 1
        }
    }
]);


//3.Увеличить баланс всех не заблокированных юзеров на 0.5%

db.users.updateMany(
    {
        is_blocked: { $ne: true }
    },
    {
        $mul: { balance: 1.005 }
    }
)

//4.Вывести ко-во реакций с оценкой 4

db.post_reactions.countDocuments(
    { value: 4 }
);
