Toy Robot Simulator
===================

Description
-----------

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
  
To start the simlation
-----------

- In the command line, navigate to the directory of the robot's code
    run $ruby 'lib/simulation.rb'

Commands
-----------    

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- It is best to follow the formats of the commands as closely as possible, however
  there is some leniency regarding spaces and capitalisation
- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command.
- MOVE will move the toy robot one unit forward in the direction it is
  currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot.
