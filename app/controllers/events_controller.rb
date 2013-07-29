class EventsController < ApplicationController
  before_action :is_authenticated

  def index
    @event = Event.all
  end
  

  def new
    @event = Event.new
  end

  def create
    @event = Event.create event_params
    @event.user = current_user
    @event.save

    supply_params["supplies"].each do |supply|
      puts supply.inspect
      new_supply = Supply.create supply
      @event.supplies << new_supply
    end 


    chore_params["chores"].each do |chore|
      new_chore = Chore.create :chore => chore
      @event.chores << new_chore
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

  def show
    @event = Event.find params[:id]

    recipes = @event.get_recipes

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
    params.permit(:supplies => [:amount, :supply])
  end

  def chore_params
    params.permit(:chores => [])
  end
end
