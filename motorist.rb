class Motorist
  require_relative 'trip'

  def initialize(name)
    @name = name
    @trips = Array.new
  end

  attr_reader :name
  attr_reader :trips

end