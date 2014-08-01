class MessagesController < ApplicationController
  before_action :require_login, only: [:create]

  def new
    @message = Message.new
  end

  def create
    current_user.update(last_seen_at: Time.now)

    image = ImageFile.new(message_params[:image]).decode

    message = current_user.messages.new(message_params.merge(image: image))
    online_users_html = render_to_string(partial: "online_users", locals: { online_users: User.recently_online })
    PusherClient.announce_online_users(online_users_html)

    if message.save
      message_html = render_to_string(message)
      PusherClient.send_message(message_html)

      render json: { success: true }
    else
      error_html = render_to_string(partial: "error_messages", locals: { target: message })

      render json: { error: error_html }, status: 422
    end
  end

  private

  def message_params
    params.require(:message).permit(
      :body,
      :image,
    )
  end
end
