# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!({
    username: 'Tiffany',
    email: '15linht@gmail.com',
    full_name:'Tiffany Linh',
    password:'123',
    location:'Center City, Philadelphia',
    gender:'F',
    age:25,
    preferences:[{
        activities: ['hiking', 'singing'],
        religious?: false,
    }],
})

User.create!({
    username: 'Kevin',
    email: 'magavakevin10@gmail.com',
    full_name:'Kevin Ma',
    password:'123',
    location:'New York, New York',
    gender:'M',
    age:26,
    preferences:[{
        activities: ['hiking', 'singing'],
        religious?: false,
    }],
})

Chat.create!({
    title: 'Couple Chat'
})

Message.create!({
    chat_id:1,
    user_id:1,
    text: "Hi kevy"
})

Message.create!({
    chat_id:1,
    user_id:2,
    text: "Hi tiffy"
})
