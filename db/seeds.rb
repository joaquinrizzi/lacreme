require 'open-uri'

Appointment.destroy_all
Service.destroy_all
Client.destroy_all
User.destroy_all

# User creation

# User.create!(email: 'azulsm7@gmail.com', password: '123456', role: 'admin')
User.create!(email: 'joaquinsotorizzi@gmail.com', password: 'Contrasenia51!', role: 'admin')
User.create!(email: 'guest@test.com', password: '111111', role: 'guest')
User.create!(email: 'user@test.com', password: '111111', role: 'user')


# Service creation
Service.create(name: 'dépose semi-permanent', price: 5.0, duration: 15, description: 'Dépose du semi-permanent', creator_id: 1)
Service.create(name: 'dépose gel-x', price: 10.0, duration: 30, description: 'Dépose du gel-x', creator_id: 1)
Service.create(name: 'semi-permanent', price: 30.0, duration: 60, description: 'semi-permanent simple', creator_id: 1)
Service.create(name: 'semi-permanent nail art', price: 40.0, duration: 90, description: 'semi-permanent avec nail art', creator_id: 1)
Service.create(name: 'semi-permanent nail art élaboré', price: 50.0, duration: 120, description: 'semi-permanent avec nail art complexe', creator_id: 1)
Service.create(name: 'gainage gel', price: 45.0, duration: 120, description: 'gainage gel sur ongles naturels', creator_id: 1)
Service.create(name: 'gel X', price: 60.0, duration: 120, description: 'pose de gel X', creator_id: 1)
Service.create(name: 'gel X élaboré', price: 80.0, duration: 150, description: 'pose de gel X avec du nail art complexe', creator_id: 1)


# Client creation

Client.create(first_name: 'Valentina', last_name: 'Corpateaux', email: 'valentinacorpateaux@gmail.com')
Client.create(first_name: 'Armonia', last_name: 'Fernandez', email: 'armonia.fernandez@ldc.com')
Client.create(first_name: 'Enola', last_name: 'Fernandez', email: 'armonia.fernandez@ldc.com')

# Product creation with multiple images
products = [
  { name: 'Avengers', price: 45.0, description: 'Press on avec motif des Avengers', image_files: ['avengers_1.jpeg'] },
  { name: 'Carnival', price: 30.0, description: 'Press on avec motif carnivale', image_files: ['carnival_1.jpeg'] },
  { name: 'Léopard', price: 40.0, description: 'Press on avec motif de léopard', image_files: ['leopard_1.jpeg'] },
  { name: 'Fairy Tale', price: 50.0, description: 'Press on avec motif de conte de fée', image_files: ['fairy_tale_1.jpeg', 'fairy_tale_2.jpeg'] },
  { name: 'Réligion', price: 35.0, description: 'Press on avec motif réligieux', image_files: ['religion_1.jpeg', 'religion_2.jpeg'] },
  { name: 'Van Gogh', price: 60.0, description: 'Press on avec motif de Van Gogh', image_files: ['vangogh_1.jpeg'] },
  { name: 'Poseidon', price: 60.0, description: 'Press on avec motif de Poseidon', image_files: ['poseidon_1.jpeg'] }
]

# products.each do |product_data|
#   product = Product.create(name: product_data[:name], price: product_data[:price], description: product_data[:description])
#   product_data[:image_files].each do |image_file|
#     image_path = Rails.root.join('app', 'assets', 'images', image_file)
#     product.images.attach(io: File.open(image_path), filename: image_file) if File.exist?(image_path)
#   end
# end

products.each do |product_data|
  product = Product.create(name: product_data[:name], price: product_data[:price], description: product_data[:description])
  product_data[:image_files].each do |image_file|
    image_path = Rails.root.join('app', 'assets', 'images', image_file)
    if File.exist?(image_path)
      product.images.attach(io: File.open(image_path), filename: image_file, content_type: 'image/jpeg')
    end
  end
end
