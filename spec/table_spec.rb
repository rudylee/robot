require 'spec_helper'
require 'table'

describe "table" do
  let(:table) { Table.new(5,10) }

  it 'should be created with width and height' do
    expect(table.width).to eq 5
    expect(table.height).to eq 10
  end

  it 'should return false if position is outside the table' do
    pos = {:x => 11, :y => 5}
    expect(table.valid_pos?(pos)).to eq false
  end

  it 'should return false if position is within the table' do
    pos = {:x => 5, :y => 5}
    expect(table.valid_pos?(pos)).to eq true
  end
end
