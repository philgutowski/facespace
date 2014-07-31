class Vote < ActiveRecord::Base
  belongs_to :user

  validates :value, presence: true
  validates :user, presence: true
  validates :message_id, presence: true
end
