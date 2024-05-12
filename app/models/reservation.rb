class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, :end_date, :number_of_people, presence: true
  validates :number_of_people, numericality: { greater_than_or_equal_to: 1 }
  validate :start_date_is_today_or_later
  validate :end_date_is_after_start_date

  def days_to_stay
    (end_date - start_date).to_i
  end
end

  private
    def start_date_is_today_or_later
      return if start_date.blank?
      errors.add(:start_date, 'は今日以降の日付出なければなりません。') if start_date < Date.today
    end

    def end_date_is_after_start_date
      return if end_date.blank? || start_date.blank?
      errors.add(:end_date, 'はチェックイン日より後の日付でなくてはなりません。') if end_date <= start_date
    end