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
    food_preferences: ["Italian", "Pizza"],
    food_restrictions: ["Gluten-Free", "Dairy-Free"],
    number_of_reviews: 612,
    image_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4"
  },
  {
    name: "La Guinguette d'Angèle",
    restaurant_owner: restaurant_owners[2],
    address: "34 Rue Coquillière, 75001 Paris",
    rating: 4.7,
    food_preferences: ["Japanese", "Sushi"],
    food_restrictions: ["Vegan", "Gluten-Free", "Nut-Free"],
    number_of_reviews: 745,
    image_url: "https://images.unsplash.com/photo-1514933651103-005eec06c04b"
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
  { name: "Halal Chicken Burger", description: "Juicy halal chicken patty with fresh toppings", price: 12.99, restaurant: created_restaurants[0], image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd" },
  { name: "Vegan Fries", description: "Crispy potato fries", price: 4.99, restaurant: created_restaurants[0], image_url: "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d" },

  { name: "Gluten-Free Margherita Pizza", description: "Classic pizza with gluten-free base", price: 14.99, restaurant: created_restaurants[1], image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3" },
  { name: "Dairy-Free Pesto Pasta", description: "Fresh pasta with vegan pesto", price: 13.99, restaurant: created_restaurants[1], image_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601" },
  { name: "Quinoa Salad", description: "Healthy quinoa with fresh vegetables", price: 11.99, restaurant: created_restaurants[1], image_url: "https://images.unsplash.com/photo-1505576399279-565b52d4ac71" },

  { name: "Avocado Sushi Roll", description: "Fresh avocado roll with rice", price: 8.99, restaurant: created_restaurants[2], image_url: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c" },
  { name: "Miso Soup", description: "Traditional Japanese soup", price: 5.99, restaurant: created_restaurants[2], image_url: "https://images.unsplash.com/photo-1547592166-23ac45744acd" },
  { name: "Tofu Poke Bowl", description: "Hawaiian-inspired bowl with tofu", price: 15.99, restaurant: created_restaurants[2], image_url: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c" },

  { name: "BBQ Jackfruit Burger", description: "Plant-based BBQ burger", price: 13.99, restaurant: created_restaurants[3], image_url: "https://images.unsplash.com/photo-1550950158-d0d960dff51b" },
  { name: "Grilled Plantain Skewers", description: "Sweet and savory grilled plantains", price: 8.99, restaurant: created_restaurants[3], image_url: "https://images.unsplash.com/photo-1555939594-58d7cb561ad1" },
  { name: "Vegan Coleslaw", description: "Creamy dairy-free coleslaw", price: 5.99, restaurant: created_restaurants[3], image_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601" },

  { name: "Lactose-Free Cheese Pizza", description: "Pizza with dairy-free cheese", price: 15.99, restaurant: created_restaurants[4], image_url: "https://images.unsplash.com/photo-1513104890138-7c749659a591" },
  { name: "Nut-Free Pesto Pasta", description: "Safe and delicious pesto pasta", price: 14.99, restaurant: created_restaurants[4], image_url: "https://images.unsplash.com/photo-1551183053-bf91a1d81141" },
  { name: "Italian Veggie Burger", description: "Mediterranean-style veggie burger", price: 13.99, restaurant: created_restaurants[4], image_url: "https://images.unsplash.com/photo-1586190848861-99aa4a171e90" },

  { name: "Mapo Tofu", description: "Spicy tofu dish", price: 12.99, restaurant: created_restaurants[5], image_url: "https://images.unsplash.com/photo-1541696432-82c6da8ce7bf" },
  { name: "Egg-Free Fried Rice", description: "Vegan Chinese fried rice", price: 11.99, restaurant: created_restaurants[5], image_url: "https://images.unsplash.com/photo-1603133872878-684f208fb84b" },

  { name: "Vegan Black Bean Burger", description: "Hearty black bean patty", price: 13.99, restaurant: created_restaurants[6], image_url: "https://images.unsplash.com/photo-1525059696034-4967a8e1dca2" },
  { name: "Nut-Free Veggie Nuggets", description: "Crispy vegetable nuggets", price: 9.99, restaurant: created_restaurants[6], image_url: "https://images.unsplash.com/photo-1562967914-608f82629710" },

  { name: "Falafel Tacos", description: "Middle Eastern-Mexican fusion", price: 11.99, restaurant: created_restaurants[7], image_url: "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85" },
  { name: "Hummus Bowl", description: "Fresh hummus with toppings", price: 9.99, restaurant: created_restaurants[7], image_url: "https://images.unsplash.com/photo-1577805947697-89e18249d767" },
  { name: "Halal Vegan Wrap", description: "Plant-based halal wrap", price: 10.99, restaurant: created_restaurants[7], image_url: "https://images.unsplash.com/photo-1626700051175-6818013e1d4f" },

  { name: "Margherita Pizza", description: "Classic Italian pizza", price: 14.99, restaurant: created_restaurants[8], image_url: "https://images.unsplash.com/photo-1604068549290-dea0e4a305ca" },
  { name: "Pasta Pomodoro", description: "Simple tomato pasta", price: 12.99, restaurant: created_restaurants[8], image_url: "https://images.unsplash.com/photo-1608897013039-887f21d8c804" },
  { name: "Tiramisu", description: "Classic Italian dessert", price: 7.99, restaurant: created_restaurants[8], image_url: "https://images.unsplash.com/photo-1571877227200-a0d98ea607e9" },

  { name: "Grilled Vegetables", description: "Seasonal grilled vegetables", price: 10.99, restaurant: created_restaurants[9], image_url: "https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38" },
  { name: "BBQ Chicken", description: "Grilled BBQ chicken", price: 15.99, restaurant: created_restaurants[9], image_url: "https://images.unsplash.com/photo-1527477396000-e27163b481c2" },
  { name: "Dairy-Free Pasta", description: "Pasta without dairy", price: 13.99, restaurant: created_restaurants[9], image_url: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9" },

  { name: "Vegetable Sushi Rolls", description: "Fresh vegetable maki", price: 9.99, restaurant: created_restaurants[10], image_url: "https://images.unsplash.com/photo-1579584425555-c3ce17fd4351" },
  { name: "Miso Soup", description: "Traditional miso soup", price: 4.99, restaurant: created_restaurants[10], image_url: "https://images.unsplash.com/photo-1607301405390-d831c242f59b" },

  { name: "Halal BBQ Ribs", description: "Halal-certified ribs", price: 18.99, restaurant: created_restaurants[11], image_url: "https://images.unsplash.com/photo-1544025162-d76694265947" },
  { name: "Gluten-Free Burger", description: "Burger with GF bun", price: 14.99, restaurant: created_restaurants[11], image_url: "https://images.unsplash.com/photo-1565299507177-b0ac66763828" },
  { name: "Grilled Chicken", description: "Simple grilled chicken", price: 13.99, restaurant: created_restaurants[11], image_url: "https://images.unsplash.com/photo-1598515214211-89d3c73ae83b" },

  { name: "Vegetable Curry", description: "Spicy vegetable curry", price: 12.99, restaurant: created_restaurants[12], image_url: "https://images.unsplash.com/photo-1574894709920-11b28e7367e3" },
  { name: "Stir-Fried Tofu", description: "Chinese-style tofu", price: 11.99, restaurant: created_restaurants[12], image_url: "https://images.unsplash.com/photo-1546069901-d5bfd2cbfb1f" },

  { name: "Veggie Tacos", description: "Mexican vegetable tacos", price: 11.99, restaurant: created_restaurants[13], image_url: "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b" },
  { name: "Four Cheese Pizza", description: "Pizza with four cheeses", price: 16.99, restaurant: created_restaurants[13], image_url: "https://images.unsplash.com/photo-1513104890138-7c749659a591" },
  { name: "Mexican Pizza", description: "Pizza with Mexican toppings", price: 15.99, restaurant: created_restaurants[13], image_url: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38" },

  { name: "Marinara Pizza", description: "Classic tomato pizza", price: 13.99, restaurant: created_restaurants[14], image_url: "https://images.unsplash.com/photo-1571407970349-bc81e7e96d47" },
  { name: "Pasta Arrabiata", description: "Spicy tomato pasta", price: 12.99, restaurant: created_restaurants[14], image_url: "https://images.unsplash.com/photo-1563379926898-05f4575a45d8" },
  { name: "Bruschetta", description: "Toasted bread with toppings", price: 7.99, restaurant: created_restaurants[14], image_url: "https://images.unsplash.com/photo-1572695157366-5e585ab2b69f" },

  { name: "Kung Pao Chicken", description: "Spicy Chinese chicken", price: 14.99, restaurant: created_restaurants[15], image_url: "https://images.unsplash.com/photo-1525755662778-989d0524087e" },
  { name: "BBQ Pork", description: "Chinese-style BBQ pork", price: 15.99, restaurant: created_restaurants[15], image_url: "https://images.unsplash.com/photo-1623653387945-2fd25214f8fc" },
  { name: "Vegetable Fried Rice", description: "Classic fried rice", price: 11.99, restaurant: created_restaurants[15], image_url: "https://images.unsplash.com/photo-1603133872878-684f208fb84b" },

  { name: "Halal Beef Burger", description: "Halal-certified burger", price: 14.99, restaurant: created_restaurants[16], image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd" },
  { name: "Chicken Wings", description: "Crispy chicken wings", price: 12.99, restaurant: created_restaurants[16], image_url: "https://images.unsplash.com/photo-1567620832903-9fc6debc209f" },

  { name: "Dairy-Free Nachos", description: "Nachos without cheese", price: 10.99, restaurant: created_restaurants[17], image_url: "https://images.unsplash.com/photo-1513456852971-30c0b8199d4d" },
  { name: "Halal Beef Burger", description: "Halal-certified burger", price: 14.99, restaurant: created_restaurants[17], image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd" },
  { name: "Spicy Black Bean Tacos", description: "Vegetarian bean tacos", price: 11.99, restaurant: created_restaurants[17], image_url: "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85" },

  { name: "Cucumber Maki Rolls", description: "Fresh cucumber sushi", price: 8.99, restaurant: created_restaurants[18], image_url: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c" },
  { name: "Miso-Glazed Eggplant", description: "Grilled Japanese eggplant", price: 12.99, restaurant: created_restaurants[18], image_url: "https://images.unsplash.com/photo-1574484284002-952d92456975" },
  { name: "Vegan Ramen", description: "Plant-based ramen soup", price: 13.99, restaurant: created_restaurants[18], image_url: "https://images.unsplash.com/photo-1557872943-16a5ac26437e" }
]

dishes_data.each do |dish_data|
  puts "Creating dish: #{dish_data[:name]}"
  image_url = dish_data.delete(:image_url)
  dish = Dish.create!(dish_data)
  attach_image_from_url(dish, image_url)
  dish
end
