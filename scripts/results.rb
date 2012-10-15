#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path


require "csv"
require "country_codes"
require 'ruby-debug'

class Results
  include CountryCodes

  @results = []
  @athletes = []
  @events = []
  @olympics = []

  def initialize

    filepath = "../data_source/Results.csv"

    rows = []

    CSV.foreach(filepath, :headers => true, :return_headers => true,
                :converters => :all) do |row|
      #puts row
      rows << row
    end
      @results = rows

      rows = []

      ##### ATHLETES ######
      filepath = "../output/Athlete.csv"

      CSV.foreach(filepath, :headers => true, :return_headers => true,
            :converters => :all) do |row|
          #puts row
          rows << row
      end

      @athletes = rows

      ###### EVENTS #######
      rows = []
      filepath = "../output/Event.csv"

      CSV.foreach(filepath, :headers => true, :return_headers => true,
            :converters => :all) do |row|
          #puts row
          rows << row
      end

      @events = rows

      ####### OLYMPICS #######
      rows = []
       filepath = "../output/Olympics.csv"

       newRows = []
      CSV.foreach(filepath, :headers => true, :return_headers => true,
            :converters => :all) do |row|
          #puts row
          newRows << row
      end
      
      @olympics = newRows




  end

  def getEventId id
    @results[id]["EventID"]
  end

  def getOlympicId id
    #@results[id]["OlympicYear"]
    currentI = 0
    for i in 0...@olympics.length
      #LOL 1896
      
      if @olympics[i]["1896"].to_s == @results[id]["OlympicYear"].to_s
        
        return @olympics[i]["1"]
      else
        puts @olympics[i][1].to_s + " . " + @results[id]["OlympicYear"].to_s
        next
      end
    end

    


  end

  def getOlympicSeason id
    @results[id]["OlympicSeason"]
  end

  def getResult id
    result = @results[id]["Result"]

    if result.to_s.downcase == "n/a"
      ""
    else
      result
    end
  end

  def getMedal id
    medal = @results[id]["Medal"].to_s.upcase

    if medal != "GOLD" and medal != "SILVER" and medal != "BRONZE" and medal != ""
      puts "Medal with ID #{id} is invalid - has value #{medal}"
    end
    
    return medal

  end

  def writeOutput
    filepath = "../output/Results.csv"

    CSV.open(filepath, "wb") do |csv|

      @results.each_index {|index|
        if index >0
          csv << ["#{index}", getEventId(index), getOlympicId(index), getResult(index), getMedal(index)]
        end
      }

    end
  end
end