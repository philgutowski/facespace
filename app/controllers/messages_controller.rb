class MessagesController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    message = current_user.messages.create(message_params)
    Pusher["chat_channel"].trigger('chat-event', message: message.body)
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
