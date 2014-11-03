puts "Esto puede llevar un tiempito. Paciencia..."

user_carlos = User.create!(
      full_name: 'Carlos Fontana',
      email: 'carlos@mileem.com', 
      password: 'asdfasdf', 
      password_confirmation: 'asdfasdf',
      phone: "1511111111")

user_mario = User.create!(
      full_name: 'Mario Giovani',
      email: 'mario@mileem.com', 
      password: 'asdfasdf', 
      password_confirmation: 'asdfasdf',
      phone: "1522222222")

user_alejandro = User.create!(
      full_name: 'Alejandro Molina',
      email: 'alejandro@mileem.com', 
      password: 'asdfasdf', 
      password_confirmation: 'asdfasdf',
      phone: "1533333333")

puts "Usuarios creados."      

def address(lat,long)
  Geocoder.search("#{lat},#{long}").first.route + ' ' + Geocoder.search("#{lat},#{long}").first.street_number
end

def zone(lat,long)
  Geocoder.search("#{lat},#{long}").second.neighborhood
end

latitudes = []
longitudes = []

latitudes << -34.550; longitudes << -58.4444
latitudes << -34.555; longitudes << -58.4444
latitudes << -34.560; longitudes << -58.4444
latitudes << -34.565; longitudes << -58.4444
latitudes << -34.570; longitudes << -58.4444
latitudes << -34.575; longitudes << -58.4444
latitudes << -34.580; longitudes << -58.4444
latitudes << -34.585; longitudes << -58.4444
latitudes << -34.590; longitudes << -58.4444
latitudes << -34.595; longitudes << -58.4444
latitudes << -34.600; longitudes << -58.4444
latitudes << -34.605; longitudes << -58.4444
latitudes << -34.610; longitudes << -58.4444
latitudes << -34.615; longitudes << -58.4444
latitudes << -34.620; longitudes << -58.4444
latitudes << -34.625; longitudes << -58.4444
  
latitudes << -34.550; longitudes << -58.4555
latitudes << -34.555; longitudes << -58.4555
latitudes << -34.560; longitudes << -58.4555
latitudes << -34.565; longitudes << -58.4555
latitudes << -34.570; longitudes << -58.4555
latitudes << -34.575; longitudes << -58.4555
latitudes << -34.580; longitudes << -58.4555
latitudes << -34.585; longitudes << -58.4555
latitudes << -34.590; longitudes << -58.4555
latitudes << -34.595; longitudes << -58.4555
latitudes << -34.600; longitudes << -58.4555
latitudes << -34.605; longitudes << -58.4555
latitudes << -34.610; longitudes << -58.4555
latitudes << -34.615; longitudes << -58.4555
latitudes << -34.620; longitudes << -58.4555
latitudes << -34.625; longitudes << -58.4555
  
latitudes << -34.550; longitudes << -58.477
latitudes << -34.555; longitudes << -58.477
latitudes << -34.560; longitudes << -58.477
latitudes << -34.565; longitudes << -58.477
latitudes << -34.570; longitudes << -58.477
latitudes << -34.575; longitudes << -58.477
latitudes << -34.580; longitudes << -58.477
latitudes << -34.585; longitudes << -58.477
latitudes << -34.590; longitudes << -58.477
latitudes << -34.595; longitudes << -58.477
latitudes << -34.598; longitudes << -58.477
latitudes << -34.605; longitudes << -58.477
latitudes << -34.610; longitudes << -58.477
latitudes << -34.615; longitudes << -58.477
latitudes << -34.620; longitudes << -58.477
latitudes << -34.625; longitudes << -58.477

# Carlos

puts "Creando publicaciones de Carlos Fontana (usuario \"carlos@mileem.com\", password: \"asdfasdf\")..."

Publication.create!([

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_carlos.id, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", paid: true, expiration_date: (Time.now + 1.months - 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_carlos.id, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months - 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=mehaW2UJdjY" },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "$", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_carlos.id, publication_date: (Time.now - 3.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months - 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_carlos.id, publication_date: (Time.now - 3.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months - 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=76LR0tp-gc8" },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: true, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=0-lOraBbkiw" },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_carlos.id, publication_date: (Time.now - 12.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months - 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=76LR0tp-gc8" },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_carlos.id, publication_date: (Time.now - 12.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months - 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 }
])

# Mario
puts "Creando publicaciones de Mario Giovani (usuario \"mario@mileem.com\", password: \"asdfasdf\")..."

Publication.create!([

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_mario.id, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months - 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_mario.id, publication_date: (Time.now - 3.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months - 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_mario.id, publication_date: (Time.now - 12.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months - 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 }
])
 
# Alejandro
puts "Creando publicaciones de Alejandro Molina (usuario \"alejandro@mileem.com\", password: \"asdfasdf\")..."
  
Publication.create!([  

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_alejandro.id, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months - 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_alejandro.id, publication_date: (Time.now - 3.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months - 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_alejandro.id, publication_date: (Time.now - 12.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months - 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 }
])

puts "Publicaciones creadas sin imágenes."

PublicationAttachment.create!([
  {publication_id: 1, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/1.jpg"))},
  {publication_id: 1, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/2.jpg"))},
  {publication_id: 1, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/3.jpg"))},
  {publication_id: 2, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/4.jpg"))},
  {publication_id: 2, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/5.jpg"))},
  {publication_id: 2, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/6.jpg"))},
  {publication_id: 3, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/7.jpg"))},
  {publication_id: 3, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/8.jpg"))},
  {publication_id: 3, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/9.jpg"))},
  {publication_id: 4, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/10.jpg"))},
  {publication_id: 4, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/11.jpg"))},
  {publication_id: 4, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/12.jpg"))},
  {publication_id: 5, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/13.jpg"))},
  {publication_id: 5, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/14.jpg"))},
  {publication_id: 5, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/15.jpg"))},
  {publication_id: 6, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/14.jpg"))},
  {publication_id: 6, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/13.jpg"))},
  {publication_id: 6, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/12.jpg"))},
  {publication_id: 7, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/11.jpg"))},
  {publication_id: 7, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/10.jpg"))},
  {publication_id: 7, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/9.jpg"))},
  {publication_id: 8, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/8.jpg"))},
  {publication_id: 8, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/7.jpg"))},
  {publication_id: 8, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/6.jpg"))},
  {publication_id: 9, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/1.jpg"))},
  {publication_id: 9, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/2.jpg"))},
  {publication_id: 9, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/3.jpg"))},
  {publication_id: 10, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/4.jpg"))},
  {publication_id: 10, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/5.jpg"))},
  {publication_id: 10, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/6.jpg"))},
  {publication_id: 11, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/7.jpg"))},
  {publication_id: 11, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/8.jpg"))},
  {publication_id: 11, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/9.jpg"))},
  {publication_id: 12, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/10.jpg"))},
  {publication_id: 12, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/11.jpg"))},
  {publication_id: 12, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/12.jpg"))},
  {publication_id: 13, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/13.jpg"))},
  {publication_id: 13, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/14.jpg"))},
  {publication_id: 13, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/15.jpg"))},
  {publication_id: 14, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/14.jpg"))},
  {publication_id: 14, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/13.jpg"))},
  {publication_id: 14, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/12.jpg"))},
  {publication_id: 15, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/11.jpg"))},
  {publication_id: 15, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/10.jpg"))},
  {publication_id: 15, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/9.jpg"))},
  {publication_id: 16, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/8.jpg"))},
  {publication_id: 16, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/7.jpg"))},
  {publication_id: 16, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/6.jpg"))},
  {publication_id: 17, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/1.jpg"))},
  {publication_id: 17, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/2.jpg"))},
  {publication_id: 17, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/3.jpg"))},
  {publication_id: 18, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/4.jpg"))},
  {publication_id: 18, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/5.jpg"))},
  {publication_id: 18, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/6.jpg"))},
  {publication_id: 19, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/7.jpg"))},
  {publication_id: 19, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/8.jpg"))},
  {publication_id: 19, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/9.jpg"))},
  {publication_id: 20, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/10.jpg"))},
  {publication_id: 20, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/11.jpg"))},
  {publication_id: 20, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/12.jpg"))},
  {publication_id: 21, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/13.jpg"))},
  {publication_id: 21, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/14.jpg"))},
  {publication_id: 21, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/15.jpg"))},
  {publication_id: 22, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/14.jpg"))},
  {publication_id: 22, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/13.jpg"))},
  {publication_id: 22, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/12.jpg"))},
  {publication_id: 23, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/11.jpg"))},
  {publication_id: 23, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/10.jpg"))},
  {publication_id: 23, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/9.jpg"))},
  {publication_id: 24, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/8.jpg"))},
  {publication_id: 24, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/7.jpg"))},
  {publication_id: 24, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/6.jpg"))},
  {publication_id: 25, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/1.jpg"))},
  {publication_id: 25, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/2.jpg"))},
  {publication_id: 25, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/3.jpg"))},
  {publication_id: 26, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/4.jpg"))},
  {publication_id: 26, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/5.jpg"))},
  {publication_id: 26, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/6.jpg"))},
  {publication_id: 27, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/7.jpg"))},
  {publication_id: 27, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/8.jpg"))},
  {publication_id: 27, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/9.jpg"))},
  {publication_id: 28, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/10.jpg"))},
  {publication_id: 28, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/11.jpg"))},
  {publication_id: 28, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/12.jpg"))},
  {publication_id: 29, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/13.jpg"))},
  {publication_id: 29, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/14.jpg"))},
  {publication_id: 29, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/15.jpg"))},
  {publication_id: 30, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/14.jpg"))},
  {publication_id: 30, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/13.jpg"))},
  {publication_id: 30, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/12.jpg"))},
  {publication_id: 31, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/11.jpg"))},
  {publication_id: 31, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/10.jpg"))},
  {publication_id: 31, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/9.jpg"))},
  {publication_id: 32, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/8.jpg"))},
  {publication_id: 32, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/7.jpg"))},
  {publication_id: 32, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/6.jpg"))},
  {publication_id: 33, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/1.jpg"))},
  {publication_id: 33, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/2.jpg"))},
  {publication_id: 33, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/3.jpg"))},
  {publication_id: 34, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/4.jpg"))},
  {publication_id: 34, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/5.jpg"))},
  {publication_id: 34, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/6.jpg"))},
  {publication_id: 35, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/7.jpg"))},
  {publication_id: 35, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/8.jpg"))},
  {publication_id: 35, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/9.jpg"))},
  {publication_id: 36, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/10.jpg"))},
  {publication_id: 36, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/11.jpg"))},
  {publication_id: 36, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/12.jpg"))},
  {publication_id: 37, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/13.jpg"))},
  {publication_id: 37, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/14.jpg"))},
  {publication_id: 37, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/15.jpg"))},
  {publication_id: 38, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/14.jpg"))},
  {publication_id: 38, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/13.jpg"))},
  {publication_id: 38, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/12.jpg"))},
  {publication_id: 39, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/11.jpg"))},
  {publication_id: 39, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/10.jpg"))},
  {publication_id: 39, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/9.jpg"))},
  {publication_id: 40, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/8.jpg"))},
  {publication_id: 40, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/7.jpg"))},
  {publication_id: 40, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/6.jpg"))},
  {publication_id: 41, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/1.jpg"))},
  {publication_id: 41, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/2.jpg"))},
  {publication_id: 41, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/3.jpg"))},
  {publication_id: 42, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/4.jpg"))},
  {publication_id: 42, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/5.jpg"))},
  {publication_id: 42, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/6.jpg"))},
  {publication_id: 43, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/7.jpg"))},
  {publication_id: 43, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/8.jpg"))},
  {publication_id: 43, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/9.jpg"))},
  {publication_id: 44, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/10.jpg"))},
  {publication_id: 44, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/11.jpg"))},
  {publication_id: 44, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/12.jpg"))},
  {publication_id: 45, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/13.jpg"))},
  {publication_id: 45, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/14.jpg"))},
  {publication_id: 45, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/15.jpg"))},
  {publication_id: 46, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/14.jpg"))},
  {publication_id: 46, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/13.jpg"))},
  {publication_id: 46, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/12.jpg"))},
  {publication_id: 47, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/11.jpg"))},
  {publication_id: 47, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/10.jpg"))},
  {publication_id: 47, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/9.jpg"))},
  {publication_id: 48, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/8.jpg"))},
  {publication_id: 48, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/7.jpg"))},
  {publication_id: 48, image: File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/6.jpg"))}
])

puts "Imágenes agregadas."
