class User < ApplicationRecord
  validates :email, :device_id, presence: true
  validates :email, uniqueness: true

  def create_session
    self.token ||= SecureRandom.urlsafe_base64
  end
end
