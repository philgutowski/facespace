class DashboardsController < ApplicationController
  def show
    @message = Message.new
    @messages = Message.all
    @online_users = User.recently_online
  end
end
