class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon_image
  mount_uploader :icon_image, IconUploader
  validates :name, :email, presence: true
end
