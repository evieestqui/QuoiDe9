# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
RestaurantOwner.destroy_all
Restaurant.destroy_all
Dish.destroy_all

james = User.create(name: "James", email: "james@example.com", password: "password")
chloe = User.create(name: "Chloe", email: "chloe@example.com", password: "password")

john = RestaurantOwner.create(name: "John", email: "john@example.com", password: "password")
jane = RestaurantOwner.create(name: "Jane", email: "jane@example.com", password: "password")

paris_addresses = [
  "12 Rue du Faubourg Saint-Honoré, 75008 Paris",
  "45 Avenue de la Bourdonnais, 75007 Paris",
  "89 Rue de la Roquette, 75011 Paris",
  "156 Rue Montmartre, 75002 Paris",
  "23 Rue des Martyrs, 75009 Paris",
  "78 Avenue des Champs-Élysées, 75008 Paris",
  "34 Rue Vieille du Temple, 75004 Paris",
  "167 Rue Saint-Martin, 75003 Paris",
  "90 Boulevard de Clichy, 75018 Paris",
  "45 Rue Oberkampf, 75011 Paris",
  "123 Avenue de France, 75013 Paris",
  "56 Rue de la Pompe, 75016 Paris",
  "234 Rue de Charenton, 75012 Paris",
  "89 Rue du Commerce, 75015 Paris",
  "12 Place de la Bastille, 75004 Paris",
  "67 Avenue Parmentier, 75011 Paris",
  "189 Rue Saint-Jacques, 75005 Paris",
  "45 Rue de Belleville, 75020 Paris",
  "78 Rue des Dames, 75017 Paris",
  "23 Rue Dauphine, 75006 Paris"
]

food_preferences = [
  "Fast Food", "Italian", "Chinese", "Japanese", "Kebab", "Pizza", "Pasta", "Thai", "Burger",
  "Sushi", "Vietnamese", "Indian", "Mexican", "BBQ", "Greek", "French", "Lebanese", "Brunch",
  "Breakfast", "Desserts", "Bubble Tea", "Coffee", "Tacos", "Vegan", "Vegetarian", "Organic",
  "High-Protein", "High-Fiber"
]

food_restrictions = [
  "Halal", "Hindu Vegetarian", "Kosher", "Gluten-Free", "Lactose Free", "Dairy-Free",
  "Nut-Free", "Egg-Free", "Shellfish-Free", "Coriander-Free", "Diabetic-Friendly",
  "Low-Carb", "Low-Fat"
]

5.times do |i|
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: paris_addresses[i],
    rating: rand(1..5),
    food_preferences: food_preferences.sample(rand(2..5)),
    food_restrictions: food_restrictions.sample(rand(1..3)),
    restaurant_owner: [john, jane].sample
  )

  restaurant.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/restaurants/smoked-meat.jpg")), filename: "#{restaurant.name.downcase.gsub(' ', '_')}.jpg", content_type: "image/jpeg")
end

# Create dishes for restaurants
dish_names = [
  "Classic Burger", "Margherita Pizza", "Pad Thai", "Sushi Roll", "Chicken Curry",
  "Caesar Salad", "Beef Stir Fry", "Pasta Carbonara", "Fish and Chips", "Greek Salad",
  "Ramen Bowl", "Falafel Plate", "Butter Chicken", "Veggie Bowl", "Taco Platter"
]

descriptions = [
  "Juicy beef patty with fresh toppings", "Traditional Italian pizza with tomato and mozzarella",
  "Rice noodles with tamarind sauce", "Fresh fish with rice and seaweed",
  "Aromatic spiced curry", "Crisp romaine with parmesan", "Tender beef with vegetables",
  "Creamy pasta with bacon", "Crispy battered fish", "Fresh Mediterranean salad",
  "Rich broth with noodles", "Crispy chickpea balls", "Rich tomato-based curry",
  "Fresh seasonal vegetables", "Authentic Mexican tacos"
]

Restaurant.all.each do |restaurant|
  2.times do
    dish = Dish.create!(
      name: dish_names.sample,
      description: descriptions.sample,
      price: rand(8.99..29.99).round(2),
      restaurant: restaurant
    )

    dish.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/dishes/grill.jpg")), filename: "#{dish.name.downcase.gsub(' ', '_')}.jpg", content_type: "image/jpeg")
  end
end
