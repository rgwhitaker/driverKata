require_relative '../spec_helper'
require_relative '../../lib/driving_history'

describe 'DrivingHistory' do
  before :all do
    @drivingHistory = DrivingHistory.new
    ReadInput::readInput @drivingHistory
  end

  it 'will output the correct data' do
    expect { @drivingHistory.calculateOutput }.to output("Alex: 42 miles @ 34 mph\nDan: 39 miles @ 50 mph\nBob: 0 miles\n").to_stdout
  end
end