# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Recipe.destroy_all

Recipe.create(name: "Cake", description: "A cake is a sweet, baked food typically made with flour, sugar, and other ingredients.", image_url: "https://images.unsplash.com/photo-1571115177098-24ec42ed204d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", rating: 3)

Recipe.create(name: "Lasagna", description: "Lasagna is a classic baked pasta dish of Italian origin, characterized by alternating layers of flat pasta sheets and a variety of fillings.", image_url: "https://images.unsplash.com/photo-1709429790175-b02bb1b19207?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", rating: 4)

Recipe.create(name: "Greek salad", description: "A traditional Greek salad consists of sliced cucumbers, tomatoes, green bell pepper, red onion, olives, and feta cheese. This classic combination is delicious, so I stick to it, just adding a handful of mint leaves for a fresh finishing touch.", image_url: "https://images.unsplash.com/photo-1599021419847-d8a7a6aba5b4?q=80&w=1958&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", rating: 5)

Recipe.create(name: "Ice cream sundae", description: "An ice cream sundae is a popular American dessert typically consisting of one or more scoops of ice cream topped with a sweet sauce or syrup and other toppings like whipped cream, sprinkles, nuts, or fruits.", image_url: "https://images.unsplash.com/photo-1718985344972-d0eaf1ba5d72?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", rating: 2)

puts "#{Recipe.count} Recipes created!"
