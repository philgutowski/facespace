class VotesController < ApplicationController
  def create
    get_vote
    @vote.value += 1 unless @vote.value == 1
    @vote.save
    redirect_to :dashboard
  end

  def destroy
    get_vote
    @vote.value -= 1 unless @vote.value == -1
    @vote.save
  end

  private

  def get_vote
    message = Message.find(params[:message_id])
    @vote = message.votes.find_or_create_by(user_id: current_user.id)
    unless @vote
      @vote = Vote.create(user_id: current_user.id, message_id: message.id)
      # message.votes << @vote
    end
  end
end
