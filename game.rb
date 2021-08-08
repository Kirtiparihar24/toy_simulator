require_relative 'robot'

class Game

  attr_accessor :robot

  def initialize
    @robot = Robot.new
  end

  def execute(cmd)
    cmd = cmd.downcase.strip
    cmd.include?("place") ? robot.position=(cmd) : robot.roam(cmd)
  end

  def generate_report
    return robot.report
  end

end