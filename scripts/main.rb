$: << "." #Append Current Directory to Load Path

require "athletes"
require "cities"

puts "//========== Athletes ==========//\n"

athletes = Athletes.new

#puts athletes.printHeaders

athletes.writeOutput
puts "File Written"

puts "//========== Cities ==========//\n"