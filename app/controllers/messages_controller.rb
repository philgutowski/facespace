class MessagesController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    message = current_user.messages.create(message_params)
    message_html = render_to_string(message)

    Pusher["chat_channel"].trigger('chat-event', message: message_html)

    render json: { success: true }
  end

  private

  def message_params
    params.require(:message).permit(
      :body,
      :url,
    )
  end
end
