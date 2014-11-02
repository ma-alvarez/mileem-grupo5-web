class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :publication_attachments, allow_destroy: true
  YT_LINK_FORMAT = /\A*youtube.com\/(v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
 

  validates :transaction_type, :address, :zone, :price, :publication_date, presence: true
  validates :video_link, allow_blank: true, format: { with: YT_LINK_FORMAT,
    message:"no posee el formato correcto o no pertenece a Youtube"}
  validates_numericality_of :number_of_rooms, greater_than_or_equal_to:0, only_integer:true
  validates_numericality_of :price, less_than_or_equal_to:1000000000, greater_than_or_equal_to:0, only_integer:true
  validates_numericality_of :age, less_than_or_equal_to:1000, greater_than_or_equal_to:0, only_integer:true
  validates_numericality_of :expenses, less_than_or_equal_to:100000, greater_than_or_equal_to:0, only_integer:true
  validates_numericality_of :area, less_than_or_equal_to:100000, greater_than_or_equal_to:0, only_integer:true

  attr_accessor :fetched_from_db #se setea en true cuando se toman los datos de la base con el find en el controller
  
  TRANSACTION_TYPES = [['Compra','Compra'],['Alquiler','Alquiler']]
  PROPERTY_TYPES = [['Casa', 'Casa'], ['Departamento','Departamento']]
  NUMBER_OF_ROOMS = [['1',1], ['2',2], ['3',3], ['4+',4]]
  CURRENCIES = [['$ (Pesos Argentinos)','ARS'] ,['US$ (Dólares)', 'US']]
  ACCOUNT_TYPES = [['Gratuita',1],['Básica',2],['Premium',3]]
  STATUS = [['--Todos--', ''],['Activa', 'active'], ['Pausada', 'paused'], ['Finalizada', 'finished'], ['Pte. de pago', 'missing_pay'], 
  ['Lista para publicar', 'enable_to_publish']]
  PRICES = [100, 150]

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
  
  def is_editable?
    !fetched_from_db
  end

  def has_video?
    !(self.video_link == nil || self.video_link.empty?)
  end

  def self.active_publications(publications)
    filtered_publications = []
    publications.each { |publication| filtered_publications << publication if publication.active? }
    return filtered_publications
  end

  def self.paused_publications(publications)
    filtered_publications = []
    publications.each { |publication| filtered_publications << publication if publication.paused? }
    return filtered_publications
  end

  def self.finished_publications(publications)
    filtered_publications = []
    publications.each { |publication| filtered_publications << publication if publication.finished? }
    return filtered_publications
  end

  def self.missing_pay_publications(publications)
    filtered_publications = []
    publications.each { |publication| filtered_publications << publication if publication.missing_pay? }
    return filtered_publications
  end

  def self.enable_to_publish_publications(publications)
    filtered_publications = []
    publications.each { |publication| filtered_publications << publication if publication.enable_to_publish? }
    return filtered_publications
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

  def pay
    self.paid = true
  end

  def republicate
    self.active = true
    self.paid = true
     if relevance == 2
       self.expiration_date = self.expiration_date + 3.months
    elsif relevance == 3
       self.expiration_date = self.expiration_date + 12.months
    end

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

  def is_editable?(atribute)
    return true if !fetched_from_db
    case atribute
    when 'currency' then true
    when 'price' then true
    when 'expenses' then true
    else false
    end
  end

  def republicable?
    if (relevance == 2 || relevance == 3) && ((expiration_date - Date.today).days <= 30.days && self.active?) || (relevance == 2 || relevance == 3) && (self.finished?)
      true
    else
      false
    end
  end

  def republication_price
    if (relevance == 2 || relevance == 3) && ((expiration_date - Date.today).days <= 30.days && self.active?)
      Publication::PRICES[relevance-2] * 0.5
    else
      self.standard_price
    end
  end

  def standard_price
    Publication::PRICES[self.relevance-2]
  end

end
