require_relative 'game'

puts %{Challenge Toy Robot Simulator
Valid commands: 'PLACE X,Y,EAST/WEST/NORTH/SOUTH', MOVE, LEFT, RIGHT and REPORT (case insensitive)"
Type exit or ctrl+c to quit the game.
Enter a command:}

cmd = gets.chomp
game = Game.new

while cmd
  cmd = cmd.downcase.strip
  exit if cmd == 'exit'

  if cmd == 'report'
    puts game.generate_report
    exit
  end

  game.execute(cmd)
  
  puts "Enter next command:"
  cmd = gets.chomp 
end