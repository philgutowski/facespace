class Message < ActiveRecord::Base
  validates :body, presence: true
  validates :url, presence: true
end
