class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # validates :title, :artist_id, :genre_id, presence: true
  # validates :title, uniqueness: { scope: [:artist_id]}

  # validates :artist_id, :genre_id, {presence: true}
  # validates :title, {presence: true, uniqueness: { scope: [:artist_id]}}

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist.try(:name)
  end

end
