class Api::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render( status: 200, json: {events: Event.all}.to_json )
  end

  def show
    render( status: 200, json: {event: Event.find(params[:id])}.to_json )
  end

  def create
    event = Event.new(event_params)
    if event.save
      render(status: 201, json: {message: "Event created!", event: event}.to_json)
    else
      render(status: 422, json: {errors: event.errors}.to_json)
    end
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render(status: 200, json: {message: "Event updated!", event: event}.to_json)
    else
      render(status: 422, json: {errors: event.errors}.to_json)
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    render(status: 200, json: {message: "Event deleted!"}.to_json)
  end

  private

  def event_params
    params
      .require(:event)
      .permit(
        :name, :description, :location, :starts_at, :ends_at, :active,
        :price, :capacity, :includes_food, :includes_drinks, theme_ids: []
      )
  end
end
