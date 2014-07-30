class DownvotesController < ApplicationController
  def create
    vote.update(value: -1)
    redirect_to :dashboard
  end

  private

  def vote
    message = Message.find(params[:message_id])
    message.votes.find_or_create_by(user_id: current_user.id)
  end
end
