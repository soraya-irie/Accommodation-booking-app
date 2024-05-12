class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path
    else
      render :confirm
    end
  end

  def show
    @room = Room.find(params[:id])
  end 
  
  def edit
    @reservation = Reservation.find(params[:id])
    @user = @reservation.user
    @room = @reservation.room
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @total_price = @room.price_per_night * @reservation.days_to_stay * @reservation.number_of_people
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end
  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :total_price, :number_of_people)
    end

    
end
