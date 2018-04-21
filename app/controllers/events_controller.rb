class EventsController < ApplicationController
  before_action :admin_user,     only: :create

  def new
    @event = Event.new
  end

  def create

  end

  private

    def event_params
      params.require(:events).permit(:name, :location, :start)
    end

    def admin_user
      redirect_to root_url  unless current_user.admin?
    end
end