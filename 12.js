// В рамках БД social_network выведите данные о трех произвольных реакциях на публикации (проекция: оценка, имяавторареакции, заголовок_публикации)

db.post_reactions.aggregate([
    { $sample: { size: 3 } },
    {
        $lookup: {
            from: 'users',
            localField: 'author_id',
            foreignField: '_id',
            as: 'reaction_author'
        }
    },
    { $unwind: '$reaction_author' },
    {
        $lookup: {
            from: 'posts',
            localField: 'post_id',
            foreignField: '_id',
            as: 'post'
        }
    },
    { $unwind: '$post' },
    {
        $project: {
            reaction_value: '$value',
            reaction_author_fullname: '$reaction_author.fullname',
            post_title: '$post.title',
            _id: 0
        }
    }
])
