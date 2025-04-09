# puts "Destroying all experiences"
# Experience.destroy_all

# # Helper method to attach image from URL
# def attach_image_from_url(record, image_url)
#   begin
#     downloaded_image = URI.open(image_url)
#     record.photo.attach(
#       io: downloaded_image,
#       filename: "#{record.name.downcase.gsub(' ', '_')}.jpg",
#       content_type: "image/jpeg"
#     )
#   rescue OpenURI::HTTPError => e
#     puts "Failed to download image for #{record.name}: #{e.message}"
#   end
# end

# experiences_data = [
#   {
#     name: "Sicilian Street Food Tour",
#     description: "Explore the vibrant street food scene of Palermo's historic markets",
#     price: 75.00,
#     duration: 180,
#     max_participants: 8,
#     category: "Food",
#     address: "Piazza San Domenico, 90133 Palermo PA, Italy",
#     image_url: "https://images.unsplash.com/photo-1572695157366-5e585ab2b69f"
#   },
#   {
#     name: "Mount Etna Wine Experience",
#     description: "Discover the unique wines produced on the slopes of Mount Etna",
#     price: 85.00,
#     duration: 240,
#     max_participants: 6,
#     category: "Food",
#     address: "Contrada Solicchiata, 95012 Castiglione di Sicilia CT, Italy",
#     image_url: "https://images.unsplash.com/photo-1510812431401-41d2bd2722f3"
#   },
#   {
#     name: "Ancient Greek Theater Tour",
#     description: "Step back in time at the well-preserved Greek Theater of Taormina",
#     price: 45.00,
#     duration: 120,
#     max_participants: 15,
#     category: "History",
#     address: "Via del Teatro Greco, 1, 98039 Taormina ME, Italy",
#     image_url: "https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff"
#   },
#   {
#     name: "Sicilian Cooking Class",
#     description: "Learn to make authentic Sicilian dishes with a local chef",
#     price: 95.00,
#     duration: 180,
#     max_participants: 6,
#     category: "Food",
#     address: "Via Maqueda, 172, 90133 Palermo PA, Italy",
#     image_url: "https://images.unsplash.com/photo-1556911220-bff31c812dba"
#   },
#   {
#     name: "Valley of the Temples Tour",
#     description: "Explore the stunning ancient Greek temples of Agrigento",
#     price: 65.00,
#     duration: 180,
#     max_participants: 12,
#     category: "History",
#     address: "Valle dei Templi, 92100 Agrigento AG, Italy",
#     image_url: "https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff"
#   }
# ]

# experiences_data.each do |experience_data|
#   puts "Creating experience: #{experience_data[:name]} - #{experiences_data.index(experience_data) + 1}/#{experiences_data.length}"

#   image_url = experience_data.delete(:image_url)
#   experience = Experience.new(experience_data)
#   attach_image_from_url(experience, image_url)
#   experience.save
# end

# puts "Created #{Experience.count} experiences"
