class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :publication_attachments, allow_destroy: true

  validates :transaction_type, :address, :phone, :price, presence: true
  validates_numericality_of :number_of_rooms, :price, :age, :expenses, :area, greater_than_or_equal_to:0, only_integer:true
  validate :publication_date_cannot_be_in_the_past
  validates :phone, format: {with: /\A[0-9]{8,15}\z/,
    message: "debe contener entre 8 y 15 caracteres numéricos unicamente"}

  TRANSACTION_TYPES = [['Compra','Compra'],['Alquiler','Alquiler']]
  PROPERTY_TYPES = [['Casa', 'Casa'], ['Departamento','Departamento']]
  NUMBER_OF_ROOMS = [['1',1], ['2',2], ['3',3], ['4+',4]]
  CURRENCIES = [['$ (Pesos Argentinos)','$'] ,['US$ (Dólares)', 'US$']]
  ACCOUNT_TYPES = [['Free',1],['Basic',2],['Premium',3]]

  def publication_date_cannot_be_in_the_past
    if publication_date.present? && publication_date < Date.today
      errors.add(:publication_date, " debe ser mayor o igual a la fecha actual.")
    end
  end

end
