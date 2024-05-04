class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
  end

  def show
    @room = Room.find(params[:id])
  end 
  

  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :total_price, :number_of_people, :created_at, :updated_at)
    end
end
