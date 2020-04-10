class Room
  attr_reader(:name, :fee, :songs, :guests)

  def initialize(name, fee)
    @name = name
    @fee = fee
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
