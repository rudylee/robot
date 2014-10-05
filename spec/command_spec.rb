require 'spec_helper'
require 'command'

describe "command" do
  it "should raise error if parameter is not available" do
    lambda { Command.new('', 5, 5) }.should raise_error SystemExit
  end

  it "should raise error if file is not exist" do
    lambda { Command.new(['not_exist.txt'], 5, 5) }.should raise_error SystemExit
  end
end
