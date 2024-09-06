Appointment.destroy_all
Service.destroy_all
Client.destroy_all
User.destroy_all

# User creation

User.create!(email: 'azulsm7@gmail.com', password: '123456', role: 'admin')
User.create!(email: 'joaquinsotorizzi@gmail.com', password: '111111', role: 'admin')
User.create!(email: 'user@gmail.com', password: '111111', role: 'user')


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
