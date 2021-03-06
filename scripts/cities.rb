#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path


require "csv"
require "country_codes"


class Cities
  include CountryCodes

  @cities = []

  @countriesArray = []

  def initialize

    @countriesArray = getCountryArray

    filepath = "../data_source/City.csv"

    rows = []

    CSV.foreach(filepath, :headers => true, :return_headers => true, :converters => :all) do |row|
      #puts row
      rows << row
    end
      @cities = rows
  end

  def getCity id
    @cities[id]["City"]
  end

  def getCountry id
    country_code = @cities[id]["Region"]

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
    filepath = "../output/City.csv"

    CSV.open(filepath, "wb") do |csv|

      @cities.each_index {|index|

        if index >0
          countryFK = getCountryFk(getCountry(index), @countriesArray)

          #puts countryFK

          csv << ["#{index}", getCity(index), countryFK]
        end
      }


    end

  end

end