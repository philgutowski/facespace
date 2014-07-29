class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :messages

  def mark_as_online
    update(last_seen_at: Time.now)
  end

  def recently_online
    where("last_seen_at > ?", 5.minutes.ago)
  end
end
