# Toy Robot Simulator
### Installation:
```
$ git clone https://github.com/Kirtiparihar24/toy_simulator.git
$ cd toy_simulator
$ bundle install
```

### Run test cases:
```
$ bundle exec rspec
```

### Run this from standard input:
```
$ ruby start_game.rb
```

### Example Input and Output:
i.

    PLACE 0,0,NORTH
    MOVE
    REPORT

    Output: 0,1,NORTH

ii.

    PLACE 0,0,NORTH
    LEFT
    REPORT

    Output: 0,0,WEST

iii.

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

    Output: 3,3,NORTH
