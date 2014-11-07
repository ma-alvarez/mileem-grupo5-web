User.create!(
      full_name: 'Mileem Prueba',
      email: 'mileemprueba@mileem.com', 
      password: 'mileemprueba', 
      password_confirmation: 'mileemprueba',
      phone: "1569886542")

Publication.create!([
  {transaction_type: "Alquiler", property_type: "Departamento", address: "Neuquén 1038-1100", area: 20, number_of_rooms: 2, price: 5000, expenses: 500, age: 10, user_id: 1, publication_date: "2014-11-02", zone: "Caballito", relevance: 1, currency: "ARS", latitude: -34.6158330553697, longitude: -58.4489527344704, active: true, paid: true, expiration_date: "2014-12-02", pause_counter: 0, remaining_days: 0, video_link: nil, retired_at: "2014-11-02 19:30:54"},
  {transaction_type: "Compra", property_type: "Casa", address: "México 3801-3899", area: 25, number_of_rooms: 3, price: 1500000, expenses: 0, age: 15, user_id: 1, publication_date: "2014-08-15", zone: "Almagro", relevance: 2, currency: "ARS", latitude: -34.6199298938928, longitude: -58.4200841188431, active: true, paid: true, expiration_date: "2014-11-15", pause_counter: 0, remaining_days: 0, video_link: "", retired_at: nil},
  {transaction_type: "Compra", property_type: "Casa", address: "Av Congreso 5902-6000", area: 25, number_of_rooms: 2, price: 950000, expenses: 0, age: 16, user_id: 1, publication_date: (Time.now - 1.months).strftime("%Y-%m-%d"), zone: "Villa Pueyrredón", relevance: 1, currency: "US", latitude: -34.5752775795944, longitude: -58.5000783205032, active: false, paid: true, expiration_date:Time.now.strftime("%Y-%m-%d") , pause_counter: 0, remaining_days: 0, video_link: nil, retired_at: nil},
  {transaction_type: "Compra", property_type: "Casa", address: "Montenegro 1402-1500", area: 38, number_of_rooms: 3, price: 780000, expenses: 0, age: 9, user_id: 1, publication_date: "2014-08-02", zone: "Villa Ortúzar", relevance: 2, currency: "ARS", latitude: -34.5885627381387, longitude: -58.4674626588821, active: false, paid: true, expiration_date: "2014-11-02", pause_counter: 0, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=mehaW2UJdjY", retired_at: nil},
  {transaction_type: "Compra", property_type: "Casa", address: "Lezica 4402-4500", area: 35, number_of_rooms: 4, price: 750000, expenses: 0, age: 12, user_id: 1, publication_date: "2013-11-08", zone: "Almagro", relevance: 3, currency: "US", latitude: -34.613713921614, longitude: -58.4290105104446, active: true, paid: true, expiration_date: "2014-11-08", pause_counter: 0, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=mehaW2UJdjY", retired_at: nil},
  {transaction_type: "Compra", property_type: "Casa", address: "Guayra 2201-2299", area: 40, number_of_rooms: 4, price: 1780000, expenses: 0, age: 5, user_id: 1, publication_date: "2013-09-09", zone: "Núñez", relevance: 3, currency: "ARS", latitude: -34.5518113691705, longitude: -58.4636861085892, active: false, paid: true, expiration_date: "2014-09-09", pause_counter: 0, remaining_days: 0, video_link: "https://www.youtube.com/watch?v=mehaW2UJdjY", retired_at: nil}
])
PublicationAttachment.create!([
  {publication_id: 1, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/4.jpg"))},
  {publication_id: 1, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/1.jpg"))},
  {publication_id: 1, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/3.jpg"))},
  {publication_id: 2, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/2.jpg"))},
  {publication_id: 2, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/8.jpg"))},
  {publication_id: 2, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/10.jpg"))},
  {publication_id: 2, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/11.jpg"))},
  {publication_id: 2, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/15.jpg"))},
  {publication_id: 3, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/12.jpg"))},
  {publication_id: 3, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/8.jpg"))},
  {publication_id: 3, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/5.jpg"))},
  {publication_id: 4, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/8.jpg"))},
  {publication_id: 4, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/2.jpg"))},
  {publication_id: 4, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/3.jpg"))},
  {publication_id: 5, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/1.jpg"))},
  {publication_id: 5, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/7.jpg"))},
  {publication_id: 5, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/10.jpg"))},
  {publication_id: 5, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/9.jpg"))},
  {publication_id: 5, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/15.jpg"))},
  {publication_id: 6, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/11.jpg"))},
  {publication_id: 6, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/8.jpg"))},
  {publication_id: 6, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/departamentos/14.jpg"))},
  {publication_id: 6, image:  File.new(File.join(Rails.root, "/public/imagenesDePrueba/casas/9.jpg"))},
])
Zone.create!([
  {name: "Agronomía"},
  {name: "Almagro"},
  {name: "Balvanera"},
  {name: "Barracas"},
  {name: "Belgrano"},
  {name: "Boedo"},
  {name: "Caballito"},
  {name: "Chacarita"},
  {name: "Coghlan"},
  {name: "Colegiales"},
  {name: "Constitución"},
  {name: "Flores"},
  {name: "Floresta"},
  {name: "La Boca"},
  {name: "Paternal"},
  {name: "Liniers"},
  {name: "Mataderos"},
  {name: "Monte Castro"},
  {name: "Monserrat"},
  {name: "Nueva Pompeya"},
  {name: "Núñez"},
  {name: "Palermo"},
  {name: "Parque Avellaneda"},
  {name: "Parque Chacabuco"},
  {name: "Parque Chas"},
  {name: "Parque Patricios"},
  {name: "Puerto Madero"},
  {name: "Recoleta"},
  {name: "Retiro"},
  {name: "Saavedra"},
  {name: "San Cristóbal"},
  {name: "San Nicolás"},
  {name: "San Telmo"},
  {name: "Vélez Sarsfield"},
  {name: "Versalles"},
  {name: "Villa Crespo"},
  {name: "Villa del Parque"},
  {name: "Villa Devoto"},
  {name: "Villa General Mitre"},
  {name: "Villa Lugano"},
  {name: "Villa Luro"},
  {name: "Villa Ortúzar"},
  {name: "Villa Pueyrredón"},
  {name: "Villa Real"},
  {name: "Villa Riachuelo"},
  {name: "Villa Santa Rita"},
  {name: "Villa Soldati"},
  {name: "Villa Urquiza"}
])
