class User < ApplicationRecord
  has_many :playlists
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
