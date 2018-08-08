class Trip
  require 'date'
  require 'time'

  def initialize(startTime, endTime, miles)
    @startTime = startTime
    @endTime = endTime
    @miles = miles.to_i
    @speed = calculateSpeed
  end

  attr_reader :startTime
  attr_reader :endTime
  attr_reader :miles
  attr_reader :speed

  private
  def calculateSpeed
    duration = (Time.parse(@endTime) - Time.parse(@startTime)) / 3600
    return (@miles.to_i / duration)
  end

end