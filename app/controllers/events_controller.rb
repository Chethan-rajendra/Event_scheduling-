class EventsController < ApplicationController

  def new
  	@event = Event.new
  end

  def create
        
        u=User.find(current_user).events << Event.new(event_params)
        
        @par=Participent.new
        # Event.last.participents << User.find(params["user_ids"])
         params["user_ids"].map {|i| i.to_i}.each do |i|
         @par.user=User.find(i)
         @par.event=Event.last
         @par.save

         redirect_to list_events_path
        end
    end



 end
