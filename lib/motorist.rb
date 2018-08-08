class Motorist
  require_relative 'trip'

  attr_reader :name
  attr_reader :trips
  attr_reader :milesDriven

  def initialize(name)
    @name = name
    @trips = Array.new
    @milesDriven = 0
  end

  def updateMilesDriven(miles)
    @milesDriven += miles.to_f.round
  end


end