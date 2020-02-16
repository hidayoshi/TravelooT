# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
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

user = User.new(
  name: 'portfolio',
  email: 'portfolio@portfolio.com',
  password: 'portfolio',
  password_confirmation: 'portfolio'
)
user.skip_confirmation!
user.save!

users = User.order(:created_at).take(4)
3.times do
  description = Faker::Lorem.sentence(5)
  users.each do |user|
    user.microposts.create!(
      description: description,
      image: open('./public/images/example.jpg')
    )
  end
end

microposts = Micropost.all
user = User.first
microposts.each { |micropost| micropost.like(user, micropost.id) }
# users = User.all
# like_users = users[2..7]
# like_users.each { |user| user.}
