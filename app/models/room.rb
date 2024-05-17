class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  mount_uploader :room_image, FacilityUploader
  scope :search_by_area, -> (area) { where("address LIKE ?", "%#{area}%") }
  scope :search_by_keyword, -> (keyword) { where("name LIKE :keyword OR introduction LIKE :keyword", keyword: "%#{keyword}%") }
  validates :name, :introduction, :price_per_night, :address, presence: true
  validates :name, length: { maximum: 15 }
  validates :introduction, length: { maximum: 150 }
  validates :price_per_night, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
