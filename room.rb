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

  def list_song_names()
    song_names = []
    for song in @songs
      song_names << song.name
    end
    return song_names
  end

  def list_artist_names()
    artist_names = []
    for song in @songs
      artist_names << song.artist
    end
    return artist_names
  end

  def add_guest(guest)
    return "Sorry this room is full" if (@guests.length >= @guest_limit)
    return "You can't afford the fee" if (@fee > guest.cash)

    guest.cash -= @fee
    @guests << guest
  end

  def find_guest_by_name(guest_name)
    the_guest = @guests.find{ |guest| guest.name == guest_name}
    return the_guest.name
  end

  def find_guest_cash(guest_name)
    the_guest = @guests.find{ |guest| guest.name == guest_name}
    return the_guest.cash
  end

  def remove_last_guest
    @guests.pop()
  end

  def remove_specific_guest(guest_name)
    for guest in @guests
      if (guest.name == guest_name)
        @guests.delete(guest)
      end
    end
  end
end
