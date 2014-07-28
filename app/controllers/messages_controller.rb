class MessagesController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    message = current_user.messages.create(message_params)
    redirect_to :dashboard
  end

  private

  def message_params
    params.require(:message).permit(
      :body,
      :url,
    )
  end
end
