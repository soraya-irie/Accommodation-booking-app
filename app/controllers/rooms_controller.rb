class RoomsController < ApplicationController
  def index
    if params[:search].present?
      @rooms = Room.where("name LIKE ? OR introduction LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @rooms = Room.all
    end
  end
end
