class Song

  attr_reader :artist, :title, :release_date

  def initialize(artist, title, release_date)
    @artist = artist
    @title = title
    @release_date = release_date
  end


end
