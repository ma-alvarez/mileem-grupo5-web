class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :publication_attachments, allow_destroy: true

  validates :transaction_type, :address, :zone, :price, presence: true
  validates_numericality_of :number_of_rooms, :price, :age, :expenses, :area, greater_than_or_equal_to:0, only_integer:true
  validates_numericality_of :price, less_than_or_equal_to:1000000000

  TRANSACTION_TYPES = [['Compra','Compra'],['Alquiler','Alquiler']]
  PROPERTY_TYPES = [['Casa', 'Casa'], ['Departamento','Departamento']]
  NUMBER_OF_ROOMS = [['1',1], ['2',2], ['3',3], ['4+',4]]
  CURRENCIES = [['$ (Pesos Argentinos)','ARS'] ,['US$ (Dólares)', 'US']]
  ACCOUNT_TYPES = [['Gratuita',1],['Básica',2],['Premium',3]]

  def type
     Publication::ACCOUNT_TYPES[relevance - 1][0]
  end

  def rooms
     Publication::NUMBER_OF_ROOMS[number_of_rooms - 1][0]
  end

  def init_date
    publication_date.strftime("%d/%m/%Y")
  end

  def init_publication
    self.pause_counter = 0
    self.remaining_days = 0
  end

  def expiration
    expiration_date.strftime("%d/%m/%Y")
  end

  def missing_pay?
    !paid && !active
  end

  def enable_to_publish?
    paid && !active && Date.today < publication_date
  end

  def active?
    paid && active
  end

  def paused?
    paid && !active && remaining_days > 0
  end

  def finished?
    paid && !active && expiration_date <= Date.today && remaining_days == 0
  end

  def publicate
    self.active = true
    self.publication_date = Date.today
    determinate_expiration
  end

  def pause
    self.active = false
    self.pause_counter = self.pause_counter + 1
    self.remaining_days = (expiration_date - Date.today).to_i
  end


  def unpause
    self.active = true
    self.expiration_date = Date.today + self.remaining_days.days
    self.remaining_days = 0
  end

  def determinate_payment
    if relevance == 1
      self.paid = true
    else
      self.paid = false
    end  
  end

  def determinate_active
    self.active = (paid && self.publication_date == Date.today)
  end

  def determinate_expiration
    if relevance == 1
      return self.expiration_date = self.publication_date + 1.months
    elsif relevance == 2
      return self.expiration_date = self.publication_date + 3.months
    elsif relevance == 3
      return self.expiration_date = self.publication_date + 12.months
    end
  end

  def remaining_pauses
    3 - self.pause_counter
  end

end
