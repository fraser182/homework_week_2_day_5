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

  def play_song(song_title)
     for song in @playlist
       if song_title == song
         return "Under Pressure"
       else
         return "Song not available"
       end
     end
   end

# def songs_from_the_80s(@playlist_1)
#
# end



end
