class Api::EventsController < Api::BaseController

  def index
    render( status: 200, json: {events: Event.all}.to_json ) # before serializers
    # render status: 200, json: events
  end

  def show
    event = Event.find(params[:id])
    # render( status: 200, json: {event: Event.find(params[:id])}.to_json )
    render status: 200, json: event
  end

  def create
    event = @user.events.build(event_params)
    if event.save
      render(status: 201, json: event)
    else
      render(status: 422, json: {errors: event.errors}.to_json)
    end
  end

  def update
    event = @user.events.find(params[:id])
    if event.update(event_params)
      render(status: 200, json: event)
    else
      render(status: 500, json: {message: "The event could not be updated", errors: event.errors}.to_json)
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
