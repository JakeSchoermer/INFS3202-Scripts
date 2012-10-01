#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path 


require "csv"

class Athletes

  
  @athletes = []
  
  
	def initialize


		filepath = "../data_source/Athlete.csv"

    rows = []

    CSV.foreach(filepath, :headers => true) do |row|
      #puts row
      rows << row
    end
      @athletes = rows
  end


  def getRecord(id)

    @athletes.sele

  end

  def listHeaders


  end




end