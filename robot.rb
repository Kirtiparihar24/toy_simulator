class Robot
  SEQUENCE = %w[west north east south]

  attr_accessor :position, :max_unit

  def initialize(max_unit)
    @max_unit = max_unit
  end

  # Save position of toy robot
  # Return nil if not value not given in format PLACE X,Y,DIRECTION
  def position=(cmd)
    coordinates_arr = cmd.gsub(/place/, "").split(",").map(&:strip)
    return nil unless coordinates_arr.count == 3 && SEQUENCE.include?(coordinates_arr[2])
    @position = {
      x: coordinates_arr[0].to_i, 
      y: coordinates_arr[1].to_i, 
      direction: coordinates_arr[2]}
  end

  def roam(cmd)
    # Rotate toy towards left direction, ex. if toy facing east then will face north
    if cmd == 'left'
      @position[:direction] = SEQUENCE[SEQUENCE.index(@position[:direction]) - 1]
    end

    # Rotate toy towards right direction, ex. if toy facing east then will face south
    if cmd == 'right'
      @position[:direction] = SEQUENCE[SEQUENCE.index(@position[:direction]) + 1]
    end

    # Move toy 1 step ahead on x axis if direction is east or west
    # Move toy 1 step ahead on y axis if direction is north or south
    # Position remain unchanged if attempt to move toy beyond set dimensions ex. 5
    if cmd == 'move'
      if @position[:direction] == 'north' || @position[:direction] == 'south'
        @position[:y] = @position[:y] + 1 if (@position[:y] + 1 <= max_unit)
      else
        @position[:x] = @position[:x] + 1 if (@position[:x] + 1 <= max_unit)
      end
    end
  end

  # Return Final position of the toy in string format ex. "0,2,west"
  # Return "Invalid command" if position is nil due to invalid input
  def report
    @position.values.join(',') rescue "Invalid commands"
  end
end
