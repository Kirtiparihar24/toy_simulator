require_relative 'robot'

puts %{Challenge Toy Robot Simulator
Valid commands: 'PLACE X,Y,EAST/WEST/NORTH/SOUTH', MOVE, LEFT, RIGHT and REPORT (case insensitive)"
Type exit or ctrl+c to quit the game.
Enter a command:}

cmd = gets.chomp

robot = Robot.new

while cmd
  cmd = cmd.downcase.strip
  
  exit if cmd == 'exit'

  if cmd == "report"
    puts robot.report
    exit
  end
  
  cmd.include?("place") ? robot.position=(cmd) : robot.roam(cmd)
  
  puts "Enter next command:"
  cmd = gets.chomp 
end