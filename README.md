Toy Robot
=========

Toy Robot is a text based simulator that moves a toy robot around a tabletop.


Valid Commands
--------------

The program can read the following commands:

### PLACE X,Y,ORIENTATION

Puts the toy robot on the tabletop at the specified X and Y coordinates and
facing the NORTH, SOUTH, EAST or WEST direction. If the robot is already placed
on the table, issuing another PLACE command will move the robot to the new
location.

### MOVE

Moves the toy robot one place forward in the direction that the robot is
currently facing.

### LEFT

Rotates the robot counter-clockwise, 90 degrees to the left.

### RIGHT

Rotates the robot clockwise, 90 degrees to the right.

### REPORT

Displays the X and Y coordinates and facing direction of the robot.

Installation
------------

This guide assumes that you already have Ruby, RubyGems, and Bundler set up on
your machine.

```
git clone https://github.com/chrisalley/toy-robot
cd toy-robot
bundle
```

Running the Program
-------------------

`./toy-robot.rb`

Example Commands
----------------

Entering the following commands...

```
PLACE 1,2,EAST
MOVE
RIGHT
MOVE
MOVE
LEFT
REPORT
```

...produces the following report:

`2,0,EAST`


Running Automated Tests
-----------------------

`rspec`

Copyright
---------

All code is freely available under the [MIT License](LICENSE).
