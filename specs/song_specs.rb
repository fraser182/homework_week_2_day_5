require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../guest.rb')
require_relative("../room.rb")
require_relative("../song.rb")


class SongTest < MiniTest::Test

  def setup()
    @song_1 = Song.new("Queen", "Bohemian Rhapsody")
    @song_2 = Song.new("Goo Goo Dolls", "Iris")
  end


  def test_get_song_artist()
    assert_equal("Queen", @song_1.artist)

  end


  def test_get_song_name()
    assert_equal("Iris", @song_2.title)
  end


end
