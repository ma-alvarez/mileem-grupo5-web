json.array!(@publications) do |publication|
	json.extract! publication, :id, :transaction_type, :property_type, :address, :area, :number_of_rooms, :price, :expenses, :age, :phone
	json.url publication_url(publication, format: :json)
end