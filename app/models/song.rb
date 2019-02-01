class Song < ApplicationRecord
  belongs_to :playlist
  validates :artist, :name, presence: true

end
