class Robot
require_relative 'exceptions' #require the non class specific methods and variables.
require_relative 'globals' #require the non class specific methods and variables.

  attr_accessor :position

  def initialize
    @position = Hash.new
  end

#place method : -
  def place(x,y,f)
    @position[:x]= x #create x position
    @position[:y]= y #create y position
    @position[:f]= f #create face position
  end

#right method : -
  def right
    newIndex = cycle($faces, 1, @position[:f])
    @position[:f] = $faces[newIndex]
  end

#left method : -
  def left
    revFaces = $faces.reverse
    newIndex = cycle(revFaces, 1, @position[:f])
    @position[:f] = revFaces[newIndex]
  end

#move method : -
  def move
    #check that the robot has been placed: -
    if @position.empty? #if not placed
      raise NoPlaceError
    else #if placed
      case @position[:f]  # was case obj.class

        when "NORTH"
          if checkCoord(@position[:y]) != :atmax #check before moving
            @position[:y] += 1
          else
            raise EdgeError
          end

        when "EAST"
          if checkCoord(@position[:x]) != :atmax #check before moving
            @position[:x] += 1
          else
            raise EdgeError
          end

        when "SOUTH"
          if checkCoord(@position[:y]) != :atmin #check before moving
            @position[:y] -= 1
          else
            raise EdgeError
          end

        when "WEST"
          if checkCoord(@position[:x]) != :atmin #check before moving
            @position[:x] -= 1
          else
            raise EdgeError
          end
      end
    end
  end

#report method : -
  def report
    pos = "#{@position[:x]},#{@position[:y]},#{@position[:f]}"
    return pos
  end

end
