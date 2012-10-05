$: << "." #Append Current Directory to Load Path

require "athletes"
require "cities"

puts "//========== Athletes ==========//\n"
puts "\n"
#athletes = Athletes.new
#athletes.writeOutput
#puts "File Written"
puts "\n"
puts "//========== Cities ==========//\n"
cities = Cities.new
cities.writeOutput
puts"File Written"
puts"\n"