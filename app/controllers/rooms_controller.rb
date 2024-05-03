class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @rooms = @rooms.search_by_area(params[:area]) if params[:area].present?
    @rooms = @rooms.search_by_keyword(params[:keyword]) if params[:keyword].present?
    @rooms_count = @rooms.count
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new_room_path
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :rooms_own
  end

  def own
    @rooms = Room.all
    redirect_to new_room_path if @rooms.empty?  
  end

  def room_params
    params.require(:room).permit(:name, :introduction, :price_per_night, :address, :room_image)
  end
end
