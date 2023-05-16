class EventsController < ApplicationController

  def index

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
    @event.admin_id = current_user.id

    if @event.save
      # redirect_to event_path(@event.id)
      redirect_to root_path
      flash[:success]= "Ton évenement a bien été créé !"
    else
      render new_event_path
    end
  end

end