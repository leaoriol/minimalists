# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!(name:  "Example User",
             email: "test@test.org",
             password:              "foobar",
             password_confirmation: "foobar")

10.times do |n|
  name  = "test-#{n+1}"
  email = "test-#{n+1}@test.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

user = User.first
list = user.create_list
5.times do
  name = "couch"
  quantity = 1
  category = "furniture"
  action = "keep"
  list.items.create!(name: name, quantity: quantity, category: category, action: action) 
end
5.times do
  name = "bracelets"
  quantity = 13
  category = "jewelry"
  action = "donate"
  list.items.create!(name: name, quantity: quantity, category: category, action: action) 
end