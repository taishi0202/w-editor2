# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create!(name: "焼肉太郎", email: "test@example.com", password: "password")
user_2 = User.create!(name: "焼肉次郎", email: "test2@example.com", password: "password")
5.times do |num|
  user_1.articles.create!(title: "テストタイトル_#{num}", body: "テスト本文_#{num}", status: "published")
end
article = Article.first
3.times do |num|
  article.comments.create!(user_id: user_2.id, content: "それって感想ですよね_#{num}")
end
