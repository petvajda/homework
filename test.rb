require "test/unit"
require_relative "kata04"
 
class TestKata04 < Test::Unit::TestCase
 
  def test_weather
  	d = DataReader.new
    d.read_file("weather.dat", 0, 1, 2)
    assert_equal(30, d.data.length)
    assert_equal(["14", 2], d.analyse())
  end

  def test_football
  	d = DataReader.new
    d.read_file("football.dat", 1, 6, 8)
    assert_equal(20, d.data.length)
    assert_equal(["Aston_Villa", 1], d.analyse())
  end
end
