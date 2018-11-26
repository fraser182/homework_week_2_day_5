require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../guest.rb')
require_relative("../room.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup()

    @guest = Guest.new("Belle", 40, "Iris")

    @song_1 = Song.new("Queen", "Under Pressure", 1982)
    @song_2 = Song.new("Goo Goo Dolls", "Iris", 1998)
    @song_3 = Song.new("Bee Gees", "Stayin' Alive", 1977)

    @playlist_1 = [@song_1, @song_2, @song_3]

    @room = Room.new("Purple Room",5, [@song_1, @song_2])

  end

  def test_guest_name()
    assert_equal("Belle", @guest.name)
  end


  def test_how_much_money_guest_has()
    assert_equal(40, @guest.money)
  end


  def test_can_afford_entry
    assert_equal(true, @guest.can_afford_entry(@room))
  end


  def test_cannot_afford_entry
    guest = Guest.new("Jacob", 3, "One")
    assert_equal(false, guest.can_afford_entry(@room))
  end

  def test_favourite_song_available
    assert_equal("Iris", @guest.favourite_song)
  end

  def test_favourite_song_plays
    fav_song = @guest.favourite_song_plays(@song_2.title)
    assert_equal("Yes, what a tune!",fav_song)
  end



end
