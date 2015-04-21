#!/usr/bin/ruby -w
# Created by Peter Vajda 20.04.2015
# Solutions for this coding exercise:
# http://codekata.com/kata/kata04-data-munging/

require 'csv'
require_relative "kata04"

class DataReader
  attr_accessor :data
  
  def read_file(file_name, name_i, first_i, second_i)
    @data = Array.new
    CSV.foreach(file_name, col_sep: " ") do |row|
      begin
        @data << [
          row[name_i], 
          Integer(row[first_i].chomp("*")),
          Integer(row[second_i].chomp("*"))] unless
            row.empty? or row[name_i].nil? or row[first_i].nil? or row[second_i].nil?
      rescue ArgumentError
        # Skip header of table
      end
    end
  end
  
  def analyse
    smallest = [@data[0][0], (@data[0][2] - @data[0][1]).abs]
    for row in @data
      diff = row[2] - row[1]
      smallest = row[0], diff.abs if diff.abs < smallest[1]    
    end
    return smallest    
  end
end

class WeatherData < DataReader  
  def read_file(file_name)
    # super(file_name, 0, 2, 1)
    # Both works :-)
    super(file_name, 0, 1, 2)
  end
end

class FootballData < DataReader
  def read_file(file_name)
    super(file_name, 1, 6, 8)
  end
end