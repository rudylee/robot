## Robot

This application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

There are no other obstructions on the table surface.

The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

## Environments

This application is developed on Mac OS X 10.10 with Ruby 1.9.3

Won't support Ruby < 1.9.3

## System Dependencies & Configuration

ruby => 1.9.3 

rspec => 3.1.5

## How to Install

1. Make sure you have Ruby installed on your machine

    ruby -v

2. If you don't have Ruby, I recommend [RVM](http://rvm.io/) for Mac and Linux. On Windows, you can try [Ruby Installer](http://rubyinstaller.org/)

3. Clone the project from Github

    git clone https://github.com/rudylee/robot.git

## Getting Started

Execute

    ./bin/robot.rb <command_file>

Example
  
    ./bin/robot.rb first_data

## Testing Instructions

1. Make sure you have RSpec => 3.1.5 installed on your machine

    rspec -v

2. Run this command to run the tests
  
    rspec spec

## Overview

This application is divided into 3 main classes: Robot, Table and Command.

## License

Licensed under the GNU Lesser General Public License

## Contributing


