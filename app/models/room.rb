class Room < ApplicationRecord
  mount_uploader :room_image, FacilityUploader
  scope :search_by_area, -> (area) { where("address LIKE ?", "%#{area}%") }
  scope :search_by_keyword, -> (keyword) { where("name LIKE :keyword OR introduction LIKE :keyword", keyword: "%#{keyword}%") }
end
