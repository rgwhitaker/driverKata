require_relative 'driving_history'
require_relative 'readInput'
require 'test/unit'
include ReadInput

class TestDrivingHistory < Test::Unit::TestCase

  def setup
    @drivingHistory = DrivingHistory.new
    ReadInput::readInput(@drivingHistory)
    @output = @drivingHistory.calculateOutput
  end

  def testAddMotorist
    assert_nothing_thrown( Exception ) { @drivingHistory.addMotorist 'Rob' }
  end

  def testAddTrip
    assert_nothing_thrown( Exception ) { @drivingHistory.addTrip 'Natalie', '04:32', '07:00', '75' }
  end

  def testCalculateOutput
    @output
    # report contains each driver from input
    # total miles driven for each driver
    # average speed for each driver
    # drivers sorted by most miles driven to least
    # Round miles and miles per hour to the nearest integer
  end

end