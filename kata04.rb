#!/usr/bin/ruby -w
# Created by Peter Vajda 20.04.2015
# Solutions for this coding exercise:
# http://codekata.com/kata/kata04-data-munging/

require 'csv'
require_relative "kata04"

class WeatherData
  attr_accessor :temperature_spread
  
  def read_file(file_name)
    @temperature_spread = Array.new
    CSV.foreach(file_name, col_sep: " ") do |row|
      begin
        @temperature_spread << [
          Integer(row[0].chomp("*")), 
          Integer(row[2].chomp("*")),
          Integer(row[1].chomp("*"))] if not row.empty?
      rescue ArgumentError
        # Skip header of table
      end
    end
  end

  def analyse
    smallest = [@temperature_spread[0][0], @temperature_spread[0][2] - @temperature_spread[0][1]]
    for row in @temperature_spread
      diff = row[2] - row[1]
      smallest = row[0], diff if diff < smallest[1]    
    end
    return smallest
  end
end
