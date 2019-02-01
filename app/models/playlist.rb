class Playlist < ApplicationRecord
  belongs_to :user
  has_many :songs
  validates :name, precense: true, uniqueness: true
end
