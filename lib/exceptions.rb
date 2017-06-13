#list of custom errors to be raised.
class EdgeError < StandardError
  def to_s
      "For the pretection of your bot your move command was not processed."
  end
end

class NoPlaceError < StandardError
  def to_s
      "You can't move a bot you haven't placed. Place the bot first."
  end
end
