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

## Command File

In order to control the robot, you have to create a file containing all the commands. Here is the list of commands you can use:

### PLACE 

This will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. 

The origin (0,0) can be considered to be the SOUTH WEST most corner.

The first valid command to the robot is a 'PLACE' command, after that, any sequence of commands may be issued, in any order, including another 'PLACE' command. The application should discard all commands in the sequence until a valid 'PLACE' command has been executed.

Example:

    # This command will put the robot at coordinate (2,3) and facing WEST
    PLACE 2,3,WEST

### MOVE 

This will move the toy robot one unit forward in the direction it is currently facing.


### 'LEFT' and 'RIGHT'

This will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

### 'REPORT' 

This will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

I have included 3 sample command files(first_data, second_data and third_data) within this project. 

## Run the Application

Execute this command inside the directory after you clone the project

    ./bin/robot.rb <command_file>

Example
  
    # The application will read file and output the result
    ./bin/robot.rb first_data

## Testing Instructions

1. Make sure you have RSpec => 3.1.5 installed on your machine

    rspec -v

2. Run this command to run the tests

    rspec spec

## Overview

This application has 3 main classes: Robot, Table and Command.

### Command 

Command class is responsible to parse command file and send the instructions to Robot class. 

It will use Table class to check the validity of a position before moving or placing the robot.

### Table

Table class only has one method to check the validity of x-y position. This method is being used by command class before performing any movement or placement.

### Robot

The core class of this application. 

## License

Licensed under the GNU Lesser General Public License

## Contributing


