class NameCollisionError < RuntimeError; end

class Robot


  attr_accessor :name


  def initialize
    @@registry ||= []
    name_generator
    check_registry
  end

  def name_generator
    char = -> { ('A'..'Z').to_a.sample }
    num = -> { rand(10) }
    self.name = "#{char.call}#{char.call}#{num.call}#{num.call}#{num.call}"
  end

  def check_registry
    if !(name =~ /[[:alpha:]]{2}[[:digit:]]{3}/) || @@registry.include?(name)
     raise NameCollisionError, 'There was a problem generating the robot name!'
    else
      add_to_registry
    end
  end

  def add_to_registry 
    @@registry << name
  end

end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Errors!
# generator = -> { 'AA111' }
# Robot.new(name_generator: generator)
# Robot.new(name_generator: generator)
