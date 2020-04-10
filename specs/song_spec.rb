require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../song")

class TestSong < Minitest::Test
  def setup
    # Songs
    @song1 = Song.new("Sadie", "Alkaline Trio")
    @song2 = Song.new("Meant To Be", "Blaze Bayley")
    @song3 = Song.new("Alice Cooper", "Former Lee Warner")
  end

  def test_get_song_name
    assert_equal("Sadie", @song1.name)
  end

  def test_get_artist
    assert_equal("Alkaline Trio", @song1.artist)
  end
end
