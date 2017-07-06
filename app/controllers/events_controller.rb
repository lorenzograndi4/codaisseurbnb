class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = current_user.events
    #  @events = Event.all # shows all the events
  end

  def show
    @themes = @event.themes
    @photos = @event.photos
  end

  def new
    @event = current_user.events.build


  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      image_params.each do |i|
        @event.photos.create(image: i)
      end

      redirect_to edit_event_path(@event), notice: "Event created!"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @event.user.id
      @photos = @event.photos
    else
      redirect_to events_path, notice: "You smart! But you still do not have permission."
    end
  end

  def update
    if @event.update(event_params)
      image_params.each do |i|
        @event.photos.create(image: i)
      end

      redirect_to edit_event_path(@event), notice: "Event updated"
    else
      render :edit
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def image_params
    params[:images].present? ? params.require(:images) : []
  end

  def event_params
    params
      .require(:event)
      .permit(
        :name, :description, :location, :starts_at, :ends_at, :active,
        :price, :capacity, :includes_food, :includes_drinks, theme_ids: []
      )
  end
end
