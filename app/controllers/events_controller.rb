class EventsController < ApplicationController
  before_action :require_admin_user,  only: :create

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
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



  private

    def event_params
      params.require(:event).permit(:name, :location,
                                    :start, :end, :link)
    end
end