# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |n|
  name = "name#{n + 1}"
  email = "user#{n + 1}@user.com"
  password = 'password'
  user = User.new(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
  user.skip_confirmation!
  user.save!
end

users = User.order(:created_at).take(2)
3.times do
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(description: description, image: open('#{Rails.root}/public/uploads/micropost/image/example.jpg')) }
end
