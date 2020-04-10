require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../room")
require_relative("../song")

class TestRoom < Minitest::Test
  def setup
    # Rooms
    @room1 = Room.new("Red Room", 1, 5)
    @room2 = Room.new("Velvet Room", 2, 10)
    @room3 = Room.new("The Quiet Room", 3, 15)
    @room4 = Room.new("The Forbidden Room", 4, 2)
    @room5 = Room.new("Illuminati Chamber", 500000, 50)
    # Guests
    @guest1 = Guest.new("Alex", 10)
    @guest2 = Guest.new("Bob", 20)
    @guest3 = Guest.new("Carlos", 30)
    @guest4 = Guest.new("Dave", 40)
    @guest5 = Guest.new("Ed", 50)
    @guest6 = Guest.new("Frank", 60)
    # Songs
    @song1 = Song.new("Sadie", "Alkaline Trio")
    @song2 = Song.new("Meant To Be", "Blaze Bayley")
    @song3 = Song.new("Former Lee Warner", "Alice Cooper")
  end

  def test_get_room_name
    assert_equal("Red Room", @room1.name)
  end

  def test_get_fee
    assert_equal(1, @room1.fee)
  end

  def test_guest_limit
    assert_equal(5, @room1.guest_limit)
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

  def test_list_song_names()
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    @room1.add_song(@song3)
    assert_equal(["Sadie", "Meant To Be", "Former Lee Warner"],@room1.list_song_names())
  end

  def test_list_song_names_no_songs_added()
    assert_equal("The room has no songs",@room1.list_song_names())
  end

  def test_list_artist_names()
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    @room1.add_song(@song3)
    assert_equal(["Alkaline Trio", "Blaze Bayley", "Alice Cooper"],@room1.list_artist_names())
  end

  def test_list_artist_names_no_songs_added()
    assert_equal("The room has no songs",@room1.list_artist_names())
  end

  def test_add_guests()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    assert_equal(2, @room1.guests.length)
  end

  def test_find_guest_by_name()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
   assert_equal("Bob", @room1.find_guest_by_name("Bob"))
  end

  # prove that guest pays fee after being added to room
  def test_find_guest_cash_after_fee_paid()
    # Bob has 20 originally & room fee is 1
    @room1.add_guest(@guest2)
   assert_equal(19, @room1.find_guest_cash("Bob"))
  end

  def test_remove_last_guest()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    # duplicate value for guest 1 so remove
    @room1.add_guest(@guest1)
    @room1.remove_last_guest()
    assert_equal(3, @room1.guests.length)
  end

  def test_remove_specific_guest()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.remove_specific_guest("Bob")
    assert_equal(1, @room1.guests.length)
  end

  def test_if_room_already_full()
    @room4.add_guest(@guest1)
    @room4.add_guest(@guest2)
    @room4.add_guest(@guest3)
    @room4.add_guest(@guest4)
    @room4.add_guest(@guest5)
    @room4.add_guest(@guest6)
    assert_equal(2, @room4.guests.length)
  end

  def test_if_guest_cannot_afford_room
    assert_equal("You can't afford the fee", @room5.add_guest(@guest3))
  end
end
