user_free = User.create!(
			full_name: 'Mileem Asdf IV',
			email: 'asdf8@asdf.com', 
      		password: 'asdfasdf', 
      		password_confirmation: 'asdfasdf',
      		phone: "1569886543")
      
user_basic = user_free
user_premium = user_free

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


# latitudes << -34.550
# longitudes << -58.4444

Publication.create!([
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "US", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 1, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 1.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "$", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 2, currency: "US", active: true, paid: true, expiration_date: (Time.now + 3.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d"), pause_counter: 0 },
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Casa", address: address(latitudes.last,longitudes.last), area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Compra", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "US", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")},
  {latitude: latitudes.last, longitude: longitudes.last, transaction_type: "Alquiler", property_type: "Departamento", address: address(latitudes.last,longitudes.last), area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: zone(latitudes.pop,longitudes.pop), relevance: 3, currency: "ARS", active: true, paid: true, expiration_date: (Time.now + 12.months).strftime("%Y-%m-%d")}

])

