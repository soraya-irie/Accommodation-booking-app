class RoomsController < ApplicationController
  VALID_AREAS = ["東京", "大阪", "京都", "札幌"]

  def index
    @rooms = Room.all
    if params[:area].present? && VALID_AREAS.include?(params[:area])
      @rooms = @rooms.search_by_area(params[:area])
    end
    if params[:keyword].present?
      @rooms = @rooms.search_by_keyword(params[:keyword])
    end
    @rooms_count = @rooms.count
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "施設を登録しました"
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
      flash[:notice] = "施設を更新しました"
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
    @rooms = Room.all
    @rooms = @rooms.where(user_id: current_user.id)
  end
  
  def room_params
    params.require(:room).permit(:name, :introduction, :price_per_night, :address, :room_image)
  end
end
