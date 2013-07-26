class EventsController < ApplicationController
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.create event_params
    
    @supply = Supply.create supply_params
    @event.supplies << @supply
    
    puts chore_params.class
    chore_params.each do |chore|
      Chore.create! chore: chore
      @event.chores << chore
    end

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

  def supply_params
    params.permit(:supply, :amount)
  end

  def chore_params
    params.permit(:chores)
  end
end
