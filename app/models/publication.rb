class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments
  accepts_nested_attributes_for :publication_attachments
  validates :transaction_type, :address, :phone, :price, presence: true
  validates_numericality_of :number_of_rooms, :price, :age, :expenses, :area, greater_than:0
  validate :publication_date_cannot_be_in_the_past

  TRANSACTION_TYPES = [['Compra','Compra'],['Alquiler','Alquiler']]
  PROPERTY_TYPES = [['Casa', 'Casa'], ['Departamento','Departamento']]
  NUMBER_OF_ROOMS = [['1',1], ['2',2], ['3',3], ['4+',4]]
  CURRENCIES = [['$ (Pesos Argentinos)','$'] ,['US$ (Dólares)', 'US$']]

  def publication_date_cannot_be_in_the_past
    if publication_date.present? && publication_date < Date.today
      errors.add(:publication_date, " debe ser mayor o igual a la fecha actual.")
    end
  end

end
