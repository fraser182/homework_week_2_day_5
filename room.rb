require ('pry')

class Room

  attr_reader :room_name, :entry_price

  attr_accessor :capacity, :guests, :playlist


  def initialize (room_name, capacity, playlist)
    @room_name = room_name
    @capacity = capacity
    @playlist = playlist
    @guests = []
    @entry_price = 7
  end

  def check_in_guest(guest)
    if @guests.count < @capacity
      @guests << guest
    else
      return "The room is full."
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  def remove_song_from_playlist(song)
    @playlist.delete(song)
  end

  # def play_song(song_title)
  #   if @favourite_song == song_title
  #     return "We have #{song_title}!"
  #   else
  #     return "We dont have #{song_title}. Sorry!"
  #
  #   end
  # end




end
