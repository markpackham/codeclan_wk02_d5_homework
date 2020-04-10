require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")

class TestGuest < Minitest::Test
  def setup
    # Guests
    @guest1 = Guest.new("Alex", 10, "Former Lee Warner")
    @guest2 = Guest.new("Bob", 20, "Park Life")
    @guest3 = Guest.new("Carlos", 30, "Beautiful People")
  end

  def test_get_guest_name
    assert_equal("Alex", @guest1.name)
  end

  def test_get_guest_cash
    assert_equal(10, @guest1.cash)
  end

  def test_get_fav_song
    assert_equal("Beautiful People", @guest3.fav_song)
  end
end
