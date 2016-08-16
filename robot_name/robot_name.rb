class Robot
  attr_accessor :name

  def initialize(args = {})
    if args[:name_generator]
      @name = args[:name_generator]
    else
      generate_char = Array.new(2) { ("A".."Z").to_a.sample }.join
      generate_num =  Array.new(3) { rand(10) }.join
      @name = "#{generate_char}#{generate_num}"
    end
  end

  def check_error
    unless @name =~ /[[:alpha:]]{2}[[:digit:]]{3}/
      raise "There was a problem generating the robot name!"
    end
  end
end

robot = Robot.new
robot.check_error
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Errors!
# generator = -> { 'AA111' }
# Robot.new(name_generator: generator)
# Robot.new(name_generator: generator)
