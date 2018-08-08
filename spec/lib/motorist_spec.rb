require_relative '../spec_helper'
require_relative '../../lib/motorist'

describe 'Motorist' do
  before :all do
    @motorist = Motorist.new('Rob')
  end

  it 'does not have an empty name' do
    expect(@motorist.name).not_to be_empty
  end

  it 'is named Rob' do
    expect(@motorist.name).to eq 'Rob'
  end

  it 'starts with 0 miles driven' do
    expect(@motorist.milesDriven).to eq 0
  end

  it 'can have its miles added to' do
    @motorist.updateMilesDriven 21
    expect(@motorist.milesDriven).to eq(21)
  end

  it 'can have its miles added twice' do
    @motorist.updateMilesDriven 39
    expect(@motorist.milesDriven).to eq(60)
  end

  it 'will round miles added' do
    @motorist.updateMilesDriven 4.5
    expect(@motorist.milesDriven).to eq(65)
    @motorist.updateMilesDriven 0.4
    expect(@motorist.milesDriven).to eq(65)
  end
end