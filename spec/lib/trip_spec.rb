require_relative '../spec_helper'
require_relative '../../lib/trip'

describe 'Trip' do
  before :all do
    @trip = Trip.new('07:15', '08:15', '35.8')
  end

  it 'has a start time' do
    expect(@trip.startTime).not_to be_empty
    expect(@trip.startTime).to eq('07:15')
  end

  it 'has an end time' do
    expect(@trip.endTime).not_to be_empty
    expect(@trip.endTime).to eq('08:15')
  end

  it 'has miles driven rounded' do
    expect(@trip.miles).to eq(36)
  end

  it 'has an average speed' do
    expect(@trip.speed).to eq(36)
  end

  describe 'calculateSpeed' do
    it 'returns the time in hours between two points in time' do
      expect(@trip.calculateSpeed('08:15', '07:15', 36)).to eq(36)
      expect(@trip.calculateSpeed('09:13', '08:01', 32)).to eq(27)
      expect(@trip.calculateSpeed('15:32', '11:44', 321)).to eq(84)
    end
  end
end