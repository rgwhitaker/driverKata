require_relative '../spec_helper'
require_relative '../../lib/motorist'

describe 'Motorist' do

  it 'does not have an empty name' do
    motorist = Motorist.new('Rob')
    expect(motorist.name).not_to be_empty
  end

  it 'is named Rob' do
    motorist = Motorist.new('Rob')
    expect(motorist.name).to eq 'Rob'
  end

  it 'starts with 0 miles driven' do
    motorist = Motorist.new('Rob')
    expect(motorist.milesDriven).to eq 0
  end

end