require "test/unit"
require_relative "kata04"
 
class TestKata04 < Test::Unit::TestCase
 
  def test_weather
  	d = WeatherData.read_file("/Users/pvajda/Desktop/HW/weather.dat")
    assert_equal([14, 2], WeatherData.analyse())
  end
 
end