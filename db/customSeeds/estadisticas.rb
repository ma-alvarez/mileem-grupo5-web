puts "Esto puede llevar un tiempito. Paciencia..."

user_carlos = User.create!(
      full_name: 'Carlos Fontana',
      email: 'carlos@mileem.com', 
      password: 'asdfasdf', 
      password_confirmation: 'asdfasdf',
      phone: "1511111111",
      confirmed_at: "2014-11-16 20:14:59")

user_mario = User.create!(
      full_name: 'Mario Giovani',
      email: 'mario@mileem.com', 
      password: 'asdfasdf', 
      password_confirmation: 'asdfasdf',
      phone: "1522222222",
      confirmed_at: "2014-11-16 20:14:59")

user_alejandro = User.create!(
      full_name: 'Alejandro Molina',
      email: 'alejandro@mileem.com', 
      password: 'asdfasdf', 
      password_confirmation: 'asdfasdf',
      phone: "1533333333",
      confirmed_at: "2014-11-16 20:14:59")

puts "Usuarios creados."      

def address(lat,long)
  Geocoder.search("#{lat},#{long}").first.route + ' ' + Geocoder.search("#{lat},#{long}").first.street_number
end

def zone(lat,long)
  Geocoder.search("#{lat},#{long}").second.neighborhood
end

latitudes = []
longitudes = []

#Almagro y aledaños (Villa Crespo,Palermo,Recoleta,Balvanera,Boedo,Caballito)
latitudes << -34.599437; longitudes << -58.409757
latitudes << -34.600969; longitudes << -58.408507
latitudes << -34.600945; longitudes << -58.419217
latitudes << -34.601470; longitudes << -58.425091
latitudes << -34.599867; longitudes << -58.423669
latitudes << -34.597734; longitudes << -58.421067
latitudes << -34.599222; longitudes << -58.416523
latitudes << -34.603014; longitudes << -58.408149
latitudes << -34.598548; longitudes << -58.445075
latitudes << -34.596000; longitudes << -58.444179
latitudes << -34.602056; longitudes << -58.452556
latitudes << -34.601160; longitudes << -58.453506
latitudes << -34.599804; longitudes << -58.454595
latitudes << -34.601036; longitudes << -58.457304
latitudes << -34.590471; longitudes << -58.429685
latitudes << -34.590471; longitudes << -58.429685
latitudes << -34.590489; longitudes << -58.424331
latitudes << -34.590058; longitudes << -58.422835
latitudes << -34.589561; longitudes << -58.427537
latitudes << -34.588391; longitudes << -58.428647
latitudes << -34.587857; longitudes << -58.430798
latitudes << -34.587768; longitudes << -58.423899
latitudes << -34.590418; longitudes << -58.427601
latitudes << -34.588391; longitudes << -58.428647
latitudes << -34.588391; longitudes << -58.428647
latitudes << -34.594428; longitudes << -58.425927
latitudes << -34.594693; longitudes << -58.429500
latitudes << -34.591840; longitudes << -58.423706
latitudes << -34.592431; longitudes << -58.394511
latitudes << -34.592961; longitudes << -58.396872
latitudes << -34.588391; longitudes << -58.428647
latitudes << -34.591265; longitudes << -58.387473
latitudes << -34.594020; longitudes << -58.387387
latitudes << -34.590558; longitudes << -58.387259
latitudes << -34.611011; longitudes << -58.402150
latitudes << -34.613342; longitudes << -58.402408
latitudes << -34.612142; longitudes << -58.401120
latitudes << -34.612989; longitudes << -58.394168
latitudes << -34.610587; longitudes << -58.394511
latitudes << -34.633119; longitudes << -58.419917
latitudes << -34.629800; longitudes << -58.413909
latitudes << -34.588391; longitudes << -58.428647
latitudes << -34.628105; longitudes << -58.410047
latitudes << -34.630117; longitudes << -58.422020
latitudes << -34.613342; longitudes << -58.450644
latitudes << -34.614049; longitudes << -58.447469
latitudes << -34.612989; longitudes << -58.447554
latitudes << -34.615814; longitudes << -58.451417



# Carlos
puts "Creando publicaciones de Carlos Fontana (usuario \"carlos@mileem.com\", password: \"asdfasdf\")..."

Publication.create!([

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 3100000, expenses: 0, age: 5, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 320000, expenses: 0, age: 8, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 330000, expenses: 0, age: 6, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 340000, expenses: 0, age: 7, user_id: user_carlos.id, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", paid: true, expiration_date: (Time.now + 1.months - 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 360000, expenses: 0, age: 4, user_id: user_carlos.id, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months - 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 140000, expenses: 0, age: 2, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=mehaW2UJdjY" },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 850000, expenses: 700, age: 10, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: false, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 110000, expenses: 800, age: 11, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 120000, expenses: 900, age: 12, user_id: user_carlos.id, publication_date: (Time.now - 3.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months - 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 145000, expenses: 1000, age: 13, user_id: user_carlos.id, publication_date: (Time.now - 3.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months - 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 310000, expenses: 0, age: 5, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=76LR0tp-gc8" },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 3200000, expenses: 0, age: 8, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: false, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=0-lOraBbkiw" },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3300000, expenses: 0, age: 6, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 3400000, expenses: 0, age: 7, user_id: user_carlos.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 350200, expenses: 0, age: 4, user_id: user_carlos.id, publication_date: (Time.now - 12.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months - 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=76LR0tp-gc8" },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 380300, expenses: 0, age: 11, user_id: user_carlos.id, publication_date: (Time.now - 12.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months - 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 }
])

# Mario
puts "Creando publicaciones de Mario Giovani (usuario \"mario@mileem.com\", password: \"asdfasdf\")..."

Publication.create!([

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1150000, expenses: 0, age: 3, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 87000, expenses: 700, age: 10, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_mario.id, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months - 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 3160000, expenses: 0, age: 5, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 3280000, expenses: 0, age: 8, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: false, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 331000, expenses: 0, age: 6, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 332000, expenses: 0, age: 7, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 330000, expenses: 0, age: 4, user_id: user_mario.id, publication_date: (Time.now - 3.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months - 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3500000, expenses: 0, age: 7, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 398000, expenses: 0, age: 6, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: false, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 90000, expenses: 0, age: 14, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_mario.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 4, price: 120000, expenses: 0, age: 3, user_id: user_mario.id, publication_date: (Time.now - 12.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months - 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 }
])
 
# Alejandro
puts "Creando publicaciones de Alejandro Molina (usuario \"alejandro@mileem.com\", password: \"asdfasdf\")..."
  
Publication.create!([  

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 3830000, expenses: 0, age: 11, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 245500, expenses: 0, age: 7, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 345000, expenses: 0, age: 6, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 85000, expenses: 0, age: 14, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 87600, expenses: 0, age: 9, user_id: user_alejandro.id, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", expiration_date: (Time.now + 1.months - 1.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 3458000, expenses: 0, age: 11, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3500000, expenses: 0, age: 7, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: false, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 3786000, expenses: 0, age: 6, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 84000, expenses: 0, age: 14, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 130000, expenses: 0, age: 3, user_id: user_alejandro.id, publication_date: (Time.now - 3.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", expiration_date: (Time.now + 3.months - 3.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },

  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 142000, expenses: 0, age: 2, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1050000, expenses: 700, age: 10, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: false, active: false, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 113000, expenses: 800, age: 11, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 126000, expenses: 900, age: 12, user_id: user_alejandro.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1360000, expenses: 1000, age: 13, user_id: user_alejandro.id, publication_date: (Time.now - 12.months).strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", expiration_date: (Time.now + 12.months - 12.months).strftime("%Y-%m-%d"), pause_counter: 0, paid: true, active: true, remaining_days: 0 }
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
