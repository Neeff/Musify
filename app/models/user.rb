class User < ApplicationRecord
  has_many :playlists
  validates :name, :email, precence: true
  validates :email, uniqueness: true
end
