class Message < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :user, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
