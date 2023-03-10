class ReservesController < ApplicationController
  before_action :set_reserf, only: %i[show update destroy]

  def index
    @reserves = Reserve.all

    render json: @reserves, include: :event
  end

  def show
    render json: @reserf
  end

  def create
    if Reserve.where(user_id: params[:user_id], event_id: params[:event_id]).exists?
      render json: { message: 'You have already made Reservation' }
    else
      @reserf = Reserve.new(reserf_params)
      if @reserf.save
        render json: @reserf, status: :created
      else
        render json: @reserf.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @reserf.destroy
    render json: { message: 'Reserve deleted' }
  end

  private

  def set_reserf
    @reserf = Reserve.find(params[:id])
  end

  def reserf_params
    params.require(:reserf).permit(:name, :date, :city, :user_id, :event_id)
  end
end
