class User < ApplicationRecord
  validates :email, :device_id, presence: true
  validates :email, uniqueness: true
end
