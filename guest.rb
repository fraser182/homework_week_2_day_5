class Guest

attr_reader :name

attr_accessor :money,:favourite_song

  def initialize (name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
  end


  def can_afford_entry(room)
     money >= room.entry_price
   end



     def favourite_song_plays(song)
       if @favourite_song == song
         return "Yes, what a tune!"
       else
         return nil
       end
     end


end
