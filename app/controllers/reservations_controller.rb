class ReservationsController < ApplicationController
  
  def index
     @reservations = Reservation.all

  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = @reservation.room
    if @reservation.save
      redirect_to reservations_path
    else
      render 'confirm', status: :unprocessable_entity
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
    @room = @reservation.room
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end
  

  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @room = @reservation.room
    if @reservation.invalid?
      render 'rooms/show'
    else
      render 'confirm'
    end
  end
    

  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :total_price, :number_of_people)
    end

    
end
