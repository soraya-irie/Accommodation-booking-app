class Room < ApplicationRecord
  mount_uploader :room_image, AvatarUploader
end
