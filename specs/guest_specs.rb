require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../guest.rb')
require_relative("../room.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup()

    @guest = Guest.new("Belle", 40, "We Will Rock You")

    @song_1 = Song.new("Queen", "Bohemian Rhapsody")
    @song_2 = Song.new("Queen", "We Will Rock You")

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

  def test_favourite_song
    fav_song = @guest.favourite_song_plays(@song_2.title)
    assert_equal("Yes, what a tune!",fav_song)
  end

  def test_not_favourite_song
    not_fav_song = @guest.favourite_song_plays(@song_1.title)
    assert_equal(nil, not_fav_song)
  end

end
