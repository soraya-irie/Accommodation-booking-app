class Room < ApplicationRecord
  mount_uploader :room_image, FacilityUploader
end
