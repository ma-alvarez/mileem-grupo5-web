class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments
  accepts_nested_attributes_for :publication_attachments
  validates :transaction_type, :address, :phone, :price, presence: true
  validates_numericality_of :number_of_rooms, :price, :age, :expenses, :area, greater_than:0

  TRANSACTION_TYPES = [['Compra','Compra'],['Alquiler','Alquiler']]
  PROPERTY_TYPES = [['Casa', 'Casa'], ['Departamento','Departamento']]
  NUMBER_OF_ROOMS = [['1',1], ['2',2], ['3',3], ['4+',4]]
  CURRENCIES = [['$ (Pesos Argentinos)','$'] ,['US$ (Dólares)', 'US$']]
end
