class Room
  attr_reader(:name, :songs, :guests)

  def initialize(name)
    @name = name
    @songs = []
    @guests = []
  end

  def add_song(song)
    @songs << song
  end

  def add_guest(guest)
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
