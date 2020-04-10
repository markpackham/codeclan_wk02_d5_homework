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

  def remove_guest(guest)
    for g in @guests
      if (g.name == guest)
        @guests.delete(g)
      end
    end
  end
end
