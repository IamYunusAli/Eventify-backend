class ReservesController < ApplicationController
  before_action :set_reserf, only: %i[show update destroy]

  def index
    @reserves = Reserve.where(event_id: params[:event_id])

    render json: @reserves
  end

  def show
    render json: @reserf
  end

  def create
    @reserf = Reserve.where(event_id: params[:event_id]).new(reserf_params)
    if @reserf.save
      render json: @reserf, status: :created
    else
      render json: @reserf.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reserf.destroy
  end

  private

  def set_reserf
    @reserf = Reserve.find(params[:id])
  end

  def reserf_params
    params.require(:reserf).permit(:name, :date, :city, :user_id, :event_id)
  end
end
