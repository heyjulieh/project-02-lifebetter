# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Tip.delete_all

user_data = [
  {email: "b@c.com", password: '123456', first_name: "Beth", last_name: "Coppola", username: "BethC", age: 30, location: "San Francisco"},
  {email: "c@d.com", password: '123456', first_name: "Cory", last_name: "Donald", username: "CDude", age: 25, location: "San Francisco"},
  {email: "d@e.com", password: '123456', first_name: "Dan", last_name: "Emery", username: "deeman", age: 40, location: "San Francisco"}
]

tip_data = [
  {genre: "beauty", title: "Coconut Oil Is Awesome", content: "Use coconut oil on your hair once a week to get super soft hair!",
    important: true},
  {genre: "beauty", title: "Cranberry Blush", content: "If you are at a restaurant and forgot to put on your blush, have no fear - use cranberries!",
    important: true},
  {genre: "beauty", title: "For Faster Drying, Ice Your Nails!", content: "If you are impatient like me, you probably hate waiting for your nails to dry!
    So if you want to dry them faster, use ice cubes on them!", important: true}
]

User.create(user_data)

mock_user = User.create({email: "a@b.com", password: '123456', first_name: "Abby", last_name: "Boyd", username: "ABoyd", age: 20, location: "San Francisco"})
mock_user.tips << Tip.create(tip_data)

p "Seed data populated!"
