class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :publications

  validates :full_name, presence: true
  validates :full_name, format: { with: /\A[^0-9`!@#\$%\^&*+_=-]+\z/,
    message: "solo permite caracteres alfabéticos" } 
  validates :full_name, format: { without: /\s{2}/, 
    message: "no debe contener mas de 2 espacios en blanco consecutivos"}

  ACCOUNT_TYPES = [['Free',"Free"],['Basic','Basic'],['Premium','Premium']]
end
