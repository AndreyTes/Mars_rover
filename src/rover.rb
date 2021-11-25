class Rover
  CARDINAL_POINTS = %w[N E S W]

  attr_reader :plateau, :start_position, :rover_command, :direction, :position

  def initialize(plateau, position, commands)
    @direction = position.split[2]
    @position = position.split.first(2).map(&:to_i)
    @plateau = plateau.split.map(&:to_i)
    @commands = commands
  end

  def print_info
    if valid?(position)
      @commands.each_char { |command| execute command }
      p "X: #{position[0]}    Y: #{position[1]}    DIRECTION: #{direction}"
    else
      p 'Rover lending out of range'
    end
  end

  private

  def execute action
    case action
    when 'R'
      tern_right
    when 'L'
      tern_left
    when 'M'
      move
    else
      p "Wrong command: #{action}".chomp
    end
  end

  def tern_right
    curent_index = CARDINAL_POINTS.index(direction)

    @direction = case curent_index
                 when 0..2
                   CARDINAL_POINTS[curent_index + 1]
                 when 3
                   CARDINAL_POINTS[0]
                 end
  end

  def tern_left
    curent_index = CARDINAL_POINTS.index(direction)

    @direction = case curent_index
                 when 1..3
                   CARDINAL_POINTS[curent_index - 1]
                 when 0
                   CARDINAL_POINTS[3]
                 end
  end

  def move
    new_position = calculate_new_position
    if valid?(new_position)
      @position = new_position
    else
      p 'Rover out of range'
    end
  end

  def calculate_new_position
    new_position = position.clone
    case @direction
    when 'N'
      new_position[1] += 1
    when 'E'
      new_position[0] += 1
    when 'S'
      new_position[1] -= 1
    when 'W'
      new_position[0] -= 1
    end
    new_position
  end

  def valid? new_position
    (0..plateau[0]).include?(new_position[0]) && (0..plateau[1]).include?(new_position[1])
  end
end
