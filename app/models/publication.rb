class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments
  accepts_nested_attributes_for :publication_attachments
  validates :transaction_type, :address, :phone, :price, presence: true
  validates_numericality_of :number_of_rooms, :price, :age, :expenses, :area, greater_than:0
end
