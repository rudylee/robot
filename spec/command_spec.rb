require 'spec_helper'
require 'command'

describe "command" do
  it "should raise error if parameter does not available" do
    expect(lambda { Command.new('', 5, 5) }).to raise_error SystemExit
  end

  it "should raise error if file does not exist" do
    expect(lambda { Command.new(['not_exist.txt'], 5, 5) }).to raise_error SystemExit
  end

  context 'start' do
    it "should ignore all the command if robot is not on the table" do
      command = Command.new(['spec/test_files/no_put'], 5, 5);
      expect { command.start }.to_not output.to_stdout
    end      

    it "should be able to put robot on the table" do
      command = Command.new(['spec/test_files/place'], 5, 5);
      expect { command.start }.to output("0,0,NORTH\n").to_stdout
    end      

    it "should be able to rotate robot to the left" do
      command = Command.new(['spec/test_files/rotate_left'], 5, 5);
      expect { command.start }.to output("0,0,WEST\n").to_stdout
    end      

    it "should be able to rotate robot to the right" do
      command = Command.new(['spec/test_files/rotate_right'], 5, 5);
      expect { command.start }.to output("0,0,EAST\n").to_stdout
    end      
  end

end
