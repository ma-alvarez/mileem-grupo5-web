class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments
  accepts_nested_attributes_for :publication_attachments
  validates :transaction_type, :address, :phone, :price, presence: true
  validates_numericality_of :number_of_rooms, :price, :age, :expenses, :area, greater_than:0

  TRANSACTION_TYPES = [['Compra','Compra'],['Alquiler','Alquiler']]
  PROPERTY_TYPES = [['Casa', 'Casa'], ['Departamento','Departamento']]
  NUMBER_OF_ROOMS = [['1',1], ['2',2], ['3',3], ['4+',4]]

  HUMANIZED_ATTRIBUTES = {
    :address => "Dirección", 
    :age => "Antiguedad", 
  	:area => "Superficie", 
  	:created_at => "Fecha de creación", 
    :expenses => "Expensas", 
    :name => "Publicación", 
  	:number_of_rooms => "Ambientes", 
  	:phone => "Teléfono", 
  	:price => "Precio", 
  	:property_type => "Tipo de propiedad", 
  	:publication_date => "Fecha de publicación", 
  	:publication_attachments => "Fotos", 
  	:transaction_type  => "Tipo de transacción", 
  	:zone  => "Barrio"
  }

  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end


end
