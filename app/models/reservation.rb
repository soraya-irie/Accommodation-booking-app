class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  def days_to_stay
    (end_date - start_date).to_i
  end
end
