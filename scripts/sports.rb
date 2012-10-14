#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path 


require "csv"
require "country_codes"

class Sports
  include CountryCodes

  @sports = []

  
	def initialize
		filepath = "../data_source/Sports.csv"

    rows = []

    CSV.foreach(filepath, :headers => true, :return_headers => true, :converters => :all) do |row|
      #puts row
      rows << row
    end
      @sports = rows
  end

  def getSportName id
    @sports[id]["Sport"]
  end

  def getDescription id
    @sports[id]["Description"]
  end


  def writeOutput
    filepath = "../output/Sport.csv"

    CSV.open(filepath, "wb") do |csv|


      @sports.each_index {|index|
        if index >0
          csv << ["#{index}", getSportName(index), getDescription(index)]
        end
      }

    end
  end
end