class WebSockets::AuthorizationController < WebsocketRails::BaseController

  def get_channel_key
    if user_signed_in?
      key = current_user.channel_key
      WebsocketRails[key].make_private
      send_message :key, key, :namespace => :user
    else
      send_message :key, nil, :namespace => :user
    end
  end

  def authorize_user_channel
    if user_signed_in? and current_user.channel_key == message[:channel]
      if current_user.seen == 1
        WebsocketRails[:online_users].trigger "seen", current_user
      end
      accept_channel nil
    else
      deny_channel nil
    end
  end

  def client_disconnected
    if current_user.left <= 0
      WebsocketRails[:online_users].trigger "left", current_user
    end
  end

end
