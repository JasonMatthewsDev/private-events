class EventsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create]
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    
    if @event.save
      flash[:success] = "Event #{@event.name} saved."
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
    unless @event = Event.find_by(id: params[:id])
      flash[:danger] = 'Event does not exist'
      @event = Event.new
    end
  end

  def index
    @events = Event.all
  end
  
  private
  
    def event_params
      params.require(:event).permit(:name, :date)
    end
    
    def check_logged_in
      unless logged_in?
        flash[:danger] = 'You must be logged in to do that.'
        redirect_to login_path
      end
    end
    
end
