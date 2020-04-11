class Room
  attr_reader(:name, :fee, :guest_limit, :songs, :guests)

  def initialize(name, fee, guest_limit)
    @name = name
    @fee = fee
    @guest_limit = guest_limit
    @songs = []
    @guests = []
  end

  def add_song(song)
    @songs << song
  end

  # def list_song_names()
  #   song_names = []
  #   for song in @songs
  #     song_names << song.name
  #   end
  #   return song_names
  # end

  def list_song_names()
    song_array = @songs.map { |song| song.name }
    return song_array if (song_array.length > 0)
    return "The room has no songs"
  end

  # def list_artist_names()
  #   artist_names = []
  #   for song in @songs
  #     artist_names << song.artist
  #   end
  #   return artist_names
  # end

  def list_artist_names()
    artist_array = @songs.map { |song| song.artist }
    return artist_array if (artist_array.length > 0)
    return "The room has no songs"
  end

  def add_guest(guest)
    return "Sorry this room is full" if (@guests.length >= @guest_limit)
    return "You can't afford the fee" if (@fee > guest.cash)

    guest.cash -= @fee
    @guests << guest
  end

  def find_guest_details(guest_name)
    the_guest = @guests.find { |guest| guest.name == guest_name }
    return "Guest does not exist" if (the_guest == nil)
    return the_guest
  end

  def find_guest_by_name(guest_name)
    the_guest = @guests.find { |guest| guest.name == guest_name }
    return "Guest does not exist" if (the_guest == nil)
    return the_guest.name
  end

  def find_guest_cash(guest_name)
    the_guest = @guests.find { |guest| guest.name == guest_name }
    return the_guest.cash
  end

  # def fav_song_check(guest_name)
  #     fav_song = guest_name.fav_song
  #     for song in @songs
  #       if(song.name == fav_song)
  #           return "Whoo!"
  #       else
  #           return "Boo!"
  #       end
  #     end
  # end

  def fav_song_check(guest_name)
    fav_song = guest_name.fav_song
    return "Whoo!" if (@songs.find { |song| song.name == fav_song })
    return "Boo!"
  end

  def remove_last_guest
    @guests.pop()
  end

  def remove_specific_guest(guest_name)
    guest = find_guest_details(guest_name)
    @guests.delete(guest)
    # for guest in @guests
    #   if (guest.name == guest_name)
    #     @guests.delete(guest)
    #   end
    # end
  end
end
