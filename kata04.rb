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
          Integer(row[second_i].chomp("*"))
        ]                
      rescue ArgumentError, NoMethodError
        # Skip header of table and empty lines
      end
    end
  end
  
  def analyse
    smallest = [@data[0][0], (@data[0][2] - @data[0][1]).abs]
    for row in @data
      diff = (row[2] - row[1]).abs
      smallest = row[0], diff if diff < smallest[1]    
    end
    return smallest    
  end
end
