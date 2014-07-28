require 'pusher'

Pusher.app_id = 'ID'
Pusher.key = 'KEY'
Pusher.secret = 'SECRET'

class HelloworldController < ApplicationController
  def hello_world
    Pusher.trigger('chatspace', 'event', {:message => 'hello world'})
  end
end
