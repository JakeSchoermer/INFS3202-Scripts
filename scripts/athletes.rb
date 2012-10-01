#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path 


require "csv"

class Athletes

  
  @athletes = []
  
  
	def initialize


		filepath = "../data_source/Athlete.csv"

    rows = []

    CSV.foreach(filepath, :headers => true, :return_headers => true, :converters => :all) do |row|
      #puts row
      rows << row
    end
      @athletes = rows
  end

  def printAllRecords
    @athletes.each do |row|
      puts "#{row}"
    end
  end

  def getHeaders

    @athletes[0]

  end

  def printHeaders

    output = ""

    @athletes.each {|word|
      output += "#{word} "
    }

  end

  def getRecord(id)

    if id > 0
      @athletes[id]
    else
      throw "Invalid Record Id"
    end
  end

  def getFirstName id
    @athletes[id]["FirstName"]
  end

  def getLastName id
    @athletes[id]["LastName"]
  end

  def getDOB id
    @athletes[id]["DateofBirth"]
  end

  def getGender id
    @athletes[id]["Gender"]
  end

  def getCountry id
    @athletes[id]["Country"]
  end



  def writeOutput

    filepath = "../output/Athlete.csv"

    CSV.open(filepath, "wb") do |csv|


      @athletes.each_index {|index|
        if index > 0
          csv << ["#{index}", getFirstName(index), getLastName(index), getDOB(index), getGender(index), getCountry(index)]
        end
      }


    end

  end




end