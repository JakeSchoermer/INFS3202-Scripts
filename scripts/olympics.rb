#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path


require "csv"
require "countries"

class Olympics
  include Countries

  @olympics = []

  def initialize

    rows = []

    #Olympiads

    year = 1896
    id = 1

    until year == 2012

      row = [id, year, getSeason(year)]
      rows << row

      year += 1
      id += 1
    end

    @olympics = rows

  end

  private
  def getSeason year

    season =1

    if year%4<2
      season = 1
    else
      season = 2
    end
  end

  public
  def writeOutput
    filepath = "../output/Olympics.csv"

    CSV.open(filepath, "wb") do |csv|

      @olympics.each {|row|
          csv << row
      }

    end
  end
end