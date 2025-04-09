puts "Destroying all users"
User.destroy_all
puts "Destroying all restaurant owners"
RestaurantOwner.destroy_all
puts "Destroying all restaurants"
Restaurant.destroy_all
puts "Destroying all dishes"
Dish.destroy_all
puts "Destroying all experiences"
Experience.destroy_all

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
demo = User.create(name: "demo", email: "next@example.com", password: "testtest")


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
        name: "HalalBurger",
        description: "A delicious burger with a side of fries",
        price: 10.00,
        image_url: "https://images.unsplash.com/photo-1595255669512-144851438b8b"
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
      image_url: "https://images.unsplash.com/photo-1579751626657-72bc17010498"
    },
    restaurant_owner: {
      name: "Sophie Laurent",
      email: "sophie.laurent@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Gluten-Free Pizza",
        description: "Delicious rice pizza with gluten-free crust",
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
      name: "Ohayo d'Angèle",
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
        description: "Porc ramen with gluten-free noodles",
        price: 13.99,
        image_url: "https://images.unsplash.com/photo-1557872943-16a5ac26437e"
      }
    ]
  },
  {
    restaurant: {
      name: "Vamos Vegan",
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
        image_url: "https://images.unsplash.com/photo-1593708659671-595be1c95128"
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
        description: "Papperoni with dairy-free cheese",
        price: 13.99,
        image_url: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3"
      },
      {
        name: "Nut-Free Pasta",
        description: "pasta with tomato sauce",
        price: 12.99,
        image_url: "https://plus.unsplash.com/premium_photo-1677000666741-17c3c57139a2"
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
      name: "Mexican Veggie Express",
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
        image_url: "https://images.unsplash.com/photo-1734772591537-15ac1b3b3c04"
      },
      {
        name: "Vegan tacos",
        description: "Plant-based protein with garlic sauce tacos",
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
        image_url: "https://images.unsplash.com/photo-1560434019-4558f9a9e2a1"
      },
      {
        name: "Calamari only pizza",
        description: "Shellfish-Free Seafood Pizza",
        price: 15.99,
        image_url: "https://images.unsplash.com/photo-1598206572429-f02335a5edc6"
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
        image_url: "https://images.unsplash.com/photo-1637361874063-e5e415d7bcf7"
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
        image_url: "https://images.unsplash.com/photo-1732589306925-b26b2153a9c8"
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
        image_url: "https://images.unsplash.com/photo-1615297928064-24977384d0da"
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
        image_url: "https://plus.unsplash.com/premium_photo-1661601722152-87143d4be5b9"
      }
    ]
  },
  {
    restaurant: {
      name: "Izakaya Francis",
      address: "7 Place de l'Alma, 75008 Paris",
      rating: 4.6,
      food_preferences: ["Sushi", "Japanese"],
      food_restrictions: ["Vegetarian", "Vegan", "Shellfish-Free"],
      number_of_reviews: 850,
      image_url: "https://images.unsplash.com/photo-1502364271109-0a9a75a2a9df"
    },
    restaurant_owner: {
      name: "Francis Leclerc",
      email: "francis.leclerc@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Shellfish-Free Sushi Platter",
        description: "Seasonal sushi platter without shellfish",
        price: 22.99,
        image_url: "https://images.unsplash.com/photo-1563612116625-3012372fccce"
      },
      {
        name: "Frided vegetable with udon",
        description: "Traditional hiyashi vegan udon",
        price: 14.99,
        image_url: "https://plus.unsplash.com/premium_photo-1726880637228-52cb20f7bc7d"
      }
    ]
  },
  {
    restaurant: {
      name: "Healthy Dehli",
      address: "16 Villa Gaudelet, 75011 Paris",
      rating: 4.6,
      food_preferences: ["Indian", "Italian"],
      food_restrictions: ["Lactose-Free", "Vegan", "Halal"],
      number_of_reviews: 745,
      image_url: "https://images.unsplash.com/photo-1582228096960-7f5d2ec4aa8e"
    },
    restaurant_owner: {
      name: "Morgan Garcia",
      email: "owner1@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Chana Masala",
        description: "Spiced chickpeas with curry",
        price: 11.22,
        image_url: "https://plus.unsplash.com/premium_photo-1675727579542-ad785e1cee41"
      },
      {
        name: "Indial curry vegie bowl",
        description: "Lactose-Free, Vegan and Halal for sure",
        price: 12.83,
        image_url: "https://images.unsplash.com/photo-1634234498505-51b316832b28"
      }
    ]
  },
  {
    restaurant: {
      name: "Taste of Taiwan",
      address: "10 Rue Saint-Maur, 75011 Paris",
      rating: 4.3,
      food_preferences: ["Chinese", "Sushi"],
      food_restrictions: ["Lactose-Free", "Vegan", "Halal"],
      number_of_reviews: 569,
      image_url: "https://images.unsplash.com/photo-1670404160617-8ca76c8cc2be"
    },
    restaurant_owner: {
      name: "Jordan Chen",
      email: "owner2@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Fried Rice",
        description: "Stir-fried rice with vegetables and eggs",
        price: 11.94,
        image_url: "https://images.unsplash.com/photo-1615322813057-1ebfffa553a9"
      },
      {
        name: "Mapo Tofu",
        description: "Spicy tofu dish with chili and bean paste",
        price: 10.16,
        image_url: "https://images.unsplash.com/photo-1573470571028-a0ca7a723959"
      }
    ]
  },
  {
    restaurant: {
      name: "Maji Maji Kyoto",
      address: "8 Rue de la Folie Méricourt, 75011 Paris",
      rating: 4.5,
      food_preferences: ["Japanese", "BBQ"],
      food_restrictions: ["Lactose-Free", "Gluten-Free", "Nut-Free"],
      number_of_reviews: 873,
      image_url: "https://images.unsplash.com/photo-1629684782790-385ed5adb497"
    },
    restaurant_owner: {
      name: "Cameron Lopez",
      email: "owner3@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Yakinuku teishouku",
        description: "Gluten free yakinuku set",
        price: 14.14,
        image_url: "https://images.unsplash.com/photo-1663569820326-fece03afdf1c"
      },
      {
        name: "Duck braised with soba",
        description: "Brothy noodle soup",
        price: 14.03,
        image_url: "https://images.unsplash.com/photo-1496114212242-bac8bd9de53d"
      }
    ]
  },
  {
    restaurant: {
      name: "Nihao 886",
      address: "21 Rue Moret, 75011 Paris",
      rating: 4.5,
      food_preferences: ["Chinese", "Burger"],
      food_restrictions: ["Vegan", "Lactose-Free", "Halal"],
      number_of_reviews: 720,
      image_url: "https://images.unsplash.com/photo-1571091718767-18b5b1457add"
    },
    restaurant_owner: {
      name: "Jordan Patel",
      email: "owner4@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Sweet sour chicken with pad thai",
        description: "Stir-fried chicken halal and lactose free",
        price: 14.46,
        image_url: "https://images.unsplash.com/photo-1623689048105-a17b1e1936b8"
      },
      {
        name: "Hot pot set with tofu and vegetables",
        description: "Hot pot set for 2 people",
        price: 32.55,
        image_url: "https://images.unsplash.com/photo-1614104030967-5ca61a54247b"
      }
    ]
  },
  {
    restaurant: {
      name: "Guacamonamour",
      address: "3 Cité Griset, 75011 Paris",
      rating: 4.7,
      food_preferences: ["Mexican", "Fast Food"],
      food_restrictions: ["Gluten-Free", "Vegan", "Egg-Free"],
      number_of_reviews: 532,
      image_url: "https://plus.unsplash.com/premium_photo-1681406689584-2f7612fa98a4"
    },
    restaurant_owner: {
      name: "Casey Kim",
      email: "owner7@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Tacos with chickpeas",
        description: "Soft corn tortillas with veggie filling",
        price: 15.41,
        image_url: "https://images.unsplash.com/photo-1565299585323-38d6b0865b47"
      },
      {
        name: "Vegan Burrito",
        description: "Rice, beans, veggies, and guac",
        price: 15.08,
        image_url: "https://images.unsplash.com/photo-1629122850744-28e6baa5d4d8"
      }
    ]
  },
  {
    restaurant: {
      name: "Kokoro Naka",
      address: "13 Rue Sedaine, 75011 Paris",
      rating: 4.4,
      food_preferences: ["Japanese", "Pizza"],
      food_restrictions: ["Lactose-Free", "Gluten-Free", "Vegetarian"],
      number_of_reviews: 457,
      image_url: "https://images.unsplash.com/photo-1601351841251-766245326eee"
    },
    restaurant_owner: {
      name: "Casey Kim",
      email: "owner13@example.com",
      password: "password"
    },
    dishes: [
      {
        name: "Seasonal Vegan Sushi",
        description: "Sushi rolls with cucumber, avocado",
        price: 14.02,
        image_url: "https://images.unsplash.com/photo-1557395714-5177be073e2b"
      },
      {
        name: "Curry rice with vegetable croquette",
        description: "Vegetarian Gluten-Free curry rice",
        price: 10.75,
        image_url: "https://images.unsplash.com/photo-1695977723082-dcf5ebbead9a"
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

experiences_data = [
  {
    name: "Parisian Food Tour",
    description: "Explore the hidden gems of Parisian cuisine with a local guide",
    price: 50,
    rating: 4.5,
    number_of_reviews: 156,
    categories: ["Food", "Culture", "Adventure", "Art"],
    image_url: "https://images.unsplash.com/photo-1599894418362-4f54dfe0a5f8"
  },
  {
    name: "Wine Tasting in Montmartre",
    description: "Discover French wines in a charming Montmartre cellar",
    price: 65,
    rating: 4.9,
    number_of_reviews: 89,
    categories: ["Food", "Culture"],
    image_url: "https://images.unsplash.com/photo-1510812431401-41d2bd2722f3"
  },
  {
    name: "Macaron Making Class",
    description: "Learn to make authentic French macarons from a pastry chef",
    price: 75,
    rating: 4.7,
    number_of_reviews: 42,
    categories: ["Food", "Culture"],
    image_url: "https://images.unsplash.com/photo-1558326567-98ae2405596b"
  },
  {
    name: "Cheese and Wine Pairing",
    description: "Learn about French cheeses and their perfect wine matches",
    price: 55,
    rating: 4.9,
    number_of_reviews: 167,
    categories: ["Food", "Culture"],
    image_url: "https://images.unsplash.com/photo-1598306442890-742e834da092"
  },
  {
    name: "Make your own croissant",
    description: "Master the art of French bread making",
    price: 70,
    rating: 4.8,
    number_of_reviews: 98,
    categories: ["Food", "Culture"],
    image_url: "https://images.unsplash.com/photo-1530610476181-d83430b64dcd"
  },
  {
    name: "Dog yoga with view of the Eiffel Tower",
    description: "Yoga with doggos while enjoying the view of the Eiffel Tower",
    price: 85,
    rating: 4.7,
    number_of_reviews: 145,
    categories: ["Adventure", "Sports"],
    image_url: "https://images.unsplash.com/photo-1658924454888-050188a1dcb3"
  },
  {
    name: "Market Tour & Cooking Class",
    description: "Shop at a local market and cook with fresh ingredients",
    price: 95,
    rating: 4.9,
    number_of_reviews: 178,
    categories: ["Food", "Culture"],
    image_url: "https://images.unsplash.com/photo-1589470288084-ecad61835772"
  },
  {
    name: "Cocktail Mixology Class",
    description: "Learn to make French-inspired cocktails",
    price: 60,
    rating: 4.6,
    number_of_reviews: 89,
    categories: ["Food", "Culture"],
    image_url: "https://images.unsplash.com/photo-1551538827-9c037cb4f32a"
  },
  {
    name: "Food Photography Workshop",
    description: "Learn to capture the beauty of French cuisine",
    price: 80,
    rating: 4.7,
    number_of_reviews: 67,
    categories: ["Food", "Art"],
    image_url: "https://images.unsplash.com/photo-1490645935967-10de6ba17061"
  },
  {
    name: "Exploring Les catacombes de Paris",
    description: "Step back in time underground in the catacombs of Paris",
    price: 45,
    rating: 4.8,
    number_of_reviews: 112,
    categories: ["History", "Culture", "Adventure"],
    image_url: "https://french-nautilus.b-cdn.net/wp-content/uploads/2022/04/Catacombes-2.jpg"
  },
  {
    name: "Haute couture of classic french tailoring workshop",
    description: "Deep dive into the world of classic french tailoring",
    price: 95,
    rating: 4.6,
    number_of_reviews: 76,
    categories: ["Culture", "Art"],
    image_url: "https://images.unsplash.com/photo-1562347174-7370ad83dc47"
  },
  {
    name: "Ceramics of Le Marais",
    description: "Make your own ceramics in the Marais district",
    price: 30,
    rating: 4.9,
    number_of_reviews: 148,
    categories: ["Culture", "Art", "Shopping"],
    image_url: "https://images.unsplash.com/photo-1616886888643-bdb88fb92812"
  },
  {
    name: "Buttes-Chaumont Sketching Challenge",
    description: "Creative Sketching class in Paris' most scenic urban park for epic views and nature",
    price: 25,
    rating: 4.5,
    number_of_reviews: 63,
    categories: ["Nature", "Adventure", "Art"],
    image_url: "https://images.unsplash.com/photo-1720031995259-f2d8ea9734fd"
  },
  {
    name: "Escape Game in the Château Vieux de Saint-Germain-en-Laye ",
    description: "Exceptional escape game in the Château Vieux de Saint-Germain-en-Laye",
    price: 40,
    rating: 4.7,
    number_of_reviews: 89,
    categories: ["Adventure", "Sports", "Games"],
    image_url: "https://static.apidae-tourisme.com/filestore/objets-touristiques/images/90/239/8384346-diaporama.jpg"
  },
  {
    name: "Escape Room Experience: The Louvre Heist",
    description: "Solve puzzles and crack codes in this art-themed escape adventure",
    price: 35,
    rating: 4.8,
    number_of_reviews: 54,
    categories: ["Games", "Adventure"],
    image_url: "https://images.unsplash.com/photo-1599548291260-8a88e3d3b095"
  },
  {
    name: "Introduction to Archery in Parc Floral",
    description: "Try your hand at archery in a peaceful garden setting",
    price: 28,
    rating: 4.4,
    number_of_reviews: 39,
    categories: ["Sports", "Nature"],
    image_url: "https://images.unsplash.com/photo-1641531105535-1ead3c1784ab"
  },
  {
    name: "Interactive French Revolution Tour",
    description: "Experience Paris in 1789 with immersive stories and reenactments",
    price: 50,
    rating: 4.9,
    number_of_reviews: 97,
    categories: ["History", "Games"],
    image_url: "https://images.unsplash.com/photo-1531752148124-118ba196fc7b"
  },
  {
    name: "Boules & Baguettes: Parisian Park Games",
    description: "Play pétanque like a local and enjoy a baguette picnic",
    price: 15,
    rating: 4.3,
    number_of_reviews: 65,
    categories: ["Games", "Culture", "Sports"],
    image_url: "https://images.unsplash.com/photo-1595971649687-0901985665a1"
  },
  {
    name: "Sunrise Run Along the Seine",
    description: "Start your day with a scenic group run through the heart of Paris",
    price: 15,
    rating: 4.6,
    number_of_reviews: 81,
    categories: ["Sports", "Nature"],
    image_url: "https://images.unsplash.com/photo-1550620224-150e0de822ff"
  },
  {
    name: "Off roading in the Parisian countryside",
    description: "Embark on an exhilarating off-road adventure through the picturesque French countryside",
    price: 50,
    rating: 4.8,
    number_of_reviews: 90,
    categories: ["Sports", "Nature"],
    image_url: "https://images.unsplash.com/photo-1566760749534-c1778fd72b1c"
  }
]

experiences_data.each do |experience_data|
  puts "Creating experience: #{experience_data[:name]} - #{experiences_data.index(experience_data) + 1}/#{experiences_data.length}"

  image_url = experience_data.delete(:image_url)
  experience = Experience.new(experience_data)
  attach_image_from_url(experience, image_url)
  experience.save
end

puts "Created #{Experience.count} experiences"
