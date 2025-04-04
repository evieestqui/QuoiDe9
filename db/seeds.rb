# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Destroying all users"
User.destroy_all
puts "Destroying all restaurant owners"
RestaurantOwner.destroy_all
puts "Destroying all restaurants"
Restaurant.destroy_all
puts "Destroying all dishes"
Dish.destroy_all


# Helper method to attach image from URL
def attach_image_from_url(record, image_url)
  begin
    downloaded_image = URI.open(image_url)
    record.photo.attach(
      io: downloaded_image,
      filename: "#{record.name.downcase.gsub(' ', '_')}.jpg",
      content_type: "image/jpeg"
    )
  rescue OpenURI::HTTPError => e
    puts "Failed to download image for #{record.name}: #{e.message}"
  end
end

puts "Creating users"
ivy = User.create(name: "Ivy", email: "ivy@chiang.com", password: "password")
helen = User.create(name: "Helen", email: "helen@chiang.com", password: "password")

john = RestaurantOwner.create(name: "John", email: "john@example.com", password: "password")
jane = RestaurantOwner.create(name: "Jane", email: "jane@example.com", password: "password")


# Create restaurant owners first
restaurant_owners = [
  RestaurantOwner.create!(name: "Nicolas Dupont", email: "nicolas.dupont@example.com", password: "password"),
  RestaurantOwner.create!(name: "Sophie Laurent", email: "sophie.laurent@example.com", password: "password"),
  RestaurantOwner.create!(name: "Angèle Ferreux-Maeght", email: "angele.ferreux@example.com", password: "password"),
  RestaurantOwner.create!(name: "John Paul", email: "john.paul@example.com", password: "password"),
  RestaurantOwner.create!(name: "Marco Bianchi", email: "marco.bianchi@example.com", password: "password"),
  RestaurantOwner.create!(name: "Ann Wong", email: "ann.wong@example.com", password: "password"),
  RestaurantOwner.create!(name: "Paul Richard", email: "paul.richard@example.com", password: "password"),
  RestaurantOwner.create!(name: "Omar Al-Sayed", email: "omar.alsayed@example.com", password: "password"),
  RestaurantOwner.create!(name: "Alessandro Rossi", email: "alessandro.rossi@example.com", password: "password"),
  RestaurantOwner.create!(name: "Giovanni Moreau", email: "giovanni.moreau@example.com", password: "password"),
  RestaurantOwner.create!(name: "Laurent Dupuis", email: "laurent.dupuis@example.com", password: "password"),
  RestaurantOwner.create!(name: "Michel Morel", email: "michel.morel@example.com", password: "password"),
  RestaurantOwner.create!(name: "Isabelle Fontaine", email: "isabelle.fontaine@example.com", password: "password"),
  RestaurantOwner.create!(name: "Philippe Garnier", email: "philippe.garnier@example.com", password: "password"),
  RestaurantOwner.create!(name: "Roberto Conti", email: "roberto.conti@example.com", password: "password"),
  RestaurantOwner.create!(name: "Claude Petit", email: "claude.petit@example.com", password: "password"),
  RestaurantOwner.create!(name: "Thomas Leclerc", email: "thomas.leclerc@example.com", password: "password"),
  RestaurantOwner.create!(name: "Jean-Pierre Martin", email: "jeanpierre.martin@example.com", password: "password"),
  RestaurantOwner.create!(name: "Francis Leclerc", email: "francis.leclerc@example.com", password: "password")
]

# First define all the restaurant data
restaurants_data = [
  {
    name: "Chez Nicos",
    restaurant_owner: restaurant_owners[0],
    address: "44 Rue Mouffetard, 75005 Paris",
    rating: 4.9,
    food_preferences: ["Fast Food", "Burger"],
    food_restrictions: ["Halal", "Egg-Free"],
    number_of_reviews: 818,
    image_url: "https://images.unsplash.com/photo-1555396273-367ea4eb4db5"
  },
  {
    name: "NoGlu",
    restaurant_owner: restaurant_owners[1],
    address: "15 Rue Basfroi, 75011 Paris",
    rating: 4.5,
    food_preferences: ["Italian", "Burger"],
    food_restrictions: ["Vegan", "Nut-Free"],
    number_of_reviews: 612,
    image_url: "https://images.unsplash.com/photo-1536329639134-ade172b2fea0"
  },
  {
    name: "La Guinguette d'Angèle",
    restaurant_owner: restaurant_owners[2],
    address: "34 Rue Coquillière, 75001 Paris",
    rating: 4.7,
    food_preferences: ["Japanese", "Sushi"],
    food_restrictions: ["Vegan", "Gluten-Free", "Nut-Free"],
    number_of_reviews: 745,
    image_url: "https://images.unsplash.com/photo-1696449241254-11cf7f18ce32"
  },
  {
    name: "Jah Jah",
    restaurant_owner: restaurant_owners[3],
    address: "11 Rue des Petites Écuries, 75010 Paris",
    rating: 4.6,
    food_preferences: ["BBQ", "Fast Food"],
    food_restrictions: ["Vegan", "Gluten-Free", "Shellfish-Free"],
    number_of_reviews: 530,
    image_url: "https://images.unsplash.com/photo-1537047902294-62a40c20a6ae"
  },
  {
    name: "Big Love Café",
    restaurant_owner: restaurant_owners[4],
    address: "30 Rue Debelleyme, 75003 Paris",
    rating: 4.4,
    food_preferences: ["Pizza", "Italian", "Burger"],
    food_restrictions: ["Lactose-Free", "Nut-Free"],
    number_of_reviews: 970,
    image_url: "https://images.unsplash.com/photo-1466978913421-dad2ebd01d17"
  },
  {
    name: "Chez Ann",
    restaurant_owner: restaurant_owners[5],
    address: "29 Rue de l'Échiquier, 75010 Paris",
    rating: 4.3,
    food_preferences: ["Chinese", "Fast Food"],
    food_restrictions: ["Vegetarian", "Vegan", "Egg-Free"],
    number_of_reviews: 820,
    image_url: "https://images.unsplash.com/photo-1526234362653-3b75a0c07438"
  },
  {
    name: "Les Tontons Veg",
    restaurant_owner: restaurant_owners[6],
    address: "9 Rue de Lancry, 75010 Paris",
    rating: 4.5,
    food_preferences: ["Burger", "Fast Food"],
    food_restrictions: ["Vegan", "Nut-Free"],
    number_of_reviews: 645,
    image_url: "https://images.unsplash.com/photo-1552566626-52f8b828add9"
  },
  {
    name: "Daily Syrien Veggie",
    restaurant_owner: restaurant_owners[7],
    address: "72 Rue du Faubourg Saint-Denis, 75010 Paris",
    rating: 4.6,
    food_preferences: ["Fast Food", "Mexican"],
    food_restrictions: ["Vegetarian", "Vegan", "Halal"],
    number_of_reviews: 450,
    image_url: "https://images.unsplash.com/photo-1555992336-fb0d29498b13"
  },
  {
    name: "Café di Roma",
    restaurant_owner: restaurant_owners[8],
    address: "22 Avenue des Champs-Élysées, 75008 Paris",
    rating: 4.5,
    food_preferences: ["Italian", "Pizza"],
    food_restrictions: ["Nut-Free", "Shellfish-Free"],
    number_of_reviews: 685,
    image_url: "https://images.unsplash.com/photo-1559925393-8be0ec4767c8"
  },
  {
    name: "Gigi Paris",
    restaurant_owner: restaurant_owners[9],
    address: "16 Rue de la Paix, 75002 Paris",
    rating: 4.6,
    food_preferences: ["Italian", "BBQ"],
    food_restrictions: ["Shellfish-Free", "Dairy-Free"],
    number_of_reviews: 530,
    image_url: "https://images.unsplash.com/photo-1533777857889-4be7c70b33f7"
  },
  {
    name: "Semilla",
    restaurant_owner: restaurant_owners[10],
    address: "54 Rue de Seine, 75006 Paris",
    rating: 4.7,
    food_preferences: ["Sushi", "Japanese"],
    food_restrictions: ["Nut-Free", "Dairy-Free", "Egg-Free"],
    number_of_reviews: 875,
    image_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4"
  },
  {
    name: "Brasserie Flottes",
    restaurant_owner: restaurant_owners[11],
    address: "2 Rue Cambon, 75001 Paris",
    rating: 4.3,
    food_preferences: ["BBQ", "Fast Food"],
    food_restrictions: ["Halal", "Gluten-Free"],
    number_of_reviews: 560,
    image_url: "https://images.unsplash.com/photo-1508766917616-d22f3f1eea14"
  },
  {
    name: "Loulou Restaurant Paris",
    restaurant_owner: restaurant_owners[12],
    address: "107 Rue de Rivoli, 75001 Paris",
    rating: 4.5,
    food_preferences: ["Indian", "Chinese"],
    food_restrictions: ["Vegetarian", "Dairy-Free", "Egg-Free"],
    number_of_reviews: 930,
    image_url: "https://images.unsplash.com/photo-1515669097368-22e68427d265"
  },
  {
    name: "Les Antiquaires",
    restaurant_owner: restaurant_owners[13],
    address: "5 Quai Malaquais, 75006 Paris",
    rating: 4.4,
    food_preferences: ["Mexican", "Pizza"],
    food_restrictions: ["Egg-Free", "Nut-Free"],
    number_of_reviews: 700,
    image_url: "https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c"
  },
  {
    name: "L'Oliveto Paris",
    restaurant_owner: restaurant_owners[14],
    address: "41 Boulevard Saint-Michel, 75005 Paris",
    rating: 4.3,
    food_preferences: ["Pizza", "Italian"],
    food_restrictions: ["Lactose-Free", "Shellfish-Free"],
    number_of_reviews: 480,
    image_url: "https://images.unsplash.com/photo-1424847651672-bf20a4b0982b"
  },
  {
    name: "Le Balzar",
    restaurant_owner: restaurant_owners[15],
    address: "49 Rue des Écoles, 75005 Paris",
    rating: 4.2,
    food_preferences: ["Chinese", "BBQ"],
    food_restrictions: ["Shellfish-Free", "Nut-Free"],
    number_of_reviews: 920,
    image_url: "https://images.unsplash.com/photo-1525610553991-2bede1a236e2"
  },
  {
    name: "NOVETTINO_Bastille",
    restaurant_owner: restaurant_owners[16],
    address: "14 Boulevard Beaumarchais, 75011 Paris",
    rating: 4.5,
    food_preferences: ["Burger", "Fast Food"],
    food_restrictions: ["Nut-Free", "Halal"],
    number_of_reviews: 760,
    image_url: "https://images.unsplash.com/photo-1514933651103-005eec06c04b"
  },
  {
    name: "Café de Flore",
    restaurant_owner: restaurant_owners[17],
    address: "172 Boulevard Saint-Germain, 75006 Paris",
    rating: 4.4,
    food_preferences: ["Mexican", "Burger"],
    food_restrictions: ["Dairy-Free", "Halal"],
    number_of_reviews: 990,
    image_url: "https://images.unsplash.com/photo-1521017432531-fbd92d768814"
  },
  {
    name: "Chez Francis",
    restaurant_owner: restaurant_owners[18],
    address: "7 Place de l'Alma, 75008 Paris",
    rating: 4.6,
    food_preferences: ["Sushi", "Japanese"],
    food_restrictions: ["Vegetarian", "Vegan", "Shellfish-Free"],
    number_of_reviews: 850,
    image_url: "https://images.unsplash.com/photo-1590846406792-0adc7f938f1d"
  },
  {
    name: "Le Petit Indien",
    restaurant_owner: restaurant_owners[0],
    address: "15 Rue de la Roquette, 75011 Paris",
    rating: 4.8,
    food_preferences: ["Indian", "BBQ"],
    food_restrictions: ["Vegetarian", "Gluten-Free"],
    number_of_reviews: 680,
    image_url: "https://images.unsplash.com/photo-1585937421612-70a008356fbe"
  },
  {
    name: "Tokyo Sushi Bar",
    restaurant_owner: restaurant_owners[1],
    address: "8 Rue de la Gaité, 75014 Paris",
    rating: 4.7,
    food_preferences: ["Japanese", "Sushi"],
    food_restrictions: ["Shellfish-Free", "Dairy-Free"],
    number_of_reviews: 890,
    image_url: "https://images.unsplash.com/photo-1553621042-f6e147245754"
  },
  {
    name: "La Taqueria",
    restaurant_owner: restaurant_owners[2],
    address: "55 Rue Oberkampf, 75011 Paris",
    rating: 4.5,
    food_preferences: ["Mexican", "Fast Food"],
    food_restrictions: ["Vegan", "Nut-Free"],
    number_of_reviews: 720,
    image_url: "https://images.unsplash.com/photo-1565299585323-38d6b0865b47"
  },
  {
    name: "Dragon Wok",
    restaurant_owner: restaurant_owners[3],
    address: "63 Avenue Parmentier, 75011 Paris",
    rating: 4.4,
    food_preferences: ["Chinese", "Fast Food"],
    food_restrictions: ["Halal", "Egg-Free"],
    number_of_reviews: 550,
    image_url: "https://images.unsplash.com/photo-1512003867696-6d5ce6835040"
  },
  {
    name: "Burger Paradise",
    restaurant_owner: restaurant_owners[4],
    address: "20 Rue Saint-Antoine, 75004 Paris",
    rating: 4.6,
    food_preferences: ["Burger", "Fast Food"],
    food_restrictions: ["Halal", "Gluten-Free"],
    number_of_reviews: 830,
    image_url: "https://images.unsplash.com/photo-1586816001966-79b736744398"
  },
  {
    name: "Pasta Bella",
    restaurant_owner: restaurant_owners[5],
    address: "12 Rue des Martyrs, 75009 Paris",
    rating: 4.5,
    food_preferences: ["Italian", "Pizza"],
    food_restrictions: ["Vegetarian", "Dairy-Free"],
    number_of_reviews: 670,
    image_url: "https://images.unsplash.com/photo-1481931098730-318b6f776db0"
  },
  {
    name: "Le BBQ House",
    restaurant_owner: restaurant_owners[6],
    address: "25 Rue du Temple, 75004 Paris",
    rating: 4.7,
    food_preferences: ["BBQ", "Fast Food"],
    food_restrictions: ["Shellfish-Free", "Nut-Free"],
    number_of_reviews: 910,
    image_url: "https://images.unsplash.com/photo-1529193591184-b1d58069ecdd"
  },
  {
    name: "Sushi Master",
    restaurant_owner: restaurant_owners[7],
    address: "88 Boulevard Beaumarchais, 75011 Paris",
    rating: 4.8,
    food_preferences: ["Japanese", "Sushi"],
    food_restrictions: ["Gluten-Free", "Dairy-Free"],
    number_of_reviews: 780,
    image_url: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c"
  },
  {
    name: "Vegan Corner",
    restaurant_owner: restaurant_owners[8],
    address: "33 Rue des Rosiers, 75004 Paris",
    rating: 4.6,
    food_preferences: ["Burger", "Fast Food"],
    food_restrictions: ["Vegan", "Gluten-Free"],
    number_of_reviews: 640,
    image_url: "https://images.unsplash.com/photo-1540914124281-342587941389"
  },
  {
    name: "Spice of India",
    restaurant_owner: restaurant_owners[9],
    address: "45 Rue de Rivoli, 75004 Paris",
    rating: 4.5,
    food_preferences: ["Indian", "BBQ"],
    food_restrictions: ["Vegetarian", "Nut-Free"],
    number_of_reviews: 850,
    image_url: "https://images.unsplash.com/photo-1585937421612-70a008356fbe"
  },
  {
    name: "Mexican Fiesta",
    restaurant_owner: restaurant_owners[10],
    address: "18 Rue Saint-Maur, 75011 Paris",
    rating: 4.4,
    food_preferences: ["Mexican", "Fast Food"],
    food_restrictions: ["Halal", "Dairy-Free"],
    number_of_reviews: 590,
    image_url: "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b"
  },
  {
    name: "Pizza Roma",
    restaurant_owner: restaurant_owners[11],
    address: "95 Rue Montorgueil, 75002 Paris",
    rating: 4.7,
    food_preferences: ["Pizza", "Italian"],
    food_restrictions: ["Vegetarian", "Egg-Free"],
    number_of_reviews: 730,
    image_url: "https://images.unsplash.com/photo-1574071318508-1cdbab80d002"
  },
  {
    name: "Chinese Garden",
    restaurant_owner: restaurant_owners[12],
    address: "28 Avenue de Choisy, 75013 Paris",
    rating: 4.3,
    food_preferences: ["Chinese", "Fast Food"],
    food_restrictions: ["Shellfish-Free", "Nut-Free"],
    number_of_reviews: 480,
    image_url: "https://images.unsplash.com/photo-1525755662778-989d0524087e"
  },
  {
    name: "Burger & Co",
    restaurant_owner: restaurant_owners[13],
    address: "66 Rue de la Roquette, 75011 Paris",
    rating: 4.6,
    food_preferences: ["Burger", "Fast Food"],
    food_restrictions: ["Halal", "Gluten-Free"],
    number_of_reviews: 870,
    image_url: "https://images.unsplash.com/photo-1550317138-10000687a72b"
  },
  {
    name: "Tokyo Express",
    restaurant_owner: restaurant_owners[14],
    address: "22 Rue Saint-Anne, 75001 Paris",
    rating: 4.5,
    food_preferences: ["Japanese", "Sushi"],
    food_restrictions: ["Vegan", "Dairy-Free"],
    number_of_reviews: 620,
    image_url: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c"
  }
]

created_restaurants = restaurants_data.map do |restaurant_data|
  puts "Creating restaurant: #{restaurant_data[:name]}"
  image_url = restaurant_data.delete(:image_url)
  restaurant = Restaurant.create!(restaurant_data)
  attach_image_from_url(restaurant, image_url)
  restaurant
end

# Define dishes data with their respective restaurants
dishes_data = [
  # For Pizza Roma (Vegetarian, Egg-Free, Pizza, Italian)
  { name: "Vegetarian Margherita", description: "Classic egg-free pizza with tomatoes and basil", price: 13.99, restaurant: created_restaurants[0], image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3" },
  { name: "Egg-Free Pasta Primavera", description: "Fresh pasta with seasonal vegetables", price: 14.99, restaurant: created_restaurants[0], image_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601" },
  { name: "Grilled Vegetable Pizza", description: "Assorted grilled vegetables on egg-free crust", price: 15.99, restaurant: created_restaurants[0], image_url: "https://images.unsplash.com/photo-1513104890138-7c749659a591" },

  # For Chinese Garden (Chinese, Fast Food, Shellfish-Free, Nut-Free)
  { name: "Nut-Free Kung Pao Chicken", description: "Spicy chicken without peanuts", price: 12.99, restaurant: created_restaurants[1], image_url: "https://images.unsplash.com/photo-1525755662778-989d0524087e" },
  { name: "Shellfish-Free Fried Rice", description: "Classic fried rice with vegetables", price: 10.99, restaurant: created_restaurants[1], image_url: "https://images.unsplash.com/photo-1603133872878-684f208fb84b" },

  # For Burger & Co (Burger, Fast Food, Halal, Gluten-Free)
  { name: "Halal Beef Burger", description: "Gluten-free bun with certified halal beef", price: 14.99, restaurant: created_restaurants[2], image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd" },
  { name: "Gluten-Free Chicken Burger", description: "Halal chicken with special bun", price: 13.99, restaurant: created_restaurants[2], image_url: "https://images.unsplash.com/photo-1550317138-10000687a72b" },

  # For Tokyo Express (Japanese, Sushi, Vegan, Dairy-Free)
  { name: "Vegan Roll", description: "Plant-based tofu steak roll", price: 11.99, restaurant: created_restaurants[3], image_url: "https://images.unsplash.com/photo-1679744034962-c0650a2a20b3?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Dairy-Free Ramen", description: "Traditional ramen with plant-based broth", price: 13.99, restaurant: created_restaurants[3], image_url: "https://images.unsplash.com/photo-1557872943-16a5ac26437e" },

  # For Le Balzar (Chinese, BBQ, Shellfish-Free, Nut-Free)
  { name: "Nut-Free Sweet and Sour Chicken", description: "Chinese-style souce without nuts", price: 16.99, restaurant: created_restaurants[4], image_url: "https://images.unsplash.com/photo-1623653387945-2fd25214f8fc" },
  { name: "Gyoza", description: "Mixed vegetables with chicken", price: 14.99, restaurant: created_restaurants[4], image_url: "https://images.unsplash.com/photo-1541696432-82c6da8ce7bf" },

  # For NOVETTINO_Bastille (Burger, Fast Food, Nut-Free, Halal)
  { name: "Halal Chicken Burger", description: "Certified halal chicken burger", price: 13.99, restaurant: created_restaurants[5], image_url: "https://images.unsplash.com/photo-1615297928064-24977384d0da?q=80&w=2824&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Nut-Free Veggie Burger", description: "Safe vegetarian option", price: 12.99, restaurant: created_restaurants[5], image_url: "https://images.unsplash.com/photo-1525059696034-4967a8e1dca2" },

  # For Café de Flore (Mexican, Burger, Dairy-Free, Halal)
  { name: "Dairy-Free Mexican Pizza", description: "Halal beef with Mexican spices", price: 15.99, restaurant: created_restaurants[6], image_url: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38" },
  { name: "Halal Tacos", description: "Certified halal meat tacos", price: 12.99, restaurant: created_restaurants[6], image_url: "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b" },

  # For Chez Francis (Sushi, Japanese, Vegetarian, Vegan, Shellfish-Free)
  { name: "Vegan Sushi Platter", description: "Assorted plant-based sushi", price: 18.99, restaurant: created_restaurants[7], image_url: "https://images.unsplash.com/photo-1579584425555-c3ce17fd4351" },
  { name: "Wok Veggie", description: "Crispy vegetables", price: 11.99, restaurant: created_restaurants[7], image_url: "https://images.unsplash.com/photo-1692742246345-c6e7f28ae345?q=80&w=3005&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },

  # For Le Petit Indien (Indian, BBQ, Vegetarian, Gluten-Free)
  { name: "Gluten-Free Tandoori", description: "Clay oven grilled vegetables", price: 16.99, restaurant: created_restaurants[8], image_url: "https://images.unsplash.com/photo-1727280376746-b89107a5b0df?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Vegetarian Platter Salad", description: "Assorted grilled vegetables", price: 15.99, restaurant: created_restaurants[8], image_url: "https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38" },

  # For Tokyo Sushi Bar (Japanese, Sushi, Shellfish-Free, Dairy-Free)
  { name: "Dairy-Free Dragon Roll", description: "Special roll without cream cheese", price: 14.99, restaurant: created_restaurants[9], image_url: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c" },
  { name: "Shellfish-Free Bento Box", description: "Safe Japanese combo", price: 19.99, restaurant: created_restaurants[9], image_url: "https://images.unsplash.com/photo-1629684782790-385ed5adb497?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },

  # For La Taqueria (Mexican, Fast Food, Vegan, Nut-Free)
  { name: "Vegan Street Tacos", description: "Plant-based Mexican classic", price: 11.99, restaurant: created_restaurants[10], image_url: "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85" },
  { name: "Nut-Free Mexican Bowl", description: "Safe burrito bowl", price: 13.99, restaurant: created_restaurants[10], image_url: "https://images.unsplash.com/photo-1513456852971-30c0b8199d4d" },

  # For Dragon Wok (Chinese, Fast Food, Halal, Egg-Free)
  { name: "Halal Chicken Stir-Fry", description: "Certified meat with vegetables", price: 12.99, restaurant: created_restaurants[11], image_url: "https://images.unsplash.com/photo-1525755662778-989d0524087e" },
  { name: "Egg-Free Fried Rice", description: "Traditional rice dish without egg", price: 10.99, restaurant: created_restaurants[11], image_url: "https://images.unsplash.com/photo-1603133872878-684f208fb84b" },

  # For Burger Paradise (Burger, Fast Food, Halal, Gluten-Free)
  { name: "Gluten-Free Halal Burger", description: "Special bun with certified meat", price: 15.99, restaurant: created_restaurants[12], image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd" },
  { name: "Halal Chicken Sandwich", description: "Gluten-free chicken burger", price: 13.99, restaurant: created_restaurants[12], image_url: "https://images.unsplash.com/photo-1550317138-10000687a72b" },

  # For Pasta Bella (Italian, Pizza, Vegetarian, Dairy-Free)
  { name: "Dairy-Free Pizza", description: "Classic pizza with vegan cheese", price: 14.99, restaurant: created_restaurants[13], image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3" },
  { name: "Vegetarian Pasta", description: "Fresh pasta with vegetables", price: 13.99, restaurant: created_restaurants[13], image_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601" },

  # For Les Tontons Veg (Burger, Fast Food, Vegan, Nut-Free)
  { name: "Vegan Black Bean Burger", description: "Plant-based patty", price: 13.99, restaurant: created_restaurants[14], image_url: "https://images.unsplash.com/photo-1525059696034-4967a8e1dca2" },
  { name: "Nut-Free Veggie Wrap", description: "Safe vegan wrap", price: 11.99, restaurant: created_restaurants[14], image_url: "https://images.unsplash.com/photo-1626700051175-6818013e1d4f" }
]

dishes_data.each do |dish_data|
  puts "Creating dish: #{dish_data[:name]}"
  image_url = dish_data.delete(:image_url)
  dish = Dish.create!(dish_data)
  attach_image_from_url(dish, image_url)
  dish
end
