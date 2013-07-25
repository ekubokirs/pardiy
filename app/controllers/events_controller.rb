class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create event_params

    redirect_to root_url
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
    params.permit(:title, :venue, :event_type)
  end
end
