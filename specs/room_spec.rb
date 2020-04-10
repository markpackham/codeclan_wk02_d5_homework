require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../room")
require_relative("../song")

class TestRoom < Minitest::Test
  def setup
    # Rooms
    @room1 = Room.new("Red Room")
    @room2 = Room.new("Velvet Room")
    @room3 = Room.new("The Quiet Room")
    @room4 = Room.new("The Forbidden Room")
    # Guests
    @guest = Guest.new("Alex")
    @guest = Guest.new("Bob")
    @guest = Guest.new("Carlos")
    # Songs
    @song1 = Song.new("Sadie", "Alkaline Trio")
    @song2 = Song.new("Meant To Be", "Blaze Bayley")
    @song3 = Song.new("Alice Cooper", "Former Lee Warner")
  end

  def test_get_room_name
    assert_equal("Red Room", @room1.name)
  end

  def test_get_songs
    assert_equal([], @room1.songs)
  end

  def test_get_guests
    assert_equal([], @room1.guests)
  end

  def test_add_songs()
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    @room1.add_song(@song3)
    assert_equal(3, @room1.songs.length)
  end

  def test_add_guests()
    @room1.add_guest(@guest)
    @room1.add_guest(@guest)
    assert_equal(2, @room1.guests.length)
  end
end
