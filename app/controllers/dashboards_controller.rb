class DashboardsController < ApplicationController
  def show
    @message = Message.new
    @messages = Message.all
    @recent_messages = @messages.recent 
    @online_users = User.recently_online
  end
end
