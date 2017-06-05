# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tip.delete_all
User.delete_all

user_1 = User.create({username: "BethCee", first_name: "Beth", last_name: "Coppola", email: "b@c.com", password: "123456", birthday: "1987-02-02", location: "San Francisco"})
user_1.tips = Tip.create([
  {genre: "beauty", title: "Coconut Oil is Awesome!", content: "Use coconut oil on your hair once a week to get super soft hair!"},
  {genre: "food", title: "How to pick healthy food", content: "Pick bright-colored foods, they're usually high in antioxidants. And antioxidants remove free radicals in our body"},
  {genre: "food", title: "Meal prep!", content: "Take a day to plan out and meal prep a week's worth of food. You'll save money and be able to control what goes in your food"},
  {genre: "health", title: "Focus on good posture", content: "Good posure improves your breathing and may also make you look more intelligent and attractive! "}
  ])

user_2 = User.create({email: "c@d.com", password: '123456', first_name: "Cory", last_name: "Donald", username: "CDude", birthday: "1992-03-03", location: "San Francisco"})
user_2.tips = Tip.create([
  {genre: "travel", title: "SOUND CANCELLING headphones!!", content: "Oh man, I don't travel without this! It makes such a big difference. No more having to suffer through crying babies."},
  {genre: "home", title: "The Life Changing Magic of Tidying Up", content: "This is a must read book by Marie Kondo. It's been psychotherapeutic to apply the concepts to my home and life."},
  {genre: "food", title: "Health snacking", content: "Always have some healthy snacks on standby. You never know when the munchies will strike... don't reach for the brownies and cookies, go for fruits or nuts!"},
  {genre: "travel", title: "Meet the locals", content: "Try to speak to and learn from those who live in the country you're visiting. This experience will enrich your travels much more than sightseeing will!"},
  ])

user_3 = User.create({email: "d@e.com", password: '123456', first_name: "Dan", last_name: "Emery", username: "deeman02", birthday: "1977-04-04", location: "San Francisco"})
user_3.tips = Tip.create([
  {genre: "travel", title: "Try Couchsurfing", content: "This is a great way to experience the people and it's country. There's a large community of travellers willing to host you during your stay and give recommendations for the most authentic experience"},
  {genre: "art", title: "Understand the basics of color theory", content: "I consider this a must have for every artist trying to develop their skills. It'll help you choose appealing color palettes and understand color mixing."},
  {genre: "health", title: "Hang out with healthy people", content: "It'll make it easier to eat healthier during social gatherings. And more motivation to be active when you have health-conscious buddies"},
  {genre: "home", title: "Organize your sheets!", content: "Fold your sheets and put them in one of the matching pillow cases for a neat and tidy looking shelf. Next time you need a change of bed sheets, everything is easily accessible!"}
  ])

user_4 = User.create({email: "a@b.com", password: '123456', first_name: "Abby", last_name: "Boyd", username: "ABoyd", birthday: "1997-01-02", location: "Los Angeles"})
user_4.tips = Tip.create([
  {genre: "art", title: "How to draw", content: "Draw what you see. Draw what you know. Draw what you want to see"},
  {genre: "beauty", title: "Cranberry Blush", content: "If you are at a restaurant and forgot to put on your blush, have no fear - use cranberries!"},
  {genre: "beauty", title: "For Faster Drying, Ice Your Nails!", content: "If you are impatient like me, you probably hate waiting for your nails to dry! So if you want to dry them faster, use ice cubes on them!"},
  {genre: "art", title: "Feeling a creative block?", content: "Change your daily routine. Take a different route to work or walk down a street you've never been to. You may get inspired!"}
  ])

user_5 = User.create({email: "julie@ga.com", password: "123456", first_name: "Julie", last_name: "Huang", username: "julieGA", birthday: "1990-12-24", location: "Oakland"})
user_5.tips = Tip.create([
  {genre: "food", title: "Don't Skip Breakfast!", content: "It's true, it's the most important meal of the day. If you skip it, you're more likely to snack on foods high in fat or sugar. "},
  {genre: "travel", title: "Get Lost on Purpose", content: "This is the best way to experience the real city, country and the people that live there!"},
  {genre: "art", title: "Carry a doodle journal with you", content: "If you're like me, it's hard to translate ideas onto a computer using a mouse or touch pad. Instead, I like to jot down and draw my ideas in my doodle journal. "},
  {genre: "beauty", title: "Balance our your shimmer", content: "If you're going for a shimmery eye look, then opt for a matte lipstick. Too much shimmer can make you look oily!"}
  ])
user_6 = User.create({email: "addy@ga.com", password: "123456", first_name: "Addy", last_name: "Kumar", username: "addyGA", birthday: "1992-02-05", location: "East Bay"})
user_6.tips = Tip.create([
  {genre: "health", title: "Sleep more!", content: "Get enough sleep. Lack of sleep can lead to premature aging and over-eating!"},
  {genre: "health", title: " you are not able to sleep at night?", content: "Drink some warm milk before sleeping should have you sleep faster"},
  {genre: "travel", title: "Beautiful Place to Hike In SF", content: "My top picks for hiking in sf are -Mount Davidson - Twin Peaks - Batteries To Bluffs -Lands End -Fort Funston"},
  {genre: "travel", title: "My top Travel Tips", content: "Be Flexible, Make a List, Learn Common Phrases of the Local Language, Don't Forget an Extra Camera Battery (or Two),Always Bring a Sarong,Always Buy Travel Insurance,Make Photocopies of Important Documents,Pack Extra Underwear"},
  {genre: "travel", title: "Tips for having an Awesome road trip", content: "-clean your car before the trip. -check your vehicle. -have a loose plan. -get off the highways. -have an escape plan to get off country roads."},
  {genre: "home", title: "On the market for furniture? ", content: "Try Craigslist or even Facebook to look for bargains in gently used furniture. No need to drop 7 grand on that new couch from Crate and Barrel!"},
  {genre: "home", title: "Garbage disposal overused?", content: "Throw in a lemon peel and hot water to give that garbage disposal a fresh cleaning"},
  {genre: "home", title: "Zap clean you microwave crap!", content: "Use white distilled vingear and it will leave your microwave sparkling like before"}
  ])
user_7 = User.create({email: "michael@ga.com", password: "123456", first_name: "Michael", last_name: "Laird", username: "michaelGA", birthday: "1995-05-05", location: "San Francisco"})
user_7.tips = Tip.create([
  {genre: "health", title: "Water is your best friend", content: "A lot of us don't drink enough water. The next time you feel hungry you should down a glass of water and assess your hunger levels after that"},
  {genre: "travel", title: "Don't plan too much", content: "My advise is to pick a starting point, endpoint and a couple must-do activities. Let what happens in between be spontaneous. "},
  {genre: "home", title: "Smelly odors in your house? Use Vinegar!", content: "Lay out a bowl of vinegar for a couple hours and smelly odors will be gone"},
  {genre: "home", title: "Organize container lids", content: "Use that old CD holder to rack up all your container lids for easy organization!"}
  ])
user_8 = User.create({email: "jane@ga.com", password: "123456", first_name: "Jane", last_name: "Wie", username: "janeGA", birthday: "1980-02-05", location: "San Francisco"})
user_8.tips = Tip.create([
  {genre: "food", title: "Shop on the perimeter of a grocery store", content: "Avoid the processed foods, and go for the foods in the refrigerated/freezer section"},
  {genre: "beauty", title: "Use eye cream to clean up your cat eye!", content: "Getting that perfect cat eye-liner can be really hard. I like to put some eye cream on a q tip when I start outlining the edges of my cat eye."},
  {genre: "health", title: "Listen to music!", content: "When you're working, or exercising or even falling asleep - turn on some tunes. It can help you focus on the task at hand and even put you in a better mood. "},
  {genre: "home", title: "Moving in or out of an apartment?", content: "Take pictures of every room, just in case the landlord tries to pin damages on you that you didn't cause. "}
  ])

p "Seed data populated!"
