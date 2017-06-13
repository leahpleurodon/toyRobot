require './lib/robot'

@robot =Robot.new
command = "" #initiate the command variable
puts "Welcome to the Toy Robot. Input your commands below"

while !command.eql?("STOP")
    command = gets.chomp.upcase()
    if command != "STOP"
      	puts "Hello #{command}"
    end
end

puts "Hope you enjoyed the Toy Robot, your robot finished up at..." + @robot.report
