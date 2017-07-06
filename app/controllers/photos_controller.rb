class PhotosController < ApplicationController

def destroy
  photo = Photo.find(params[:id])
  @event = photo.event
  if current_user.id == @event.user.id
    photo.destroy
    redirect_to edit_event_path(@event), notice: "Photo removed."
  else
    redirect_to events_path, notice: "You smart! But you still do not have permission."
  end

end

end
