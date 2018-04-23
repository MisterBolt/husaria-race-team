class EventsController < ApplicationController
  before_action :require_admin_user,  only: [:new, :create, :edit, :update]

  def new
    @event = Event.new
  end

  def index
    @events = Event.where('start >= ?', Date.today).order(:start)
                  .paginate(page: params[:page], per_page: 10)
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users.order(:name).paginate(page: params[:page], per_page: 10)
  end

  def create
    @event = Event.new(event_params)
    @user = @event.build_user(id: session[:user_id])
    if @event.save
      flash[:success] = "Event created"
      redirect_to edit_user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def assign_user_to
    @event = Event.find(params[:id])
    @event.users << current_user unless @event.users.include?(current_user)
    redirect_to event_path(@event)
  end

  def delete_user_from
    @event = Event.find(params[:id])
    @event.users.delete(current_user) if @event.users.include?(current_user)
    redirect_to event_path(@event)
  end

  private

    def event_params
      params.require(:event).permit(:name, :location,
                                    :start, :end, :link)
    end
end