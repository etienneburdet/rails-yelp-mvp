# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)'
Restaurant.destroy_all

10.times do
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.phone_number
  category = %w[chinese italian japanese french belgian][rand(0..4)]
  name = Faker::Restaurant.name
  restaurant = Restaurant.new(
    name: name,
    category: category,
    phone_number: phone_number,
    address: address
  )
  restaurant.save
  rand(2..5).times do
    rating = rand(0..5)
    content = Faker::Lorem.paragraph
    review = Review.new(content: content, rating: rating, restaurant: restaurant)
    review.save
  end
end
