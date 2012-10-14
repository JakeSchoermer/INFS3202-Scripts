#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path


require "csv"
require "countries"

class Results
  include Countries

  @results = []

  def initialize

    filepath = "../data_source/Results.csv"

    rows = []

    CSV.foreach(filepath, :headers => true, :return_headers => true,
                :converters => :all)do |row|
      #puts row
      rows << row
    end
      @results = rows

  end


  def getEventId id
    @results[id]["EventID"]
  end

  def getOlympicYear id
    @results[id]["OlympicYear"]
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

  end

  def writeOutput
    filepath = "../output/Results.csv"

    CSV.open(filepath, "wb") do |csv|

      @results.each_index {|index|
        if index >0
          csv << ["#{index}", getEventId(index), getOlympicYear(index),
                  getOlympicSeason(index), getResult(index), getMedal(index)]
        end
      }

    end
  end
end