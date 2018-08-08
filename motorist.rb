class Motorist
  require_relative 'trip'

  def initialize(name)
    @name = name
    @trips = Array.new
    @milesDriven = 0
  end

  def updateMilesDriven(miles)
    @milesDriven += miles.to_f.round
  end

  attr_reader :name
  attr_reader :trips
  attr_reader :milesDriven

end