module ReadInput
  def readInput(drivingHistory)
    text = ARGV.empty? ? File.open('input.txt').read : File.open(ARGV[0])
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
end