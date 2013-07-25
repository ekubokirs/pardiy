class EventController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create event_params
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]

    if  @event.update_attributes(event_params)
      redirect_to root_url, status:303
    else
      render :edit
    end
  end

  def destroy
    event = Event.find params[:id]
    event.destroy

    redirect_to root_url, status: 303
  end

  private

  def event_params
    params.require(:event).permit(:title, :venue, :type)
  end
end
