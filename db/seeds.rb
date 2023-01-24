100.times do 
    Product.create(
        name: Faker::Commerce.unique.product_name,
        description: "Surprisingly this product is made out of pure #{Faker::Commerce.material}.",
        price: Faker::Commerce.price,
        position: Faker::Number.number(digits: 2),
        category_id: Faker::Number.between(from: 1, to: 10)
    ) 
 end
