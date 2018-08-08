class DrivingHistory
  require_relative 'motorist'

  def initialize
    @motorists = Array.new
  end

  def addMotorist(name)
    @motorists.push Motorist.new(name)
  end

  def addTrip(motoristName, startTime, endTime, miles)
    motorist = @motorists.find { |motorist| motorist.name === motoristName}
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
    @motorists.each { |motorist|
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

def readInput(drivingHistory)
  text = File.open('input.txt').read
  text.each_line do |line|
    commands = line.to_s.split ' '
    if commands[0] === 'Driver'
      drivingHistory.addMotorist commands[1]
    elsif commands[0] === 'Trip'
      drivingHistory.addTrip(commands[1], commands[2], commands[3], commands[4])
    else
      puts "#{commands[0]} is not a valid command"
    end
  end
end

readInput(drivingHistory)

drivingHistory.calculateOutput