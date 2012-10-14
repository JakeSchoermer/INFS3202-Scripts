class Countries
  include CountryCodes

  @countries = []

  def initialize
    @countries = getCountryArray
  end

  def writeOutput
    filepath = "../output/Countries.csv"


    CSV.open(filepath, "wb") do |csv|
      @countries.each_index{|i|
        csv << @countries.fetch(i)
      }
    end

  end

end