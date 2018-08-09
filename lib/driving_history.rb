require_relative '../lib/readInput'
include ReadInput

class DrivingHistory
  require_relative 'motorist'

  attr_reader :motorists

  def initialize
    @motorists = Array.new
  end

  def addMotorist(name)
    @motorists.push Motorist.new(name)
  end

  def addTrip(motoristName, startTime, endTime, miles)
    motorist = @motorists.find {|motorist| motorist.name === motoristName}
    averageSpeedOfTrip = calculateSpeed(endTime, startTime, miles)

    if averageSpeedOfTrip.between?(5, 100)
      motorist.trips.push(Trip.new(startTime, endTime, miles))
      motorist.updateMilesDriven miles
    end
  end

  def calculateSpeed(endTime, startTime, miles)
    duration = (Time.parse(endTime) - Time.parse(startTime)) / 3600
    return (miles.to_f / duration)
  end

  def calculateOutput
    @motorists.sort_by!(&:milesDriven).reverse!
    @motorists.each {|motorist|
      trips = motorist.trips
      totalSpeed = trips.map(&:speed).inject(0, :+)
      totalMiles = trips.map(&:miles).inject(0, :+)
      numberOfTrips = trips.count
      averageSpeedOfTrips = numberOfTrips > 0 ? (totalSpeed / numberOfTrips).round : 0

      puts numberOfTrips < 1 ? "#{motorist.name}: #{totalMiles} miles" : "#{motorist.name}: #{totalMiles} miles @ #{averageSpeedOfTrips} mph"
    }
  end
end

drivingHistory = DrivingHistory.new

ReadInput::readInput(drivingHistory)

drivingHistory.calculateOutput