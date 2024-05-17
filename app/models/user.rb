class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon_image
  mount_uploader :icon_image, IconUploader
  
  validates :password, :current_password, :password_confirmation, presence: true

  
  validates :name, :self_introduction, presence: true

  validates :email, uniqueness: true
  

end
