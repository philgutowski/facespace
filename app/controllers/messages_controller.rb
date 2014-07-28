class MessagesController < ApplicationController
  before_action :require_login, only: [:create]

  def new
    @message = Message.new
  end

  def create
    message = current_user.messages.create(message_params)
    current_user.update(last_seen_at: Time.now)

    data = message_params[:image]

    base64_data = data.sub("data:image/png;base64,", "")
    image_data = Base64.decode64(base64_data)

    file = File.new("#{Rails.root}/tmp/uploads/image.png", 'wb')
    file.write image_data

    message = current_user.messages.create(message_params.merge(image: file))

    message_html = render_to_string(message)
    announce_online_users
    Pusher["chat_channel"].trigger('chat-event', message: message_html)

    render json: { success: true }
  end

  private

  def message_params
    params.require(:message).permit(
      :body,
      :image,
    )
  end
end
