class Trip
  require 'time'

  def initialize(startTime, endTime, miles)
    @startTime = startTime
    @endTime = endTime
    @miles = miles.to_f.round
    @speed = calculateSpeed(@endTime, @startTime, @miles).to_f
  end

  attr_reader :startTime
  attr_reader :endTime
  attr_reader :miles
  attr_reader :speed

  private
  def calculateSpeed(endTime, startTime, miles)
    duration = (Time.parse(endTime) - Time.parse(startTime)) / 3600
    return (miles.to_f / duration)
  end

end