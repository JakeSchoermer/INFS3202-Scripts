$: << "." #Append Current Directory to Load Path

require "athletes.rb"

puts "//========== Athletes ==========//"

athletes = Athletes.new

puts athletes.printHeaders

athletes.writeOutput
puts "File Written"

#puts athletes.getRecord(1)

#Athletes.listHeaders