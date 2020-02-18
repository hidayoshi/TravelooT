# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = %w[hanako
           masa
           toshiki]

3.times do |n|
  email = "user#{n + 1}@user.com"
  password = 'password'
  user = User.new(
    name: names[n],
    email: email,
    password: password,
    password_confirmation: password
  )
  user.skip_confirmation!
  user.save!
end

# portfolio用のユーザー
user = User.new(
  name: 'portfolio',
  email: 'portfolio@portfolio.com',
  password: 'portfolio',
  password_confirmation: 'portfolio'
)
user.skip_confirmation!
user.save!

# 次の計算のため[0]を使わない
descriptions = ['',
                'コンパクトながらも結構な量が入るリュックサックです。耐久性もあるので、かれこれ3年間は旅行に使っています！',
                '旅行にもオシャレが必要！でも見た目とは裏腹にハイキングにも使えます',
                "旅行用の衣服には耐久性が必要なのでデニムを愛用しています。その中でもLEVI'Sが好きで、3着も持っています",
                'スニーカーやサンダルでは足元が不安なのでブーツを履いています。急な登山などにも対応できますよ',
                '旅人は黙って白シャツです。素材も乾きやすく、匂いもしにくいのでヘビロテしてます。',
                'タオルを持ち歩く人は旅人として2流だと思ってます（笑）プロは吸水タオルで全て済ませますよ']
count = 0

users = User.order(:created_at).take(3)
  users.each do |user|
    2.times do |n|
    user.microposts.create!(
      description: descriptions[n+1+count],
      image: open("./public/images/example-#{n+1+count}.jpg")
    )
  end
  count+=2
end

microposts = Micropost.all
user = User.first
microposts.each { |micropost| micropost.like(user, micropost.id) }
# users = User.all
# like_users = users[2..7]
# like_users.each { |user| user.}
