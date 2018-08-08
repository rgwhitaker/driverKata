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
    motorist.trips.push Trip.new(startTime, endTime, miles)
  end

  def calculateOutput
    @motorists.each { |motorist|
      trips = motorist.trips
      totalSpeed = trips.map(&:speed).inject(0, :+)
      totalMiles = trips.map(&:miles).inject(0, :+)
      numberOfTrips = trips.count
      averageSpeed = numberOfTrips > 0 ? (totalSpeed / numberOfTrips).round : 0

      puts "#{motorist.name}: #{totalMiles} @ #{averageSpeed} mph"
    }
  end
end

dh = DrivingHistory.new

text = File.open('input.txt').read
text.each_line do |line|
  commands = line.to_s.split ' '
  if commands[0] === 'Driver'
    dh.addMotorist commands[1]
  elsif commands[0] === 'Trip'
    dh.addTrip(commands[1], commands[2], commands[3], commands[4])
  else
    puts "#{commands[0]} is not a valid command"
  end
end

dh.calculateOutput