# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'
require 'open-uri'

puts "Cleaning the DB"
Bookmark.destroy_all
Recipe.destroy_all
Category.destroy_all

puts "Creating recipes..."

Recipe.create!(
  name: "Cake",
  description: "A cake is a sweet, baked food typically made with flour, sugar, and other ingredients.",
  image_url: "https://images.unsplash.com/photo-1571115177098-24ec42ed204d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: 3.6
)

Recipe.create!(
  name: "Lasagna",
  description: "Lasagna is a classic baked pasta dish of Italian origin, characterized by alternating layers of flat pasta sheets and a variety of fillings.",
  image_url: "https://images.unsplash.com/photo-1709429790175-b02bb1b19207?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: 4.4
)

Recipe.create!(
  name: "Greek salad",
  description: "A traditional Greek salad consists of sliced cucumbers, tomatoes, green bell pepper, red onion, olives, and feta cheese. This classic combination is delicious, so I stick to it, just adding a handful of mint leaves for a fresh finishing touch.",
  image_url: "https://images.unsplash.com/photo-1599021419847-d8a7a6aba5b4?q=80&w=1958&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: 5.0
)

Recipe.create!(name: "Ice cream sundae",
  description: "An ice cream sundae is a popular American dessert typically consisting of one or more scoops of ice cream topped with a sweet sauce or syrup and other toppings like whipped cream, sprinkles, nuts, or fruits.",
  image_url: "https://images.unsplash.com/photo-1718985344972-d0eaf1ba5d72?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: 2.7
)

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
  meal_serialized = URI.parse(url).read
  meal = JSON.parse(meal_serialized)['meals'][0]

  Recipe.create!(
    name: meal['strMeal'],
    description: meal['strInstructions'],
    image_url: meal['strMealThumb'],
    rating: rand(2..5.0).round(1)
  )
end

categories = ['Breakfast', 'Seafood', 'Chicken', 'Vegetarian']

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  recipe_list = URI.parse(url).read
  recipes = JSON.parse(recipe_list)
  recipes["meals"].take(5).each do |recipe|
    recipe_builder(recipe['idMeal'])
  end
end

puts "Done! #{Recipe.count} Recipes created!"
