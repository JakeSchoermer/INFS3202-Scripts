$: << "." #Append Current Directory to Load Path

require "athletes"
require "cities"
require "events"
require "sports"
require "olympics"
require "results"
require "countries"

puts "//========== Athletes ==========//\n"
puts "\n"
athletes = Athletes.new
athletes.writeOutput
puts "File Written"
puts "\n"
puts "//========== Countries ==========//\n"
countries = Countries.new
countries.writeOutput
puts "File Written"
puts"\n"
puts "//========== Cities ==========//\n"
cities = Cities.new
cities.writeOutput
puts "File Written"
puts"\n"
puts "//========== Events ==========//\n"
events = Events.new
events.writeOutput
puts "File Written"
puts"\n"
puts "//========== Sports ==========//\n"
sports = Sports.new
sports.writeOutput
puts "File Written"
puts"\n"
puts "//========== Olympics ==========//\n"
olympics = Olympics.new
olympics.writeOutput
puts "File Written"
puts"\n"
puts "//========== Results ==========//\n"
results = Results.new
results.writeOutput
puts "File Written"
puts"\n"