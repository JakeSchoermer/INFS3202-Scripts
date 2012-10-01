#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path 


require "csv"
#require "country_code"

class Athletes

  
  @athletes = {}
  
  
	def initialize
		puts "Athelete Script"
		
		filepath = "../data_source/Athlete.csv"

    
    
    @rows = []
    data = CSV.open(filepath, :headers => true) do |line|
      line.each do |row|
        #puts header
      end
    end
    
    row.headers


  end
end


Athletes.new