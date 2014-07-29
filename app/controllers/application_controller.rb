class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def announce_online_users
    online_users_html = render_to_string(partial: "online_users", locals: { online_users: User.recently_online })
    Pusher["chat_channel"].trigger('online-users-event', message: online_users_html)
  end
end
