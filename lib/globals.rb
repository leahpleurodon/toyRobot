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
#check if string is an integer in string form
class String
  def is_integer?
    self.to_i.to_s == self
  end
end
