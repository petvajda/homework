require "test/unit"
require_relative "kata04"
 
class TestKata04 < Test::Unit::TestCase
 
  def test_weather
  	d = WeatherData.new
    d.read_file("weather.dat")
    assert_equal([14, 2], d.analyse())
    assert_equal(30, d.temperature_spread.length)
  end
  
  def test_football
  	d = FootballData.new
    d.read_file("football.dat")
    assert_equal(20, d.difference.length)
  end
end