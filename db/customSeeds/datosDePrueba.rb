user_free = User.create!(
			full_name: 'Mileem Free',
			email: 'mileemfree@mileem.com', 
      password: 'mileemfree', 
      password_confirmation: 'mileemfree',
      phone: "1569886541")

user_basic = User.create!(
			full_name: 'Mileem Basic',
			email: 'mileembasic@mileem.com', 
      password: 'mileembasic', 
      password_confirmation: 'mileembasic',
      phone: "1569886542")

user_premium = User.create!(
			full_name: 'Mileem Premium',
			email: 'mileempremium@mileem.com', 
      password: 'mileempremium', 
      password_confirmation: 'mileempremium',
      phone: "1569886543")

Publication.create!([
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion free user propiedad 1", area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Agronomía", relevance: 1, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion free user propiedad 2", area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Parque Patricios", relevance: 1, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion free user propiedad 3", area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Urquiza", relevance: 1, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion free user propiedad 4", area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "La Paternal", relevance: 1, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion free user propiedad 9", area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Real", relevance: 1, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion free user propiedad 10", area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Constitución", relevance: 1, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion free user propiedad 11", area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Balvanera", relevance: 1, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion free user propiedad 12", area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Riachuelo", relevance: 1, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion free user propiedad 5", area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Parque Avellaneda", relevance: 1, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion free user propiedad 6", area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Saavedra", relevance: 1, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion free user propiedad 7", area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Pueyrredón", relevance: 1, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion free user propiedad 8", area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Liniers", relevance: 1, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion free user propiedad 13", area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Coghlan", relevance: 1, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion free user propiedad 14", area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Retiro", relevance: 1, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion free user propiedad 15", area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Soldati", relevance: 1, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion free user propiedad 16", area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_free.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Caballito", relevance: 1, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion basic user propiedad 1", area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Agronomía", relevance: 2, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion basic user propiedad 2", area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Parque Patricios", relevance: 2, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion basic user propiedad 3", area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Urquiza", relevance: 2, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion basic user propiedad 4", area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "La Paternal", relevance: 2, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion basic user propiedad 9", area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Real", relevance: 2, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion basic user propiedad 10", area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Constitución", relevance: 2, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion basic user propiedad 11", area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Balvanera", relevance: 2, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion basic user propiedad 12", area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Riachuelo", relevance: 2, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion basic user propiedad 5", area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Parque Avellaneda", relevance: 2, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion basic user propiedad 6", area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Saavedra", relevance: 2, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion basic user propiedad 7", area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Pueyrredón", relevance: 2, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion basic user propiedad 8", area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Liniers", relevance: 2, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion basic user propiedad 13", area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Coghlan", relevance: 2, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion basic user propiedad 14", area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Retiro", relevance: 2, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion basic user propiedad 15", area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Soldati", relevance: 2, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion basic user propiedad 16", area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_basic.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Caballito", relevance: 2, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion premium user propiedad 1", area: 150, number_of_rooms: 1, price: 2100000, expenses: 0, age: 5, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Agronomía", relevance: 3, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion premium user propiedad 2", area: 160, number_of_rooms: 2, price: 2200000, expenses: 0, age: 8, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Parque Patricios", relevance: 3, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion premium user propiedad 3", area: 170, number_of_rooms: 3, price: 2300000, expenses: 0, age: 6, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Urquiza", relevance: 3, currency: "$"},
  {transaction_type: "Compra", property_type: "Casa", address: "Direccion premium user propiedad 4", area: 180, number_of_rooms: 4, price: 2400000, expenses: 0, age: 7, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "La Paternal", relevance: 3, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion premium user propiedad 9", area: 150, number_of_rooms: 1, price: 1500, expenses: 0, age: 4, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Real", relevance: 3, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion premium user propiedad 10", area: 160, number_of_rooms: 2, price: 2500, expenses: 0, age: 11, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Constitución", relevance: 3, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion premium user propiedad 11", area: 170, number_of_rooms: 3, price: 3500, expenses: 0, age: 7, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Balvanera", relevance: 3, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Casa", address: "Direccion premium user propiedad 12", area: 180, number_of_rooms: 4, price: 4500, expenses: 0, age: 6, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Riachuelo", relevance: 3, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion premium user propiedad 5", area: 50, number_of_rooms: 1, price: 1100000, expenses: 0, age: 14, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Parque Avellaneda", relevance: 3, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion premium user propiedad 6", area: 60, number_of_rooms: 2, price: 1200000, expenses: 0, age: 9, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Saavedra", relevance: 3, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion premium user propiedad 7", area: 70, number_of_rooms: 3, price: 1300000, expenses: 0, age: 3, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Pueyrredón", relevance: 3, currency: "$"},
  {transaction_type: "Compra", property_type: "Departamento", address: "Direccion premium user propiedad 8", area: 80, number_of_rooms: 4, price: 1400000, expenses: 0, age: 2, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Liniers", relevance: 3, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion premium user propiedad 13", area: 50, number_of_rooms: 1, price: 1000000, expenses: 700, age: 10, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Coghlan", relevance: 3, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion premium user propiedad 14", area: 60, number_of_rooms: 2, price: 1100000, expenses: 800, age: 11, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Retiro", relevance: 3, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion premium user propiedad 15", area: 70, number_of_rooms: 3, price: 1200000, expenses: 900, age: 12, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Villa Soldati", relevance: 3, currency: "$"},
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Direccion premium user propiedad 16", area: 80, number_of_rooms: 4, price: 1300000, expenses: 1000, age: 13, user_id: user_premium.id, publication_date: Time.now.strftime("%Y-%m-%d"), zone: "Caballito", relevance: 3, currency: "$"}
 ])

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