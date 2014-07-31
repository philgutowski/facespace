class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  validates :value, presence: true
  validates :user, presence: true
  validates :message, presence: true
end
