#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path 


require "csv"
require "countries"

class Events
  include Countries
  
  @events = []

  
	def initialize
		filepath = "../data_source/Event.csv"

    rows = []

    CSV.foreach(filepath, :headers => true, :return_headers => true, :converters => :all) do |row|
      #puts row
      rows << row
    end
      @events = rows
  end

  def getEventName id
    @events[id]["EventName"]
  end

  def getSport id
    @events[id]["Sport"]
  end

  def getType id
    @events[id]["Type"]
  end

  def writeOutput
    filepath = "../output/Event.csv"

    CSV.open(filepath, "wb") do |csv|


      @events.each_index {|index|
        if index >0
          csv << ["#{index}", getEventName(index), getSport(index), getType(index)]
        end
      }


    end
  end
end