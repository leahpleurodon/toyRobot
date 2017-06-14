require_relative 'parser'
require_relative 'robot'
require_relative 'globals'

# initiates ToyRobot
  @robot = Robot.new
  command = '' # initiate the command variable
  # welcome message
  puts 'Welcome to the Toy Robot. Input your commands below'
  until command.eql?('STOP') # run program until asked to stop
    command = gets.chomp.upcase
    if command != 'STOP'
      execCommand(command)
    end
  end
  # fairwell message
  puts 'Hope you enjoyed the Toy Robot, your robot finished up at...' + @robot.report
