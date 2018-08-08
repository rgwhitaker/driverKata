require_relative "driving_history"
require 'test/unit'

class TestDrivingHistory < Test::Unit::TestCase

  def setup
    @driverList = DrivingHistory.addDriver('Rob')
  end

  def testInitialize
    # accept a file from the command line
    # assert_throws( Exception ) { DrivingHistory.new(input.txt)}
    # assert_nothing_thrown( Exception ) { DrivingHistory.new(input.txt)}
  end

  def testAddDriver
    assert_nothing_thrown( Exception ) { DrivingHistory.addDriver('Rob')}
    # register a new driver
  end

  def testAddTrip
    # record a trip attribute to an existing driver
    # return exception if driver unknown
    # trip attribute should contain start time, stop time and miles driven
    # time must be in hours:minutes format
    # discard any trips that average a speed of less than 5mph
    # discard any trips that average a speed of greater than 100mph
  end

  def testCalculateOutput
    # report contains each driver from input
    # total miles driven for each driver
    # average speed for each driver
    # drivers sorted by most miles driven to least
    # Round miles and miles per hour to the nearest integer
  end

end