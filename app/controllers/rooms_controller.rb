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
    @room = current_user.rooms.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = @room.reservations.build
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      flash[:notice] = "施設を削除しました"
    else
      flash[:alert] = "施設の削除に失敗しました"
    end

    redirect_to own_rooms_path
  end

  def own
    @rooms = current_user.rooms
  end

  
  
  def room_params
    params.require(:room).permit(:name, :introduction, :price_per_night, :address, :room_image)
  end
end
