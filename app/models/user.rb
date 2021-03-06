class User < ApplicationRecord
  # validates :email, presence: true
  # validates :email, uniqueness: true
  validates :device_id, uniqueness: true

  def create_session
    self.token ||= SecureRandom.urlsafe_base64
  end
end
