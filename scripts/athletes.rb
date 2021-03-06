#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path 


require "csv"
require "country_codes"
require "sports"

class Athletes
  include CountryCodes
  
  @athletes = []
  @sports = Sports.new
  @countriesArray = []

	def initialize

    @countriesArray = getCountryArray

    filepath = "../data_source/Athlete.csv"

    rows = []

    CSV.foreach(filepath, :headers => true, :return_headers => true, :converters => :all) do |row|
      #puts row
      rows << row
    end
      @athletes = rows
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

    if @athletes[id]["DateOfBirth"] != nil

      dob = @athletes[id]["DateOfBirth"].to_s.split[0]
      dob = dob.split("/")

      output = dob[2]+"/"+dob[1]+"/"+dob[0]

      output
    else
      ""
    end
  end

  def getGender id
    gender = @athletes[id]["Gender"].to_s.downcase

    if gender == "male" || gender == "m"
      return "M"
    elsif gender == "female" || gender == "f"
      return "F"
    else
      return nil
    end


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
      puts "#{id} => #{result} => #{country_code}"
    end
    result

  end

  def writeOutput
    filepath = "../output/Athlete.csv"

    CSV.open(filepath, "wb") do |csv|

      @athletes.each_index {|index|

        if index >0
          countryFK = getCountryFk(getCountry(index), @countriesArray)

          #puts countryFK

          csv << ["#{index}", getFirstName(index), getLastName(index),
                  getDOB(index), getGender(index), countryFK]
        end
      }


    end
  end
end