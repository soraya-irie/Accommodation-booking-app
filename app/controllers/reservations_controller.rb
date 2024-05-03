class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @reservations = @room.reservations
  end

  def confirm
    @reservation = Reservation.find(params[:id])
  end

end
