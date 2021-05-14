class RobotCli
  def self.start
    robot = Robot.new
    print "X: #{robot.x}\n"
    print "Y: #{robot.y}\n"
    print "Facing: #{robot.position}\n"
    puts ''
    puts ''
    command = gets.strip
    process_command(robot, command)
  end

  def self.process_command(robot, input)
    if input.start_with?('L')
      coordinate = coordinate_input
      robot.turn_left(coordinate.x, coordinate.y)
    elsif input.start_with?('R')
      coordinate = coordinate_input
      robot.turn_right(coordinate.x, coordinate.y)
    elsif input == 'M'
      robot.move
    elsif input == '?'
      robot.help_command
    elsif input == 'Q'
      robot.end_session
    else
      puts 'command not found'
    end
    next_command(robot) if input != 'Q'
  end

  def self.coordinate_input
    print 'X: '
    input_x = gets.strip
    print 'Y: '
    input_y = gets.strip
    OpenStruct.new({ x: input_x.to_i, y: input_y.to_i })
  end

  def self.next_command(robot)
    command = gets.strip
    process_command(robot, command)
  end
end
