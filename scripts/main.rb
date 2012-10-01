$: << "." #Append Current Directory to Load Path

require "athletes.rb"

puts "Athletes"

Athletes = Athletes.new

puts Athletes.getRecord(1)

Athletes.listHeaders