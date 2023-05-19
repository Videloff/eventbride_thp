class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @registered = false
    @event = Event.find(params[:id])
    @count = Event.find(params[:id]).users.all.count
    if @count > 0 && @event.attendances.find_by(user_id: current_user)
      @registered = true
    else
      @registered = false
    end
  end

  def new
    @event = Event.new
  end

  def create
    if current_user
      puts '$' * 100
      puts params[:event_picture]
      puts '$' * 100
      @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
      @event.admin_id = current_user.id
      if params[:event_picture] 
        @event.event_picture = params[:event_picture]
      else
        flash[:alert] = "Il est obligatoire d'associer une photo à votre événement"
        redirect_to root_path
      end
      if @event.save
        # redirect_to event_path(@event.id)
        redirect_to root_path
        flash[:success]= "Ton évenement a bien été créé !"
      else
        render new_event_path
      end
    else
      flash[:alert] = "Vous devez être connecté pour créer un potin"
      redirect_to root_path
    end
  end

end