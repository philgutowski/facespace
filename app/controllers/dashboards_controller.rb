class DashboardsController < ApplicationController
  def show
    @message = Message.new
    @messages = current_user.recent_messages
    @online_users = User.recently_online
  end
end
