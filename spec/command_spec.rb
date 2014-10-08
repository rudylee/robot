require 'spec_helper'
require 'command'

describe "command" do
  it "should raise error if parameter is not available" do
    expect(lambda { Command.new('', 5, 5) }).to raise_error SystemExit
  end

  it "should raise error if file is not exist" do
    expect(lambda { Command.new(['not_exist.txt'], 5, 5) }).to raise_error SystemExit
  end

  it "should raise error if table height is not exist" do
    expect(lambda { Command.new('test_file.txt', 5, 5) }).to raise_error SystemExit
  end
end
