require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../room.rb')
require_relative ('../guest.rb')
require_relative ('../song.rb')


class RoomTest < MiniTest::Test

  def setup()
    @guest_1 = Guest.new("Fraser", 20, "Under Pressure")
    @guest_2 = Guest.new("Lindsay", 30, "Somebody To Love")
    @guest_3 = Guest.new("Belle", 9 , "We Will Rock You")

    @guestlist = [@guest_1, @guest_2]

    @song_1 = Song.new("Queen", "Under Pressure", 1982)
    @song_2 = Song.new("Goo Goo Dolls", "Iris", 1998)
    @song_3 = Song.new("Bee Gees", "Stayin' Alive", 1977)
    @song_4 = Song.new("AC/DC", "Thunderstruck", 1990)
    @song_5 = Song.new("Journey", "Don't Stop Believin'", 1982)

    @playlist_1 = [@song_1, @song_2, @song_3]
    @playlist_2 = [@song_3, @song_4, @song_5]


    @room = Room.new("Blue Room",5, @playlist_1)

  end


  def test_room_name()
    assert_equal("Blue Room", @room.room_name)
  end


  def test_room_capacity()
    assert_equal(5, @room.capacity)
  end

  def test_room_starts_empty()
    initial_guests = @room.guests.length
    assert_equal(0, initial_guests)
  end

  def test_add_guest_to_room()
    @room.check_in_guest(@guest_1)
    assert_equal(1, @room.guests.length)
  end

  def test_remove_guest_from_room()
    @room.check_in_guest(@guest_1)
    @room.check_in_guest(@guest_2)
    @room.check_out_guest(@guest_2)
    assert_equal([@guest_1], @room.guests)
  end

  def test_add_song_to_room()
    song = Song.new("Iron Maiden", "Wickerman", 2000)
    @room.add_song_to_playlist(song)
    assert_equal(@playlist_1, @room.playlist)
  end

  def test_remove_song_from_room()
    @room.remove_song_from_playlist(@song_3)
    assert_equal(@playlist_1, @room.playlist)
  end


  def test_can_play_song_from_playlist
    assert_equal("Under Pressure", @room.play_song(@song_1))
  end


  def test_add_guest_to_full_room
    room = Room.new("Small Yellow Room",2, @playlist_1)
    room.check_in_guest(@guest_1)
    room.check_in_guest(@guest_2)
    assert_equal("The room is full.", room.check_in_guest(@guest_3))
  end

  # def test_find_songs_from_the_80s_from_playlist_1
  #   songs = @room.songs_from_the_80s(@playlist_1)
  #   assert_equal()
  # end


end
