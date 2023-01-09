class EventsController < ApplicationController
  before_action :set_event, only: %i[show update destroy]

  def index
    @events = Event.where(user_id: params[:user_id])

    render json: @events
  end

  def show
    render json: @event
  end

  def create
    @event = Event.where(user_id: params[:user_id]).new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :image, :date, :time, :category, :description, :organizer, :location,
                                  :price, :user_id)
  end
end
