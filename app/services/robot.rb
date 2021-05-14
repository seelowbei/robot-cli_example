class Robot
  attr_accessor :x, :y, :position

  def initialize(x = 0, y = 0, facing = 'North')
    @x =  x
    @y =  y
    @position = facing
    puts 'type ? to view list of commands'
  end

  def turn_left(cx, cy)
    @x = cx
    @y = cy
    coordinate = "(#{x}, #{y})"
    @position = turn_left_position
    text = "Robot at #{coordinate} facing #{position}"
    puts text
  end

  def turn_right(cx, cy)
    @x = cx
    @y = cy
    coordinate = "(#{x}, #{y})"
    @position = turn_right_position
    text = "Robot at #{coordinate} facing #{position}"
    puts text
  end

  def move
    new_coordinate = move_coordinate
    @x = new_coordinate.x
    @y = new_coordinate.y
    coordinate_display = "(#{x}, #{y})"
    text = "Robot at #{coordinate_display} facing #{position}"
    puts text
  end

  def help_command
    text = "Command the robot with:\n" \
    "L - turn left\n" \
    "R - turn right\n" \
    "M - move forward\n" \
    "? - this message\n" \
    "Q - quit\n"
    puts text
  end

  def end_session
    puts 'Robot shutting down.'
  end

  private

  def turn_left_position
    positions = { north: 'West',
                  south: 'East',
                  east: 'North',
                  west: 'South' }
    positions[position.downcase.to_sym]
  end

  def turn_right_position
    positions = { north: 'East',
                  south: 'West',
                  east: 'South',
                  west: 'North' }
    positions[position.downcase.to_sym]
  end

  def move_coordinate
    directions = { north: coordinate(0, 1),
                   south: coordinate(0, -1),
                   east: coordinate(1, 0),
                   west: coordinate(-1, 0) }
    direction = directions[position.downcase.to_sym]
    new_x = x + (direction.x || 0)
    new_y = y + (direction.y || 0)
    coordinate(new_x, new_y)
  end

  def coordinate(x, y)
    OpenStruct.new({ x: x, y: y })
  end
end
