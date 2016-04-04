# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


companies = Company.create([
  {name: 'Pixar', username: 'pixar', address_1: '1234 Sesame Street', city: 'Omaha', state: 'Nebraska', zip: '68106'},
  {name: 'Disney', username: 'disney', address_1: '1235 Yellow Brick Road', city: 'Omaha', state: 'Nebraska', zip: '68106'}])


tutorials = Tutorial.create([
  {title: 'Intro to ActiveRecord', description: 'This is an intro to ActiveRecord', video: 'https://youtu.be/epMyXW7TjwE', public: false, user_id: 1, category: 'ActiveRecord', draft: false},
  {title: 'Intro to ActiveRecord II', description: 'This is the other intro to ActiveRecord', video: 'https://youtu.be/ghfirzoQZ3Q', public: true, user_id: 1, category: 'ActiveRecord', draft: false},
  {title: 'Post Requests', description: 'How to use post requests', video: 'https://youtu.be/QHqMMiBA7ew', public: false, user_id: 2, category: 'HTTP', draft: false},
  {title: 'Dropdowns', description: 'How to create HTML dropdowns', video: 'https://youtu.be/-SszsSObbg0', public: true, user_id: 2, category: 'HTML', draft: true}])

users = User.create([
  {email: 'tommy@aol.com', password: 'hello314', first_name: 'Tommy', last_name: 'Tutone', company_id: 1},
  {email: 'pete@peterson.com', password: 'Password123', first_name: 'Pete', last_name: 'Peterson', company_id: 2}])


# votes = Vote.create([
#   {user_id: 1},
#   {user_id: 1},
#   {user_id: 2},
#   {user_id: 2}])
