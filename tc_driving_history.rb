require_relative "driving_history"
require 'test/unit'

class TestDrivingHistory < Test::Unit::TestCase

  def testReadFile
    #accept a file from the command line
  end

  def testAddDriver
    #register a new driver
  end

  def testAddTrip
    #record a trip attribute to an existing driver
    # return exception if driver unknown
    # trip attribute should contain start time, stop time and miles driven
    # time must be in hours:minutes format
    # discard any trips that average a speed of less than 5mph
    # discard any trips that average a speed of greater than 100mph
  end

  def testCalculateOutput
    #report contains each driver from input
    # total miles driven for each driver
    # average speed for each driver
    # drivers sorted by most miles driven to least
    # Round miles and miles per hour to the nearest integer
  end

end