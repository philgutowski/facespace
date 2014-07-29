class DashboardsController < ApplicationController
  def show
    @message = Message.new
    @messages = Message.all
    @online_users = User.where("last_seen_at > ?", 5.minutes.ago)
  end
end
