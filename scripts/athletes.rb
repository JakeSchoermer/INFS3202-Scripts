#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path 


require "csv"
require "countries"

class Athletes
  include Countries
  
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
    gender = @athletes[id]["Gender"].to_s.downcase

    if gender == "male" || gender == "m"
      gender = "M"
    elsif gender == "female" || gender == "f"
      gender = "F"
    end

    gender


  end

  def getCountry id
    country_code = @athletes[id]["Country"]

    result = ""

    COUNTRY_CODES.each_key do |key|

      #Tries to get the Appropriate Shortcode for the country
      if country_code.eql? key
        result = getCountryFromCode(key)
      end
    end


    if result ==""
      result = "NO MATCH"
      puts "#{id} => #{result}"
    end
    #puts "#{id} => #{result}"
    result

  end



  def writeOutput

    filepath = "../output/Athlete.csv"

    CSV.open(filepath, "wb") do |csv|


      @athletes.each_index {|index|
        if index >0 and index <100
          csv << ["#{index}", getFirstName(index), getLastName(index), getDOB(index), getGender(index), getCountry(index)]
        end
      }


    end

  end




end