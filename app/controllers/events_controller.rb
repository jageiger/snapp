class EventsController < ApplicationController
        def new
                @event = Event.new
        end
        
        def create
                @event = Event.new(params[:event].permit(:title, :description, :date, :time, :location))
            
                if @event.save
                  redirect_to @event
                else
                  render 'new'
                end
        end
        
    
        def destroy
                @event = Event.find(params[:id])
                @event.destroy
        end
        
        def edit
                @event = Event.find(params[:id])
        end
        
        def update
                @event = Event.find(params[:id])
                if @event.update(params[:event].permit(:title, :description, :date, :time, :location))
                   redirect_to @event
                   else
                     render 'edit'
                   end
        end
        
        
        def show
                @event = Event.find(params[:id])
        end
        
        def index
              @events = Event.all
        end
        

        
end
