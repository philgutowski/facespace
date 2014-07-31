class DashboardsController < ApplicationController
  def show
    @message = Message.new
    @messages = Message.order(created_at: :asc).limit(50).sort_by(&:created_at)
    @online_users = User.recently_online
  end
end
