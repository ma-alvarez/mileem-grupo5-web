class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :publications

  validates :full_name, presence: true
  validates :full_name, format: { with: /\A\S[^0-9`!@#\$%\^&*+_=-]+\z/,
    message: "solo permite caracteres alfabéticos y no puede comenzar con un espacio en blanco" } 
  validates :full_name, format: { without: /\s{2}/, 
    message: "no debe contener 2 o más espacios en blanco consecutivos"}

  ACCOUNT_TYPES = [['Free',"Free"],['Basic','Basic'],['Premium','Premium']]
end
