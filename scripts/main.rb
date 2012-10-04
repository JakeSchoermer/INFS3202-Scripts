$: << "." #Append Current Directory to Load Path

require "athletes.rb"
require "cities.rb"

puts "//========== Athletes ==========//\n"

athletes = Athletes.new

#puts athletes.printHeaders

athletes.writeOutput
puts "File Written"

puts "//========== Cities ==========//\n"