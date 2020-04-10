require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")

class TestGuest < Minitest::Test
  def setup
    # Guests
    @guest = Guest.new("Alex")
    @guest = Guest.new("Bob")
    @guest = Guest.new("Carlos")
  end

  def get_guest_name
    assert_equal("Alex", @guest.name)
  end
end
