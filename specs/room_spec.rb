require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")

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

  def test_get_room
    assert_equal("Red Room", @room1.name)
  end

  def test_get_songs
    assert_equal([], @room1.songs)
  end

  def test_get_guests
    assert_equal([], @room1.guests)
  end
end
