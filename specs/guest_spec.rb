require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")

class TestGuest < Minitest::Test
  def setup
    # Guests
    @guest1 = Guest.new("Alex", 10)
    @guest2 = Guest.new("Bob", 20)
    @guest3 = Guest.new("Carlos", 30)
  end

  def test_get_guest_name
    assert_equal("Alex", @guest1.name)
  end

  def test_get_guest_cash
    assert_equal(10, @guest1.cash)
  end
end
