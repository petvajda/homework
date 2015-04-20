#!/usr/bin/ruby -w
# Created by Peter Vajda 20.04.2015

require 'csv'
require_relative "kata04"

class WeatherData
  def self.read_file(file_name)
    @temperature_spread = Array.new
    CSV.foreach(file_name, col_sep: " ") do |row|
      begin
        @temperature_spread << [Integer(row[0]), Integer(row[2]), Integer(row[1])] if not row.empty?
      rescue ArgumentError
        # Skip header of table
      end
    end
  end

  def self.analyse
    smallest = [@temperature_spread[0][0], @temperature_spread[0][2] - @temperature_spread[0][1]]
    for row in @temperature_spread
      diff = row[2] - row[1]
      smallest = row[0], diff if diff < smallest[1]    
    end
    return smallest
  end
end
