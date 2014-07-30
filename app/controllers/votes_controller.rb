class VotesController < ApplicationController
  def create
    get_vote
    @vote.value += 1 unless @vote.value == 1
    @vote.save
    redirect_to :dashboard
  end

  def update
    get_vote
    @vote.value -= 1 unless @vote.value == -1
    @vote.save
    redirect_to :dashboard
  end

  private

  def get_vote
    message = Message.find(params[:message_id])
    @vote = message.votes.find_or_create_by(user_id: current_user.id)
  end
end
