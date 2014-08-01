class PusherClient
  def self.announce_online_users(online_users_html)
    Pusher["chat_channel"].trigger('online-users-event', message: online_users_html)
  end
 
  def self.send_message(message_html)
    Pusher["chat_channel"].trigger('chat-event', message: message_html)
  end
end
