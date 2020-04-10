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

  def add_guest(guest)
    return "Sorry this room is full" if (@guests.length >= @guest_limit)
    return "You can't afford the fee" if (@fee > guest.cash)

    guest.cash -= @fee
    @guests << guest
  end

  def remove_last_guest
    @guests.pop()
  end

  def remove_specific_guest(guest_name)
    for g in @guests
      if (g.name == guest_name)
        @guests.delete(g)
      end
    end
  end
end
