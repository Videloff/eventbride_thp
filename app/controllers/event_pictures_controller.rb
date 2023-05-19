class EventsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event.event_picture.attach(params[:event_picture])
    redirect_to @event
  end

end