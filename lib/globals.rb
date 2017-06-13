#global variables
  $commands  = ["PLACE","MOVE","LEFT","RIGHT","REPORT"]
  $faces =["NORTH","EAST", "SOUTH", "WEST"]
  $table = {:min=>0,:max=>4}

#methods

#cycle method: -  go through an array and cycle back if >= array.length
  def cycle(array, step, value)
    oldIndex = array.index(value)
    newIndex = (oldIndex + step) % array.length
    return newIndex #return index not value
  end

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
