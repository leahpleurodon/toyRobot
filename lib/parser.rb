require_relative 'robot'
require_relative 'exceptions'

#parsing methods
#checkCoord method: - checks if x or y position is max
  def checkCoord(coord)
    if coord == $table[:min]
      return :atmin
    elsif coord == $table[:max]
      return :atmax
    else
      return :hasroom
    end
  end
#check command: - checks the inital input of command (not place args) true if pass, false if fail
  def checkCommand(command)
    if $commands.include? command
      return :cmd
    elsif command.partition(" ").first == "PLACE"
      return :placecmd
    else
      return false
    end
  end
#parse place command: - tests place args and formats the array.
  def parsePlaceCommand(command)
    str = command.gsub(/place/i, '') #remove the place comand
    ary = str.split(',') #turn args into an array
    ary = ary.collect(&:strip) #removes and white spaces
    if ($faces.include? ary[2]) && (ary[0].is_integer?) && (ary[1].is_integer?) #check each arg is the correct type
      if(ary[0].to_i.between?($table[:min],$table[:max])) &&
        (ary[1].to_i.between?($table[:min],$table[:max])) #check x and y are in range
        return [ary[0].to_i,ary[1].to_i,ary[2]]
      else
        raise PlaceOffTable
      end
    else
      raise NoSuchCommand
    end
  end
#execCommand method: - executes commands from the CLI input
  def execCommand(command)
    if checkCommand(command) == :placecmd
      cmds = parsePlaceCommand(command)
      @robot.place(cmds[0],cmds[1],cmds[2])
    elsif checkCommand(command) == :cmd
      case command.upcase
        when "REPORT"
          puts @robot.report
        when "MOVE"
          @robot.move
        when "LEFT"
          @robot.left
        when "RIGHT"
          @robot.right
      end
    else
      raise NoSuchCommand
    end
  end
