require 'spec_helper'
require 'robot'

describe "robot" do
  let(:robot) { Robot.new }

  it 'should be created with on_table false' do
    expect(robot.on_table).to eq false
  end

  it 'should be able to be put on a table' do
    robot.put(2, 4, :EAST)
    expect(robot.x).to eq 2
    expect(robot.y).to eq 4
    expect(robot.facing).to eq :EAST
  end

  context 'rotate' do
    before(:each) do
      @robot = Robot.new
      pos = @robot.put(2, 4, :SOUTH)
    end

    it 'should change direction to EAST when rotated LEFT' do
      @robot.rotate(:LEFT)
      expect(@robot.facing).to eq :EAST
    end

    it 'should change direction to WEST when rotated RIGHT' do
      @robot.rotate(:RIGHT)
      expect(@robot.facing).to eq :WEST
    end

    it 'should change direction to NORTH when rotated RIGHT twice' do
      @robot.rotate(:RIGHT)
      @robot.rotate(:RIGHT)
      expect(@robot.facing).to eq :NORTH
    end

    it 'should facing SOUTH when rotated RIGHT four times' do
      @robot.rotate(:RIGHT)
      @robot.rotate(:RIGHT)
      @robot.rotate(:RIGHT)
      @robot.rotate(:RIGHT)
      expect(@robot.facing).to eq :SOUTH
    end
  end

  it 'should return the new position of the robot' do
    robot.put(2, 4, :EAST)
    pos = robot.next_pos
    expect(pos[:x]).to eq 3
    expect(pos[:y]).to eq 4
  end

  it 'should change the position of the robot' do
    robot.move({:x => 5, :y => 3})
    expect(robot.x).to eq 5
    expect(robot.y).to eq 3
  end

  it 'should output the information about the robot' do
    robot.put(3, 3, :WEST)
    output = '3,3,WEST' 
    expect(robot.report).to eq output
  end
end
