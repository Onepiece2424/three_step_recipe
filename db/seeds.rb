# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.all.each do |user|
#   user.recipes.create!(
#     title: 'チャーハン',
#     process1: '具材を切る',
#     process2: '炒める',
#     process3: '味付け'
#   )
# end

User.create!(username:  "管理者",
  email: "admin@example.jp",
  password:  "11111111",
  password_confirmation: "11111111",
  admin: true)
