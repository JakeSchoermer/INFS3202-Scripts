class Countries
  include CountryCodes

  @countries = []

  def initialize

    countryList = []
    countryId = 1

    COUNTRY_CODES.select{|key, value|
      found = false

      #See if country is already stored
      countryList.each{|item|
        if item == value
          found = true
        end
      }

      #If still not found
      if found == false
        countryList << [countryId, value]
      end

      countryId+=1
    }

    @countries = countryList

    #puts countryList

  end

  def writeOutput
    filepath = "../output/Countries.csv"

    puts @countries.class

    CSV.open(filepath, "wb") do |csv|
      @countries.each_index{|i|
        csv << @countries.fetch(i)
      }
    end

  end

end