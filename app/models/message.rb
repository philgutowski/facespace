class Message < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :votes, dependent: :destroy

  validates :user, presence: true
  validates :body, presence: true
  validates :image, presence: true

  def score
    votes.sum("value")
  end

  def self.top_five
    joins(:votes)
      .select("messages.*, SUM(votes.value) AS score")
      .group("messages.id")
      .order("score DESC")
      .limit(5)
  end
end
