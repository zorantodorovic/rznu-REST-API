# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(full_name: "Zoran Todorovic", username: "zoran.todorovic@fer.hr", password: "password", description: "igracina")
user2 = User.create(full_name: "Mislav Grgic", username: "mislav.grgic@fer.hr", password: "password", description: "dekan")

for i in 1..10 do
	Project.create(title: "Projekt #{i}", content: "content od #{user1.full_name}", user_id: 1)
end

for j in 10..20 do
	Project.create(title: "Projekt #{j}", content: "content od #{user2.full_name}", user_id: 2)
end