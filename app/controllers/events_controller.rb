class EventsController < ApplicationController

 def show
   
end

  def index
    
    @events=Event.all
  end


  def new
    @event = current_user.events_as_host.build
  end

  def create
    @event = current_user.events_as_host.build(event_params)
    @event.user << User.find(params["invite"])
    if @event.save
      flash[:success] = "Event created!"
      redirect_to events_list_path(current_user)
    else
      render :new
    end
  end

 

  def edit
    @event=Event.find(params[:event_id])
  end


def update
  @event = Event.find(params[:event_id])
  if @event.update(event_params)
    redirect_to events_list_path
  else
    render 'edit'
  end
end



  def destroy
    @event = Event.find(params[:id])
    flash[:success] = "Event deleted"
    @event.destroy

    redirect_to events_list_path

  end

  private
	def event_params
	  params.require(:event).permit(:title, :venu, :date, :time, :description, :invitees, :status, :host_id)
	end



 end
