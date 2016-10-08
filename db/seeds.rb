# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Wishlist.create(name: 'Bday', user_id: 1)
Wishlist.create(name: 'New Year', user_id: 2)
Wishlist.create(name: '8 of March', user_id: 3)
Wishlist.create(name: 'Thankgiving', user_id: 4)


5.times do
  User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(8)
  )
end

25.times do
  Gift.create(
      name: Faker::Commerce.product_name,
      link: Faker::Internet.url,
      wishlist_id: rand(1..3)
  )
end

  Comment.create(user_id: 3, gift_id: 4, content: Faker::Hipster.sentence)
  Comment.create(user_id: 4, gift_id: 2, content: Faker::Hipster.sentence)
  Comment.create(user_id: 2, gift_id: 10, content: Faker::Hipster.sentence)
