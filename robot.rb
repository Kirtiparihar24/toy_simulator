class Robot
  SEQUENCE = %w[west north east south]

  attr_accessor :position, :max_unit

  def initialize(max_unit)
    @max_unit = max_unit
  end

  def position=(cmd)
    coordinates_arr = cmd.gsub(/place/, "").split(",").map(&:strip)
    return nil unless coordinates_arr.count == 3 && SEQUENCE.include?(coordinates_arr[2])
    @position = {
      x: coordinates_arr[0].to_i, 
      y: coordinates_arr[1].to_i, 
      direction: coordinates_arr[2]}
  end

  def roam(cmd)
    if cmd == 'left'
      @position[:direction] = SEQUENCE[SEQUENCE.index(@position[:direction]) - 1]
    end

    if cmd == 'right'
      @position[:direction] = SEQUENCE[SEQUENCE.index(@position[:direction]) + 1]
    end

    if cmd == 'move'
      if @position[:direction] == 'north' || @position[:direction] == 'south'
        @position[:y] = @position[:y] + 1 if (@position[:y] + 1 <= max_unit)
      else
        @position[:x] = @position[:x] + 1 if (@position[:x] + 1 <= max_unit)
      end
    end
  end

  def report
    @position.values.join(',') rescue "Invalid commands"
  end
end
