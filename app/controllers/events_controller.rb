class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def upcoming
    @upcoming_events = Event.upcoming
  end

  def past
    @pasts_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Event sucessfully updated !'
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event sucessfully created !'
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params
      .require(:event)
      .permit(
        :name,
        :description,
        :location,
        :price,
        :start_at,
        :image_file_name,
        :capacity
      )
  end
end
