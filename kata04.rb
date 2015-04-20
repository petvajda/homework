#!/usr/bin/ruby -w
# Created by Peter Vajda 20.04.2015

require 'csv'

def read_weather_data(file_name)
  temperature_spread = Array.new
  CSV.foreach(file_name, col_sep: " ") do |row|
    begin
      temperature_spread << [Integer(row[0]), Integer(row[2]), Integer(row[1])] if not row.empty?
    rescue ArgumentError
      # Skip header of table
    end
  end
  puts temperature_spread.inspect
  return temperature_spread
end

def analyse_weather_data(data)
  smallest = [data[0][0], data[0][2] - data[0][1]]
  for row in data
    diff = row[2] - row[1]
    smallest = row[0], diff if diff < smallest[1]    
  end
  return "smallest: #{smallest}"
end

puts analyse_weather_data(read_weather_data("/Users/pvajda/Desktop/HW/weather.dat"))