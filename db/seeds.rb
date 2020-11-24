# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  User.create(email: "thp.chaton#{i}@yopmail.com", password: "123456")
end

puts "3 utilisateurs ont été créés !"

5.times do |i|
  Item.create(title: Faker::Name.first_name, description: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true), price: rand(1..500), image_url: "http://placekitten.com/300/30#{i}",)
end

puts "5 chatons ont été créés !"

User.all.each do |user|
  Cart.create(user_id: user.id)
end

puts "Chaque utilisateur a son panier !"

10.times do
  LineItem.create(cart_id: Cart.all[rand(Cart.all.length)].id, item_id: Item.all[rand(Item.all.length)].id)
end

puts "10 lignes d'achat ont été ajoutées au hasard !"