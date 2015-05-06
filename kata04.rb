#!/usr/bin/ruby -w
# Created by Peter Vajda 20.04.2015
# Solutions for this coding exercise:
# http://codekata.com/kata/kata04-data-munging/

require 'csv'

class DataReader
  attr_accessor :data
  
  def read_file(file_name, name_i, first_i, second_i)
    @data    = Array.new
    firstrun = true
    smallest = []
    CSV.foreach(file_name, col_sep: " ", :headers => true) do |row|
      begin
        name                 = row[name_i]
        data1                = Integer(row[first_i].chomp("*"))
        data2                = Integer(row[second_i].chomp("*"))
        diff                 = (data2 - data1).abs        
        if firstrun
          smallest, firstrun = [row[name_i], diff], false
        else
          smallest           = name, diff if diff < smallest[1]
        end        
        @data               << [name, data1, data2]
      rescue ArgumentError, NoMethodError
        # Skip header of table and empty lines
      end
    end
    return smallest[0]
  end
end
