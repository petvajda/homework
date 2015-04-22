#!/usr/bin/ruby -w
# Created by Peter Vajda 20.04.2015
# Solutions for this coding exercise:
# http://codekata.com/kata/kata04-data-munging/

require 'csv'
require_relative "kata04"
FIXNUM_MAX = (2**(0.size * 8 -2) -1)

class DataReader
  attr_accessor :data
  
  def read_file(file_name, name_i, first_i, second_i)
    @data = Array.new
    smallest = ["", FIXNUM_MAX]
    CSV.foreach(file_name, col_sep: " ") do |row|
      begin
        name          = row[name_i]
        data1         = Integer(row[first_i].chomp("*"))
        data2         = Integer(row[second_i].chomp("*"))
        diff          = (data2 - data1).abs
        smallest      = name, diff if diff < smallest[1]
        @data        << [name, data1, data2]
      rescue ArgumentError, NoMethodError
        # Skip header of table and empty lines
      end
    end
    return smallest[0]
  end
end
