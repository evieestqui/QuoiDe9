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

restaurants_data = [
  {
    restaurant: {
      name: "Chez Nicos",
      address: "44 Rue Mouffetard, 75005 Paris",
      rating: 4.9,
      food_preferences: ["Fast Food", "Burger"],
      food_restrictions: ["Halal", "Egg-Free"],
      number_of_reviews: 818,
      image_url: "https://images.unsplash.com/photo-1555396273-367ea4eb4db5",
    },
    restaurant_owner: {
      name: "Nicolas Dupont",
      email: "nicolas@cheznicos.com",
      password: "password"
    },
    dishes: [
      {
        name: "Burger",
        description: "A delicious burger with a side of fries",
        price: 10.00,
        image_url: "https://images.unsplash.com/photo-1555396273-367ea4eb4db5"
      }
    ]
  },
  {
    restaurant: {
      name: "NoGlu",
      address: "15 Rue Basfroi, 75011 Paris",
      rating: 4.5,
      food_preferences: ["Italian", "Burger"],
      food_restrictions: ["Vegan", "Nut-Free"],
      number_of_reviews: 612,
      image_url: "https://images.unsplash.com/photo-1536329639134-ade172b2fea0"
    },
    restaurant_owner: {
      name: "Sophie Laurent",
      email: "sophie.laurent@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Gluten-Free Pizza",
        description: "Delicious pizza with gluten-free crust",
        price: 12.99,
        image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3"
      },
      {
        name: "Vegan Burger",
        description: "Plant-based burger with special sauce",
        price: 11.99,
        image_url: "https://images.unsplash.com/photo-1525059696034-4967a8e1dca2"
      }
    ]
  },
  {
    restaurant: {
      name: "La Guinguette d'Angèle",
      address: "34 Rue Coquillière, 75001 Paris",
      rating: 4.7,
      food_preferences: ["Japanese", "Sushi"],
      food_restrictions: ["Vegan", "Gluten-Free", "Nut-Free"],
      number_of_reviews: 745,
      image_url: "https://images.unsplash.com/photo-1696449241254-11cf7f18ce32"
    },
    restaurant_owner: {
      name: "Angèle Ferreux-Maeght",
      email: "angele.ferreux@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Vegan Sushi Platter",
        description: "Assorted plant-based sushi rolls",
        price: 15.99,
        image_url: "https://images.unsplash.com/photo-1579584425555-c3ce17fd4351"
      },
      {
        name: "Gluten-Free Ramen",
        description: "Traditional ramen with gluten-free noodles",
        price: 13.99,
        image_url: "https://images.unsplash.com/photo-1557872943-16a5ac26437e"
      }
    ]
  },
  {
    restaurant: {
      name: "Jah Jah",
      address: "11 Rue des Petites Écuries, 75010 Paris",
      rating: 4.6,
      food_preferences: ["BBQ", "Fast Food"],
      food_restrictions: ["Vegan", "Gluten-Free", "Shellfish-Free"],
      number_of_reviews: 530,
      image_url: "https://images.unsplash.com/photo-1537047902294-62a40c20a6ae"
    },
    restaurant_owner: {
      name: "John Paul",
      email: "john.paul@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Vegan BBQ Plate",
        description: "Plant-based BBQ with sides",
        price: 14.99,
        image_url: "https://images.unsplash.com/photo-1529193591184-b1d58069ecdd"
      },
      {
        name: "Gluten-Free Tacos",
        description: "Mexican-style tacos with corn tortillas",
        price: 12.99,
        image_url: "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85"
      }
    ]
  },
  {
    restaurant: {
      name: "Big Love Café",
      address: "30 Rue Debelleyme, 75003 Paris",
      rating: 4.4,
      food_preferences: ["Pizza", "Italian", "Burger"],
      food_restrictions: ["Lactose-Free", "Nut-Free"],
      number_of_reviews: 970,
      image_url: "https://images.unsplash.com/photo-1466978913421-dad2ebd01d17"
    },
    restaurant_owner: {
      name: "Marco Bianchi",
      email: "marco.bianchi@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Lactose-Free Pizza",
        description: "Classic pizza with dairy-free cheese",
        price: 13.99,
        image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3"
      },
      {
        name: "Nut-Free Pasta",
        description: "Fresh pasta with safe sauce",
        price: 12.99,
        image_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601"
      }
    ]
  },
  {
    restaurant: {
      name: "Chez Ann",
      address: "29 Rue de l'Échiquier, 75010 Paris",
      rating: 4.3,
      food_preferences: ["Chinese", "Fast Food"],
      food_restrictions: ["Vegetarian", "Vegan", "Egg-Free"],
      number_of_reviews: 820,
      image_url: "https://images.unsplash.com/photo-1526234362653-3b75a0c07438"
    },
    restaurant_owner: {
      name: "Ann Wong",
      email: "ann.wong@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Vegetarian Dumplings",
        description: "Steamed vegetable dumplings",
        price: 9.99,
        image_url: "https://images.unsplash.com/photo-1541696432-82c6da8ce7bf"
      },
      {
        name: "Egg-Free Fried Rice",
        description: "Vegetable fried rice without egg",
        price: 11.99,
        image_url: "https://images.unsplash.com/photo-1603133872878-684f208fb84b"
      }
    ]
  },
  {
    restaurant: {
      name: "Les Tontons Veg",
      address: "9 Rue de Lancry, 75010 Paris",
      rating: 4.5,
      food_preferences: ["Burger", "Fast Food"],
      food_restrictions: ["Vegan", "Nut-Free"],
      number_of_reviews: 645,
      image_url: "https://images.unsplash.com/photo-1552566626-52f8b828add9"
    },
    restaurant_owner: {
      name: "Paul Richard",
      email: "paul.richard@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Vegan Black Bean Burger",
        description: "Plant-based patty with special sauce",
        price: 12.99,
        image_url: "https://images.unsplash.com/photo-1525059696034-4967a8e1dca2"
      },
      {
        name: "Nut-Free Veggie Wrap",
        description: "Safe vegan wrap with fresh vegetables",
        price: 10.99,
        image_url: "https://images.unsplash.com/photo-1626700051175-6818013e1d4f"
      }
    ]
  },
  {
    restaurant: {
      name: "Daily Syrien Veggie",
      address: "72 Rue du Faubourg Saint-Denis, 75010 Paris",
      rating: 4.6,
      food_preferences: ["Fast Food", "Mexican"],
      food_restrictions: ["Vegetarian", "Vegan", "Halal"],
      number_of_reviews: 450,
      image_url: "https://images.unsplash.com/photo-1555992336-fb0d29498b13"
    },
    restaurant_owner: {
      name: "Omar Al-Sayed",
      email: "omar.alsayed@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Halal Falafel Wrap",
        description: "Traditional falafel with tahini sauce",
        price: 8.99,
        image_url: "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b"
      },
      {
        name: "Vegan Shawarma",
        description: "Plant-based shawarma with garlic sauce",
        price: 11.99,
        image_url: "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85"
      }
    ]
  },
  {
    restaurant: {
      name: "Café di Roma",
      address: "22 Avenue des Champs-Élysées, 75008 Paris",
      rating: 4.5,
      food_preferences: ["Italian", "Pizza"],
      food_restrictions: ["Nut-Free", "Shellfish-Free"],
      number_of_reviews: 685,
      image_url: "https://images.unsplash.com/photo-1559925393-8be0ec4767c8"
    },
    restaurant_owner: {
      name: "Alessandro Rossi",
      email: "alessandro.rossi@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Nut-Free Pasta Carbonara",
        description: "Classic carbonara without nuts",
        price: 14.99,
        image_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601"
      },
      {
        name: "Shellfish-Free Seafood Pizza",
        description: "Pizza with safe seafood options",
        price: 15.99,
        image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3"
      }
    ]
  },
  {
    restaurant: {
      name: "Gigi Paris",
      address: "16 Rue de la Paix, 75002 Paris",
      rating: 4.6,
      food_preferences: ["Italian", "BBQ"],
      food_restrictions: ["Shellfish-Free", "Dairy-Free"],
      number_of_reviews: 530,
      image_url: "https://images.unsplash.com/photo-1533777857889-4be7c70b33f7"
    },
    restaurant_owner: {
      name: "Giovanni Moreau",
      email: "giovanni.moreau@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Dairy-Free Risotto",
        description: "Creamy risotto with plant-based cream",
        price: 16.99,
        image_url: "https://images.unsplash.com/photo-1481931098730-318b6f776db0"
      },
      {
        name: "Shellfish-Free BBQ Platter",
        description: "Mixed grill with safe meat options",
        price: 18.99,
        image_url: "https://images.unsplash.com/photo-1529193591184-b1d58069ecdd"
      }
    ]
  },
  {
    restaurant: {
      name: "Semilla",
      address: "54 Rue de Seine, 75006 Paris",
      rating: 4.7,
      food_preferences: ["Sushi", "Japanese"],
      food_restrictions: ["Nut-Free", "Dairy-Free", "Egg-Free"],
      number_of_reviews: 875,
      image_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4"
    },
    restaurant_owner: {
      name: "Laurent Dupuis",
      email: "laurent.dupuis@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Nut-Free Sushi Platter",
        description: "Assorted sushi without nuts",
        price: 19.99,
        image_url: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c"
      },
      {
        name: "Dairy-Free Ramen",
        description: "Traditional ramen with plant-based broth",
        price: 14.99,
        image_url: "https://images.unsplash.com/photo-1557872943-16a5ac26437e"
      }
    ]
  },
  {
    restaurant: {
      name: "Brasserie Flottes",
      address: "2 Rue Cambon, 75001 Paris",
      rating: 4.3,
      food_preferences: ["BBQ", "Fast Food"],
      food_restrictions: ["Halal", "Gluten-Free"],
      number_of_reviews: 560,
      image_url: "https://images.unsplash.com/photo-1508766917616-d22f3f1eea14"
    },
    restaurant_owner: {
      name: "Michel Morel",
      email: "michel.morel@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Halal BBQ Platter",
        description: "Mixed grill with certified halal meat",
        price: 17.99,
        image_url: "https://images.unsplash.com/photo-1529193591184-b1d58069ecdd"
      },
      {
        name: "Gluten-Free Burger",
        description: "Special bun with halal beef",
        price: 13.99,
        image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd"
      }
    ]
  },
  {
    restaurant: {
      name: "Loulou Restaurant Paris",
      address: "107 Rue de Rivoli, 75001 Paris",
      rating: 4.5,
      food_preferences: ["Indian", "Chinese"],
      food_restrictions: ["Vegetarian", "Dairy-Free", "Egg-Free"],
      number_of_reviews: 930,
      image_url: "https://images.unsplash.com/photo-1515669097368-22e68427d265"
    },
    restaurant_owner: {
      name: "Isabelle Fontaine",
      email: "isabelle.fontaine@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Vegetarian Curry",
        description: "Spicy vegetable curry",
        price: 14.99,
        image_url: "https://images.unsplash.com/photo-1585937421612-70a008356fbe"
      },
      {
        name: "Dairy-Free Naan",
        description: "Traditional bread without dairy",
        price: 4.99,
        image_url: "https://images.unsplash.com/photo-1603360946369-dc9bb6258143"
      }
    ]
  },
  {
    restaurant: {
      name: "Les Antiquaires",
      address: "5 Quai Malaquais, 75006 Paris",
      rating: 4.4,
      food_preferences: ["Mexican", "Pizza"],
      food_restrictions: ["Egg-Free", "Nut-Free"],
      number_of_reviews: 700,
      image_url: "https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c"
    },
    restaurant_owner: {
      name: "Philippe Garnier",
      email: "philippe.garnier@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Egg-Free Quesadilla",
        description: "Cheese and vegetable quesadilla",
        price: 12.99,
        image_url: "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b"
      },
      {
        name: "Nut-Free Pizza",
        description: "Classic pizza without nuts",
        price: 13.99,
        image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3"
      }
    ]
  },
  {
    restaurant: {
      name: "L'Oliveto Paris",
      address: "41 Boulevard Saint-Michel, 75005 Paris",
      rating: 4.3,
      food_preferences: ["Pizza", "Italian"],
      food_restrictions: ["Lactose-Free", "Shellfish-Free"],
      number_of_reviews: 480,
      image_url: "https://images.unsplash.com/photo-1424847651672-bf20a4b0982b"
    },
    restaurant_owner: {
      name: "Roberto Conti",
      email: "roberto.conti@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Lactose-Free Pizza",
        description: "Classic pizza with dairy-free cheese",
        price: 14.99,
        image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3"
      },
      {
        name: "Shellfish-Free Pasta",
        description: "Fresh pasta with safe seafood",
        price: 15.99,
        image_url: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601"
      }
    ]
  },
  {
    restaurant: {
      name: "Le Balzar",
      address: "49 Rue des Écoles, 75005 Paris",
      rating: 4.2,
      food_preferences: ["Chinese", "BBQ"],
      food_restrictions: ["Shellfish-Free", "Nut-Free"],
      number_of_reviews: 920,
      image_url: "https://images.unsplash.com/photo-1525610553991-2bede1a236e2"
    },
    restaurant_owner: {
      name: "Claude Petit",
      email: "claude.petit@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Nut-Free Kung Pao Chicken",
        description: "Spicy chicken without peanuts",
        price: 13.99,
        image_url: "https://images.unsplash.com/photo-1525755662778-989d0524087e"
      },
      {
        name: "Shellfish-Free BBQ Platter",
        description: "Mixed grill with safe meat options",
        price: 16.99,
        image_url: "https://images.unsplash.com/photo-1529193591184-b1d58069ecdd"
      }
    ]
  },
  {
    restaurant: {
      name: "NOVETTINO_Bastille",
      address: "14 Boulevard Beaumarchais, 75011 Paris",
      rating: 4.5,
      food_preferences: ["Burger", "Fast Food"],
      food_restrictions: ["Nut-Free", "Halal"],
      number_of_reviews: 760,
      image_url: "https://images.unsplash.com/photo-1514933651103-005eec06c04b"
    },
    restaurant_owner: {
      name: "Thomas Leclerc",
      email: "thomas.leclerc@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Halal Beef Burger",
        description: "Certified halal beef burger",
        price: 12.99,
        image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd"
      },
      {
        name: "Nut-Free Chicken Burger",
        description: "Safe chicken burger",
        price: 11.99,
        image_url: "https://images.unsplash.com/photo-1550317138-10000687a72b"
      }
    ]
  },
  {
    restaurant: {
      name: "Café de Flore",
      address: "172 Boulevard Saint-Germain, 75006 Paris",
      rating: 4.4,
      food_preferences: ["Mexican", "Burger"],
      food_restrictions: ["Dairy-Free", "Halal"],
      number_of_reviews: 990,
      image_url: "https://images.unsplash.com/photo-1521017432531-fbd92d768814"
    },
    restaurant_owner: {
      name: "Jean-Pierre Martin",
      email: "jeanpierre.martin@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Dairy-Free Mexican Pizza",
        description: "Spicy pizza with plant-based cheese",
        price: 14.99,
        image_url: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38"
      },
      {
        name: "Halal Beef Burger",
        description: "Certified halal beef burger",
        price: 13.99,
        image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd"
      }
    ]
  },
  {
    restaurant: {
      name: "Chez Francis",
      address: "7 Place de l'Alma, 75008 Paris",
      rating: 4.6,
      food_preferences: ["Sushi", "Japanese"],
      food_restrictions: ["Vegetarian", "Vegan", "Shellfish-Free"],
      number_of_reviews: 850,
      image_url: "https://images.unsplash.com/photo-1590846406792-0adc7f938f1d"
    },
    restaurant_owner: {
      name: "Francis Leclerc",
      email: "francis.leclerc@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Vegetarian Sushi Platter",
        description: "Assorted vegetable sushi",
        price: 16.99,
        image_url: "https://images.unsplash.com/photo-1579584425555-c3ce17fd4351"
      },
      {
        name: "Shellfish-Free Ramen",
        description: "Traditional ramen with safe ingredients",
        price: 14.99,
        image_url: "https://images.unsplash.com/photo-1557872943-16a5ac26437e"
      }
    ]
  }
]

restaurants_data.each do |restaurant_data|
  puts "Creating restaurant: #{restaurant_data[:restaurant][:name]} - #{restaurants_data.index(restaurant_data) + 1}/#{restaurants_data.length}"

  restaurant_owner = RestaurantOwner.create(restaurant_data[:restaurant_owner])
  image_url = restaurant_data[:restaurant].delete(:image_url)
  restaurant = Restaurant.new(restaurant_data[:restaurant])
  restaurant.restaurant_owner = restaurant_owner
  attach_image_from_url(restaurant, image_url)
  restaurant.save

  restaurant_data[:dishes].each do |dish_data|
    image_url = dish_data.delete(:image_url)
    dish = Dish.new(dish_data)
    dish.restaurant = restaurant
    attach_image_from_url(dish, image_url)
    dish.save
  end
end
