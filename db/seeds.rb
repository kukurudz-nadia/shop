# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do 
    Product.create(
        name: Faker::Commerce.unique.product_name,
        description: "Surprisingly this product is made out of pure #{Faker::Commerce.material}.",
        price: Faker::Commerce.price,
        position: Faker::Number.number(digits: 2),
        category_id: Faker::Number.between(from: 1, to: 10)
    ) 
end
